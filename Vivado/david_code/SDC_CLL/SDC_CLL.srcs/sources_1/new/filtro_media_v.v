`timescale 1ns / 1ps

module filtro_media_v(
    clk,
    ready,
    in_1,
    out_N,
    out_12    
    );

// Entradas 
input wire clk;
input wire ready;
input wire [11:0] in_1;

//Salida
output wire [N-1:0] out_N;
output wire [11:0] out_12;

// Parámetros 
parameter Q = 15;
parameter N = 28;

// Parámetros locales
localparam DIEZ = 327680;
localparam VEINTE = 655360; 

/////////////////////////////////////////////// MODULO ///////////////////////////////////////////

reg [N-1:0] in_val;
always @(in_1) begin
    in_val[N-1] = 0;
    in_val[N-2:Q] = in_1;
    in_val[Q-1:0] = 0;
end

wire [N-1:0] div_in;
div_v #(Q,N) ut (in_val, DIEZ, clk, div_in);  /// DIEZ

reg [N-1:0] aux0 = 0; reg [N-1:0] aux1 = 0; 
reg [N-1:0] aux2 = 0; reg [N-1:0] aux3 = 0;
reg [N-1:0] aux4 = 0; reg [N-1:0] aux5 = 0;
reg [N-1:0] aux6 = 0; reg [N-1:0] aux7 = 0;
reg [N-1:0] aux8 = 0; reg [N-1:0] aux9 = 0;
//reg [N-1:0] aux10 = 0; reg [N-1:0] aux11 = 0; 
//reg [N-1:0] aux12 = 0; reg [N-1:0] aux13 = 0;
//reg [N-1:0] aux14 = 0; reg [N-1:0] aux15 = 0;
//reg [N-1:0] aux16 = 0; reg [N-1:0] aux17 = 0;
//reg [N-1:0] aux18 = 0; reg [N-1:0] aux19 = 0;

wire [N-1:0] result;

wire [N-1:0] sum1;    
qadd #(Q,N) sum_1 ( aux0, aux1, sum1);

wire [N-1:0] sum2;    
qadd #(Q,N) sum_2 ( sum1, aux2, sum2);

wire [N-1:0] sum3;    
qadd #(Q,N) sum_3 ( sum2, aux3, sum3);

wire [N-1:0] sum4;    
qadd #(Q,N) sum_4 ( sum3, aux4, sum4);

wire [N-1:0] sum5;    
qadd #(Q,N) sum_5 ( sum4, aux5, sum5);

wire [N-1:0] sum6;    
qadd #(Q,N) sum_6 ( sum5, aux6, sum6);

wire [N-1:0] sum7;    
qadd #(Q,N) sum_7 ( sum6, aux7, sum7);

wire [N-1:0] sum8;    
qadd #(Q,N) sum_8 ( sum7, aux8, sum8);

wire [N-1:0] sum9;    
qadd #(Q,N) sum_9 ( sum8, aux9, result); //sum9

//wire [N-1:0] sum10;    
//qadd #(Q,N) sum_10 ( sum9, aux10, sum10);

//wire [N-1:0] sum11;    
//qadd #(Q,N) sum_11 ( sum10, aux11, sum11);

//wire [N-1:0] sum12;    
//qadd #(Q,N) sum_12 ( sum11, aux12, sum12);

//wire [N-1:0] sum13;    
//qadd #(Q,N) sum_13 ( sum12, aux13, sum13);

//wire [N-1:0] sum14;    
//qadd #(Q,N) sum_14 ( sum13, aux14, sum14);

//wire [N-1:0] sum15;    
//qadd #(Q,N) sum_15 ( sum14, aux15, sum15);

//wire [N-1:0] sum16;    
//qadd #(Q,N) sum_16 ( sum15, aux16, sum16);

//wire [N-1:0] sum17;    
//qadd #(Q,N) sum_17 ( sum16, aux17, sum17);

//wire [N-1:0] sum18;    
//qadd #(Q,N) sum_18 ( sum17, aux18, sum18);

//wire [N-1:0] sum19;    
//qadd #(Q,N) sum_19 ( sum18, aux19, result);

assign out_N = result;
assign out_12 = result[N-2:Q];

always @(posedge clk) begin
    if (ready) begin
//        aux19 <= aux18;  
//        aux18 <= aux17;
//        aux17 <= aux16;
//        aux16 <= aux15;
//        aux15 <= aux14;
//        aux14 <= aux13;
//        aux13 <= aux12;
//        aux12 <= aux11;
//        aux11 <= aux10;
//        aux10 <= aux9;
        aux9 <= aux8;  
        aux8 <= aux7;
        aux7 <= aux6;
        aux6 <= aux5;
        aux5 <= aux4;
        aux4 <= aux3;
        aux3 <= aux2;
        aux2 <= aux1;
        aux1 <= aux0;
        aux0 <= div_in;     
    end
end
    
endmodule
