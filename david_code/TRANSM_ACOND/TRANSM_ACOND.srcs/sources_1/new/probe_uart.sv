`timescale 1ns / 1ps

`default_nettype none

`include "baudrate_list.vh"
`include "div_frecuencias.vh"

//-- Top design
module probe_uart(
        clk,
        sw,
        uart_rxd_in,
        uart_txd_out,
        JB_0
           );   

// Entradas
input logic clk;
input logic [3:0] sw;
input logic uart_rxd_in;

// Salidas
output logic uart_txd_out;
output logic JB_0;
              
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

localparam FLAG_1C1 = 4'd0;
localparam FLAG_1C2 = 4'd1;
localparam FLAG_2C1 = 4'd2;
localparam FLAG_2C2 = 4'd3;
localparam FLAG_3C1 = 4'd4;
localparam FLAG_3C2 = 4'd5;
localparam FLAG_4C1 = 4'd6;
localparam FLAG_4C2 = 4'd7;
localparam T1_C_P1 = 4'd8;
localparam T1_C_P2 = 4'd9;
localparam T2_C_P1 = 4'd10;
localparam T2_C_P2 = 4'd11;
localparam T3_C_P1 = 4'd12;
localparam T3_C_P2 = 4'd13;
localparam DC_C_P1 = 4'd14;
localparam DC_C_P2 = 4'd15;

// --------------------------------------------- MÓDULO ---------------------------------------------------
// Registro de entradas
logic [7:0] PV1_C_P1;
logic [7:0] PV1_C_P2;
logic [7:0] PV2_C_P1;
logic [7:0] PV2_C_P2;
logic [7:0] PV3_C_P1;
logic [7:0] PV3_C_P2;
logic [7:0] CV_C_P1;
logic [7:0] CV_C_P2;

logic [11:0] PV1 = 1;
logic [15:0] PV2 = 259;
logic [11:0] PV3 = 517;
logic [15:0] CV = 1033;

// Captura de datos de salida
logic capt_data;
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
        
        PV3_C_P1[7:5] <= 0;
        PV3_C_P1[4:0] <= PV3[11:7];
        PV3_C_P2[7]   <= 0;
        PV3_C_P2[6:0] <= PV3[6:0];
        
        CV_C_P1[7] <= 0;
        CV_C_P1[6:0] <= CV[11:7];
        CV_C_P2[7]   <= 0;
        CV_C_P2[6:0] <= CV[6:0];
    end
end

// TRANSMISIÓN DE SEÑALES CONTINUA
logic [7:0] aux = 0;
logic [3:0] state_jonas;
logic [5:0] state_send = FLAG_1C1;
always_ff @(posedge clk) begin
    if (send) begin
        if (sw == 4'b1000) begin
            tipo <= 1;
            state_jonas <= J;
            if (aux == 0)
                aux <= 65;
            else if ( aux < 90 ) begin 
                data_out <= aux;
                aux <= aux + 1;
            end
            else begin 
                data_out <= aux;
                aux <= 65; 
            end
        end
        else if (sw == 4'b0100) begin 
            tipo <= 0;
            aux <= 0;
            state_jonas <= J;
        end
        else if (sw == 4'b0010) begin
            tipo <= 1;
            aux <= 0;
            case (state_jonas)
            
            J: begin
                data_out <= "J";
                state_jonas <= O;
            end
            O: begin
                data_out <= "O";
                state_jonas <= N;
            end
            N: begin
                data_out <= "N";
                state_jonas <= A;
            end
            A: begin
                data_out <= "A";
                state_jonas <= S;
            end
            S: begin
                data_out <= "S";
                state_jonas <= SPACE;
            end
            SPACE: begin
                data_out <= 95;
                state_jonas <= J;
            end
            default:
                state_jonas <= SPACE;    
            endcase
        end
        else if (sw == 4'b0001) begin
        tipo <= 1;
        state_jonas <= J;
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
                state_send <= FLAG_3C1;
            end
            FLAG_3C1: begin
                data_out <= 251;
                state_send <= T3_C_P1;
            end
            T3_C_P1: begin
                data_out <= PV3_C_P1;
                state_send <= FLAG_3C2;
            end
            FLAG_3C2: begin
                data_out <= 250;
                state_send <= T3_C_P2;
            end
            T3_C_P2: begin
                data_out <= PV3_C_P2;
                state_send <= FLAG_4C1;
            end
            FLAG_4C1: begin
                data_out <= 249;
                state_send <= DC_C_P1;
            end
            DC_C_P1: begin
                data_out <= CV_C_P1;
                state_send <= FLAG_4C2;
            end
            FLAG_4C2: begin
                data_out <= 248;
                state_send <= DC_C_P2;
            end
            DC_C_P2: begin
                data_out <= CV_C_P2;
                state_send <= FLAG_1C1;
            end
            default:
                state_send <= FLAG_1C1;    
            endcase
        end
        else begin 
            tipo <= 1;  
            aux <= 0;
            data_out <= 95;
            state_jonas <= J;
        end
    end
end
// -------------------------------INSTANCIA DE MODS UART E/S Y RELOJES------------------------------------
//-- Variables
logic [7:0] data_out;
logic [7:0] data_in = 0;
logic data_rcv;
logic ready;
logic send;

// --- RELOJ DE ENVÍO
    
//-- UNIDAD UART RX   
uart_rx #(BAUD) RX0(
    .clk(clk),
    .rx(uart_rxd_in),
    .dato(data_in),
    .data_rcv(data_rcv)
    );

//-- UNIDAD UART TX.
logic [1:0] mode;
uart_tx #(BAUD,SEND_RATE) TX0(
    .clk(clk),
    .mode(mode),
    .en_signal(data_rcv),
    .send(send),
    .dato(data_out),
    .tx(tx),
    .ready(ready)
    );

logic tx;
logic tipo;
always_comb begin
    if (tipo) 
        uart_txd_out = tx;
    else
        uart_txd_out = uart_rxd_in;
end

assign JB_0 = ready;

endmodule