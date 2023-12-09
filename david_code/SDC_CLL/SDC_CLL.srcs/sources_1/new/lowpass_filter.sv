`timescale 1ns / 1ps

module lowpass_filter(
    clk,
    start,
    yT,
    yT_filt
    );
    
// Entradas 
input logic clk;
input logic start;
input logic [N-1:0] yT;

// Salidas
output logic [N-1:0] yT_filt;

// Parámetros
parameter Q = 15; 
parameter N = 28;

// Parámetros locales 
localparam offset = 0;
localparam neg_a1 = 64567; 
localparam a2 = 31813;
localparam a3 = 0; 
localparam a4 = 0;
localparam a5 = 0; 

localparam b0 = 4;
localparam b1 = 7;
localparam b2 = 4;
localparam b3 = 0;
localparam b4 = 0;
localparam b5 = 0;

////////////////////////////////// MÓDULO /////////////////////////////
// Cálculo parámetros negativos
logic [N-1:0] a1; 
negar #(Q,N) neg0 (neg_a1,a1);

//logic [N-1:0] a3; 
//negar #(Q,N) neg1 (neg_a3,a3);

//logic [N-1:0] a5; 
//negar #(Q,N) neg2 (neg_a5,a5);

// Memorias filtro variables

//  Entrada 
logic [N-1:0] y0; 
logic [N-1:0] y1; 
logic [N-1:0] y2; 
logic [N-1:0] y3;
logic [N-1:0] y4; 
logic [N-1:0] y5;

// Salida
logic [N-1:0] u1;  
logic [N-1:0] u2;  
logic [N-1:0] u3;  
logic [N-1:0] u4;  
logic [N-1:0] u5; 

// Asignación de memorias
always_ff @(posedge clk) begin
    if (start) begin
        // Entrada
        y5 <= y4;
        y4 <= y3;
        y3 <= y2;
        y2 <= y1; 
        y1 <= y0;
        y0 <= yT;
        
        // Salida
        u5 <= u4; 
        u4 <= u3; 
        u3 <= u2;
        u2 <= u1;
        u1 <=  u0 + offset;
    end
end

// Cálculo de yb
logic [N-1:0] yb0; 
qmult #(Q,N) multb0 (b0, y0, yb0);

logic [N-1:0] yb1; 
qmult #(Q,N) multb1 (b1, y1, yb1);

logic [N-1:0] yb2; 
qmult #(Q,N) multb2 (b2, y2, yb2);

logic [N-1:0] yb3; 
qmult #(Q,N) multb3 (b3, y3, yb3);

logic [N-1:0] yb4; 
qmult #(Q,N) multb4 (b4, y4, yb4);

logic [N-1:0] yb5; 
qmult #(Q,N) multb5 (b5, y5, yb5);

logic [N-1:0] auxb0;  
qadd #(Q,N) sumb0 (yb0, yb1, auxb0);

logic [N-1:0] auxb1;  
qadd #(Q,N) sumb1 (yb2, yb3, auxb1);

logic [N-1:0] auxb2;  
qadd #(Q,N) sumb2 (yb4, yb5, auxb2);

logic [N-1:0] auxb3;  
qadd #(Q,N) sumb3 (auxb0, auxb1, auxb3);

logic [N-1:0] yb;  
qadd #(Q,N) sumb (auxb2, auxb3, yb);

// Cálculo ya
logic [N-1:0] ua1; 
qmult #(Q,N) multa1 (a1, u1, ua1);

logic [N-1:0] ua2; 
qmult #(Q,N) multa2 (a2, u2, ua2);

logic [N-1:0] ua3; 
qmult #(Q,N) multa3 (a3, u3, ua3);

logic [N-1:0] ua4; 
qmult #(Q,N) multa4 (a4, u4, ua4);

logic [N-1:0] ua5; 
qmult #(Q,N) multa5 (a5, u5, ua5);

logic [N-1:0] auxa1;  
qadd #(Q,N) suma1 (ua1, ua2, auxa1);

logic [N-1:0] auxa2;  
qadd #(Q,N) suma2 (ua3, ua4, auxa2);

logic [N-1:0] auxa3;  
qadd #(Q,N) suma3 (auxa1, auxa2, auxa3);

logic [N-1:0] ua;  
qadd #(Q,N) suma (auxa3, ua5, ua);

logic [N-1:0] ya; 
negar #(Q,N) nega (ua,ya);

// Cálculo final
logic [N-1:0] u0;  
qadd #(Q,N) sum_ab (yb, ya, u0);

// Salida 
always_ff @(posedge clk) begin
    yT_filt <= u0; 
end

endmodule


