`timescale 1ps / 1ps

module sec_calcs_sim;
//Parameterized values
	parameter Q = 15;
	parameter N = 28;
 
	// Inputs
    reg [N-1:0] in_1;
    reg [N-1:0] in_2;
	reg clk;
 
	// Outputs
	wire [N-1:0] result;
	wire [11:0] q;
	wire [N-1:0] sum;
	
	// Instantiate the Unit Under Test (UUT)
	//module  Params  Name  Signals
	qadd #(Q,N) sum1 ( in_1, in_2, sum);
	div_v #(Q,N) uut (sum, in_1, clk, result);
  
    assign q = result[N-2:Q];

 
	initial begin
		// Initialize Inputs
		in_1 = 20'd65536;
		in_2 = 20'd327680;
		clk = 0;
	end
	
	always
	begin
		#5 clk = ~clk;
	end

endmodule