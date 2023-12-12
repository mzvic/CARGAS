`timescale 1ps / 1ps

module neg_opers;

reg clk = 0;
reg [N-1:0] in_1 = 655360; 
reg [N-1:0] in_2 = 65536;
wire [11:0] result_out;
wire [N-1:0] result;
wire [N-1:0] sum;
wire [11:0] sum_out;
wire [N-1:0] neg;
wire [N-1:0] mult;
wire [11:0] mult_out;
wire [N-1:0] div; 
wire [11:0] div_out;
wire [N-1:0] neg_result;
wire [11:0] neg_result_out;

parameter Q = 15;
parameter N = 28;

qadd #(Q,N) sum1 ( in_1, in_2, result);

assign sum = in_2 - in_1;
qmult #(Q,N) mult1 ( neg, in_2, mult);

negar #(Q,N) neg1 (in_1, neg);

div_v #(Q,N) div1 (neg, in_2, clk, div);

qadd #(Q,N) sum2 ( in_2 , neg, neg_result);

assign result_out = result[N-2:Q];
assign sum_out = sum[N-2:Q];
assign mult_out = mult[N-2:Q];
assign div_out = div[N-2:Q];
assign neg_result_out = neg_result[N-2:Q];

always #5 clk = ~clk;

//initial begin
//result_out = 0;
//result = 0;
//end
endmodule
