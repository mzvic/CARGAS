`timescale 1ns / 1ps

module pre_process(
    clk,
    SP1,
    SP2,
    SP3,
    param1_1,
    param2_1,
    param3_1,
    param1_2,
    param2_2,
    param3_2,
    param1_3,
    param2_3,
    param3_3,
    modo,
    sensor,
    stop,
    config_mode,
    yT1_1,
    yT2_1,
    yT3_1,
    yT1_2,
    yT2_2,
    yT3_2,
    yT1_3,
    yT2_3,
    yT3_3,
    modo_1,
    SP_1,
    kc_1,
    Ti_1,
    Td_1,
    yT_1,
    modo_2,
    SP_2,
    kc_2,
    Ti_2,
    Td_2,
    yT_2,
    modo_3,
    SP_3,
    kc_3,
    Ti_3,
    Td_3,
    yT_3,
    ind_config
    );
    
// Entradas
input wire clk;

input wire [20:0] SP1;   
input wire [20:0] SP2;  
input wire [13:0] SP3;  

input wire [20:0] param1_1;   
input wire [20:0] param2_1;  
input wire [20:0] param3_1;  

input wire [20:0] param1_2;   
input wire [20:0] param2_2;  
input wire [20:0] param3_2;

input wire [20:0] param1_3;   
input wire [20:0] param2_3;  
input wire [20:0] param3_3;  

input wire [20:0] modo;   
input wire [20:0] sensor;  
input wire stop;  
input wire [20:0] config_mode;  

input wire [N-1:0] yT1_1;   
input wire [N-1:0] yT2_1;  
input wire [N-1:0] yT3_1;  

input wire [N-1:0] yT1_2;   
input wire [N-1:0] yT2_2;  
input wire [N-1:0] yT3_2;  

input wire [N-1:0] yT1_3;   
input wire [N-1:0] yT2_3;  
input wire [N-1:0] yT3_3;  

// Salidas
output wire [2:0] modo_1;
output wire [N-1:0] SP_1;   
output wire [N-1:0] kc_1; 
output wire [N-1:0] Ti_1;   
output wire [N-1:0] Td_1;   
output wire [N-1:0] yT_1;

output wire [2:0] modo_2;
output wire [N-1:0] SP_2;   
output wire [N-1:0] kc_2; 
output wire [N-1:0] Ti_2;   
output wire [N-1:0] Td_2;   
output wire [N-1:0] yT_2;

output wire [2:0] modo_3;
output wire [N-1:0] SP_3;   
output wire [N-1:0] kc_3; 
output wire [N-1:0] Ti_3;   
output wire [N-1:0] Td_3;   
output wire [N-1:0] yT_3;

output wire [2:0] ind_config;
       
// Parámetros 
parameter Q = 15;
parameter N = 28;

///////////////////////////////////////////////// MODULO ////////////////////////////////////////
// Indicador configuración
assign ind_config[0] = config_mode[0];
assign ind_config[1] = config_mode[0];
assign ind_config[2] = config_mode[0];

// Separación de modo de control 
assign modo_1 = stop ? 0:modo[1:0];
assign modo_2 = stop ? 0:modo[3:2];
assign modo_3 = stop ? 0:modo[5:4];

// Separación de modo de control 
wire [1:0] sensor_1;
assign sensor_1 = sensor[1:0];

wire [1:0] sensor_2;
assign sensor_2 = sensor[3:2];

wire [1:0] sensor_3;
assign sensor_3 = sensor[5:4];

// Set points
assign SP_1[26:5] = stop ? 0:SP1;
assign SP_1[N-1] = 0;
assign SP_1[4:0] = 0; 

assign SP_2[26:5] = stop ? 0:SP2;
assign SP_2[N-1] = 0;
assign SP_2[4:0] = 0; 

assign SP_3[26:5] = stop ? 0:SP3;
assign SP_3[N-1] = 0;
assign SP_3[4:0] = 0; 

// Parámetros
//1
localparam kcM_1 = 425984; // kc = 13 en FP (28,15) 
localparam TiM_1 = 2818048; // Ti = 86 en FP (28,15) 
localparam TdM_1 = 0; // Td = 0.5 en FP (28,15)   /// Corregido a cero por ruido en el sensor

wire [N-1:0] aux_kc_1;
assign aux_kc_1[26:5] = param1_1;
assign aux_kc_1[N-1] = 0;
assign aux_kc_1[4:0] = 0;

assign kc_1 = config_mode[0]? aux_kc_1:kcM_1;

wire [N-1:0] aux_Ti_1;
assign aux_Ti_1[26:5] = param2_1;
assign aux_Ti_1[N-1] = 0;
assign aux_Ti_1[4:0] = 0;

assign Ti_1 = config_mode[0]? aux_Ti_1:TiM_1;

wire [N-1:0] aux_Td_1;
assign aux_Td_1[26:5] = param3_1;
assign aux_Td_1[N-1] = 0;
assign aux_Td_1[4:0] = 0;

assign Td_1 = config_mode[0]? aux_Td_1:TdM_1;

//2
localparam kcM_2 = 425984; // kc = 13 en FP (28,15) 
localparam TiM_2 = 2818048; // Ti = 86 en FP (28,15) 
localparam TdM_2 = 16384; // Td = 0.5 en FP (28,15) 

wire [N-1:0] aux_kc_2;
assign aux_kc_2[26:5] = param1_2;
assign aux_kc_2[N-1] = 0;
assign aux_kc_2[4:0] = 0;

assign kc_2 = config_mode[0]? kcM_2:aux_kc_2;

wire [N-1:0] aux_Ti_2;
assign aux_Ti_2[26:5] = param2_2;
assign aux_Ti_2[N-1] = 0;
assign aux_Ti_2[4:0] = 0;

assign Ti_2 = config_mode[0]? TiM_2:aux_Ti_2;

wire [N-1:0] aux_Td_2;
assign aux_Td_2[26:5] = param3_2;
assign aux_Td_2[N-1] = 0;
assign aux_Td_2[4:0] = 0;

assign Td_2 = config_mode[0]? TdM_2:aux_Td_2;

//3
localparam kcM_3 = 425984; // kc = 13 en FP (28,15) 
localparam TiM_3 = 2818048; // Ti = 86 en FP (28,15) 
localparam TdM_3 = 16384; // Td = 0.5 en FP (28,15) 

wire [N-1:0] aux_kc_3;
assign aux_kc_3[26:5] = param1_3;
assign aux_kc_3[N-1] = 0;
assign aux_kc_3[4:0] = 0;

assign kc_3 = config_mode[0]? kcM_3:aux_kc_3;

wire [N-1:0] aux_Ti_3;
assign aux_Ti_3[26:5] = param2_3;
assign aux_Ti_3[N-1] = 0;
assign aux_Ti_3[4:0] = 0;

assign Ti_3 = config_mode[0]? TiM_3:aux_Ti_3;

wire [N-1:0] aux_Td_3;
assign aux_Td_3[26:5] = param3_3;
assign aux_Td_3[N-1] = 0;
assign aux_Td_3[4:0] = 0;

assign Td_3 = config_mode[0]? TdM_3:aux_Td_3;

// Retroalimentación 
//1
wire [N-1:0] auxm_1; 
m3an #(Q,N) mean1 (clk,yT1_1,yT2_1,yT3_1,auxm_1);

reg [N-1:0] aux_1;
always @(sensor_1) begin
    case(sensor_1) 
    
    0: aux_1 = auxm_1;
    
    1: aux_1 = yT1_1;
    
    2: aux_1 = yT2_1;
    
    3: aux_1 = yT3_1;
    
    default: aux_1 = auxm_1;
    
    endcase
end

assign yT_1 = aux_1;

//2
wire [N-1:0] auxm_2; 
m3an #(Q,N) mean2 (clk,yT1_2,yT2_2,yT3_2,auxm_2);

reg [N-1:0] aux_2;
always @(sensor_2) begin
    case(sensor_2) 
    
    0: aux_2 = auxm_2;
    
    1: aux_2 = yT1_2;
    
    2: aux_2 = yT2_2;
    
    3: aux_2 = yT3_2;
    
    default: aux_2 = auxm_2;
    
    endcase
end

assign yT_2 = aux_2;

//3
wire [N-1:0] auxm_3; 
m3an #(Q,N) mean3 (clk,yT1_3,yT2_3,yT3_3,auxm_3);

reg [N-1:0] aux_3;
always @(sensor_3) begin
    case(sensor_3) 
    
    0: aux_3 = auxm_3;
    
    1: aux_3 = yT1_3;
    
    2: aux_3 = yT2_3;
    
    3: aux_3 = yT3_3;
    
    default: aux_3 = auxm_3;
    
    endcase
end

assign yT_3 = aux_3;

endmodule
