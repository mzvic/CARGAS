`timescale 1ns / 1ps

`include "baudrate_list.vh"
`include "div_frecuencias.vh"

module package_ext(
        clk,
        rx,
        in_01,
        in_02,
        in_03,
        in_04,
        in_05,
        in_06,
        in_07,
        in_08,
        in_09,
        in_10,
        in_11,
        in_12,
        in_13, 
        tx,
        out_01,
        out_02,
        out_03,
        out_04,
        out_05, 
        out_06,
        out_07,
        out_08,
        out_09,
        out_10, 
        out_11,
        out_12,
        out_13,
        out_14,
        out_15, 
        out_16,
        out_17,
        out_18,
        out_19,
        out_20, 
        send,
        data_ready
           ); 

// Entradas
input wire clk;
input wire rx;
input wire [13:0] in_01;
input wire [13:0] in_02;
input wire [13:0] in_03;
input wire [13:0] in_04;
input wire [13:0] in_05;
input wire [13:0] in_06;
input wire [13:0] in_07;
input wire [13:0] in_08;
input wire [13:0] in_09;
input wire [13:0] in_10;
input wire [13:0] in_11;
input wire [13:0] in_12;
input wire [13:0] in_13;

// Salidas
output wire tx;
output wire send;
output wire [20:0] out_01;
output wire [20:0] out_02;
output wire [20:0] out_03;
output wire [20:0] out_04;
output wire [20:0] out_05;
output wire [20:0] out_06;
output wire [20:0] out_07;
output wire [20:0] out_08;
output wire [20:0] out_09;
output wire [20:0] out_10;
output wire [20:0] out_11;
output wire [20:0] out_12;
output wire [20:0] out_13;
output wire [20:0] out_14;
output wire [20:0] out_15;
output wire [20:0] out_16;
output wire [20:0] out_17;
output wire [20:0] out_18;
output wire [20:0] out_19;
output wire [20:0] out_20;
output wire data_ready;
              
//-- Parametro: Velocidad de transmision
parameter BAUD = 3126;
parameter SEND_RATE = 133280;


// --------------------------------------------- M�DULO ---------------------------------------------------

pack_ext #(BAUD,SEND_RATE)
    pack1_ext(
        .clk(clk),
        .rx(rx),
        .in_01(in_01),
        .in_02(in_02),
        .in_03(in_03),
        .in_04(in_04),
        .in_05(in_05),
        .in_06(in_06),
        .in_07(in_07),
        .in_08(in_08),
        .in_09(in_09),
        .in_10(in_10),
        .in_11(in_11),
        .in_12(in_12),
        .in_13(in_13),        
        .tx(tx),
        .out_01(out_01),
        .out_02(out_02),
        .out_03(out_03),
        .out_04(out_04),
        .out_05(out_05),
        .out_06(out_06),
        .out_07(out_07),
        .out_08(out_08),
        .out_09(out_09),
        .out_10(out_10),
        .out_11(out_11),
        .out_12(out_12),
        .out_13(out_13),
        .out_14(out_14),
        .out_15(out_15),
        .out_16(out_16),
        .out_17(out_17),
        .out_18(out_18),
        .out_19(out_19),
        .out_20(out_20),
        .send(send),
        .data_ready(data_ready)
           );   

endmodule
