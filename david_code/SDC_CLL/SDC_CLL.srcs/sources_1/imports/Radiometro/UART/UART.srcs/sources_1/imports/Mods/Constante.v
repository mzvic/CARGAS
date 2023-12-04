`timescale 1ns / 1ps

module constante(
    in_0,
    in_1,
    clk,
    d1,
    d2,
    d3,
    d4,
    d5,
    d6,
    out_0,
    out_1,
    out_2
    );

input wire [15:0] in_0; 
input wire [11:0] in_1; 
input wire clk; 

output wire [15:0] d1;
output wire [2:0] d2;
output wire [15:0] d3;
output wire [15:0] d4;
output wire [15:0] d5;
output wire [9:0] d6;

output wire [9:0] out_0;
output wire [9:0] out_1;
output wire [9:0] out_2;

// MODULO

reg [15:0] k1 = 16'd0;
reg [2:0] k2 = 3'd1;
reg [15:0] k3 = 15'b100000000;
reg [15:0] k4 = 15'b100000000;
reg [15:0] k5 = 15'b100000000;
reg [9:0] k6 = 10'd100;

//always @(in_0) begin 
//    k1 = in_0;
//end

assign d1 = k1;
assign d2 = k2;
assign d3 = k3;
assign d4 = k4;
assign d5 = k5;
assign d6 = k6;


// Entrada de 0-4095 .. salida de 0-511
assign out_0 = in_1[11:2];

// Entrada de 0-4095 .. salida de 0-1000
localparam Q = 15;
localparam N = 28;
localparam L = 10; 
localparam res_1 = 1023;

localparam k = 134185;

wire [N-1:0] bits;
assign bits[N-2:Q] = in_1;

wire [N-1:0] aux;
div_v #(Q,N) div0 (bits,k,clk,aux);

control_value #(L,res_1,Q,N) 
out_ctrl(
    clk,
    aux, 
    out_1
    );

// Entrada de 0-100 FP .. salida de 0-1000
// Set point
reg [N-1:0] SV;
always @(posedge clk) begin
    SV[26:7] <= in_0;
    SV[N-1] <= 0;
    SV[6:0] <= 0; 
end

control_value #(L,res_1,Q,N) 
out_ctrl2(
    clk,
    SV, 
    out_2
    );


endmodule