`timescale 1ns / 1ps

module bits2temp2(
    clk,
//    read_data,
    yk,
    yT
    );
    
// Entradas
input wire clk;
//input wire read_data;
input wire [11:0] yk;

// Salida
output wire [N-1:0] yT;

// Parámetros 
parameter Q = 15;
parameter N = 28;

// Parámetros locales
localparam V = 108134;  // V =3.3 
localparam inv_res_V = 40662109; // bit / V  .. bit = 4095
localparam gain = 9863168; // G =301
localparam inv_r_1 = 33030; // 1/r + 1 = 1.008 ..
localparam b = 4161798;  // b = 127.008
localparam inv_alpha = 8511169; // 1/alpha = 259.7402
localparam dos = 65536; // dos = 2

localparam R1 = 7208960; // R1 = 220
localparam R0 = 3276800; // R0 = 100
localparam R0_alpha = 12615; 
///////////////////////////////////////// MODULO /////////////////////////////////////

wire [N-1:0] bits;
assign bits[N-2:Q] = yk;

// Calculo de voltaje Vg
wire [N-1:0] Vg;
div_v #(Q,N) div_Vg (bits, inv_res_V,clk, Vg );

// Calculo Rt del divisor de voltaje (ALTERNATIVA)
wire [N-1:0] R1_Vg;
qmult #(Q,N) mult2 (Vg, R1, R1_Vg );

wire [N-1:0] neg_Vg;
negar #(Q,N) neg (Vg,neg_Vg);

wire [N-1:0] V_Vg;    
qadd #(Q,N) sum1 ( neg_Vg, V, V_Vg);

wire [N-1:0]  Rt;
div_v #(Q,N) div1 (R1_Vg,V_Vg,clk,Rt);

// Cálculo de t0

wire [N-1:0] neg_R0;
negar #(Q,N) neg1 (R0,neg_R0);

wire [N-1:0] Rt_R0;    
qadd #(Q,N) sum2 ( Rt, neg_R0, Rt_R0);

wire [N-1:0]  t_o;
div_v #(Q,N) div2 (Rt_R0,R0_alpha,clk,t_o);

reg [N-1:0] t_out;

//always @(posedge clk) begin
//    if ( read_data )
//        t_out <= t_o;
//end

assign yT = t_o;

endmodule
