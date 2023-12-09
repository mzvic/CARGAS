`timescale 1ps / 1ps

module tb_semaforo;

    reg clk;
    wire [1:0] color; 
    wire divClk;
    wire [5:0] cont;
    
    
    
    divisor_f #(10)
        divisor ( 
        .clk(clk),
        .en_clk(1), 
        .clk_out(divClk)
      );
    semaforo jkkk(
          .clk(clk),
          .divClk(divClk),
          .color(color),
          .cont(cont)
          );   
    initial begin
    clk = 0;
//            en_clk = 0;
//            #100 en_clk = 1;
    end 
    
    always
    begin
        #5 clk = ~clk;
    end
endmodule
