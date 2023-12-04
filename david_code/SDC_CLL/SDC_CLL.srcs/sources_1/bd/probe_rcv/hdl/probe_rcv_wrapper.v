//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Wed Aug 22 18:36:46 2018
//Host        : DESKTOP-VFDGOU2 running 64-bit major release  (build 9200)
//Command     : generate_target probe_rcv_wrapper.bd
//Design      : probe_rcv_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module probe_rcv_wrapper
   (JB_0,
    clk,
    uart_rxd_in,
    uart_txd_out);
  output JB_0;
  input clk;
  input uart_rxd_in;
  output uart_txd_out;

  wire JB_0;
  wire clk;
  wire uart_rxd_in;
  wire uart_txd_out;

  probe_rcv probe_rcv_i
       (.JB_0(JB_0),
        .clk(clk),
        .uart_rxd_in(uart_rxd_in),
        .uart_txd_out(uart_txd_out));
endmodule
