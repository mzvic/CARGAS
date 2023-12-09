`timescale 1ns / 1ps

`default_nettype none

//-- Top design
module pack_ext(
        clk,
        rx,
        in_01,
        in_02,
        in_03,
        in_04,
        in_05,
        in_06,
        in_07,
        in_08,
        in_09,
        in_10,
        in_11,
        in_12,
        in_13, 
        tx,
        send,
        out_01,
        out_02,
        out_03,
        out_04,
        out_05,
        out_06,
        out_07,
        out_08,
        out_09,
        out_10,
        out_11,
        out_12,
        out_13,
        out_14,
        out_15,
        out_16,
        out_17,
        out_18,
        out_19,
        out_20,
        data_ready
           );   

// Entradas
input logic clk;
input logic rx;
input logic [13:0] in_01;
input logic [13:0] in_02;
input logic [13:0] in_03;
input logic [13:0] in_04;
input logic [13:0] in_05;
input logic [13:0] in_06;
input logic [13:0] in_07;
input logic [13:0] in_08;
input logic [13:0] in_09;
input logic [13:0] in_10;
input logic [13:0] in_11;
input logic [13:0] in_12;
input logic [13:0] in_13;

// Salidas
output logic tx;
output logic send;
output logic [20:0] out_01;
output logic [20:0] out_02;
output logic [20:0] out_03;
output logic [20:0] out_04;
output logic [20:0] out_05;
output logic [20:0] out_06;
output logic [20:0] out_07;
output logic [20:0] out_08;
output logic [20:0] out_09;
output logic [20:0] out_10;
output logic [20:0] out_11;
output logic [20:0] out_12;
output logic [20:0] out_13;
output logic [20:0] out_14;
output logic [20:0] out_15;
output logic [20:0] out_16;
output logic [20:0] out_17;
output logic [20:0] out_18;
output logic [20:0] out_19;
output logic [20:0] out_20;
output logic data_ready;
              
//-- Parametro: Velocidad de transmision
parameter BAUD = 1;
parameter SEND_RATE = 1;

// Parámetros locales
localparam SELECT = 6'd0;
localparam RCV1_P1 = 6'd1;
localparam RCV1_P2 = 6'd2;
localparam RCV1_P3 = 6'd3;
localparam RCV2_P1 = 6'd4;
localparam RCV2_P2 = 6'd5;
localparam RCV2_P3 = 6'd6;
localparam RCV3_P1 = 6'd7;
localparam RCV3_P2 = 6'd8;
localparam RCV3_P3 = 6'd9;
localparam RCV4_P1 = 6'd10;
localparam RCV4_P2 = 6'd11;
localparam RCV4_P3 = 6'd12;
localparam RCV5_P1 = 6'd13;
localparam RCV5_P2 = 6'd14;
localparam RCV5_P3 = 6'd15;
localparam RCV6_P1 = 6'd16;
localparam RCV6_P2 = 6'd17;
localparam RCV6_P3 = 6'd18;
localparam RCV7_P1 = 6'd19;
localparam RCV7_P2 = 6'd20;
localparam RCV7_P3 = 6'd21;
localparam RCV8_P1 = 6'd22;
localparam RCV8_P2 = 6'd23;
localparam RCV8_P3 = 6'd24;
localparam RCV9_P1 = 6'd25;
localparam RCV9_P2 = 6'd26;
localparam RCV9_P3 = 6'd27;
localparam RCV10_P1 = 6'd28;
localparam RCV10_P2 = 6'd29;
localparam RCV10_P3 = 6'd30;
localparam RCV11_P1 = 6'd31;
localparam RCV11_P2 = 6'd32;
localparam RCV11_P3 = 6'd33;
localparam RCV12_P1 = 6'd34;
localparam RCV12_P2 = 6'd35;
localparam RCV12_P3 = 6'd36;
localparam RCV13_P1 = 6'd37;
localparam RCV13_P2 = 6'd38;
localparam RCV13_P3 = 6'd39;
localparam RCV14_P1 = 6'd40;
localparam RCV14_P2 = 6'd41;
localparam RCV14_P3 = 6'd42;
localparam RCV15_P1 = 6'd43;
localparam RCV15_P2 = 6'd44;
localparam RCV15_P3 = 6'd45;
localparam RCV16_P1 = 6'd46;
localparam RCV16_P2 = 6'd47;
localparam RCV16_P3 = 6'd48;
localparam RCV17_P1 = 6'd49;
localparam RCV17_P2 = 6'd50;
localparam RCV17_P3 = 6'd51;
localparam RCV18_P1 = 6'd52;
localparam RCV18_P2 = 6'd53;
localparam RCV18_P3 = 6'd54;
localparam RCV19_P1 = 6'd55;
localparam RCV19_P2 = 6'd56;
localparam RCV19_P3 = 6'd57;
localparam RCV20_P1 = 6'd58;
localparam RCV20_P2 = 6'd59;
localparam RCV20_P3 = 6'd60;



