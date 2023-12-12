`timescale 1ps / 1ps

module tb_signal_gen;

reg clk;
reg [1:0] mode;
reg en_signal;
wire send;
wire load;
wire baudrate;
wire en_clk_B;
wire aux1;
wire aux2;

signal_gen #(3, 150) dut1(
    .clk(clk),
    .mode(mode),
    .en_signal(en_signal),
    .send(send),
    .load(load),
    .baudrate(baudrate),
    .en_clk_B(en_clk_B),
    .aux1(aux1),
    .aux2(aux2)
        );


initial begin
    clk = 0;
    mode = 2'b00;
    #1000 
    mode = 2'b01;
    #10000
    mode = 2'b10;
    #1000
    en_signal = 1;
    #10
    en_signal = 0;
    #1000
    en_signal = 1;
    #10
    en_signal = 0;
    #2000
    mode = 2'b01; 
    #2000
    mode = 2'b00;
    #2000
    mode = 2'b10;
    en_signal = 1;
    #10
    en_signal = 0;
    #1000
    en_signal = 1;
    #500
    en_signal = 0;
    #2000
    mode = 2'b00;
    
    end 

always begin
    #5 clk = ~clk; 
end

endmodule
