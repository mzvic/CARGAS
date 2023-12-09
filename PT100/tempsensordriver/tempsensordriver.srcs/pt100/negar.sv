`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2017 10:20:54
// Design Name: 
// Module Name: negar
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module negar(
    in,
    neg_in
    );
    
// Entradas
input logic [N-1:0] in;

// Outputs
output logic [N-1:0] neg_in;

//Parameterized values
parameter Q = 15;
parameter N = 28;    

////////////////////////////////////////// MODULO ///////////////////////////////// 
logic [N-1:0] aux;
always_comb begin
    if ( in[N-1] == 1) begin
//        aux = -in;
//        neg_in = aux + 1;
        neg_in[N-1] = 0; 
        neg_in[N-2:0] = in[N-2:0];
    end
    else begin
        neg_in[N-1] = 1;
        neg_in[N-2:0] = in[N-2:0];
    end
end
endmodule
