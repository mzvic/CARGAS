`timescale 1ns / 1ps

module rediv_f(
    clk,
    clk_in,
    clk_out,
    clk_out2,
    clk_out3,
    cont
    );

// Entradas
input logic clk; 
input logic clk_in;

// Salidas 
output logic clk_out;
output logic clk_out2;
output logic clk_out3;

// Parametros
parameter div = 10; 
parameter div2 = 1; 
parameter div3 = 1; 

// Parámetros locales
localparam N = $clog2(div); // $clog2 extrae el número de bits del parámetro

////////////////////////////// MODULO //////////////////////////////

output logic [N-1:0] cont = 0; // Se crea un vector de tamaño N para
// que el contador cuente hasta div-1

assign clk_out = (clk_in & (cont == 200)); // La salida será 1 cuando el contador
assign clk_out2 = (clk_in &  (cont == (div2))); // La salida2 será 1 cuando el contador
assign clk_out3 = (clk_in &  (cont == (div3))); // La salida2 será 1 cuando el contador

// alcance el valor div-1

always_ff @(posedge clk) begin
    if (clk_in) begin
        if (cont == (div - 1)) 
            cont <= 0;        // Cuando el contador alcance div-1 se reinicia.
        else
            cont <= cont + 1; // Si aún no lo alcanza, sigue sumando en cada 
                             // canto positivo de clk
    end                             
end
endmodule
