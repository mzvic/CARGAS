`timescale 1ns / 1ps

module syncro( 
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
input logic clk;
input logic sync_in;
input logic sync_out;
input logic [15:0] data_in1;
input logic [2:0] data_in2;
input logic [15:0] data_in3;
input logic [15:0] data_in4;
input logic [15:0] data_in5;
input logic [9:0] data_in6;

// Salidas
output logic [15:0] data_out1;
output logic [2:0] data_out2;
output logic [15:0] data_out3;
output logic [15:0] data_out4;
output logic [15:0] data_out5;
output logic [9:0] data_out6;

//////////////////////////////////////////////////////////////////// Módulo ///////////////////////////////////////////////////////////////////
// Registros de entrada
logic [15:0] data_reg1;
logic [2:0] data_reg2;
logic [15:0] data_reg3;
logic [15:0] data_reg4;
logic [15:0] data_reg5;
logic [9:0] data_reg6;

always_ff @(posedge clk) begin
	if ( sync_in ) begin
		data_reg1 <= data_in1;
		data_reg2 <= data_in2;
		data_reg3 <= data_in3;
		data_reg4 <= data_in4;
		data_reg5 <= data_in5;
		data_reg6 <= data_in6;
	end
end

// Asignación de salida
always_ff @(posedge clk) begin
	if (sync_out) begin
		data_out1 <= data_reg1;
		data_out2 <= data_reg2;
		data_out3 <= data_reg3;
		data_out4 <= data_reg4;
		data_out5 <= data_reg5;
		data_out6 <= data_reg6;
	end
end

endmodule
