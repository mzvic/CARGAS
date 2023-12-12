//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Sat Jul 29 02:11:01 2017
//Host        : DESKTOP-EQFRNM8 running 64-bit major release  (build 9200)
//Command     : generate_target SDC_2_wrapper.bd
//Design      : SDC_2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SDC_2_wrapper
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

  wire JA_0;
  wire JA_1;
  wire JA_2;
  wire JA_3;
  wire JB_1;
  wire clk;

  SDC_2 SDC_2_i
       (.JA_0(JA_0),
        .JA_1(JA_1),
        .JA_2(JA_2),
        .JA_3(JA_3),
        .JB_1(JB_1),
        .clk(clk));
endmodule
