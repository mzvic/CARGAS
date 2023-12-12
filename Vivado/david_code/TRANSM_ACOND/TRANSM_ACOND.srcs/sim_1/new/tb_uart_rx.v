`timescale 1ps / 1ps

module tb_uart_rx;

reg clk;
wire send;
wire rx;
wire data_rcv;
wire [7:0] dato;
reg [7:0] datox;
wire tx;
    
uart_tx #(3, 130) TX_in(
    .clk(clk),
    .mode(2'b01),
    .dato(datox),
    .tx(rx)
    );
            
uart_rx tb_rx(
    clk,
    rx,
    dato,
    data_rcv
    );
    
uart_tx #(3, 130) TX_out(
        .clk(clk),
        .mode(2'b10),
        .en_signal(data_rcv),
        .dato(dato),
        .tx(tx)
        );
        
initial begin
    clk = 0;
    datox = "A";
    #1910 datox = "B";
    #1000 datox = "A";
    #1600 datox = "C";
//    en_clk = 0;
//    #100 en_clk = 1;
end 

always begin
    #5 clk = ~clk; 
end

endmodule
