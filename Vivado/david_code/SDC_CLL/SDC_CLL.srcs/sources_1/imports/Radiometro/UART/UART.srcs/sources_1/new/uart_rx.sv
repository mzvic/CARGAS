`timescale 1ns / 1ps

//`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Design by : D.A
// Create Date: 13.06.2017 
// Design Name: Unidad de recepción UART
// Module Name: uart_rx
// Description: Módulo de recepción de datos UART en FPGA
//
// Dependencies: CePIA - Departamento de Astronomía - FCFM - UdeC
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_rx(
    clk,
    rx,
    dato,
    data_rcv
    );

// Entradas
input logic clk;
input logic rx;
//input logic load;

// Salidas 
output logic [7:0] dato = 8'b00000000;
output logic data_rcv;

// Parametros
parameter BAUD = 3; // 

// Parámetros locales
localparam IDLE = 1'd0;
localparam WAIT = 1'd1;
localparam RCV = 2'd2;

////////////////////////////// MODULO //////////////////////////////
logic [3:0] cont = 0; 
logic [9:0] data_shift = 0; 
logic [1:0] state = IDLE;
logic [3:0] i=0; 
logic rx_r;

logic clk_baud;
logic clk_baud2;
logic en_clk;
divisor_f #(BAUD)
    baudgen1 ( 
      .clk(clk),
      .en_clk(state == IDLE),
      .clk_out(clk_baud)
    );
    
div_f_en #(BAUD)
    baudgen0 ( 
    .clk(clk),
    .en_clk(en_clk), 
    .clk_out(clk_baud2)
  );

always_ff @(posedge clk)
  rx_r <= rx;
  
// Controlador
always_ff @(posedge clk) begin

    if ( state == IDLE ) begin
        data_rcv <= 0;
        if(cont < 9) begin
            state <= IDLE;
            if (rx_r == 1) begin
                if(clk_baud)
                    cont <= cont + 1;
            end
            else
                cont <= 0;
        end
        else 
            state <= WAIT;
    end
    
    if (state == WAIT ) begin
        if ( rx_r == 1 ) begin
            data_rcv <= 0;
            state <= WAIT;
        end
        else begin
            en_clk <= 1;
            state  <= RCV;
            i <= 0;
        end
    end
        
    if (state == RCV ) begin
        if ( i < 10 ) begin
            state <= RCV;
            if (clk_baud2) begin
                data_shift[i] <= rx_r;
                i <= i + 1;
            end
        end
        else begin
            en_clk <= 0;
            state <= IDLE;
            data_rcv <= 1;
        end
    end
end

always_ff @(posedge clk)
    dato  <= data_shift[8:1];
endmodule
