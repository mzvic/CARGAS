`timescale 1ns / 1ps

module semaforo(
    clk,
    divClk,
//    led0_r,
//    led1_r,
//    led1_g,
//    led2_g,
    color,
    cont
    );
    
    
// Entradas 
input logic clk;

// Salidas
 logic led0_r;
 logic led1_r;
 logic led1_g;
 logic led2_g;


localparam rojo = 2'd0;
localparam amarillo = 2'd1;
localparam verde = 2'd2;
//////////////////////////////////////////////////////////// MÓDULO /////////////////////////////////////////////////////////////////
input logic divClk;

  
output logic [5:0] cont = 0;
output logic [1:0] color; 

always_comb begin
    if ( color == rojo ) begin
        led0_r = 1; 
        led1_r = 0; 
        led1_g = 0; 
        led2_g = 0; 
    end
    if ( color == verde ) begin
        led0_r = 0; 
        led1_r = 0; 
        led1_g = 0; 
        led2_g = 1; 
    end    
    if ( color == amarillo ) begin
        led0_r = 0; 
        led1_r = 1; 
        led1_g = 1; 
        led2_g = 0; 
    end    
end


always_ff @(posedge clk) begin
    if (divClk) begin   
        cont <= cont + 1;
        if ( cont == 1 )
            color <= verde; 
        else if (cont == 8)
            color <= amarillo; 
        else if (cont == 10)
            color <= rojo; 
        else if (cont == 17) 
            cont <= 0;  
    end
end

endmodule
