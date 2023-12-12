//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
//Date        : Mon Oct 30 14:28:18 2023
//Host        : mzvic running 64-bit Ubuntu 22.04.3 LTS
//Command     : generate_target arch_wrapper.bd
//Design      : arch_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module arch_wrapper
   (JD_0,
    JD_1,
    JD_2,
    JD_3,
    clk,
    uart_rxd_in,
    uart_txd_out);
  output JD_0;
  input JD_1;
  input JD_2;
  output JD_3;
  input clk;
  input uart_rxd_in;
  output uart_txd_out;

  wire JD_0;
  wire JD_1;
  wire JD_2;
  wire JD_3;
  wire clk;
  wire uart_rxd_in;
  wire uart_txd_out;

  arch arch_i
       (.JD_0(JD_0),
        .JD_1(JD_1),
        .JD_2(JD_2),
        .JD_3(JD_3),
        .clk(clk),
        .uart_rxd_in(uart_rxd_in),
        .uart_txd_out(uart_txd_out));
endmodule