localparam FLAG_01_M = 6'd0;
localparam FLAG_01_L = 6'd1;
localparam FLAG_02_M = 6'd2;
localparam FLAG_02_L = 6'd3;
localparam FLAG_03_M = 6'd4;
localparam FLAG_03_L = 6'd5;
localparam FLAG_04_M = 6'd6;
localparam FLAG_04_L = 6'd7;
localparam FLAG_05_M = 6'd8;
localparam FLAG_05_L = 6'd9;
localparam FLAG_06_M = 6'd10;
localparam FLAG_06_L = 6'd11;
localparam FLAG_07_M = 6'd12;
localparam FLAG_07_L = 6'd13;
localparam FLAG_08_M = 6'd14;
localparam FLAG_08_L = 6'd15;
localparam FLAG_09_M = 6'd16;
localparam FLAG_09_L = 6'd17;
localparam FLAG_10_M = 6'd18;
localparam FLAG_10_L = 6'd19;
localparam FLAG_11_M = 6'd20;
localparam FLAG_11_L = 6'd21;
localparam FLAG_12_M = 6'd22;
localparam FLAG_12_L = 6'd23;
localparam FLAG_13_M = 6'd24;
localparam FLAG_13_L = 6'd25;

localparam IN_01_M = 6'd26;
localparam IN_01_L = 6'd27;
localparam IN_02_M = 6'd28;
localparam IN_02_L = 6'd29;
localparam IN_03_M = 6'd30;
localparam IN_03_L = 6'd31;
localparam IN_04_M = 6'd32;
localparam IN_04_L = 6'd33;
localparam IN_05_M = 6'd34;
localparam IN_05_L = 6'd35;
localparam IN_06_M = 6'd36;
localparam IN_06_L = 6'd37;
localparam IN_07_M = 6'd38;
localparam IN_07_L = 6'd39;
localparam IN_08_M = 6'd40;
localparam IN_08_L = 6'd41;
localparam IN_09_M = 6'd42;
localparam IN_09_L = 6'd43;
localparam IN_10_M = 6'd44;
localparam IN_10_L = 6'd45;
localparam IN_11_M = 6'd46;
localparam IN_11_L = 6'd47;
localparam IN_12_M = 6'd48;
localparam IN_12_L = 6'd49;
localparam IN_13_M = 6'd50;
localparam IN_13_L = 6'd51;


// --------------------------------------------- MÓDULO ---------------------------------------------------
//-- Variables
logic [7:0] data_out;
logic [7:0] data_in;
logic data_rcv;

// Registros de entradas
logic [7:0] in_01_msB;
logic [7:0] in_01_lsB;
logic [7:0] in_02_msB;
logic [7:0] in_02_lsB;
logic [7:0] in_03_msB;
logic [7:0] in_03_lsB;
logic [7:0] in_04_msB;
logic [7:0] in_04_lsB;
logic [7:0] in_05_msB;
logic [7:0] in_05_lsB;
logic [7:0] in_06_msB;
logic [7:0] in_06_lsB;
logic [7:0] in_07_msB;
logic [7:0] in_07_lsB;
logic [7:0] in_08_msB;
logic [7:0] in_08_lsB;
logic [7:0] in_09_msB;
logic [7:0] in_09_lsB;
logic [7:0] in_10_msB;
logic [7:0] in_10_lsB;
logic [7:0] in_11_msB;
logic [7:0] in_11_lsB;
logic [7:0] in_12_msB;
logic [7:0] in_12_lsB;
logic [7:0] in_13_msB;
logic [7:0] in_13_lsB;

