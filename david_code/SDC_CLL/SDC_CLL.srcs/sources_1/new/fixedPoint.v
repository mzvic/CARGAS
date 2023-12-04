`timescale 1ns / 1ps

module fixedPoint(
    ent_1,
    ent_2,
    ent_3,
    ent_4,
    ent_5,
    ent_6,
    ent_7,
    ent_8,
    ent_9,
    sal_1,
    sal_2,
    sal_3,
    sal_4,
    sal_5,
    sal_6,
    sal_7,
    sal_8,
    sal_9

    );

// Entradas
input wire [N-1:0] ent_1;   
input wire [N-1:0] ent_2;   
input wire [N-1:0] ent_3;
input wire [N-1:0] ent_4;
input wire [N-1:0] ent_5;
input wire [N-1:0] ent_6;
input wire [N-1:0] ent_7;
input wire [N-1:0] ent_8;
input wire [N-1:0] ent_9;

// Salidas
output wire [13:0] sal_1;    
output wire [13:0] sal_2;   
output wire [13:0] sal_3;
output wire [13:0] sal_4;
output wire [13:0] sal_5;
output wire [13:0] sal_6;
output wire [13:0] sal_7;
output wire [13:0] sal_8;
output wire [13:0] sal_9;

// Parámetros 
parameter Q = 15;
parameter N = 28;

// Parámetros locales
localparam Q_out = 6;
localparam N_out = 14;
////////////////////////////////////////// MÓDULO /////////////////////////////

assign sal_1 = ent_1[N_out+Q-Q_out-1:Q-Q_out];
assign sal_2 = ent_2[N_out+Q-Q_out-1:Q-Q_out];
assign sal_3 = ent_3[N_out+Q-Q_out-1:Q-Q_out];
assign sal_4 = ent_4[N_out+Q-Q_out-1:Q-Q_out];
assign sal_5 = ent_5[N_out+Q-Q_out-1:Q-Q_out];
assign sal_6 = ent_6[N_out+Q-Q_out-1:Q-Q_out];
assign sal_7 = ent_7[N_out+Q-Q_out-1:Q-Q_out];
assign sal_8 = ent_8[N_out+Q-Q_out-1:Q-Q_out];
assign sal_9 = ent_9[N_out+Q-Q_out-1:Q-Q_out];
//assign sal_2 = ent_2[N-1:Q];
//assign sal_3 = ent_3[N-1:Q];
//assign sal_4 = ent_4[20:10];
endmodule
