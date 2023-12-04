`timescale 1ps / 1ps

module sim_PID;

//Parameterized values

	// Inputs
	reg clk;
	wire clk_tm;
    reg [27:0] err;
    reg [27:0] kc;
    reg [27:0] Ti;
    reg [27:0] Td;
 
	// Outputs
    wire [27:0] uk;

    modo_pid pid1 (clk,clk_tm,err,kc,Ti,Td,uk);
    
    divisor_f #(100) start_clk (
        .clk(clk),
        .en_clk(1),
        .clk_out(clk_tm)
        ); 
            

    initial begin
		clk = 0;
		err = 333840;
		kc = 1271398;
		Ti = 1310720;
		Td = 0;
	end
	
	always
	begin
		#5 clk = ~clk;
	end
	
	
endmodule
