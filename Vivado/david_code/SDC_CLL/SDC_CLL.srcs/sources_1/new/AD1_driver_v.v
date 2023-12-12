`timescale 1ns / 1ps

`include "div_frecuencias.vh"

module AD1_driver_v(
       clk,
       start,
       divClk,
       data0, data1,
       D0, D1,
       CS, SCLK
       );    
       
// Interfaz con FPGA:
input wire clk; 
input wire start;
input wire divClk;
output wire [11:0] data0, data1;

// Interfaz con PMOD AD1:
input wire D0, D1;
output wire CS, SCLK;

// Par�metros


// ---------- MODULE ----------

AD_driver AD1 (
 
 //entradas
        .start(start),
        .clk(clk), 
        .divClk(divClk),
        .D0(D0),
        .D1(D1),
 // salidas  
        .CS(CS),
        .SCLK(SCLK),
        .data0(data0),
        .data1(data1)
        
);

endmodule