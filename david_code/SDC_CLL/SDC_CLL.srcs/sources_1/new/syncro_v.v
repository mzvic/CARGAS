`timescale 1ns / 1ps

module syncro_v( 
	clk, 
    sync_in,
    sync_out,
    data_in1,
    data_in2,
    data_in3,
    data_in4,
    data_in5,
    data_in6,
    data_out1,
    data_out2,
    data_out3,
    data_out4,
    data_out5,
    data_out6
    );

// Entradas
input wire clk;
input wire sync_in;
input wire sync_out;
input wire [15:0] data_in1;
input wire [2:0] data_in2;
input wire [15:0] data_in3;
input wire [15:0] data_in4;
input wire [15:0] data_in5;
input wire [9:0] data_in6;

// Salidas
output wire [15:0] data_out1;
output wire [2:0] data_out2;
output wire [15:0] data_out3;
output wire [15:0] data_out4;
output wire [15:0] data_out5;
output wire [9:0] data_out6;
//////////////////////////////////////////////////////////////////// Módulo ///////////////////////////////////////////////////////////////////

syncro sync_1( 
	clk, 
    sync_in,
    sync_out,
    data_in1,
    data_in2,
    data_in3,
    data_in4,
    data_in5,
    data_in6,
    data_out1,
    data_out2,
    data_out3,
    data_out4,
    data_out5,
    data_out6
    );
	


endmodule
