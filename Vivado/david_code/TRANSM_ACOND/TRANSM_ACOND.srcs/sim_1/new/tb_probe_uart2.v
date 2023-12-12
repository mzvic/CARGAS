`timescale 1ps / 1ps

module tb_probe_uart2;

reg clk;
reg [3:0] sw;
wire uart_txd_out;

probe_uart2 #(3,130) probe_tx (
    clk,
    sw,
    uart_txd_out
   );   

   
initial begin
    clk = 0;
    sw = 4'b0000; 
end

always
begin
    #5 clk = ~clk;
    
end
endmodule
