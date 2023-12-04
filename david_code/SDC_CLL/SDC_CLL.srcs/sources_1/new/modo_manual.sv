`timescale 1ns / 1ps

module control_value(
    clk,
    uk,
    CV
    );
    
// Entradas
input logic clk;
input logic [N-1:0] uk;

// Salida 
output logic [L-1:0] CV;

// Parametros 
parameter L = 10; 
parameter val_1 = 1000;
parameter Q = 15;
parameter N = 28;

localparam DIEZ = 327680; // DIEZ = 10
localparam CIEN = 3276800;

///////////////////////////////////////////////////////////////// MODULO ///////////////////////////////////////////////////////// 

// Cálculo 

// Linealización Vrms vs DC 
logic [N-1:0] aux_2;

// Precisión de salida (0.1%DC)
qmult #(Q,N) mult1 (uk, DIEZ, aux_2 ); 

// Asignación 
assign CV = aux_2[Q+L-1:Q];

endmodule
