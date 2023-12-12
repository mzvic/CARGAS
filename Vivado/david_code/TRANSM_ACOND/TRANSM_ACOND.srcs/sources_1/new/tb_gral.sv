`timescale 1ps / 1ps

module tb_gral;

logic clk;
logic send;
logic en_signal;
logic aux1;
logic aux2; 

always_ff @( posedge clk) begin
    if ( en_signal ) 
        aux1 <= 1; 
    else if ( send ) 
        aux1 <= 0;
end

always_ff @( posedge clk) begin
    if ( send ) begin
        if (aux1 ^ en_signal)
            aux2 <= 1; 
        else 
            aux2 <= 0;
    end
end

divisor_f #(3) send_gen(
    clk,
    1,
    send
    );

initial begin
    clk = 0;
    #1000
    en_signal = 1;
    #5
    en_signal = 0;
    #1000
    en_signal = 1;
    #5
    en_signal = 0;
    #1000
    en_signal = 1;
    #500 
    en_signal = 0;
    end 

always begin
    #5 clk = ~clk; 
end

endmodule
