`timescale 1ps / 1ps

module qdiv_tf;
//Parameterized values
	parameter Q = 8;
	parameter N = 20;
 
	// Inputs
    reg [N-1:0] in_1;
    reg [N-1:0] in_2;
	reg clk;
 
	// Outputs
	wire [N-1:0] quotient;
	wire done;
	reg [11:0] result;
	
	wire start;
    divisor_f #(50) start_clk (
        .clk(clk),
        .en_clk(1),
        .clk_out(start)
        ); 
	// Instantiate the Unit Under Test (UUT)
	//module  Params  Name  Signals
	qdiv #(Q,N)	uut (in_2, in_1, start, clk, quotient,done);
 
	initial begin
		// Initialize Inputs
		in_1 = 20'd512;
		in_2 = 20'd2560;
		clk = 0;
	end
	
	always @(done) begin 
        if (done)
            result = quotient[N-2:Q];
    end
 
	always
	begin
		#5 clk = ~clk;
	end

endmodule