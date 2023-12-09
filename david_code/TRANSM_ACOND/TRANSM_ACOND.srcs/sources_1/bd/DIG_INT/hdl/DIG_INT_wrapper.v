//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Tue May 29 15:40:54 2018
//Host        : DESKTOP-VFDGOU2 running 64-bit major release  (build 9200)
//Command     : generate_target DIG_INT_wrapper.bd
//Design      : DIG_INT_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module DIG_INT_wrapper
   (JA_0,
    JA_1,
    JA_2,
    JA_3,
    clk,
    uart_rxd_in,
    uart_txd_out);
  output JA_0;
  input JA_1;
  input JA_2;
  output JA_3;
  input clk;
  input uart_rxd_in;
  output uart_txd_out;

  wire JA_0;
  wire JA_1;
  wire JA_2;
  wire JA_3;
  wire clk;
  wire uart_rxd_in;
  wire uart_txd_out;

  DIG_INT DIG_INT_i
       (.JA_0(JA_0),
        .JA_1(JA_1),
        .JA_2(JA_2),
        .JA_3(JA_3),
        .clk(clk),
        .uart_rxd_in(uart_rxd_in),
        .uart_txd_out(uart_txd_out));
endmodule
