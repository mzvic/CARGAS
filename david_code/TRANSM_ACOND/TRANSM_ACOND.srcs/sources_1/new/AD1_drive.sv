`timescale 1ns / 1ps

module AD1_drive(
       start, clk, divClk,
       data0, data1,
       D0, D1,
       CS, SCLK,
       data_read,
       dato_ready,
       clkEn,
       state      
);

// ---------- PARAMETERS ----------

// ---------- LOCAL PARAMETERS ----------

// ---------- INPUTS AND OUTPUTS ----------

// Interfaz con FPGA:
input logic start, clk, divClk; // Frecuencia maxima divClk: 40MHz
logic ready;
output logic [11:0] data0, data1;

// Interfaz con PMOD AD1:
input logic D0, D1;
output logic CS, SCLK;
output logic dato_ready;

// ---------- MODULE ----------

output logic [4:0] state; // registro de estado
// registros internos de desplazamiento
logic [11:0] data0_shift, data1_shift;
output logic clkEn;
always_comb clkEn = divClk & ~SCLK;

always_ff @(posedge clk) begin
    if (start)
        SCLK <= 1;
    else if (divClk)
        SCLK <= ~SCLK;
end
output logic [4:0] data_read;
always_ff @(posedge clk) begin
    if (start) begin
        ready <= 0;
        CS <= 1;
        state <= 0;
        dato_ready <= 0;
    end
    else if (clkEn) begin
        if (state == 0) begin
            CS <= 0;
            data_read <= 0;
            state <= state + 1;
        end
        else if (state < 15) begin
            data0_shift <= {data0_shift[9:0], D0};
            data1_shift <= {data1_shift[9:0], D1};
            state <= state + 1;
            data_read <= data_read + 1;
        end
        else if ( state == 15 ) begin
            data0 <= {data0_shift, D0};
            data1 <= {data1_shift, D1};
            state <= state + 1;
            data_read <= data_read + 1;
            dato_ready <= 1;
        end
        else begin
            CS <= 1;
            ready <= 1;
            dato_ready <= 0;
        end
    end
end

endmodule