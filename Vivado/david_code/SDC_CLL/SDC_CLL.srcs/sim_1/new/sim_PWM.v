`timescale 1ps / 1ps

module sim_PWM;

//Parameterized values
    
        // Inputs
        reg clk;
        reg [9:0] duty;
        reg [11:0] sync_sin;

        // Outputs
        wire pin_pwm;
        wire [9:0] cont; 
        wire aux1;
        wire aux_ant;
    
        PWM pmw1 (clk,duty,sync_sin,pin_pwm,cont,aux1, aux_ant);
    
        initial begin
            clk = 0;
            duty = 0;
            #10000
            sync_sin = 4000;
            #30
            sync_sin = 0;
            #10000
            sync_sin =4000;
            #5
            sync_sin = 0;           
        end
        
        always
        begin
            #5 clk = ~clk;
        end
        
        
    endmodule
