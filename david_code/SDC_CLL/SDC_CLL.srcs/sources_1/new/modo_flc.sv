`timescale 1ns / 1ps

module modo_flc(
    clk,
    ek,
    dek,
    uk1,
    Se,
    Sde,
    Sdu,
    uk_out
    );

// Entradas
input logic clk;
input logic [N-1:0] ek;
input logic [N-1:0] dek;
input logic [N-1:0] uk1;
//Parámetros de entrada
input logic [N-1:0] Se;
input logic [N-1:0] Sde;
input logic [N-1:0] Sdu;

// Salida 
output logic [N-1:0] uk_out;

// Parámetros de cálculo
parameter Q = 15;
parameter N = 28;

// Parámetros locales del controlador
localparam NB = 2048; // Noise band = 0.0625°C
localparam tm = 2048;  // FP: 2048 -> 0.0625(s) --> fm = 16Hz or FP: 256 -> tm = 0.0078125(s) --> fm = 128Hz
localparam du_max = 32768; 
localparam uk_max = 3276800;  // uk_max = 100
localparam uk_min = 0;    // uk_min = 0

// Constantes en punto fijo
localparam DOS = 65536;  // DOS = 2
logic [N-1:0] UNO = 32768;  // UNO = 1
localparam UNMEDIO = 16384; // UNMEDIO = 0.5

////////////////////////////////////// CONTROLADOR //////////////////////////////////////////

// Escalamiento del error y del delta error [-1,+1]
logic [N-1:0] Es_1;
logic [N-1:0] Eds_1;

div_v #(Q,N) div0 ( ek, Se, clk, Es_1);
div_v #(Q,N) div1 ( dek, Sde, clk, Eds_1);

logic [N-1:0] Es;
logic [N-1:0] Eds;
always_comb begin
    if ( Es_1[N-2:0] > UNO )
        Es = UNO;
    else
        Es = Es_1;
    if ( Eds_1[N-2:0] > UNO )
        Eds = UNO;
    else
        Eds = Eds_1;
end

// FUSIFICACIÓN
// Me_P=0.5+0.5*Es;
logic [N-1:0] aux0;
qmult #(Q,N) mult0 (UNMEDIO, Es, aux0);
logic [N-1:0] Me_P_1;
qadd #(Q,N) sum0 (UNMEDIO, aux0, Me_P_1);
logic [N-1:0] Me_P;
always_comb begin
    if ( Me_P_1[N-1] == 0 ) begin
        if ( Me_P_1[N-2:0] > UNO ) 
            Me_P = UNO;
        else
            Me_P =Me_P_1;
    end
    else if ( Me_P_1[N-1] == 1 ) 
        Me_P = 0;
end

// Me_N=0.5-0.5*Es;
logic [N-1:0] neg_aux0;
negar #(Q,N) neg1 (aux0, neg_aux0);
logic [N-1:0] Me_N_1;
qadd #(Q,N) sum1 (UNMEDIO, neg_aux0, Me_N_1);
logic [N-1:0] Me_N;
always_comb begin
    if ( Me_N_1[N-1] == 0 ) begin
        if ( Me_N_1[N-2:0] > UNO ) 
            Me_N = UNO;
        else
            Me_N =Me_N_1;    
    end
    else if ( Me_N_1[N-1] == 1 ) 
        Me_N = 0;   
end

// Mde_P=0.5+0.5*Eds;
logic [N-1:0] aux1;
qmult #(Q,N) mult1 (UNMEDIO, Eds, aux1);
logic [N-1:0] Mde_P_1;
qadd #(Q,N) sum2 (UNMEDIO, aux1, Mde_P_1);
logic [N-1:0] Mde_P;
always_comb begin
    if ( Mde_P_1[N-1] == 0 ) begin
        if ( Mde_P_1[N-2:0] > UNO ) 
            Mde_P = UNO;
        else
            Mde_P =Mde_P_1;
    end
    else if ( Mde_P_1[N-1] == 1 ) 
        Mde_P = 0;
end

// Mde_N=0.5-0.5*Es;
logic [N-1:0] neg_aux1;
negar #(Q,N) neg2 (aux1, neg_aux1);
logic [N-1:0] Mde_N_1;
qadd #(Q,N) sum3 (UNMEDIO, neg_aux1, Mde_N_1);
logic [N-1:0] Mde_N;
always_comb begin
    if ( Mde_N_1[N-1] == 0 ) begin
        if ( Mde_N_1[N-2:0] > UNO ) 
            Mde_N = UNO;
        else
            Mde_N =Mde_N_1;
    end
    else if ( Mde_N_1[N-1] == 1 ) 
        Mde_N = 0;
end

// MOTOR DE INFERNCIA
logic [N-1:0] Mdu_N, Mdu_P, Mdu_Z;
logic [N-1:0] aux2, aux3;
always_comb begin
    // Mdu_N 
    if ( Mde_P <= Me_N )
        Mdu_N = Mde_P;
    else
        Mdu_N = Me_N;
    //Mdu_P
    if ( Mde_N <= Me_P )
        Mdu_P = Mde_N;
    else
        Mdu_P = Me_P;
    // Mdu_Z 
    if ( Me_P <= Mde_P )
        aux2 = Me_P;
    else
        aux2 = Mde_P;

    if ( Me_N <= Mde_N )
        aux3 = Me_N;
    else
        aux3 = Mde_N;
        
    if ( aux2 >= aux3 )
        Mdu_Z = aux2;
    else
        Mdu_Z = aux3; 
end

//DEFUSIFICACIÓN: Cálculo de delta uk
logic [N-1:0] neg_Mdu_N;
negar #(Q,N) neg3 (Mdu_N, neg_Mdu_N);

logic [N-1:0] num_du;
qadd #(Q,N) sum4 (Mdu_P, neg_Mdu_N, num_du);

logic [N-1:0] den_1_du;
qadd #(Q,N) sum5 (Mdu_P, Mdu_N, den_1_du);

logic [N-1:0] den_du;
qadd #(Q,N) sum6 (den_1_du, Mdu_Z, den_du);

logic [N-1:0] duk_0;
div_v #(Q,N) div2 (num_du, den_du, clk, duk_0);

logic [N-1:0] duk_1;  
qmult #(Q,N) mult2 (duk_0, Sdu, duk_1);

// Limitador de velocidad de control

logic [N-1:0] duk;
always_comb begin
    if ( duk_1[N-2:0] > du_max ) begin
        duk[N-2:0] = du_max;
        duk[N-1] = duk_1[N-1];
    end
    else
        duk = duk_1;   
end

// Cálculo de la salida
logic [N-1:0] uk_aux;
qadd #(Q,N) sum7 (uk1, duk, uk_aux);

// Limitador de salida 
logic [N-1:0] uk;
always_comb begin
    if ( uk_aux[N-1] == 0 && uk_aux[N-2:0] > uk_max )
        uk = uk_max;
    else if ( uk_aux[N-1] == 1 )
        uk = uk_min;
    else
        uk = uk_aux;   
end

// Asignación de salida
assign uk_out = uk;

endmodule
