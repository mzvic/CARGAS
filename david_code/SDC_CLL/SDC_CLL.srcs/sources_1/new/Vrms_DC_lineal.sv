`timescale 1ns / 1ps

module Vrms_DC_lineal(
    clk,
    Vrms_SP,
    DC_out
    );
    
// Entradas
input logic clk;
input logic [N-1:0] Vrms_SP;

// Salida
output logic [N-1:0] DC_out;
//output logic [N-1:0] aux_gg;

// Parámetros 
parameter Q = 15; 
parameter N = 28;


// Parámetros locales
localparam DIEZ = 327680; // 10 
localparam CIEN = 3276800; // 10 

localparam a0 = 30698; 
localparam a1 = 2120016; 
localparam a2 = 2924014; // negativo 
localparam a3 = 3225664; 
localparam a4 = 1663786; // negativo
localparam a5 = 327619; 

localparam k = 72090; // 2.2

localparam Vrms_max = 7031490; // 214.584 V
//////////////////////////////////////////////// MÓDULO ////////////////////////////////////////////////////////

logic [N-1:0] Vrms;  // Vrms = Vrms% * 2,2
qmult #(Q,N) mult0 (Vrms_SP, k, Vrms);

logic [N-1:0] Vrms_2;  // Vrms^2
qmult #(Q,N) mult1 (Vrms, Vrms, Vrms_2);

logic [N-1:0] Vrms_3; // Vrms^3
qmult #(Q,N) mult2 (Vrms_2, Vrms, Vrms_3);

logic [N-1:0] Vrms_4; // Vrms^4
qmult #(Q,N) mult3 (Vrms_2, Vrms_2, Vrms_4);

logic [N-1:0] Vrms_5; // Vrms^5
qmult #(Q,N) mult4 (Vrms_2, Vrms_3, Vrms_5);

logic [N-1:0] term1; // a1*Vrms
qmult #(Q,N) mult5 (a1, Vrms, term1);

logic [N-1:0] term2; // a2*Vrms^2
qmult #(Q,N) mult6 (a2, Vrms_2, term2);

logic [N-1:0] term3; // a3*Vrms^3
qmult #(Q,N) mult7 (a3, Vrms_3, term3);

logic [N-1:0] term4; // a4*Vrms^4
qmult #(Q,N) mult8 (a4, Vrms_4, term4);

logic [N-1:0] term5; // a5*Vrms^5
qmult #(Q,N) mult9 (a5, Vrms_5, term5);                                    

logic [N-1:0] neg_term2; 
negar #(Q,N) neg0 (term2, neg_term2);

logic [N-1:0] neg_term4; 
negar #(Q,N) neg1 (term4, neg_term4);

logic [N-1:0] aux0;   // a1*Vrms + a0
qadd #(Q,N) sum0 (term1, a0, aux0);

logic [N-1:0] aux1;   // a3*Vrms^3 - a2*Vrms^2 
qadd #(Q,N) sum1 (term3, neg_term2, aux1);

logic [N-1:0] aux2;   // a5*Vrms^5 - a4*Vrms^4 
qadd #(Q,N) sum2 (term5, neg_term4, aux2);

logic [N-1:0] aux_out0;   // a3*Vrms^3 - a2*Vrms^2 + a1*Vrms + a0 
qadd #(Q,N) sum3 (aux0, aux1, aux_out0);

logic [N-1:0] aux_out;   // a5*Vrms^5 - a4*Vrms^4 + a3*Vrms^3 - a2*Vrms^2 + a1*Vrms + a0 
qadd #(Q,N) sum4 (aux_out0, aux2, aux_out);

// Asignación de salida 

always_ff @(posedge clk) begin
    if ( Vrms_SP >= 32735 ) 
        DC_out = 3293184;
    else if ( Vrms_SP == 0 ) 
        DC_out = 0; 
    else 
        DC_out = aux_out;
end

//assign DC_out = aux_out;
//assign aux_gg = Vrms; 

endmodule
