`timescale 1ns / 1ps

module rgbmodificado(
// Entradas
    sw0,
    sw1,
    sw2,
    //Salidas
    led1azul,
    led1verde,
    led1rojo,
    led2azul,
    led2verde,
    led2rojo,
    led3azul,
    led3verde,
    led3rojo,
    led4azul,
    led4verde,
    led4rojo,
    );

//entradas
input logic sw0;
input logic sw1;
input logic sw2;

//salidas
output logic led1azul;
output logic led1verde;
output logic led1rojo;
output logic led2azul;
output logic led2verde;
output logic led2rojo;
output logic led3azul;
output logic led3verde;
output logic led3rojo;
output logic led4azul;
output logic led4verde;
output logic led4rojo;


////////////////////////////////modulo/////////////////////////////////////


logic out, in;

always_comb begin
    if(sw0 == 1 && sw1 == 0 && sw2 == 0) begin // sw_0 => rojo
        led1rojo=1;
        led2rojo=1;
        led3rojo=1;
        led4rojo=1;
    end
    else if(sw0 == 0 && sw1 == 1 && sw2 == 0) begin // sw_1=> verde
        led1verde = 1;
        led2verde=1;
        led3verde=1;
        led4verde=1;
    end
    else if(sw0 == 0 && sw1 == 0 && sw2 == 1)begin  //sw_2=> azul
        led1azul=1;
        led2azul=1;
        led3azul=1;
        led4azul=1;
    end
    else begin //en cualquier otro caso
        led1azul=0;
        led1verde=0;
        led1rojo=0;
        led2azul=0;
        led2verde=0;
        led2rojo=0;
        led3azul=0;
        led3verde=0;
        led3rojo=0;
        led4azul=0;
        led4verde=0;
        led4rojo=0;
        end
end
endmodule

//sw 0, 1 y 2 prender rgb, 0 rojo, 1, verdes, 2, azules
//todos los demas estados, ninguno prende


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2018 12:07:30
// Design Name: 
// Module Name: intermitenteCase
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Semaforo(

// Entradas
    sw_0,
    btn_0,
    clk,
    //Salidas
    led0_g,
    led0_r,
    led1_g,
    led1_r,
    led2_g,
    led2_r,
    led3_g,
    led3_r,
    );

//entradas
input logic sw_0;
input logic btn_0;
input logic clk; 

//salidas
output logic led0_g,led0_r;
output logic led1_g,led1_r;
output logic led2_g,led2_r;
output logic led3_g,led3_r;

localparam divisor2 = 200000000;
localparam divisor = 100000000;
localparam estadoRojo=2'd0;
localparam estadoVerde=2'd1;
localparam estadoAmarillo=2'd2;
localparam apagado = 4'd0;
localparam encendido = 4'd15;


logic divclk;
logic divclk2;
logic [1:0] estado= estadoVerde; 
logic switch = sw_0;
//logic boton = btn_0; //no utilizada actualmente, usar en el sgte trabajo
logic [3:0] ledrojo = 4'd0;
logic [3:0] ledverde = 4'd0;
logic contador = 0;
//asignacion ledrojo/variable
assign led0_r = ledrojo[0];
assign led1_r = ledrojo[1];
assign led2_r = ledrojo[2];
assign led3_r = ledrojo[3];
//asignacion ledverde/variable
assign led0_g = ledverde[0];
assign led1_g = ledverde[1];
assign led2_g = ledverde[2];
assign led3_g = ledverde[3];

divisor_f #(divisor) divs //divisor 1
    (.clk(clk),
    .en_clk(1),
    .clk_out(divclk)
    );
divisor_f #(divisor2) div2 //divisor 2 
        (.clk(clk),
        .en_clk(1),
        .clk_out(divclk2)
        );
    
always_ff@(posedge clk) begin
    if(switch==1) begin   // switch==1 => activa el semaforo 
        if (divclk) begin
                case(estado)       
                    estadoVerde: 
                    begin
                        ledverde=encendido; 
                        ledrojo=apagado;
                        estado=estadoAmarillo;
                    end
                    
                    estadoAmarillo:
                    begin
                        ledrojo=encendido;
                        ledverde=encendido;
                        estado=estadoRojo;
                    end
                    
                    estadoRojo:
                    begin
                        ledrojo=encendido;
                        ledverde=apagado;
                        estado=estadoVerde;    
                    end
                    
                default:
                    estado=estadoVerde;
                endcase
            end

    end
    
        
    else begin //en cualquier otro caso
        ledrojo=apagado;
        ledverde=apagado;
    end
    
    end
  
endmodule

