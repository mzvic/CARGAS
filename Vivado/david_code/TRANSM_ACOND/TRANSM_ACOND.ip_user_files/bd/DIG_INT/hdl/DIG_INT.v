//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Tue May 29 15:40:54 2018
//Host        : DESKTOP-VFDGOU2 running 64-bit major release  (build 9200)
//Command     : generate_target DIG_INT.bd
//Design      : DIG_INT
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "DIG_INT,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=DIG_INT,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "DIG_INT.hwdef" *) 
module DIG_INT
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

  wire AD1_driver_v_0_CS;
  wire AD1_driver_v_0_SCLK;
  wire [11:0]AD1_driver_v_0_data0;
  wire D0_1;
  wire D1_1;
  wire clk_1_1;
  wire package_0_tx;
  wire rx_1;

  assign D0_1 = JA_1;
  assign D1_1 = JA_2;
  assign JA_0 = AD1_driver_v_0_CS;
  assign JA_3 = AD1_driver_v_0_SCLK;
  assign clk_1_1 = clk;
  assign rx_1 = uart_rxd_in;
  assign uart_txd_out = package_0_tx;
  DIG_INT_AD1_driver_v_0_0 AD1_driver_v_0
       (.CS(AD1_driver_v_0_CS),
        .D0(D0_1),
        .D1(D1_1),
        .SCLK(AD1_driver_v_0_SCLK),
        .clk(clk_1_1),
        .data0(AD1_driver_v_0_data0));
  DIG_INT_package_0_0 package_0
       (.CV({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PV1(AD1_driver_v_0_data0),
        .PV2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PV3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clk(clk_1_1),
        .clk_2(clk_1_1),
        .rx(rx_1),
        .tx(package_0_tx));
endmodule
