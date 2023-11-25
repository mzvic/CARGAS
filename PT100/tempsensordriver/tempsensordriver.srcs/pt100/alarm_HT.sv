`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Design by : D.A
// Create Date: 23.12.2019
// Design Name: Módulo de alarma y stop por temperatura mayor a HT = 72°C
// Module Name: alarm_HT
// Description: ..
// Dependencies: Dependencia CePIA - WenuLafken - UdeC
// 
//////////////////////////////////////////////////////////////////////////////////

module alarm_HT(
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
input logic clk;
input logic start;
input logic [20:0] stop_in;
input logic [11:0] yk1_1;
input logic [11:0] yk2_1;
input logic [11:0] yk3_1;
input logic [11:0] yk1_2;
input logic [11:0] yk2_2;
input logic [11:0] yk3_2;
input logic [11:0] yk1_3;
input logic [11:0] yk2_3;
input logic [11:0] yk3_3;

// Salidas
output logic stop_out;
output logic [N-1:0] yT1_1;
output logic [N-1:0] yT2_1;
output logic [N-1:0] yT3_1;
output logic [N-1:0] yT1_2;
output logic [N-1:0] yT2_2;
output logic [N-1:0] yT3_2;
output logic [N-1:0] yT1_3;
output logic [N-1:0] yT2_3;
output logic [N-1:0] yT3_3;
output logic [13:0] HT_on;

// Parámetros 
parameter Q = 15;
parameter N = 28;

// Parámetros locales
localparam HT = 2457600; // Quedó en 75°; mucho ruido de medición //2359296; // HT = 72°C

///////////////////////////////////////////////// MODULO ////////////////////////////////////////

// Conversiones a temperatura de sensores
//1
logic [N-1:0] yn1_1, yn2_1, yn3_1;
bits2temp1 #(Q,N) y1_1 (clk,yk1_1,yT1_1);
//bits2temp1 #(Q,N) y2_1 (clk,yk2_1,yT2_1);

lowpass_filter #(Q,N) filt1_1 (clk,start,yT1_1,yT2_1);

bits2temp1 #(Q,N) y3_1 (clk,yk3_1,yT3_1);
//2
bits2temp1 #(Q,N) y1_2 (clk,yk1_2,yT1_2); 
bits2temp1 #(Q,N) y2_2 (clk,yk2_2,yT2_2);
bits2temp1 #(Q,N) y3_2 (clk,yk3_2,yT3_2);
//3
bits2temp1 #(Q,N) y1_3 (clk,yk1_3,yT1_3);
bits2temp1 #(Q,N) y2_3 (clk,yk2_3,yT2_3);
bits2temp1 #(Q,N) y3_3 (clk,yk3_3,yT3_3);

always_ff @(posedge clk) begin
    if ( yT1_1 > HT ) begin// ^^ yT2_1 > HT ^^ yT3_1 > HT ^^ yT1_2 > HT ^^ yT2_2 > HT ^^ yT3_2 > HT ^^ yT1_3 > HT ^^ yT2_3 < HT ^^ yT3_3 > HT) 
        stop_out <= 1; 
        HT_on <= 1;
    end
    else begin
        stop_out <= stop_in[0];
        HT_on <= 0;
    end
end

endmodule
