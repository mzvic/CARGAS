`timescale 1ns / 1ps

module dfiltro(
    PV,
    clk,
    start,
    dPV,
    dPV_max
    );

// Entradas
input wire [11:0] PV;
input wire clk;
input wire start;

// Salidas
output wire [11:0] dPV;
output wire [11:0] dPV_max;

// Parámetros 
parameter Q = 15;
parameter N = 28;
////////////////////////////////////////////////// MÓDULO //////////////////////////////////////////

wire [N-1:0] bits;
assign bits[N-2:Q] = PV;
assign bits[N-1] = 0;
assign bits[Q-1:0] = 0;

reg [N-1:0] aux_0, aux_1;
always @(posedge clk ) begin
    if (start) begin 
        aux_0 <= bits;
        aux_1 <= aux_0;
    end
end

wire [N-1:0] neg_aux_0;
negar #(Q,N) neg (aux_0,neg_aux_0);

wire [N-1:0] diff_PV;    
qadd #(Q,N) sum1 ( aux_1, neg_aux_0, diff_PV);

wire [N-1:0] abs_diff_PV;    
abs #(Q,N) abs0 (diff_PV, abs_diff_PV);

assign dPV = abs_diff_PV[Q+12-1:Q];

reg [11:0] aux_max = 0;
always @(posedge clk) begin
    if (start) begin
        if ( dPV > aux_max & dPV < 4000) begin
            aux_max <= dPV;
        end
        else
            aux_max <= aux_max;
    end
end

assign dPV_max = aux_max;

endmodule
