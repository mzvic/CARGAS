`timescale 1ps / 1ps

module sim_bit2temp;

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
    wire [N-1:0] yT;
    wire [11:0] yT_out;
    
    filtro_media_v #(Q,N) filt_uut (clk,ready,out_var,result,q);
    bits2temp #(Q,N) conv1 (clk,result,yT);
    
    assign yT_out = yT[N-2:Q];
    
    initial begin
		clk = 0;
	end
	
	always
	begin
		#5 clk = ~clk;
	end

endmodule
