`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Design by : D.A
// Create Date: 14.06.2017 
// Design Name: Divisor de frecuencia de duty cicle variable (fout =cte)
// Module Name: var_duty_clk
// Description: Módulo usado para dividir la frecuencia del reloj del sistema. 
// La salida es un pulso con duty cicle variable, con f igual a fclk/div. 
// Dependencies: CePIA - Departamento de Astronomía - FCFM - UdeC
// 
//////////////////////////////////////////////////////////////////////////////////

module PWM_sv (
    clk,
    duty,
    sync_sin,
    pin_pwm,
    aux1,
    sync_out,
    read_duty
    );

// Entradas
input logic clk; 
input logic [9:0] duty;
input logic [11:0]sync_sin;
// Salidas 
output logic pin_pwm;
output logic aux1;
output logic sync_out;
output logic read_duty;
// Parametros

// Parámetros locales
localparam L= $clog2(1000);

//////////////////////////////////////////////////////////// MODULO ////////////////////////////////////////////////////////////

// Sincronización con la red /////////////////////////////////////////////////////////////////////////////////////

always_comb begin
    if (sync_sin > 12'd1000)
        aux1 = 1;
    else 
        aux1 = 0;
end
//
//logic aux1_act;
//logic aux1_ant;
//assign aux1_act =( ~aux1) & aux1_ant;

//always_ff @(posedge clk) begin
//    if (start)
//        aux1_ant <= aux1;  
//end

logic sync_act;
logic [18:0] cont_sync = 0;

logic [18:0] mid_sync;
logic [19:0] max_cont;
logic in_sync = 0;

always_ff @(posedge clk) begin
    if (aux1 ) begin
        cont_sync <= cont_sync + 1;
    end
    else begin
        cont_sync <= 0;
        if ( cont_sync >= 245000 ) 
            max_cont <= cont_sync;
        else
            max_cont <= max_cont;
    end
end

assign mid_sync = (max_cont >> 1) - 13200; // 17000

assign sync_out = (cont_sync >= mid_sync ); 
assign sync_act = (cont_sync == mid_sync );


// Generación de la modulación PWM ///////////////////////////////////////////////////////////////////////////////////////

logic start;
divisor_f #(600)clk_start(  //100kHz (// Modificado el 29-11-22 / 41.666667Hz*2
    //Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(start)               
);

assign read_duty = sync_act; 

logic [L-1:0] cont = 0; 

always_ff @(posedge clk) begin
    if (sync_act ) begin // ^ (duty > 800  & cont >= 900 )
        cont <= 0;
    end
    else if (start) begin
        cont <= cont + 1;
    end
end

logic [9:0] tau;
assign tau = 1005 - duty;
assign pin_pwm = (duty == 0) ? 0 : (cont >= (tau) ); // La salida será 1 cuando el contador
// sea menor o igual al duty de entrada

endmodule
