// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:pre_process:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module SDC_CLL_pre_process_0_0 (
  clk,
  SP1,
  SP2,
  SP3,
  param1_1,
  param2_1,
  param3_1,
  param1_2,
  param2_2,
  param3_2,
  param1_3,
  param2_3,
  param3_3,
  modo,
  sensor,
  stop,
  config_mode,
  yT1_1,
  yT2_1,
  yT3_1,
  yT1_2,
  yT2_2,
  yT3_2,
  yT1_3,
  yT2_3,
  yT3_3,
  modo_1,
  SP_1,
  kc_1,
  Ti_1,
  Td_1,
  yT_1,
  modo_2,
  SP_2,
  kc_2,
  Ti_2,
  Td_2,
  yT_2,
  modo_3,
  SP_3,
  kc_3,
  Ti_3,
  Td_3,
  yT_3,
  ind_config
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
input wire [20 : 0] SP1;
input wire [20 : 0] SP2;
input wire [13 : 0] SP3;
input wire [20 : 0] param1_1;
input wire [20 : 0] param2_1;
input wire [20 : 0] param3_1;
input wire [20 : 0] param1_2;
input wire [20 : 0] param2_2;
input wire [20 : 0] param3_2;
input wire [20 : 0] param1_3;
input wire [20 : 0] param2_3;
input wire [20 : 0] param3_3;
input wire [20 : 0] modo;
input wire [20 : 0] sensor;
input wire stop;
input wire [20 : 0] config_mode;
input wire [27 : 0] yT1_1;
input wire [27 : 0] yT2_1;
input wire [27 : 0] yT3_1;
input wire [27 : 0] yT1_2;
input wire [27 : 0] yT2_2;
input wire [27 : 0] yT3_2;
input wire [27 : 0] yT1_3;
input wire [27 : 0] yT2_3;
input wire [27 : 0] yT3_3;
output wire [2 : 0] modo_1;
output wire [27 : 0] SP_1;
output wire [27 : 0] kc_1;
output wire [27 : 0] Ti_1;
output wire [27 : 0] Td_1;
output wire [27 : 0] yT_1;
output wire [2 : 0] modo_2;
output wire [27 : 0] SP_2;
output wire [27 : 0] kc_2;
output wire [27 : 0] Ti_2;
output wire [27 : 0] Td_2;
output wire [27 : 0] yT_2;
output wire [2 : 0] modo_3;
output wire [27 : 0] SP_3;
output wire [27 : 0] kc_3;
output wire [27 : 0] Ti_3;
output wire [27 : 0] Td_3;
output wire [27 : 0] yT_3;
output wire [2 : 0] ind_config;

  pre_process #(
    .Q(15),
    .N(28)
  ) inst (
    .clk(clk),
    .SP1(SP1),
    .SP2(SP2),
    .SP3(SP3),
    .param1_1(param1_1),
    .param2_1(param2_1),
    .param3_1(param3_1),
    .param1_2(param1_2),
    .param2_2(param2_2),
    .param3_2(param3_2),
    .param1_3(param1_3),
    .param2_3(param2_3),
    .param3_3(param3_3),
    .modo(modo),
    .sensor(sensor),
    .stop(stop),
    .config_mode(config_mode),
    .yT1_1(yT1_1),
    .yT2_1(yT2_1),
    .yT3_1(yT3_1),
    .yT1_2(yT1_2),
    .yT2_2(yT2_2),
    .yT3_2(yT3_2),
    .yT1_3(yT1_3),
    .yT2_3(yT2_3),
    .yT3_3(yT3_3),
    .modo_1(modo_1),
    .SP_1(SP_1),
    .kc_1(kc_1),
    .Ti_1(Ti_1),
    .Td_1(Td_1),
    .yT_1(yT_1),
    .modo_2(modo_2),
    .SP_2(SP_2),
    .kc_2(kc_2),
    .Ti_2(Ti_2),
    .Td_2(Td_2),
    .yT_2(yT_2),
    .modo_3(modo_3),
    .SP_3(SP_3),
    .kc_3(kc_3),
    .Ti_3(Ti_3),
    .Td_3(Td_3),
    .yT_3(yT_3),
    .ind_config(ind_config)
  );
endmodule
