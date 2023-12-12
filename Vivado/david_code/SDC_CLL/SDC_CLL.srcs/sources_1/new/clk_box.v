`timescale 1ns / 1ps

module clk_box(
    clk,
    divClk1,
    divClk2,
    divClk3
    );
    
// Entradas 
input wire clk;

// Salidas
output wire divClk1;
output wire divClk2;
output wire divClk3;

// Parámetros 
parameter RATE1 = 3; 
parameter RATE2 = 3; 
parameter RATE3 = 3; 

divisor_f #(RATE1)clk_divClk1(  //20MHz
//Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(divClk1)               
);


divisor_f #(RATE2)clk_divClk2(  //20MHz
//Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(divClk2)               
); 


divisor_f #(RATE3)clk_divClk3(  //20MHz
//Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(divClk3)               
);
    
endmodule

