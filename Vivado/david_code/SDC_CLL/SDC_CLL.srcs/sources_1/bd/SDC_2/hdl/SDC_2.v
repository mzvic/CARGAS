//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Sat Jul 29 02:11:01 2017
//Host        : DESKTOP-EQFRNM8 running 64-bit major release  (build 9200)
//Command     : generate_target SDC_2.bd
//Design      : SDC_2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SDC_2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SDC_2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "SDC_2.hwdef" *) 
module SDC_2
   (JA_0,
    JA_1,
    JA_2,
    JA_3,
    JB_1,
    clk);
  output JA_0;
  input JA_1;
  input JA_2;
  output JA_3;
  output JB_1;
  input clk;

  wire AD1_driver_v_0_CS;
  wire AD1_driver_v_0_SCLK;
  wire [11:0]AD1_driver_v_0_data0;
  wire D0_1;
  wire D1_1;
  wire clk_1;
  wire probe_sync_sin_0_out_1;

  assign D0_1 = JA_1;
  assign D1_1 = JA_2;
  assign JA_0 = AD1_driver_v_0_CS;
  assign JA_3 = AD1_driver_v_0_SCLK;
  assign JB_1 = probe_sync_sin_0_out_1;
  assign clk_1 = clk;
  SDC_2_AD1_driver_v_0_0 AD1_driver_v_0
       (.CS(AD1_driver_v_0_CS),
        .D0(D0_1),
        .D1(D1_1),
        .SCLK(AD1_driver_v_0_SCLK),
        .clk(clk_1),
        .data0(AD1_driver_v_0_data0));
  SDC_2_probe_sync_sin_0_0 probe_sync_sin_0
       (.clk(clk_1),
        .in_1(AD1_driver_v_0_data0),
        .out_1(probe_sync_sin_0_out_1));
endmodule
