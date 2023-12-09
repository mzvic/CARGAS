`timescale 1ns / 1ps

module calcs_sim();

reg clk = 0;
reg [11:0] in_1 = 4; 
reg [N-1:0] in_2 = 33488895;
wire [11:0] result_out;
wire [N-1:0] result;
wire [N-1:0] sum;

parameter Q = 15;
parameter N = 28;

wire [N-1:0] in_11;
assign in_11[N-2:Q] = in_1;
assign in_11[Q-1:0] = 0;
assign in_11[N-1] = 0;

wire [N-1:0] neg_in_2;
negar #(Q,N) neg2 (in_2,neg_in_2);
qadd #(Q,N) sum1 ( in_11, neg_in_2, result);
//qmult #(Q,N) mult1 ( sum, in_2, result);

assign result_out = result[N-2:Q];

always #1 clk = ~clk;

//initial begin
//result_out = 0;
//result = 0;
//end
endmodule
