`timescale 1ps / 1ps

module sim_FLC;

//Parameterized values
    
        // Inputs
        reg clk;
        wire clk_tm;
        reg [27:0] err;
        reg [27:0] Se;
        reg [27:0] Sde;
        reg [27:0] Sdu;
     
        // Outputs
        wire [27:0] uk;
    
        modo_flc fuzzy1 (clk,clk_tm,err,Se,Sde,Sdu,uk);
        
        divisor_f #(200) start_clk (
            .clk(clk),
            .en_clk(1),
            .clk_out(clk_tm)
            ); 
                
    
        initial begin
            clk = 0;
            err = 327680;
            Se = 3145728;
            Sde = 1638400;
            Sdu = 3604480;
        end
        
        always
        begin
            #5 clk = ~clk;
        end
        
        
    endmodule