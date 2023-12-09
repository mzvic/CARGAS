`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////


module filtro_media(
    clk,
    ready,
    in_1,
    out_1    
    );

// Entradas 
input logic clk;
input logic ready;
input logic [11:0] in_1;

//Salida
output logic [11:0] out_1;

// Parámetros 
parameter Q = 15;
parameter N = 28;

localparam DIEZ = 327680; // DIEZ = 10
localparam dos = 65536; // dos = 2
/////////////////////////////////////////////// MODULO ///////////////////////////////////////////

logic [N-1:0] aux0 = 0; logic [N-1:0] aux1 = 0; 
logic [N-1:0] aux2 = 0; logic [N-1:0] aux3 = 0; 
logic [N-1:0] aux4 = 0; logic [N-1:0] aux5 = 0; 
logic [N-1:0] aux6 = 0; logic [N-1:0] aux7 = 0; 
logic [N-1:0] aux8 = 0; logic [N-1:0] aux9 = 0; 

logic [N-1:0] sum1;    
qadd #(Q,N) sum_1 ( aux0, aux0, sum1);

logic [N-1:0] sum2;    
qadd #(Q,N) sum_2 ( sum1, aux2, sum2);

logic [N-1:0] sum3;    
qadd #(Q,N) sum_3 ( sum2, aux3, sum3);

logic [N-1:0] sum4;    
qadd #(Q,N) sum_4 ( sum3, aux4, sum4);

logic [N-1:0] sum5;    
qadd #(Q,N) sum_5 ( sum4, aux5, sum5);

logic [N-1:0] sum6;    
qadd #(Q,N) sum_6 ( sum5, aux6, sum6);

logic [N-1:0] sum7;    
qadd #(Q,N) sum_7 ( sum6, aux7, sum7);

logic [N-1:0] sum8;    
qadd #(Q,N) sum_8 ( sum7, aux8, sum8);

logic [N-1:0] sum9;    
qadd #(Q,N) sum_9 ( sum8, aux9, sum9);

logic [N-1:0]  out_prom;
division #(Q,N) div1 (aux0,dos,clk,out_prom);


always_ff @(posedge clk) begin
    if (ready) begin
        aux9 <= aux8;
        aux8 <= aux7;
        aux7 <= aux6;
        aux6 <= aux5;
        aux5 <= aux4;
        aux4 <= aux3;
        aux3 <= aux2;
        aux2 <= aux1;
        aux1 <= aux0;
        aux0[26:15] <= in_1;
        out_1 <= sum1[26:15];
    end   
end



endmodule
