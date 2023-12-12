`timescale 1ns / 1ps

module create_var(
    clk,
    out_var,
    ready
    );
    
// Entrada
input wire clk;

// Salida
output reg [11:0] out_var; 
output wire ready;

// Parámetros locales
localparam UNO = 4'd0;
localparam DOS = 4'd1;
localparam TRES = 4'd2;
localparam CUATRO = 4'd3;
localparam CINCO = 4'd4;
localparam SEIS = 4'd5;
localparam SIETE = 4'd6;
localparam OCHO = 4'd7;
localparam NUEVE = 4'd8;
localparam DIEZ = 4'd9;
localparam ONCE = 4'd10;
localparam DOCE = 4'd11;
localparam TRECE = 4'd12;
localparam CATORCE = 4'd13;
localparam QUINCE = 4'd14;
localparam DIECISEIS = 4'd15;

////////////////////////////////////// MODULO ////////////////////////////////

wire start;
divisor_f #(500) start_clk (
    .clk(clk),
    .en_clk(1),
    .clk_out(start)
    ); 
assign ready = start;

reg [3:0] var_val = 0;
  
always @(posedge clk) begin
    if (start) begin
        case ( var_val ) 
        UNO: 
        begin
            out_var <= 12'd1582;
            var_val <= DOS;
        end
        DOS:
        begin 
            out_var <= 12'd1584;
            var_val <= TRES;
        end
        TRES: 
        begin
            out_var <= 12'd1585;
            var_val <= CUATRO;
        end
        CUATRO: 
        begin
            out_var <= 12'd1583;
            var_val <= CINCO;
        end
        CINCO: 
        begin
            out_var <= 12'd1582;
            var_val <= SEIS;
        end
        SEIS: 
        begin
            out_var <= 12'd1581;
            var_val <= SIETE;
        end
        SIETE: 
        begin
            out_var <= 12'd1580;
            var_val <= OCHO;
        end
        OCHO: 
        begin
            out_var <= 12'd1582;
            var_val <= NUEVE;
        end
        NUEVE: 
        begin
            out_var <= 12'd1581;
            var_val <= DIEZ;
        end
        DIEZ: 
        begin
            out_var <= 12'd1585;
            var_val <= ONCE;
        end
        ONCE: 
        begin
            out_var <= 12'd1586;
            var_val <= DOCE;
        end
        DOCE: 
        begin
            out_var <= 12'd1585;
            var_val <= TRECE;
        end
        TRECE: 
        begin
            out_var <= 12'd1583;
            var_val <= CATORCE;
        end
        CATORCE: 
        begin
            out_var <= 12'd1581;
            var_val <= QUINCE;
        end
        QUINCE: 
        begin
            out_var <= 12'd1580;
            var_val <= DIECISEIS;
        end
        DIECISEIS: 
        begin
            out_var <= 12'd1582;
            var_val <= UNO;
        end
        default:
            var_val <= UNO;
        endcase
    end
end          
endmodule
