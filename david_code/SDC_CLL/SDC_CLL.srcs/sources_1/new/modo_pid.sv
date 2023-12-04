`timescale 1ns / 1ps

`include "div_frecuencias.vh"

module modo_pid(
    clk,
    ek,
    ek1,
    ek2,
    uk1,
    kc,
    Ti,
    Td,
    probe_out,
    uk_out
    );
    
// Entradas
input logic clk;
input logic [N-1:0] ek;
input logic [N-1:0] ek1;
input logic [N-1:0] ek2;
input logic [N-1:0] uk1;
//Parámetros de entrada
input logic [N-1:0] kc;
input logic [N-1:0] Ti;
input logic [N-1:0] Td;

// Salida 
output logic [N-1:0] probe_out;
output logic [N-1:0] uk_out;

// Parámetros de cálculo
parameter Q = 15;
parameter N = 28;

// Parámetros locales del controlador
//localparam NB = 2048; // Noise band = 0.0625°C
localparam tm = 512000;// FP: 2048000 -> 62.5(s), 512000 -> 15.625(s), 1024000 -> 31.25(s)
localparam du_max = 3276800; 
localparam uk_max = 3276800;  // uk_max = 100
localparam uk_min = 0;    // uk_min = 0

// Constantes en punto fijo
localparam DOS = 65536;  // DOS = 2
localparam UNO = 32768;  // UNO = 1

////////////////////////////////////// CONTROLADOR //////////////////////////////////////////

// Cálculo de parámetros discretos
logic [N-1:0] Td_tm; // Td_tm = Td/tm;
div_v #(Q,N) div0 ( Td, tm, clk, Td_tm);

logic [N-1:0] Td_tm_2; //Td_tm_2 =2*Td_tm;
qmult #(Q,N) mult0 (Td_tm, DOS, Td_tm_2);

logic [N-1:0] neg_Td_tm_2; //neg_Td_tm_2 = -Td_tm_2;
negar #(Q,N) neg0 (Td_tm_2, neg_Td_tm_2);

logic [N-1:0] Ti_2; // Ti_2 = 2*Ti;
qmult #(Q,N) mult1 (Ti, DOS, Ti_2);

logic [N-1:0] tm_Ti_2; // tm_Ti_2 = tm/Ti_2;
div_v #(Q,N) div1 (tm, Ti_2, clk, tm_Ti_2);

logic [N-1:0] a0;   // a0 = (tm/(2*Ti))+(Td/tm)
qadd #(Q,N) sum0 (tm_Ti_2, Td_tm, a0);

logic [N-1:0] neg_UNO; // -1
negar #(Q,N) neg1 (UNO, neg_UNO);

// q0
logic [N-1:0] a1;   // a1 = (1+(tm/(2*Ti))+(Td/tm)) = a0+1
qadd #(Q,N) sum1 (UNO, a0, a1);

logic [N-1:0] q0; // q0=kc*(1+(tm/(2*Ti))+(Td/tm));
qmult #(Q,N) mult2 (a1, kc, q0);

//q1
logic [N-1:0] a2;   // a2 = (tm/(2*Ti))-2*(Td/tm)) 
qadd #(Q,N) sum2 (tm_Ti_2, neg_Td_tm_2, a2);

logic [N-1:0] a3;   // a3 = (-1+(tm/(2*Ti))-2*(Td/tm)) 
qadd #(Q,N) sum3 (a2, neg_UNO, a3); 

logic [N-1:0] q1; // q1=-kc*(1-(tm/(2*Ti))+(2*Td/tm)) = kc*(-1+(tm/2*Ti))-(2*Td/tm));
qmult #(Q,N) mult3 (a3, kc, q1); 

//q2
logic [N-1:0] q2; // q2 = kc*(Td/tm);
qmult #(Q,N) mult4 (Td_tm, kc, q2);

//Cálculo de delta uk
logic [N-1:0] q0_ek;  
qmult #(Q,N) mult5 (q0, ek, q0_ek);

logic [N-1:0] q1_ek1;  
qmult #(Q,N) mult6 (q1, ek1, q1_ek1);

logic [N-1:0] q2_ek2;  
qmult #(Q,N) mult7 (q2, ek2, q2_ek2);

logic [N-1:0] a4;   // a4 = q0_ek + q1_ek1
qadd #(Q,N) sum4 (q0_ek, q1_ek1, a4);

logic [N-1:0] duk_1;  // duk=q0*ek+q1*ek1+q2*ek2;
qadd #(Q,N) sum5 (a4, q2_ek2, duk_1);

// Limitador de velocidad de control

logic [N-1:0] duk;
always_comb begin
    if ( duk_1[N-2:0] > du_max ) begin
        duk[N-1] = duk_1[N-1];
        duk[N-2:0] = du_max;  
    end
    else
        duk = duk_1;   
end

// Cálculo de la salida
logic [N-1:0] uk_aux;
qadd #(Q,N) sum6 (uk1, duk, uk_aux);

// Limitador de salida 
logic [N-1:0] uk;
always_ff @(posedge clk) begin
    if ( uk_aux[N-1] == 0 && uk_aux[N-2:0] > uk_max )
        uk <= uk_max;
    else if ( uk_aux[N-1] == 1 )
        uk <= uk_min;
    else
        uk <= uk_aux;   
end

// Asignación 
assign probe_out = duk_1;
assign uk_out = uk; 

endmodule