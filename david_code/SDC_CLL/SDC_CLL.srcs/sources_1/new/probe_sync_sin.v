`timescale 1ns / 1ps

module probe_sync_sin(
    clk,
    in_1,
    out_1
    );
    
input wire clk;
input wire [11:0] in_1;
output reg out_1;

reg aux1;
always @(in_1) begin
    if (in_1 > 2000)
        aux1 = 1;
    else
        aux1 = 0;
end


wire out_1;
reg aux1_ant;

assign out_1 =( ~aux1_ant) & aux1;

always @(posedge clk) begin
    if (start)
        aux1_ant <= aux1;
end

wire start;
divisor_f #(1000)clk_start(  //100kHz
    //Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(start)               
);

endmodule