// Captura de datos de salida
logic capt_data;
always_ff @(posedge clk) begin
    if (capt_data) begin
        in_01_msB[7] <= 0;
        in_01_msB[6:0] <= in_01[13:7];
        in_01_lsB[7]   <= 0;
        in_01_lsB[6:0] <= in_01[6:0];
        
        in_02_msB[7] <= 0;
        in_02_msB[6:0] <= in_02[13:7];
        in_02_lsB[7]   <= 0;
        in_02_lsB[6:0] <= in_02[6:0];
        
        in_03_msB[7] <= 0;
        in_03_msB[6:0] <= in_03[13:7];
        in_03_lsB[7]   <= 0;
        in_03_lsB[6:0] <= in_03[6:0];
        
        in_04_msB[7] <= 0;
        in_04_msB[6:0] <= in_04[13:7];
        in_04_lsB[7]   <= 0;
        in_04_lsB[6:0] <= in_04[6:0];
        
        
        
        in_05_msB[7] <= 0;
        in_05_msB[6:0] <= in_05[13:7];
        in_05_lsB[7]   <= 0;
        in_05_lsB[6:0] <= in_05[6:0];
        
        in_06_msB[7] <= 0;
        in_06_msB[6:0] <= in_06[13:7];
        in_06_lsB[7]   <= 0;
        in_06_lsB[6:0] <= in_06[6:0];
        
        in_07_msB[7] <= 0;
        in_07_msB[6:0] <= in_07[13:7];
        in_07_lsB[7]   <= 0;
        in_07_lsB[6:0] <= in_07[6:0];
        
        in_08_msB[7] <= 0;
        in_08_msB[6:0] <= in_08[13:7];
        in_08_lsB[7]   <= 0;
        in_08_lsB[6:0] <= in_08[6:0];
        
        in_09_msB[7] <= 0;
        in_09_msB[6:0] <= in_09[13:7];
        in_09_lsB[7]   <= 0;
        in_09_lsB[6:0] <= in_09[6:0];
        
        in_10_msB[7] <= 0;
        in_10_msB[6:0] <= in_10[13:7];
        in_10_lsB[7]   <= 0;
        in_10_lsB[6:0] <= in_10[6:0];
        
        in_11_msB[7] <= 0;
        in_11_msB[6:0] <= in_11[13:7];
        in_11_lsB[7]   <= 0;
        in_11_lsB[6:0] <= in_11[6:0];
        
        in_12_msB[7] <= 0;
        in_12_msB[6:0] <= in_12[13:7];
        in_12_lsB[7]   <= 0;
        in_12_lsB[6:0] <= in_12[6:0];
        
        in_13_msB[7] <= 0;
        in_13_msB[6:0] <= in_13[13:7];
        in_13_lsB[7]   <= 0;
        in_13_lsB[6:0] <= in_13[6:0];
    end
end

logic [6:0] aux_p1;
logic [6:0] aux_p2;

