`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Design by : David Arroyo
// Create Date: 12.06.2017 
// Design Name: Divisor de frecuencia con habilitaci�n externa
// Module Name: div_f_en
// Description: M�dulo usado para dividir la frecuencia del reloj del sistema. 
// La salida es un pulso de duraci�n Tclk con idle en 0 hasta completar tout. 
// Requiere habilitaci�n externa para comenzar a funcionar.
//
// Dependencies: CePIA - Departamento de Astronom�a - FCFM - UdeC
// 
//////////////////////////////////////////////////////////////////////////////////

module div_f_en(
    clk,
    en_clk,
    clk_out
    );

// Entradas
input logic clk; 
input logic en_clk;

// Salidas 
output logic clk_out;

// Parametros
parameter div = 10; // El par�metro div indica en cuanto se divide la 
// frecuencia del reloj del sistema (10 como valor por defecto)

// Par�metros locales
localparam N = $clog2(div); // $clog2 extrae el n�mero de bits del par�metro
localparam M2 = (div >> 1);
////////////////////////////// MODULO //////////////////////////////

logic [N-1:0] cont = 0; // Se crea un vector de tama�o N para
// que el contador cuente hasta div-1

assign clk_out = (cont == 1); // La salida ser� 1 cuando el contador
// alcance el valor div-1

always_ff @(posedge clk) begin
    if (en_clk) begin
        if (cont == (div - 1)) 
            cont <= 0;        // Cuando el contador alcance div-1 se reinicia.
        else
            cont <= cont + 1; // Si a�n no lo alcanza, sigue sumando en cada 
                              // canto positivo de clk
    end
end

endmodule
