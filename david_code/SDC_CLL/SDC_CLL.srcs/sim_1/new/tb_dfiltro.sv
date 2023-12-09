`timescale 1ps / 1ps

module tb_dfiltro;

logic clk;
logic start;
logic [11:0] PV;
logic [11:0] dPV;
logic [11:0] dPV_max;

parameter Q = 15;
parameter N = 28;

dfiltro #(Q,N) filt(PV,clk,start,dPV,dPV_max);

initial begin
    clk = 1; 
    start = 0; 
    #100
    PV = 500;
    #100
    PV = 510; 
    #100
    PV = 511;    
    #100
    PV = 611; 
    #100
    PV = 651; 
end

always begin
    #5 clk = ~clk;
end

always begin
    #90
    start = 1;
    #10
    start = 0;
end

endmodule
