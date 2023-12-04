`timescale 1ns / 1ps

module signal_gen (
    clk,
    mode,
    en_signal,
    send,
    load,
    baudrate,
    en_clk_B,
    aux1,
    aux2
    );

// Entradas
input logic clk; 
input logic [1:0] mode;
input logic en_signal;

// Salidas 
output logic send;
output logic load;
output logic baudrate;
output logic en_clk_B;

// Parametros
parameter BAUD = 10;
parameter SEND_RATE = 10;

// Parámetros locales
localparam N = $clog2(SEND_RATE); // $clog2 extrae el número de bits del parámetro
localparam B = $clog2(BAUD); // $clog2 extrae el número de bits del parámetro

localparam INACTIVO = 2'b00;
localparam CONTINUO = 2'b01;
localparam EVENTO   = 2'b10;
////////////////////////////// MODULO //////////////////////////////

logic [N-1:0] cont = 0; 
logic [B-1:0] cont_B = 0;

// Rates de salida 
assign send = (cont == 0);
assign baudrate = (cont_B == (BAUD - 1)); 

// Señales de control internas
output logic aux1 = 0;
always_ff @( posedge clk) begin
    if ( en_signal ) 
        aux1 <= 1; 
    else if ( send ) 
        aux1 <= 0;
end

output logic aux2 = 0; 
always_ff @( posedge clk) begin
    if ( send ) begin
        if (aux1 ^ en_signal)
            aux2 <= 1; 
        else 
            aux2 <= 0;
    end
end

// Asignación combinacional
always_comb begin
    if ( mode == CONTINUO ) begin
        en_clk_B = (cont >= (SEND_RATE-19*BAUD)); 
        load = (cont == 2);
    end 
    else if ( mode == EVENTO ) begin
        if (aux2) begin
            en_clk_B = (cont >= (SEND_RATE-19*BAUD)); 
            load = (cont == 2);
        end
        else begin
            en_clk_B = 0; 
            load = 0;
        end
    end
    else if ( mode == INACTIVO ) begin
        en_clk_B = 0; 
        load = 0;    
    end   
end   

// Sendrate
always_ff @(posedge clk) begin
    if (cont == (SEND_RATE - 1)) 
        cont <= 0;      
    else
        cont <= cont + 1;                           
end

// Baudrate
always_ff @(posedge clk) begin
    if(en_clk_B) begin
        if (cont_B == (BAUD - 1)) 
            cont_B <= 0;      
        else
            cont_B <= cont_B + 1;
    end
    else
        cont_B <= 0;                             
end

endmodule