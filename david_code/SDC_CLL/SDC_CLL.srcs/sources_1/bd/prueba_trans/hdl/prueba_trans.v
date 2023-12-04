//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Thu Jan 02 18:30:13 2020
//Host        : DESKTOP-SEOPNRV running 64-bit major release  (build 9200)
//Command     : generate_target prueba_trans.bd
//Design      : prueba_trans
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "prueba_trans,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=prueba_trans,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=0,numReposBlks=0,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "prueba_trans.hwdef" *) 
module prueba_trans
   (uart_rxd_in,
    uart_txd_out);
  input uart_rxd_in;
  output uart_txd_out;

  wire uart_rxd_in_1;

  assign uart_rxd_in_1 = uart_rxd_in;
  assign uart_txd_out = uart_rxd_in_1;
endmodule
