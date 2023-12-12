//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
//Date        : Mon Oct 30 14:28:18 2023
//Host        : mzvic running 64-bit Ubuntu 22.04.3 LTS
//Command     : generate_target arch.bd
//Design      : arch
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "arch,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=arch,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=3,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "arch.hwdef" *) 
module arch
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

  wire D0_1;
  wire D1_1;
  wire Net;
  wire SDC_CLL_AD1_driver_v_0_2_0_CS;
  wire SDC_CLL_AD1_driver_v_0_2_0_SCLK;
  wire [11:0]SDC_CLL_AD1_driver_v_0_2_0_data0;
  wire SDC_CLL_clk_box_0_0_0_divClk1;
  wire clk_in1_1;
  wire clk_wiz_0_clk_out2;
  wire package_ext_0_send;
  wire package_ext_0_tx;
  wire rx_1;

  assign D0_1 = JD_1;
  assign D1_1 = JD_2;
  assign JD_0 = SDC_CLL_AD1_driver_v_0_2_0_CS;
  assign JD_3 = SDC_CLL_AD1_driver_v_0_2_0_SCLK;
  assign clk_in1_1 = clk;
  assign rx_1 = uart_rxd_in;
  assign uart_txd_out = package_ext_0_tx;
  arch_SDC_CLL_AD1_driver_v_0_2_0_0 SDC_CLL_AD1_driver_v_0_2_0
       (.CS(SDC_CLL_AD1_driver_v_0_2_0_CS),
        .D0(D0_1),
        .D1(D1_1),
        .SCLK(SDC_CLL_AD1_driver_v_0_2_0_SCLK),
        .clk(Net),
        .data0(SDC_CLL_AD1_driver_v_0_2_0_data0),
        .divClk(SDC_CLL_clk_box_0_0_0_divClk1),
        .start(package_ext_0_send));
  arch_SDC_CLL_clk_box_0_0_0_0 SDC_CLL_clk_box_0_0_0
       (.clk(Net),
        .divClk1(SDC_CLL_clk_box_0_0_0_divClk1));
  arch_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_1),
        .clk_out1(Net),
        .clk_out2(clk_wiz_0_clk_out2));
  arch_package_ext_0_0 package_ext_0
       (.clk(clk_wiz_0_clk_out2),
        .in_01(SDC_CLL_AD1_driver_v_0_2_0_data0),
        .in_02({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_03({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_04({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_05({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_06({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_07({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_08({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_09({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_10({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_11({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_12({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_13({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rx(rx_1),
        .send(package_ext_0_send),
        .tx(package_ext_0_tx));
endmodule
