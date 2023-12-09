`timescale 1ns / 1ps
`include "div_frecuencias.vh"

module process_v(
    clk,
    MODO,
    SP,
    param1,
    param2,
    param3,
    yk,
    CV,
    out1,
    out2,
    mode_ind,
    ind_ctrl
    );

//Entradas
input wire clk;
input wire [2:0] MODO;
input wire [N-1:0] SP;
input wire [N-1:0] param1;
input wire [N-1:0] param2;
input wire [N-1:0] param3;
input wire [N-1:0] yk;  

//Salida
output wire [9:0] CV; 
output wire [N-1:0] out1;
output wire [N-1:0] out2;
output wire [2:0] mode_ind;
output reg ind_ctrl =0;

// Parámetros 
parameter L = 10; 
parameter res_1 = 1023;
parameter Q = 15;
parameter N = 28;

// Parámetros locales

localparam c1 = 250; // Divisor frecuencia clk_gen 1 --> f_gen = 25MHz/c1 ==> 40kHz (ÚNICO QUE CAMBIA SI CAMBIA FRECUENCIA EXTERNA)
localparam c2 = 625000; // Divisor frecuencia clk_ctrl --> f_ctrl = f_gen/c2 ==> 0.064Hz ==> tm = 15.625s ... /2 -> 31.25(s), /4 -> 62.5(s)

localparam NB = 3276; // Noise band = 0.0625°C--> 2048  ........... now 0.1

localparam OFF = 2'd0;
localparam MANUAL = 2'd1;
localparam PID = 2'd2;

///////////////////////////////////////////////////////////////// MODULO ///////////////////////////////////////////////////////// 

// VARIABLES
reg [N-1:0] yT;
reg [N-1:0] SV;
reg [N-1:0] out_pid;
reg [N-1:0] out_0;
wire [N-1:0] out_1;
wire [N-1:0] out_2;
wire [N-1:0] out;

reg [N-1:0] kc, Ti, Td;

wire [N-1:0] probe_pid;
wire [N-1:0] uk_pid;

wire [N-1:0] neg_yT;
wire [N-1:0] err;

reg [N-1:0]  error;

reg [N-1:0] ek = 0;

reg [N-1:0] ek1 = 0;
reg [N-1:0] ek2 = 0;
reg [N-1:0] uk1 = 0;

reg [N-1:0] uk1_0 = 0;

wire [N-1:0] neg_ek1;

wire tm_gen;
wire read_data;
wire tm1;
wire tm2;

// Indicación de modo
assign mode_ind[0] = (MODO == OFF);
assign mode_ind[1] = (MODO == MANUAL);
assign mode_ind[2] = (MODO == PID);


// Asignación de parámetros
always @(posedge clk) begin
    kc <= param1;
    Ti <= param2;
    Td <= param3;
end

// Captura de las entradas al controlador
always @(posedge clk) begin
    SV <= SP;        
    yT <= yk;
end
///////////////////////////////////////////////////////// CONTROLADOR //////////////////////////////////////////////////////////////////
// Cálculo del error
negar #(Q,N) neg0 (yT,neg_yT);
qadd #(Q,N) sum0 (SV,neg_yT,err);

// Noise band 
always @(err) begin
    if ( err[N-2:0] < NB ) // Debería poder evitarse esto err[N-2:0] > 0 &&
        error = 0;
    else
        error = err;   
end

// Asignación del error a ek
always @(posedge clk) begin
    if ( tm1 ) begin
        ek <= error;
        ind_ctrl <= ~ind_ctrl;
    end
end

// Controlador PID
modo_pid pid2 (clk,ek,ek1,ek2,uk1,kc,Ti,Td,probe_pid,uk_pid);

// Memoria y asignación secuencial en el tiempo de muestreo 
always @(posedge clk) begin
    if ( tm2 ) begin
        
        uk1 <= uk1_0;
        out_pid <= uk_pid;
        
        // Memoria          
        ek2 <= ek1;
        ek1 <= ek;
         
    end
end


// Modo 
always begin 
    case (MODO) 
    
        OFF:
        begin 
            uk1_0 = 0;
            out_0 = 0;
        end   
    
        MANUAL:
        begin
            uk1_0 = SV;
            out_0 = SV;
        end
        
        PID:
        begin
            uk1_0 = uk_pid;
            out_0 = out_pid;
        end

        default:
        begin 
            uk1_0 = 0;
            out_0 = 0;
        end   
    endcase  
end 

// Linealización de la salida
div_v #(Q,N) div0 ( out_0, 3276800, clk, out_1); 
Vrms_DC_lineal #(Q,N) lineal_1 (clk, out_1, out );

// Conversión de la salida 
wire [9:0] CV_1;

control_value #(L,res_1,Q,N) 
out_ctrl(
    clk,
    out, 
    CV_1
    );

assign CV = CV_1;
  
// Tiempo de muestreo
divisor_f #(c1) clk_gen ( 
    .clk(clk),
    .en_clk(1),
    .clk_out(tm_gen)            
);    

rediv_f #(c2,250,350) clk_ctrl (  // Tiempo de muestreo = 62.5(s)
    .clk(clk),
    .clk_in(tm_gen),
    .clk_out(read_data),
    .clk_out2(tm1),
    .clk_out3(tm2)          
);  
reg [N-1:0] consta = 1187840; // 36.25
assign out1 = probe_pid;  
assign out2 = ek;  
endmodule