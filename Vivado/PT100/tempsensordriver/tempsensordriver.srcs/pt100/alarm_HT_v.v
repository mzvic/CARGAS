`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design by : D.A
// Create Date: 23.12.2019
// Design Name: Módulo de alarma y stop por temperatura mayor a HT = 72°C
// Module Name: alarm_HT_v
// Description: Empaque para instanciar en IP Integrator
// Dependencies: Dependencia CePIA - WenuLafken - UdeC
// 
//////////////////////////////////////////////////////////////////////////////////

module alarm_HT_v (
    clk,
    start,
    stop_in,
    yk1_1,
    yk2_1,
    yk3_1,
    yk1_2,
    yk2_2,
    yk3_2,
    yk1_3,
    yk2_3,
    yk3_3,
    stop_out,
    yT1_1,
    yT2_1,
    yT3_1,
    yT1_2,
    yT2_2,
    yT3_2,
    yT1_3,
    yT2_3,
    yT3_3,
    HT_on
    );
    
// Entradas
input wire clk;
input wire start;
input wire [20:0] stop_in;
input wire [11:0] yk1_1;
input wire [11:0] yk2_1;
input wire [11:0] yk3_1;
input wire [11:0] yk1_2;
input wire [11:0] yk2_2;
input wire [11:0] yk3_2;
input wire [11:0] yk1_3;
input wire [11:0] yk2_3;
input wire [11:0] yk3_3; 

// Salidas
output wire stop_out;
output wire [N-1:0] yT1_1;
output wire [N-1:0] yT2_1;
output wire [N-1:0] yT3_1;
output wire [N-1:0] yT1_2;
output wire [N-1:0] yT2_2;
output wire [N-1:0] yT3_2;
output wire [N-1:0] yT1_3;
output wire [N-1:0] yT2_3;
output wire [N-1:0] yT3_3;
output wire [13:0] HT_on;

// Parámetros 
parameter Q = 15;
parameter N = 28;

///////////////////////////////////////////////// MODULO ////////////////////////////////////////

alarm_HT #(Q,N) alarm 
    (
    clk,
    start,
    stop_in,
    yk1_1,
    yk2_1,
    yk3_1,
    yk1_2,
    yk2_2,
    yk3_2,
    yk1_3,
    yk2_3,
    yk3_3,
    stop_out,
    yT1_1,
    yT2_1,
    yT3_1,
    yT1_2,
    yT2_2,
    yT3_2,
    yT1_3,
    yT2_3,
    yT3_3,
    HT_on
    );
    
endmodule
