//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Thu Jan 02 18:30:13 2020
//Host        : DESKTOP-SEOPNRV running 64-bit major release  (build 9200)
//Command     : generate_target prueba_trans_wrapper.bd
//Design      : prueba_trans_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module prueba_trans_wrapper
   (uart_rxd_in,
    uart_txd_out);
  input uart_rxd_in;
  output uart_txd_out;

  wire uart_rxd_in;
  wire uart_txd_out;

  prueba_trans prueba_trans_i
       (.uart_rxd_in(uart_rxd_in),
        .uart_txd_out(uart_txd_out));
endmodule
