`timescale 1ns / 1ps

`include "baudrate_list.vh"
`include "div_frecuencias.vh"

module package(
        clk,
        clk_2,
        rx,
        PV1,
        PV2,
        PV3,
        CV,
        tx,
        SP,
        MODO,
        param1,
        param2,
        param3, 
        send,
        data_ready
           ); 

// Entradas
input wire clk;
input wire clk_2;
input wire rx;
input wire [11:0] PV1;
input wire [15:0] PV2;
input wire [11:0] PV3;
input wire [9:0] CV;

// Salidas
output wire tx;
output wire send;
output wire [15:0] SP;
output wire [2:0] MODO;
output wire [15:0] param1;
output wire [15:0] param2;
output wire [15:0] param3;
output wire data_ready;
              
//-- Parametro: Velocidad de transmision
parameter BAUD = `B9600;
parameter SEND_RATE = `F_400Hz;


// --------------------------------------------- MÓDULO ---------------------------------------------------

pack_2 #(BAUD,SEND_RATE)
    pack1(
        .clk(clk),
        .clk_2(clk_2),
        .rx(rx),
        .PV1(PV1),
        .PV2(PV2),
        .PV3(PV3),
        .CV(CV),
        .tx(tx),
        .SP(SP),
        .MODO(MODO),
        .param1(param1),
        .param2(param2),
        .param3(param3),
        .send(send),
        .data_ready(data_ready)
           );   

endmodule
