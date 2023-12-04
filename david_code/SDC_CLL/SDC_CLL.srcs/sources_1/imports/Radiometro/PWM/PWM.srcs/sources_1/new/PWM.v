`timescale 1ns / 1ps

`include "div_frecuencias.vh" 

//////////////////////////////////////////////////////////////////////////////////
// Design by : D.A
// Create Date: 14.06.2017 
// Design Name: Modulación por ancho de pulso
// Module Name: PWM
// Description: Módulo usado para convertir un valor discreto en una señal 
// de salida "análoga" PWM con frecuencia constante de 100Hz. 
//
// Dependencies: CePIA - Departamento de Astronomía - FCFM - UdeC
// 
//////////////////////////////////////////////////////////////////////////////////

module PWM(
    clk,
    duty,
    sync_sin,
    pin_pwm,
    aux1,
    sync_out,
    read_duty
    );

// Entradas
input wire clk; 
input wire [9:0] duty;
input wire [11:0]sync_sin;
// Salidas 
output wire pin_pwm;
output wire aux1;
output wire sync_out;
output wire read_duty;
// Parametros

// Parámetros locales

////////////////////////////// MODULO //////////////////////////////

PWM_sv inst_pwm (
    clk,
    duty,
    sync_sin,
    pin_pwm,
    aux1,
    sync_out,
    read_duty
    );

    
endmodule
