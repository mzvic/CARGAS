`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Design by : David Arroyo
// Create Date: 12.06.2017 
// Design Name: Divisor de frecuencia
// Module Name: divisor_f
// Description: M�dulo usado para dividir la frecuencia del reloj del sistema. 
// La salida es un pulso de duraci�n Tclk con idle en 0 hasta completar tout. 
// Dependencies: CePIA - Departamento de Astronom�a - FCFM - UdeC
// 
//////////////////////////////////////////////////////////////////////////////////

module divisor_f(
    clk,
    en_clk,
    clk_out,
    clk_out2
    );

// Entradas
input logic clk; 
input logic en_clk;

// Salidas 
output logic clk_out;
output logic clk_out2;

// Parametros
parameter div = 10; // El par�metro div indica en cuanto se divide la 
// frecuencia del reloj del sistema (10 como valor por defecto)

parameter div2 = 10; 

// Par�metros locales
localparam N = $clog2(div); // $clog2 extrae el n�mero de bits del par�metro

////////////////////////////// MODULO //////////////////////////////

logic [N-1:0] cont = 0; // Se crea un vector de tama�o N para
// que el contador cuente hasta div-1

assign clk_out = (cont == 0); // La salida ser� 1 cuando el contador
assign clk_out2 = (cont == (div2 - 1)); // La salida2 ser� 1 cuando el contador

// alcance el valor div-1

always_ff @(posedge clk) begin
    if(en_clk) begin
        if (cont == (div - 1)) 
            cont <= 0;        // Cuando el contador alcance div-1 se reinicia.
        else
            cont <= cont + 1; // Si a�n no lo alcanza, sigue sumando en cada 
                             // canto positivo de clk
    end                             
end

endmodule