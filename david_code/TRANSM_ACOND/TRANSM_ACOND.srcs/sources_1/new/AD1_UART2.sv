`timescale 1ns / 1ps

`include "baudrate_list.vh"
`include "div_frecuencias.vh"

module AD1_UART2(
    clk,
    JA_0,
    JA_1,
    JA_2,
    JA_3,
    uart_txd_out
    );
    
// Entradas   ---------------------------------------    
input logic clk; 
input logic JA_0;
input logic JA_1;
input logic JA_2;
input logic JA_3;

// Salidas  ---------------------------------------
output logic uart_txd_out;

// Parámetros 
parameter BAUD = `B9600;
parameter SEND_RATE = `F_400Hz;
parameter SCKL_RATE = `F_13600Hz;

// Parámetros locales (constantes) ---------------------------------------
localparam FLAG_1C1 = 4'd0;
localparam FLAG_1C2 = 4'd1;
localparam FLAG_2C1 = 4'd2;
localparam FLAG_2C2 = 4'd3;

localparam T1_C_P1 = 4'd8;
localparam T1_C_P2 = 4'd9;
localparam T2_C_P1 = 4'd10;
localparam T2_C_P2 = 4'd11;


// Variables ---------------------------------------
logic send; 
logic divClk;

logic [11:0] PV1;
logic [11:0] PV2;

logic capt_data; // Registro de entradas
logic [7:0] PV1_C_P1;
logic [7:0] PV1_C_P2;
logic [7:0] PV2_C_P1;
logic [7:0] PV2_C_P2;

logic [3:0] state_send = FLAG_1C1;
logic [7:0] data_out;

//-- //////////////////////////////////// MÓDULO //////////////////////////////////////////

// Recepción AD1
// clk divClk
divisor_f #(SCKL_RATE)DIVCLK (  
//Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(divClk)               
);

AD1_drive AD1_2 ( 
//entradas
    .start(send),
    .clk(clk), 
    .divClk(divClk),
    .D0(JA_1),
    .data0(PV1),
    .D1(JA_2),
    .data1(PV2),
    .CS(JA_0),
    .SCLK(JA_3)   
);

// Captura de datos de salida
always_ff @(posedge clk) begin
    if (capt_data) begin
        PV1_C_P1[7:5] <= 0;
        PV1_C_P1[4:0] <= PV1[11:7];
        PV1_C_P2[7]   <= 0;
        PV1_C_P2[6:0] <= PV1[6:0];
        
        PV2_C_P1[7:5] <= 0;
        PV2_C_P1[4:0] <= PV2[11:7];
        PV2_C_P2[7]   <= 0;
        PV2_C_P2[6:0] <= PV2[6:0];
    end
end

// TRANSMISIÓN DE SEÑALES CONTINUA
always_ff @(posedge clk) begin
    if (send) begin
        
        case (state_send)
        
        FLAG_1C1: begin
            capt_data <= 1;
            data_out <= 255;
            state_send <= T1_C_P1;
        end
        T1_C_P1: begin
            capt_data <= 0;
            data_out <= PV1_C_P1;
            state_send <= FLAG_1C2;
        end
        FLAG_1C2: begin
            data_out <= 254;
            state_send <= T1_C_P2;
        end
        T1_C_P2: begin
            data_out <= PV1_C_P2;
            state_send <= FLAG_2C1;
        end
        FLAG_2C1: begin
            data_out <= 253;
            state_send <= T2_C_P1;
        end
        T2_C_P1: begin
            data_out <= PV2_C_P1;
            state_send <= FLAG_2C2;
        end
        FLAG_2C2: begin
            data_out <= 252;
            state_send <= T2_C_P2;
        end
        T2_C_P2: begin
            data_out <= PV2_C_P2;
            state_send <= FLAG_1C1;
        end
        default:
            state_send <= FLAG_1C1;    
        endcase
    end
end

//-- UNIDAD UART TX
uart_tx #(BAUD, SEND_RATE) UART_TX1(
    .clk(clk),
    .mode(2'b01),
    .send(send),
    .dato(data_out),
    .tx(uart_txd_out)
    );
    
endmodule
