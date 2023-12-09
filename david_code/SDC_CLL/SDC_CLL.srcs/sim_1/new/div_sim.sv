`timescale 1ps / 1ps

`include "div_frecuencias.vh"

module div_sim();

//Parameterized values
	parameter Q = 8;
	parameter N = 20;
	parameter F = 100;
 
//	// Inputs
	logic [N-1:0] dividend;
	logic [N-1:0] divisor;
	logic clk;
 
//	// Outputs
	logic [N-1:0] result;
	
 
//	// Instantiate the Unit Under Test (UUT)
//	//module  Params  Name  Signals
    logic [N-1:0] quotient;
    logic done;
	qdiv #(Q,N)	gg (dividend, divisor, start, clk, quotient,done);
	
	logic start;
	divisor_f #(F) start_clk (
        .clk(clk),
        .en_clk(1),
        .clk_out(start)
        ); 
        
    initial begin
        // Initialize Inputs
        clk = 0;
        dividend = 768; 
        divisor = 384;
        
//        #15000
        
//        dividend = 51712;
//        divisor = 955;
        
//        #1000
        
//        dividend = 2560;
//        divisor = 384;
        
//        #2000
        
//        dividend = 2560;
//        divisor = 955;
        
//        #5000
//        dividend = 51712;
//        divisor = 2560;
        
    end
    
    always_comb begin 
        if (done)
            result = quotient;
    end
        
 	always #5 clk = ~clk;
    
endmodule
