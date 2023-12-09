`timescale 1ps / 1ps

module tb_vrms_lineal;

logic clk;
logic [15:0] SP;
logic [N-1:0] SP1;
logic [N-1:0] in_0;
logic [N-1:0] in_1;
logic [N-1:0] aux_gg;

parameter Q = 15;
parameter N = 28;

always_comb begin
    SP1[26:7] = SP;
    SP1[N-1] = 0;
    SP1[6:0] = 0;
end

div_v #(Q,N) div0 ( SP1, 3276800, clk, in_0);

Vrms_DC_lineal #(Q,N) lineal1 (in_0,in_1,aux_gg); 

initial begin
    clk = 0; 
    SP = 12800;
end

always begin
    #5 clk = ~clk;
end


endmodule
