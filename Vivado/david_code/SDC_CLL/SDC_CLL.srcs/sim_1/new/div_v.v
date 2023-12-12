`timescale 1ns / 1ps

module div_v(
    in1,
    in2,
    clk,
    result
    );

// Entradas
input wire [N-1:0] in1;
input wire [N-1:0] in2;
input wire clk;

// Salidas
output reg [N-1:0] result;

// Parámetros
parameter Q = 15;
parameter N = 28;

/////////////////////////////////////////// MÓDULO ////////////////////////////////////////

wire [N-1:0] quotient;
wire done;

wire start;
divisor_f #(50) start_clk (
    .clk(clk),
    .en_clk(1),
    .clk_out(start)
    ); 
    
qdiv #(Q,N)	uut (in1, in2, start, clk, quotient,done);

always @(done) begin 
    if (done)
        result = quotient;
end

endmodule

