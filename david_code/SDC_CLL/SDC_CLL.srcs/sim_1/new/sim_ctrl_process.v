`timescale 1ps / 1ps

module sim_ctrl_process;

//Parameterized values
    
        // Inputs
        reg clk;
        reg [2:0] MODO;
        reg [15:0] SP;
        reg [27:0] yT;
        reg [15:0] param1;
        reg [15:0] param2;
        reg [15:0] param3;

     
//        // Outputs
        wire [9:0] CV;
        wire [2:0] mode_ind;
        wire [15:0] out1;
        wire ind_ctrl;

        process_v p1 (clk,SP,MODO,param1,param2,param3,yT,CV,out1,mode_ind,ind_ctrl);
    
        initial begin
            clk = 0;
            MODO = 2;
            SP = 7680;
            yT = 671744;
            param1 = 9932;
            param2 = 10240;
            param3 = 0;
        end
        
        always
        begin
            #5 clk = ~clk;
        end
        
endmodule
