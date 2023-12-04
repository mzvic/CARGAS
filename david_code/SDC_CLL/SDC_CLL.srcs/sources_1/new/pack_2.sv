`timescale 1ns / 1ps

`default_nettype none

`include "baudrate_list.vh"
`include "div_frecuencias.vh"

//-- Top design
module pack_2(
        clk,
        clk_2,
        rx,
        PV1,
        PV2,
        PV3,
        CV,
        tx,
        send,
        SP,
        MODO,
        param1,
        param2,
        param3,
        data_ready
           );   

// Entradas
input logic clk;
input logic clk_2;
input logic rx;
input logic [11:0] PV1;
input logic [15:0] PV2;
input logic [11:0] PV3;
input logic [9:0] CV;

// Salidas
output logic tx;
output logic send;
output logic [15:0] SP;
output logic [2:0] MODO;
output logic [15:0] param1;
output logic [15:0] param2;
output logic [15:0] param3;
output logic data_ready;
              
//-- Parametro: Velocidad de transmision
parameter BAUD = `B9600;
parameter SEND_RATE = `F_400Hz;

// Parámetros locales
localparam SELECT = 4'd0;
localparam RCV1_C_P1 = 4'd1;
localparam RCV1_C_P2 = 4'd2;
localparam RCV1_C_P3 = 4'd3;
localparam RCV2_C_P1 = 4'd4;
localparam RCV3_C_P1 = 4'd5;
localparam RCV3_C_P2 = 4'd6;
localparam RCV3_C_P3 = 4'd7;
localparam RCV4_C_P1 = 4'd8;
localparam RCV4_C_P2 = 4'd9;
localparam RCV4_C_P3 = 4'd10;
localparam RCV5_C_P1 = 4'd11;
localparam RCV5_C_P2 = 4'd12;
localparam RCV5_C_P3 = 4'd13;

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

// Captura de datos de salida
logic capt_data;
always_ff @(posedge clk) begin
    if (capt_data) begin
        PV1_C_P1[7:5] <= 0;
        PV1_C_P1[4:0] <= PV1[11:7];
        PV1_C_P2[7]   <= 0;
        PV1_C_P2[6:0] <= PV1[6:0];
        
        PV2_C_P1[7] <= 0;
        PV2_C_P1[6:0] <= PV2[13:7];
        PV2_C_P2[7]   <= 0;
        PV2_C_P2[6:0] <= PV2[6:0];
        
        PV3_C_P1[7:5] <= 0;
        PV3_C_P1[4:0] <= PV3[11:7];
        PV3_C_P2[7]   <= 0;
        PV3_C_P2[6:0] <= PV3[6:0];
        
        CV_C_P1[7:3] <= 0;
        CV_C_P1[2:0] <= CV[9:7];
        CV_C_P2[7]   <= 0;
        CV_C_P2[6:0] <= CV[6:0];
    end
end

logic [1:0] aux_p1;
logic [6:0] aux_p2;

// MÁQUINA DE ESTADOS DE RECEPCIÓN
logic [5:0] state_rcv = SELECT;
always_ff @(posedge clk) begin
//    -- Capturar el dato cuando se reciba
    if (data_rcv == 1'b1) begin
        
        case (state_rcv)
        
        SELECT:
            if ( data_in == 254) // SP
                state_rcv <= RCV1_C_P1;
            else if ( data_in == 253 ) // MODO
                state_rcv <= RCV2_C_P1;
            else if ( data_in == 252) //param1
                state_rcv <= RCV3_C_P1;
            else if ( data_in == 251) //param2
                state_rcv <= RCV4_C_P1;
            else if ( data_in == 250) //param3
                state_rcv <= RCV5_C_P1;
            else
                state_rcv <= SELECT;
        
        RCV1_C_P1:
            begin
                aux_p1 <= data_in[1:0];
                state_rcv <= RCV1_C_P2;
            end
        RCV1_C_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV1_C_P3;
            end
        RCV1_C_P3:
            begin
                SP <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV2_C_P1:
            begin
                MODO <= data_in[2:0];
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV3_C_P1:
            begin
                aux_p1 <= data_in[1:0];
                state_rcv <= RCV3_C_P2;
            end
        RCV3_C_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV3_C_P3;
            end
        RCV3_C_P3:
            begin
                param1 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV4_C_P1:
            begin
                aux_p1 <= data_in[1:0];
                state_rcv <= RCV4_C_P2;
            end
        RCV4_C_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV4_C_P3;
            end
        RCV4_C_P3:
            begin
                param2 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV5_C_P1:
            begin
                aux_p1 <= data_in[1:0];
                state_rcv <= RCV5_C_P2;
            end
        RCV5_C_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV5_C_P3;
            end
        RCV5_C_P3:
            begin
                param3 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        default:
            state_rcv <= SELECT;    
        endcase
    end
    else 
        data_ready <= 0;
end

// TRANSMISIÓN DE SEÑALES CONTINUA
logic [3:0] state_send = FLAG_1C1;

always_ff @(posedge clk) begin
    if (send) begin
        
        case (state_send)
        
        FLAG_1C1: begin
            capt_data <= 1;
            data_out <= 195;
            state_send <= T1_C_P1;
        end
        T1_C_P1: begin
            capt_data <= 0;
            data_out <= PV1_C_P1;
            state_send <= FLAG_1C2;
        end
        FLAG_1C2: begin
            data_out <= 194;
            state_send <= T1_C_P2;
        end
        T1_C_P2: begin
            data_out <= PV1_C_P2;
            state_send <= FLAG_2C1;
        end
        FLAG_2C1: begin
            data_out <= 193;
            state_send <= T2_C_P1;
        end
        T2_C_P1: begin
            data_out <= PV2_C_P1;
            state_send <= FLAG_2C2;
        end
        FLAG_2C2: begin
            data_out <= 192;
            state_send <= T2_C_P2;
        end
        T2_C_P2: begin
            data_out <= PV2_C_P2;
            state_send <= FLAG_3C1;
        end
        FLAG_3C1: begin
            data_out <= 191;
            state_send <= T3_C_P1;
        end
        T3_C_P1: begin
            data_out <= PV3_C_P1;
            state_send <= FLAG_3C2;
        end
        FLAG_3C2: begin
            data_out <= 190;
            state_send <= T3_C_P2;
        end
        T3_C_P2: begin
            data_out <= PV3_C_P2;
            state_send <= FLAG_4C1;
        end
        FLAG_4C1: begin
            data_out <= 189;
            state_send <= DC_C_P1;
        end
        DC_C_P1: begin
            data_out <= CV_C_P1;
            state_send <= FLAG_4C2;
        end
        FLAG_4C2: begin
            data_out <= 188;
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
end
// -------------------------------INSTANCIA DE MODS UART E/S Y RELOJES------------------------------------
//-- Variables
logic [7:0] data_out;
logic [7:0] data_in;
logic data_rcv;

// --- RELOJES
    
//-- UNIDAD UART RX   
uart_rx #(BAUD) RX0(
    .clk(clk),
    .rx(rx),
    .dato(data_in),
    .data_rcv(data_rcv)
    );
        
//-- UNIDAD UART TX
uart_tx #(BAUD, SEND_RATE) TX0(
    .clk(clk),
    .mode(2'b01),
    .send(send),
    .dato(data_out),
    .tx(tx)
    );    
endmodule