// MÁQUINA DE ESTADOS DE RECEPCIÓN  -------------------------------------------------------------------------------------------------------
logic [5:0] state_rcv = SELECT;
always_ff @(posedge clk) begin
//    -- Capturar el dato cuando se reciba
    if (data_rcv == 1'b1) begin
        
        case (state_rcv)
        
        SELECT:
            if ( data_in == 150) 
                state_rcv <= RCV1_P1;
            else if ( data_in == 151 ) 
                state_rcv <= RCV2_P1;
            else if ( data_in == 152) 
                state_rcv <= RCV3_P1;
            else if ( data_in == 153) 
                state_rcv <= RCV4_P1;
            else if ( data_in == 154) 
                state_rcv <= RCV5_P1;          
            else if ( data_in == 155 ) 
                state_rcv <= RCV6_P1;
            else if ( data_in == 156) 
                state_rcv <= RCV7_P1;
            else if ( data_in == 157) 
                state_rcv <= RCV8_P1;
            else if ( data_in == 158) 
                state_rcv <= RCV9_P1;     
            else if ( data_in == 159) 
                state_rcv <= RCV10_P1;   
            else if ( data_in == 160 ) 
                state_rcv <= RCV11_P1;
            else if ( data_in == 161) 
                state_rcv <= RCV12_P1;
            else if ( data_in == 162) 
                state_rcv <= RCV13_P1;
            else if ( data_in == 163) 
                state_rcv <= RCV14_P1;          
            else if ( data_in == 164 ) 
                state_rcv <= RCV15_P1;
            else if ( data_in == 165) 
                state_rcv <= RCV16_P1;
            else if ( data_in == 166) 
                state_rcv <= RCV17_P1;
            else if ( data_in == 167) 
                state_rcv <= RCV18_P1;     
            else if ( data_in == 168) 
                state_rcv <= RCV19_P1;   
            else if ( data_in == 169) 
                state_rcv <= RCV20_P1;   
            else
                state_rcv <= SELECT;
        
        RCV1_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV1_P2;
            end
        RCV1_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV1_P3;
            end
        RCV1_P3:
            begin
                out_01 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV2_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV2_P2;
            end
        RCV2_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV2_P3;
            end
        RCV2_P3:
            begin
                out_02 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV3_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV3_P2;
            end
        RCV3_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV3_P3;
            end
        RCV3_P3:
            begin
                out_03 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV4_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV4_P2;
            end
        RCV4_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV4_P3;
            end
        RCV4_P3:
            begin
                out_04 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV5_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV5_P2;
            end
        RCV5_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV5_P3;
            end
        RCV5_P3:
            begin
                out_05 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV6_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV6_P2;
            end
        RCV6_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV6_P3;
            end
        RCV6_P3:
            begin
                out_06 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV7_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV7_P2;
            end
        RCV7_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV7_P3;
            end
        RCV7_P3:
            begin
                out_07 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV8_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV8_P2;
            end
        RCV8_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV8_P3;
            end
        RCV8_P3:
            begin
                out_08 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV9_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV9_P2;
            end
        RCV9_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV9_P3;
            end
        RCV9_P3:
            begin
                out_09 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV10_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV10_P2;
            end
        RCV10_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV10_P3;
            end
        RCV10_P3:
            begin
                out_10 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV11_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV11_P2;
            end
        RCV11_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV11_P3;
            end
        RCV11_P3:
            begin
                out_11 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV12_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV12_P2;
            end
        RCV12_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV12_P3;
            end
        RCV12_P3:
            begin
                out_12 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV13_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV13_P2;
            end
        RCV13_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV13_P3;
            end
        RCV13_P3:
            begin
                out_13 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV14_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV14_P2;
            end
        RCV14_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV14_P3;
            end
        RCV14_P3:
            begin
                out_14 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV15_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV15_P2;
            end
        RCV15_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV15_P3;
            end
        RCV15_P3:
            begin
                out_15 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV16_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV16_P2;
            end
        RCV16_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV16_P3;
            end
        RCV16_P3:
            begin
                out_16 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV17_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV17_P2;
            end
        RCV17_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV17_P3;
            end
        RCV17_P3:
            begin
                out_17 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV18_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV18_P2;
            end
        RCV18_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV18_P3;
            end
        RCV18_P3:
            begin
                out_18 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV19_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV19_P2;
            end
        RCV19_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV19_P3;
            end
        RCV19_P3:
            begin
                out_19 <= {aux_p1, aux_p2, data_in[6:0]};
                state_rcv <= SELECT;
                data_ready <= 1;
            end
        RCV20_P1:
            begin
                aux_p1 <= data_in[6:0];
                state_rcv <= RCV20_P2;
            end
        RCV20_P2:
            begin
                aux_p2 <= data_in[6:0];
                state_rcv <= RCV20_P3;
            end
        RCV20_P3:
            begin
                out_20 <= {aux_p1, aux_p2, data_in[6:0]};
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

// TRANSMISIÓN DE SEÑALES CONTINUA -------------------------------------------------------------------------------------------------------
logic [5:0] state_send = FLAG_01_M;

always_ff @(posedge clk) begin
    if (send) begin
        
        case (state_send)
        
        FLAG_01_M: begin
            capt_data <= 1;
            data_out <= 200;
            state_send <= IN_01_M;
        end
        IN_01_M: begin
            capt_data <= 0;
            data_out <= in_01_msB;
            state_send <= FLAG_01_L;
        end
        FLAG_01_L: begin
            data_out <= 201;
            state_send <= IN_01_L;
        end
        IN_01_L: begin
            data_out <= in_01_lsB;
            state_send <= FLAG_02_M;
        end
        FLAG_02_M: begin
            data_out <= 202;
            state_send <= IN_02_M;
        end
        IN_02_M: begin
            data_out <= in_02_msB;
            state_send <= FLAG_02_L;
        end
        FLAG_02_L: begin
            data_out <= 203;
            state_send <= IN_02_L;
        end
        IN_02_L: begin
            data_out <= in_02_lsB;
            state_send <= FLAG_03_M;
        end
        FLAG_03_M: begin
            data_out <= 204;
            state_send <= IN_03_M;
        end
        IN_03_M: begin
            data_out <= in_03_msB;
            state_send <= FLAG_03_L;
        end
        FLAG_03_L: begin
            data_out <= 205;
            state_send <= IN_03_L;
        end
        IN_03_L: begin
            data_out <= in_03_lsB;
            state_send <= FLAG_04_M;
        end
        FLAG_04_M: begin
            data_out <= 206;
            state_send <= IN_04_M;
        end
        IN_04_M: begin
            data_out <= in_04_msB;
            state_send <= FLAG_04_L;
        end
        FLAG_04_L: begin
            data_out <= 207;
            state_send <= IN_04_L;
        end
        IN_04_L: begin
            data_out <= in_04_lsB;
            state_send <= FLAG_05_M;
        end
        
        
        FLAG_05_M: begin
            capt_data <= 1;
            data_out <= 208;
            state_send <= IN_05_M;
        end
        IN_05_M: begin
            capt_data <= 0;
            data_out <= in_05_msB;
            state_send <= FLAG_05_L;
        end
        FLAG_05_L: begin
            data_out <= 209;
            state_send <= IN_05_L;
        end
        IN_05_L: begin
            data_out <= in_05_lsB;
            state_send <= FLAG_06_M;
        end
        FLAG_06_M: begin
            data_out <= 210;
            state_send <= IN_06_M;
        end
        IN_06_M: begin
            data_out <= in_06_msB;
            state_send <= FLAG_06_L;
        end
        FLAG_06_L: begin
            data_out <= 211;
            state_send <= IN_06_L;
        end
        IN_06_L: begin
            data_out <= in_06_lsB;
            state_send <= FLAG_07_M;
        end
        FLAG_07_M: begin
            data_out <= 212;
            state_send <= IN_07_M;
        end
        IN_07_M: begin
            data_out <= in_07_msB;
            state_send <= FLAG_07_L;
        end
        FLAG_07_L: begin
            data_out <= 213;
            state_send <= IN_07_L;
        end
        IN_07_L: begin
            data_out <= in_07_lsB;
            state_send <= FLAG_08_M;
        end
        FLAG_08_M: begin
            data_out <= 214;
            state_send <= IN_08_M;
        end
        IN_08_M: begin
            data_out <= in_08_msB;
            state_send <= FLAG_08_L;
        end
        FLAG_08_L: begin
            data_out <= 215;
            state_send <= IN_08_L;
        end
        IN_08_L: begin
            data_out <= in_08_lsB;
            state_send <= FLAG_09_M;
        end  
        FLAG_09_M: begin
            capt_data <= 1;
            data_out <= 216;
            state_send <= IN_09_M;
        end
        IN_09_M: begin
            capt_data <= 0;
            data_out <= in_09_msB;
            state_send <= FLAG_09_L;
        end
        FLAG_09_L: begin
            data_out <= 217;
            state_send <= IN_09_L;
        end
        IN_09_L: begin
            data_out <= in_09_lsB;
            state_send <= FLAG_10_M;
        end
        FLAG_10_M: begin
            data_out <= 218;
            state_send <= IN_10_M;
        end
        IN_10_M: begin
            data_out <= in_10_msB;
            state_send <= FLAG_10_L;
        end
        FLAG_10_L: begin
            data_out <= 219;
            state_send <= IN_10_L;
        end
        IN_10_L: begin
            data_out <= in_10_lsB;
            state_send <= FLAG_11_M;
        end
        FLAG_11_M: begin
            data_out <= 220;
            state_send <= IN_11_M;
        end
        IN_11_M: begin
            data_out <= in_11_msB;
            state_send <= FLAG_11_L;
        end
        FLAG_11_L: begin
            data_out <= 221;
            state_send <= IN_11_L;
        end
        IN_11_L: begin
            data_out <= in_11_lsB;
            state_send <= FLAG_12_M;
        end
        FLAG_12_M: begin
            data_out <= 222;
            state_send <= IN_12_M;
        end
        IN_12_M: begin
            data_out <= in_12_msB;
            state_send <= FLAG_12_L;
        end
        FLAG_12_L: begin
            data_out <= 223;
            state_send <= IN_12_L;
        end
        IN_12_L: begin
            data_out <= in_12_lsB;
            state_send <= FLAG_13_M;
        end
        FLAG_13_M: begin
            data_out <= 224;
            state_send <= IN_13_M;
        end
        IN_13_M: begin
            data_out <= in_13_msB;
            state_send <= FLAG_13_L;
        end
        FLAG_13_L: begin
            data_out <= 225;
            state_send <= IN_13_L;
        end
        IN_13_L: begin
            data_out <= in_13_lsB;
            state_send <= FLAG_01_M;
        end
        
        default:
            state_send <= FLAG_01_M;    
        endcase
    end
end
// -------------------------------INSTANCIA DE MODS UART E/S Y RELOJES------------------------------------
    
//-- UNIDAD UART RX   
pin_rx #(BAUD) RX0(
    .clk(clk),
    .rx(rx),
    .dato(data_in),
    .data_rcv(data_rcv)
    );
        
//-- UNIDAD UART TX
pin_tx #(BAUD, SEND_RATE) TX0(
    .clk(clk),
    .mode(2'b01),
    .send(send),
    .dato(data_out),
    .tx(tx)
    );    
endmodule