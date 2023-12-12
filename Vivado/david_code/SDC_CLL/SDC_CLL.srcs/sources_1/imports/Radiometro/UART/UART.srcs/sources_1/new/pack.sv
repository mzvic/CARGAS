`timescale 1ns / 1ps

`default_nettype none

`include "baudrate_list.vh"
`include "div_frecuencias.vh"

//-- Top design
module pack(
        clk,
        clk_2,
        rx,
        PV1,
        PV2,
        PV3,
        CV,
        tx,
        SP,
        MODO,
        param1,
        param2,
        param3
           );   

// Entradas
input logic clk;
input logic clk_2;
input logic rx;
input logic [11:0] PV1;
input logic [15:0] PV2;
input logic [11:0] PV3;
input logic [15:0] CV;

// Salidas
output logic tx;
output logic [15:0] SP;
output logic [2:0] MODO;
output logic [15:0] param1;
output logic [15:0] param2;
output logic [15:0] param3;
              
//-- Parametro: Velocidad de transmision
parameter BAUD = 56;
parameter SEND_RATE = `F_250Hz;

// Parámetros locales
localparam SELECT = 4'd0;
localparam OUTA_msb = 4'd1;
localparam OUTA_lsb = 4'd2;
localparam OUTB = 4'd3;
localparam OUTC_msb = 4'd4;
localparam OUTC_lsb = 4'd5;
localparam OUTD_msb = 4'd6;
localparam OUTD_lsb = 4'd7;
localparam OUTE_msb = 4'd8;
localparam OUTE_lsb = 4'd9;

localparam IN_A_msb = 4'd0;
localparam IN_A_lsb = 4'd1;
localparam IN_B_msb = 4'd2;
localparam IN_B_lsb = 4'd3;
localparam IN_C_msb = 4'd4;
localparam IN_C_lsb = 4'd5;
localparam IN_D_msb = 4'd6;
localparam IN_D_lsb = 4'd7;

localparam SEND_A_msb = 4'd8;
localparam SEND_A_lsb = 4'd9;
localparam SEND_B_msb = 4'd10;
localparam SEND_B_lsb = 4'd11;
localparam SEND_C_msb = 4'd12;
localparam SEND_C_lsb = 4'd13;
localparam SEND_D_msb = 4'd14;
localparam SEND_D_lsb = 4'd15;

// --------------------------------------------- MÓDULO ---------------------------------------------------
// Registro de entradas
logic [15:0] in_a;
logic [15:0] in_b;
logic [15:0] in_c;
logic [15:0] in_d;
always_ff @(posedge clk) begin
    in_a <= PV1;
    in_b <= PV2;
    in_c <= PV3;
    in_d <= CV;
end

logic [7:0] aux_msb;
// MÁQUINA DE ESTADOS DE RECEPCIÓN

logic [3:0] state_rcv = SELECT;
always_ff @(posedge clk_2) begin
//    -- Capturar el dato cuando se reciba
    if (data_rcv == 1'b1) begin
        
        case (state_rcv)
        
        SELECT:
            if ( data_in == 255)
                state_rcv <= OUTA_msb;
            else if ( data_in == 254 )
                state_rcv <= OUTB;
            else if ( data_in == 253)
                state_rcv <= OUTC_msb;
            else if ( data_in == 252)
                state_rcv <= OUTD_msb;
            else if ( data_in == 251)
                state_rcv <= OUTE_msb;
            else
                state_rcv <= SELECT;
        
        OUTA_msb:
            begin
                aux_msb <= data_in;
                state_rcv <= OUTA_lsb;
            end
        OUTA_lsb:
            begin
                SP <= {aux_msb, data_in[7:0]+8'b00000000};
                state_rcv <= SELECT;
            end
        OUTB:
            begin
                MODO <= data_in[2:0];
                state_rcv <= SELECT;
            end
        OUTC_msb:
            begin
                aux_msb <= data_in;
                state_rcv <= OUTC_lsb;
            end
        OUTC_lsb:
            begin
                param1 <= {aux_msb, data_in[7:0]+8'b00000000};
                state_rcv <= SELECT;
            end
        OUTD_msb:
            begin
                aux_msb <= data_in;
                state_rcv <= OUTD_lsb;
            end
        OUTD_lsb:
            begin
                param2 <= {aux_msb, data_in[7:0]+8'b00000000};
                state_rcv <= SELECT;
            end
        OUTE_msb:
            begin
                aux_msb <= data_in;
                state_rcv <= OUTE_lsb;
            end
        OUTE_lsb:
            begin
                param3 <= {aux_msb, data_in[7:0]+8'b00000000};
                state_rcv <= SELECT;
            end
        default:
            state_rcv <= SELECT;    
        endcase
    end
end

// TRANSMISIÓN DE SEÑALES CONTINUA
logic [3:0] state_send = IN_A_msb;
logic [7:0] aux_lsb_A, aux_lsb_B, aux_lsb_C, aux_lsb_D;

always_ff @(posedge clk) begin
    if (send) begin
        
        case (state_send)
        
        IN_A_msb: begin
            data_out <= 255;
            state_send <= SEND_A_msb;
        end
        SEND_A_msb: begin
            data_out <= in_a[15:8];
            if ( in_a[7:0] > 247 )
                aux_lsb_A = 247;
            else
                aux_lsb_A <= in_a[7:0];
            state_send <= IN_A_lsb;
        end
        IN_A_lsb: begin
            data_out <= 254;
            state_send <= SEND_A_lsb;
        end
        SEND_A_lsb: begin
            data_out <= aux_lsb_A;
            state_send <= IN_B_msb;
        end
        
        IN_B_msb: begin
            data_out <= 253;
            state_send <= SEND_B_msb;
        end
        SEND_B_msb: begin
            data_out <= in_b[15:8];
            if ( in_b[7:0] > 247  )
                aux_lsb_B = 247;
            else
                aux_lsb_B <= in_b[7:0];
            state_send <= IN_B_lsb;
        end
        IN_B_lsb: begin
            data_out <= 252;
            state_send <= SEND_B_lsb;
        end
        SEND_B_lsb: begin
            data_out <= aux_lsb_B;
            state_send <= IN_C_msb;
        end
        
        IN_C_msb: begin
            data_out <= 251;
            state_send <= SEND_C_msb;
        end
        SEND_C_msb: begin
            data_out <= in_c[15:8];
            if ( in_c[7:0] > 247 )
                aux_lsb_C = 247;
            else
                aux_lsb_C <= in_c[7:0];
            state_send <= IN_C_lsb;
        end
        IN_C_lsb: begin
            data_out <= 250;
            state_send <= SEND_C_lsb;
        end
        SEND_C_lsb: begin
            data_out <= aux_lsb_C;
            state_send <= IN_D_msb;
        end
        
        IN_D_msb: begin
            data_out <= 249;
            state_send <= SEND_D_msb;
        end
        SEND_D_msb: begin
            data_out <= in_d[15:8];
            if ( in_d[7:0] > 247 )
                aux_lsb_D = 247;
            else
                aux_lsb_D <= in_d[7:0];
            state_send <= IN_D_lsb;
        end
        IN_D_lsb: begin
            data_out <= 248;
            state_send <= SEND_D_lsb;
        end
        SEND_D_lsb: begin
            data_out <= aux_lsb_D;
            state_send <= IN_A_msb;
        end
       
        default:
            state_send <= IN_A_msb;    
        endcase
    end
end
// -------------------------------INSTANCIA DE MODS UART E/S Y RELOJES------------------------------------
//-- Variables
logic [7:0] data_out;
logic [7:0] data_in;
logic data_rcv;
logic ok;
logic en_clk;
logic clk_baud;
logic clk_baud2;
logic ready;
logic send;

// --- RELOJES
divisor_f #(SEND_RATE)
    send_rate ( 
      .clk(clk),
      .en_clk(1),
      .clk_out(send)
    );
    
div_f_en #(BAUD)
    baudgen0 ( 
    .clk(clk_2),
    .en_clk(en_clk), 
    .clk_out(clk_baud2)
  );
  
divisor_f #(BAUD)
    baudgen1 ( 
      .clk(clk_2),
      .en_clk(ready),
      .clk_out(clk_baud)
    );
    
//-- UNIDAD UART RX   
uart_rx RX0(
    .clk(clk_2),
    .clk_baud(clk_baud),
    .clk_baud2(clk_baud2),
    .rx(rx),
    .dato(data_in),
    .en_clk(en_clk),
    .data_rcv(data_rcv)
    );

//-- UNIDAD UART TX
uart_tx TX0(
    .clk(clk_2),
    .clk_baud(clk_baud),
    .send(send),
    .dato(data_out),
    .tx(tx),
    .ready(ready)
    );
endmodule