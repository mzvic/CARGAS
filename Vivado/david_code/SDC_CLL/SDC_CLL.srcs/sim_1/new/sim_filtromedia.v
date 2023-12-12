`timescale 1ps / 1ps

module sim_filtromedia;

//Parameterized values
	parameter Q = 15;
	parameter N = 28;
	// Inputs
	reg clk;
    wire [11:0] out_var;
    wire ready;
    
    create_var val_var(clk, out_var, ready);
 
	// Outputs
	wire [N-1:0] result;
	wire [11:0] q;

    filtro_media_v #(Q,N) filt_uut (clk,ready,out_var,result,q);

    initial begin
		clk = 0;
	end
	
	always
	begin
		#5 clk = ~clk;
	end

endmodule