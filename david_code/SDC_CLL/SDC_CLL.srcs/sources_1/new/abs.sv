`timescale 1ns / 1ps

module abs(
    in,
    abs_out
    );

// Entradas
input logic [N-1:0] in;

// Outputs
output logic [N-1:0] abs_out;

//Parameterized values
parameter Q = 15;
parameter N = 28;    

////////////////////////////////////////// MODULO ///////////////////////////////// 

always_comb begin
    abs_out[N-1] = 0; 
    abs_out[N-2:0] = in[N-2:0];
end

endmodule