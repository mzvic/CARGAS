// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module SDC_CLL_wrapper(JA_0, JA_1, JA_2, JA_3, JB_0, JB_1, JB_2, JB_3, JC_0, JC_1, JC_2, JD_1, JD_2, clk, led, led_ind);
  output JA_0;
  input JA_1;
  input JA_2;
  output JA_3;
  output JB_0;
  input JB_1;
  input JB_2;
  output JB_3;
  output JC_0;
  output JC_1;
  output JC_2;
  input JD_1;
  output JD_2;
  input clk;
  output [2:0]led;
  output led_ind;
endmodule
