`timescale 1ns / 1ps

module serial_gen_AD(
       start, clk, divClk,
       ready,data0, data1,
       D0, D1, 
       SYNC, SCLK      
       
);

// ---------- INPUTS AND OUTPUTS ----------

// Interfaz con FPGA:
input logic        start, clk, divClk; // Frecuencia maxima divClk: 40MHz
output logic       ready;
input logic [11:0] data0, data1;

// Interfaz con PMOD AD1:
output logic        SYNC, SCLK;
output logic D0, D1;


// ---------- MODULE ----------

logic [4:0] state; // registro de estado
// registros de desplazamiento interno
logic [15:0] data0_shift, data1_shift;
logic clkEn;

assign clkEn = divClk & ~SCLK;
assign D0    = data0_shift[15];
assign D1    = data1_shift[15];

always_ff @(posedge clk) begin
    if( start )
        SCLK <= 1;
    else if (divClk)
        SCLK <= ~SCLK;
end

always_ff @(posedge clk) begin
    if (start) begin
        data0_shift[11:0]  <= data0;
        data0_shift[15:12] <= 4'b0000;
        data1_shift[11:0]  <= data1;
        data1_shift[15:12] <= 4'b0000;
        ready <= 0;
        SYNC  <= 1;
        state <= 0;
    end

    else if (clkEn) begin
        if (state == 0) begin
            SYNC <=  0;
            state <= state + 1;
            data0_shift <= data0_shift << 1;
            data1_shift <= data1_shift << 1;
        end
        else if (state < 15) begin
            data0_shift <= data0_shift << 1;
            data1_shift <= data1_shift << 1;
            state <= state + 1;
        end
        else begin
            SYNC <= 1;
            ready <= 1;
        end
    end
end
endmodule
