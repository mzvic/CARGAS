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


module pin_tx(
    clk,
    mode,
    en_signal,
    send,
    dato,
    tx
    );

// Entradas
input logic clk;
input logic [1:0] mode;
input logic en_signal;
input logic [7:0] dato;

// Salidas 
output logic tx;
output logic send;

// Parametros
parameter BAUD = 3; // 
parameter SENDRATE = 150;
// Parámetros locales

////////////////////////////// MODULO //////////////////////////////

logic clk_baud;
logic load;
signal_gen_pin #(BAUD, SENDRATE) dut0(
    .clk(clk),
    .mode(mode),
    .en_signal(en_signal),
    .send(send),
    .load(load),
    .baudrate(clk_baud)
        );

logic [5:0] cont = 0;
//logic load = 1;   
logic [19:0] data_shift; 

always_ff @(posedge clk) begin
    if (load) begin
        data_shift[9:2] <= dato;
        data_shift[1:0] <= 2'b01;
        data_shift[19:10] <= 10'b1111111111;
        cont <= 0;
    end

    else if (cont < 19) begin
        if (clk_baud) begin
            data_shift <= data_shift >> 1;
            cont <= cont + 1;
        end
    end
end

assign tx = data_shift[0];

endmodule
