`timescale 1ps / 1ps

module sim_ctrl;

//Parameterized values

	// Inputs
	reg clk;
    reg [27:0] uk;
    
//    create_var val_var(clk, out_var, ready);
 
	// Outputs
	wire [9:0] CV;

    control_value ctrl1 (clk, uk, CV);

    initial begin
		clk = 0;
		uk = 2471363;
	end
	
	always
	begin
		#5 clk = ~clk;
	end

endmodule
