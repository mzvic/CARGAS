`timescale 1ns / 1ps

//`default_nettype none

//`include "baudrate_list.vh"

//////////////////////////////////////////////////////////////////////////////////
// Design by : D.A
// Create Date: 12.06.2017 
// Design Name: Unidad de transmisión UART
// Module Name: uart_tx
// Description: Módulo de transmisión UART desde FPGA a PC
//
// Dependencies: CePIA - Departamento de Astronomía - FCFM - UdeC
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_tx_gg(
    clk,
    clk_baud,
    send,
    dato,
    tx,
    ready
    );

// Entradas
input logic clk;
input logic clk_baud;
input logic send;
input logic [7:0] dato;

// Salidas 
output logic tx;
output logic ready;

// Parametros
//parameter baudrate = `B115200; // 

// Parámetros locales

////////////////////////////// MODULO //////////////////////////////

assign ready = 1; 

assign tx = 1; 
// Señal de habilitación de envío
//always_ff @(posedge clk) begin
//    if (send) begin
//        ready <= 1;
//    end
//end

//logic [5:0] cont = 0;
//logic load = 1;   
//logic [19:0] data_shift; 

//always_ff @(posedge clk) begin
//    if (load) begin
//        if (clk_baud) begin
//            data_shift[9:2] <= dato;
//            data_shift[1:0] <= 2'b01;
//            data_shift[19:10] <= 10'b1111111111;
            
//            load <= 0;
//        end
//    end

//    else if (cont < 19) begin
//        if (clk_baud) begin
//            data_shift <= data_shift >> 1;
//            cont <= cont + 1;
//        end
//    end
//    else begin
//        cont <= 0;
//        load <= 1;
//        ready <= 0;
//    end
//end

//assign tx = data_shift[0];

endmodule