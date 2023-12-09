`timescale 1ns / 1ps

`default_nettype none

`include "baudrate_list.vh"
`include "div_frecuencias.vh"

module probe_uart2(
        clk,
        sw,
        uart_rxd_in,
        uart_txd_out
       );   

// Entradas
input logic clk;
input logic [3:0] sw;
input logic uart_rxd_in;

// Salidas
output logic uart_txd_out;
              
//-- Parametro: Velocidad de transmision
parameter BAUD = `B9600;
parameter SEND_RATE = `F_1Hz;

// Parámetros locales
localparam J = 3'd0;
localparam O = 3'd1;
localparam N = 3'd2;
localparam A = 3'd3;
localparam S = 3'd4;
localparam SPACE = 3'd5;

////////////////////////////////// MÓDULO /////////////////////////////////////////////////

//-- Variables
logic [3:0] estado;
logic [3:0] estado_sgte;

logic [7:0] data_out;
logic [7:0] data_in;
logic data_rcv;
logic send;
logic [1:0] mode;

//-- FSM 5 estados ActEE

always_comb begin
    case ( sw )
    
    4'b1000:    estado_sgte <= 4'b1000; // ABC...
    4'b0100:    estado_sgte <= 4'b0100; // Recep-Transm.
    4'b0010:    estado_sgte <= 4'b0010; // J-O-N-A-S-_
    4'b0001:    estado_sgte <= 4'b0001; // FSM TX
    default:    estado_sgte <= 4'b0000; // Sin transm.
    
    endcase
end

//-- Lógica secuencial (activación secuencial del estado)

always_ff @(posedge clk) begin
    if (send)
        estado <= estado_sgte;         
end
  
//-- Asignación de salida 

always_comb  begin
    case (estado)
    
    4'b1000:     // ABC...
    begin
        mode = 2'b01;
        data_out = data_abc;
    end
    4'b0100:    
    begin
        mode = 2'b10;
        data_out = data_in;
     end
    4'b0010:    // J-O-N-A-S-_   
    begin
        mode = 2'b01; 
        data_out = data_jonas;
    end 
    4'b0001:    
    begin
        mode = 2'b01;
        data_out = "A";
    end
    4'b0000:    mode = 2'b00;
    
    endcase
end  

//-- ABC...
logic [7:0] cont_abc = 0;
logic [7:0] data_abc;
always_ff @(posedge clk)  begin
    if ( estado == 4'b1000) begin
        if ( send) begin
            if ( cont_abc == 25) begin
                cont_abc <= 0;
            end
            else begin
                cont_abc <= cont_abc + 1; 
            end
        end
    end
    else 
        cont_abc <= 0;
end
assign data_abc = cont_abc + 7'd65;

//-- J-O-N-A-S-_
logic [3:0] state_jonas;
logic [3:0] nextstate_jonas;

logic aux;
always_comb begin
    if (send) begin
        if ( state_jonas == J)
            nextstate_jonas = O;
        else if ( state_jonas == O)
            nextstate_jonas = N;
        else if ( state_jonas == N )
            nextstate_jonas = A;
        else if ( state_jonas == A )
            nextstate_jonas = S;
        else if ( state_jonas == S) 
            nextstate_jonas = SPACE;
        else if ( state_jonas == SPACE) 
            nextstate_jonas = J;
        else
            nextstate_jonas = J;  
    end
end
//
always_ff @(posedge clk) begin
    if (estado == 4'b0010) begin
        if (send) begin
            state_jonas <= nextstate_jonas;
        end
    end
    else 
        state_jonas <= J;
end
//
logic [7:0] data_jonas; 
always_comb begin
    if (estado == 4'b0010) begin
        case (state_jonas) 
        J:  data_jonas = "J";
        O:  data_jonas = "O";
        N:  data_jonas = "N";
        A:  data_jonas = "A";
        S:  data_jonas = "S";
        SPACE:  data_jonas = 95;       
        endcase
    end
end

// -------------------------------INSTANCIA DE MODS UART E/S Y RELOJES------------------------------------

//-- UNIDAD UART RX   
uart_rx #(BAUD) RX0(
    .clk(clk),
    .rx(uart_rxd_in),
    .dato(data_in),
    .data_rcv(data_rcv)
    );

//-- UNIDAD UART TX.

uart_tx #(BAUD,SEND_RATE) TX0(
    .clk(clk),
    .mode(mode),
    .en_signal(data_rcv),
    .send(send),
    .dato(data_out),
    .tx(uart_txd_out)
    );

endmodule
