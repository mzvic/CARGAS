`timescale 1ns / 1ps

module m3an(
    clk,
    yT1,
    yT2,
    yT3,
    yTm
    );

//Entradas
input logic clk;
input logic [N-1:0] yT1;
input logic [N-1:0] yT2;
input logic [N-1:0] yT3;

// Salida
output logic [N-1:0] yTm;

// Parámetros 
parameter Q = 15;
parameter N = 28;

// Parámetros locales
localparam TRES = 98304;  // TRES = 3

//////////////////////////////////////////////// MODULO ////////////////////////////////////////

logic [N-1:0] aux0; 
qadd #(Q,N) sum0 ( yT1, yT2, aux0);

logic [N-1:0] aux1; 
qadd #(Q,N) sum1 ( aux0, yT3, aux1);

logic [N-1:0] aux2; 
div_v #(Q,N) div1 (aux1,TRES,clk,aux2);



assign yTm = aux2;

endmodule
