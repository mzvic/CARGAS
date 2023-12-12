`timescale 1ns / 1ps

`include "div_frecuencias.vh"

module process(
    clk,
    SP,
    MODO,
    param1,
    param2,
    param3,
    yT,
//    yT2,
//    yT3,
    CV,
    out1,
//    out2,
    mode_ind
    );

//Entradas
input logic clk;
input logic [15:0] SP;
input logic [2:0] MODO;
input logic [15:0] param1;
input logic [15:0] param2;
input logic [15:0] param3;
input logic [N-1:0] yT;
//input logic [15:0] yT2;
//input logic [15:0] yT3;

//Salida
output logic [9:0] CV;
output logic [15:0] out1;
//output logic [15:0] out2;
//output logic [15:0] out3;
output logic [2:0] mode_ind;

// Parámetros 
parameter L = 10; 
parameter res_1 = 1023;
parameter Q = 15;
parameter N = 28;

//Parámetros locales
localparam fm = `F_1Hz; //Frecuencia de muestreo

localparam NB = 2048; // Noise band = 0.0625°C

localparam MANUAL = 2'd1;
localparam PID = 2'd2;
localparam FLC = 3'd4;

////////////////////////////// MÓDULO //////////////////////////////////
logic [N-1:0] in_1;
assign in_1[26:7] = SP;
logic [N-1:0] kc, Ti, Td;
logic [N-1:0] Se, Sde, Sdu;

always_comb begin
    case (MODO)    
        PID:
        begin
            kc[26:7] = param1;
            Ti[26:7] = param2;
            Td[26:7] = param3;
        end    
        FLC:
        begin
            Se[26:7] = param1;
            Sde[26:7] = param2;
            Sdu[26:7] = param3;
        end    
        default:
        begin
        // Parámetros por defecto
            kc[26:7] = param1;
            Ti[26:7] = param2;
            Td[26:7] = param3;
            Se[26:7] = param1;
            Sde[26:7] = param2;
            Sdu[26:7] = param3;
        end
    endcase
end

//assign mode_ind = MODO;



assign out1 = uk_pid[26:7]; 

// CONTROLADORES 
// Cálculo del error
//logic [N-1:0] yk;
//assign yk[N-2:Q] = yT;
logic [N-1:0] neg_yT;
negar #(Q,N) neg0 (yT,neg_yT);

logic [N-1:0] err;
qadd #(Q,N) sum0 (in_1,neg_yT,err);

logic [N-1:0] ek = 0;
logic [N-1:0] ek1 = 0;
logic [N-1:0] ek2 = 0;
logic [N-1:0] uk1 = 0;

// Noise band 
always_comb begin
    if ( err[N-2:0] > 0 && err[N-2:0] < NB )
        ek = 0;
    else
        ek = err;   
end

//always_ff @(posedge clk) begin
//    if ( clk_tm ) begin
////        ek2 <= ek1;
////        ek1 <= ek;
////        uk1 <= uk_1;
////        uk_pid <= uk_1;
//        mode_ind = 3'd7;
//    end
    
//    else 
//        mode_ind = 3'd0;
//end

logic [N-1:0] uk_pid;
logic [N-1:0] uk_1;
modo_pid pid1 (clk,ek,ek1,ek2,uk1,kc,Ti,Td,uk_1);

logic [N-1:0] uk_flc;
modo_flc fuzzy1 (clk,clk_tm,err,Se,Sde,Sdu,uk_flc);

// Conversión de la salida 
logic [N-1:0] out;
control_value #(L,res_1,Q,N) 
out_ctrl(
    clk,
    out,
    CV
    );
    
logic clk_tm;
divisor_f #(fm) clk_ctrl (  //2Hz
//Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(clk_tm)               
);   
    
endmodule
