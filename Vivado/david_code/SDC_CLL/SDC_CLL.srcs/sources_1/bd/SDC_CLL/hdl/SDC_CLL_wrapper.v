//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Tue Nov 29 11:29:33 2022
//Host        : DESKTOP-0L13E69 running 64-bit major release  (build 9200)
//Command     : generate_target SDC_CLL_wrapper.bd
//Design      : SDC_CLL_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SDC_CLL_wrapper
   (JB_0,
    JB_4,
    JB_5,
    JB_6,
    JB_7,
    JC_0,
    JC_1,
    JC_2,
    JC_3,
    JC_4,
    JC_5,
    JC_6,
    JC_7,
    JD_0,
    JD_1,
    JD_2,
    JD_3,
    JD_4,
    JD_5,
    JD_6,
    JD_7,
    clk,
    led1,
    led4,
    led_01,
    uart_rxd_in,
    uart_txd_out);
  output JB_0;
  output JB_4;
  input JB_5;
  input JB_6;
  output JB_7;
  output JC_0;
  input JC_1;
  input JC_2;
  output JC_3;
  output JC_4;
  input JC_5;
  input JC_6;
  output JC_7;
  output JD_0;
  input JD_1;
  input JD_2;
  output JD_3;
  output JD_4;
  input JD_5;
  input JD_6;
  output JD_7;
  input clk;
  output [2:0]led1;
  output [2:0]led4;
  output led_01;
  input uart_rxd_in;
  output uart_txd_out;

  wire JB_0;
  wire JB_4;
  wire JB_5;
  wire JB_6;
  wire JB_7;
  wire JC_0;
  wire JC_1;
  wire JC_2;
  wire JC_3;
  wire JC_4;
  wire JC_5;
  wire JC_6;
  wire JC_7;
  wire JD_0;
  wire JD_1;
  wire JD_2;
  wire JD_3;
  wire JD_4;
  wire JD_5;
  wire JD_6;
  wire JD_7;
  wire clk;
  wire [2:0]led1;
  wire [2:0]led4;
  wire led_01;
  wire uart_rxd_in;
  wire uart_txd_out;

  SDC_CLL SDC_CLL_i
       (.JB_0(JB_0),
        .JB_4(JB_4),
        .JB_5(JB_5),
        .JB_6(JB_6),
        .JB_7(JB_7),
        .JC_0(JC_0),
        .JC_1(JC_1),
        .JC_2(JC_2),
        .JC_3(JC_3),
        .JC_4(JC_4),
        .JC_5(JC_5),
        .JC_6(JC_6),
        .JC_7(JC_7),
        .JD_0(JD_0),
        .JD_1(JD_1),
        .JD_2(JD_2),
        .JD_3(JD_3),
        .JD_4(JD_4),
        .JD_5(JD_5),
        .JD_6(JD_6),
        .JD_7(JD_7),
        .clk(clk),
        .led1(led1),
        .led4(led4),
        .led_01(led_01),
        .uart_rxd_in(uart_rxd_in),
        .uart_txd_out(uart_txd_out));
endmodule
