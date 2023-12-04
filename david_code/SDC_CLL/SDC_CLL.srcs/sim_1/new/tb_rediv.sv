`timescale 1ps / 1ps

module tb_rediv;

logic clk;
logic tm_gen;
logic read_data;
logic tm;

// Tiempo de muestreo
divisor_f #(3) clk_gen (
    .clk(clk),
    .en_clk(1),
    .clk_out(tm_gen)            
);    

rediv_f #(4,2) clk_ctrl (
    .clk(clk),
    .clk_in(tm_gen),
    .clk_out(read_data),
    .clk_out2(tm)     
);  


initial begin
    clk = 1; 
end

always begin
    #5 clk = ~clk;
end

endmodule
