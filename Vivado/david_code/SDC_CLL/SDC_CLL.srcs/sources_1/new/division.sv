`timescale 1ns / 1ps

module division(
    dividendo,
    divisor,
    clk,
    result
    );
 
// Entradas
input logic [N-1:0] dividendo;
input logic [N-1:0] divisor;
input logic clk;

// Outputs
output logic [N-1:0] result;

//Parameterized values
parameter Q = 8;
parameter N = 20;
parameter T = 50;  // f = 2MHz frecuencia de cálculo
 
////////////////////////////////////////// MODULO ///////////////////////////////// 

logic [N-1:0] cuociente;
logic done;
qdiv #(Q,N)	uut (dividendo, divisor, start, clk, cuociente,done);

logic start;
divisor_f #(T) start_clk (
    .clk(clk),
    .en_clk(1),
    .clk_out(start)
    ); 
    
always_comb begin 
if (done)
    result = cuociente;
end

endmodule
