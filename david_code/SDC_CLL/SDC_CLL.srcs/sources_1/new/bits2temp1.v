`timescale 1ns / 1ps

module bits2temp1(
    clk,
    yk,
    yT
    );
    
// Entradas
input wire clk;
input wire [11:0] yk;

// Salida
output reg [N-1:0] yT;

// Parámetros 
parameter Q = 15;
parameter N = 28;

// Parámetros locales
localparam V = 163840;  // V =5
localparam inv_res_V = 40662109; // bit / V  .. bit = 4095
localparam gain = 9863168; // G =301
localparam c = 32932; //c = 1/r + 1
localparam b = 6619300;  // b = r + 2 + 1/r
localparam betha = 8511169; // 1/alpha = 259.7402
localparam dos = 65536; // dos = 2

///////////////////////////////////////// MODULO /////////////////////////////////////

wire [N-1:0] bits;
assign bits[N-2:Q] = (yk == 0) ? 1 : yk;

// Calculo de voltaje Vg
wire [N-1:0] Vg;
div_v #(Q,N) div_Vg (bits, inv_res_V,clk, Vg );

// Calculo voltaje del P.W (OFICIAL)

wire [N-1:0]  gain_Vg;
div_v #(Q,N) div1 (gain,Vg,clk,gain_Vg); // Si la medición inicial es 0, esta división es infinito... #GG

wire [N-1:0] V_gain_Vg;
qmult #(Q,N) mult1 (V, gain_Vg, V_gain_Vg);

wire [N-1:0] neg_V_gain_Vg;
negar #(Q,N) neg2 (V_gain_Vg,neg_V_gain_Vg);

wire [N-1:0] den;   
qadd #(Q,N) sum1 ( neg_V_gain_Vg, c, den);

wire [N-1:0] num;
negar #(Q,N) neg1 (b,num);

wire [N-1:0]  aux1;
div_v #(Q,N) div2 (num,den,clk,aux1);

wire [N-1:0] t_o;
qmult #(Q,N) mult2 (betha, aux1, t_o);

always @(posedge clk) begin
    yT <= t_o;
end

endmodule
