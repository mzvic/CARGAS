//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Thu Nov 23 16:15:21 2023
//Host        : DESKTOP-C3LB8TR running 64-bit major release  (build 9200)
//Command     : generate_target ts_pt100_wrapper.bd
//Design      : ts_pt100_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ts_pt100_wrapper
   (clk,
    jc0,
    jc1,
    jc2,
    jc3,
    uart_rxd_in,
    uart_txd_out);
  input clk;
  output jc0;
  input jc1;
  input jc2;
  output jc3;
  input uart_rxd_in;
  output uart_txd_out;

  wire clk;
  wire jc0;
  wire jc1;
  wire jc2;
  wire jc3;
  wire uart_rxd_in;
  wire uart_txd_out;

  ts_pt100 ts_pt100_i
       (.clk(clk),
        .jc0(jc0),
        .jc1(jc1),
        .jc2(jc2),
        .jc3(jc3),
        .uart_rxd_in(uart_rxd_in),
        .uart_txd_out(uart_txd_out));
endmodule
