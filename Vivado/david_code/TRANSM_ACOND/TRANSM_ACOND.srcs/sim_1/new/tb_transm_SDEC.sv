`timescale 1ps / 1ps

module tb_transm_SDEC;

logic clk; 
logic send; 

// Tasa bitrate AD1
logic divClk;

// Datos de entrada
logic [11:0] PV1 = 1;
logic [11:0] PV2 = 259;
logic [11:0] PV3 = 517;
logic [11:0] CV  = 775;

logic PV1_gen;
logic PV2_gen;
logic PV3_gen;

logic [11:0] PV1_rcv;
logic [11:0] PV2_rcv;
logic [11:0] PV3_rcv;

// Registro de entradas
logic capt_data;
logic [7:0] PV1_C_P1;
logic [7:0] PV1_C_P2;
logic [7:0] PV2_C_P1;
logic [7:0] PV2_C_P2;
logic [7:0] PV3_C_P1;
logic [7:0] PV3_C_P2;
logic [7:0] CV_C_P1;
logic [7:0] CV_C_P2;

logic [3:0] state_send = FLAG_1C1;
logic [7:0] data_out;

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

// Generación bits entrada AD1


// Recepción AD1

// clk divClk
divisor_f #(12)clk_divClk(  
//Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(divClk)               
);

serial_gen_AD gen1(
   .start(send),
   .clk(clk), 
   .divClk(divClk),
   .data0(PV1), 
   .data1(PV2), 
   .D0(PV1_gen), 
   .D1(PV2_gen)   
);

serial_gen_AD gen2(
   .start(send),
   .clk(clk), 
   .divClk(divClk),
   .data0(PV3), 
   .D0(PV3_gen)      
);


AD1_drive AD1_1 ( 
//entradas
    .start(send),
    .clk(clk), 
    .divClk(divClk),
    .D0(PV1_gen),
    .D1(PV2_gen),
    .data0(PV1_rcv),
    .data1(PV2_rcv)
);

AD1_drive AD1_2 ( 
//entradas
    .start(send),
    .clk(clk), 
    .divClk(divClk),
    .D0(PV3_gen),
    .data0(PV3_rcv)
);

// Captura de datos de salida
always_ff @(posedge clk) begin
    if (capt_data) begin
        PV1_C_P1[7:5] <= 0;
        PV1_C_P1[4:0] <= PV1_rcv[11:7];
        PV1_C_P2[7]   <= 0;
        PV1_C_P2[6:0] <= PV1_rcv[6:0];
        
        PV2_C_P1[7:5] <= 0;
        PV2_C_P1[4:0] <= PV2_rcv[11:7];
        PV2_C_P2[7]   <= 0;
        PV2_C_P2[6:0] <= PV2_rcv[6:0];
        
        PV3_C_P1[7:5] <= 0;
        PV3_C_P1[4:0] <= PV3_rcv[11:7];
        PV3_C_P2[7]   <= 0;
        PV3_C_P2[6:0] <= PV3_rcv[6:0];
        
        CV_C_P1[7] <= 0;
        CV_C_P1[6:0] <= CV[11:7];
        CV_C_P2[7]   <= 0;
        CV_C_P2[6:0] <= CV[6:0];
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
end

//-- UNIDAD UART TX
uart_tx #(17, 408) TX1(
    .clk(clk),
    .mode(2'b01),
    .send(send),
    .dato(data_out),
    .tx(tx)
    );
    
initial begin
    clk = 0;
end 

always begin
    #5 clk = ~clk;
end

endmodule
