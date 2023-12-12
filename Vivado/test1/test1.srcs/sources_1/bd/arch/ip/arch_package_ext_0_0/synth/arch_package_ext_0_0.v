// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
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


// IP VLNV: user.org:module_ref:package_ext:1.0
// IP Revision: 1

(* X_CORE_INFO = "package_ext,Vivado 2016.1" *)
(* CHECK_LICENSE_TYPE = "arch_package_ext_0_0,package_ext,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module arch_package_ext_0_0 (
  clk,
  rx,
  in_01,
  in_02,
  in_03,
  in_04,
  in_05,
  in_06,
  in_07,
  in_08,
  in_09,
  in_10,
  in_11,
  in_12,
  in_13,
  tx,
  out_01,
  out_02,
  out_03,
  out_04,
  out_05,
  out_06,
  out_07,
  out_08,
  out_09,
  out_10,
  out_11,
  out_12,
  out_13,
  out_14,
  out_15,
  out_16,
  out_17,
  out_18,
  out_19,
  out_20,
  send,
  data_ready
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
input wire rx;
input wire [13 : 0] in_01;
input wire [13 : 0] in_02;
input wire [13 : 0] in_03;
input wire [13 : 0] in_04;
input wire [13 : 0] in_05;
input wire [13 : 0] in_06;
input wire [13 : 0] in_07;
input wire [13 : 0] in_08;
input wire [13 : 0] in_09;
input wire [13 : 0] in_10;
input wire [13 : 0] in_11;
input wire [13 : 0] in_12;
input wire [13 : 0] in_13;
output wire tx;
output wire [20 : 0] out_01;
output wire [20 : 0] out_02;
output wire [20 : 0] out_03;
output wire [20 : 0] out_04;
output wire [20 : 0] out_05;
output wire [20 : 0] out_06;
output wire [20 : 0] out_07;
output wire [20 : 0] out_08;
output wire [20 : 0] out_09;
output wire [20 : 0] out_10;
output wire [20 : 0] out_11;
output wire [20 : 0] out_12;
output wire [20 : 0] out_13;
output wire [20 : 0] out_14;
output wire [20 : 0] out_15;
output wire [20 : 0] out_16;
output wire [20 : 0] out_17;
output wire [20 : 0] out_18;
output wire [20 : 0] out_19;
output wire [20 : 0] out_20;
output wire send;
output wire data_ready;

  package_ext #(
    .BAUD(3126),
    .SEND_RATE(133280)
  ) inst (
    .clk(clk),
    .rx(rx),
    .in_01(in_01),
    .in_02(in_02),
    .in_03(in_03),
    .in_04(in_04),
    .in_05(in_05),
    .in_06(in_06),
    .in_07(in_07),
    .in_08(in_08),
    .in_09(in_09),
    .in_10(in_10),
    .in_11(in_11),
    .in_12(in_12),
    .in_13(in_13),
    .tx(tx),
    .out_01(out_01),
    .out_02(out_02),
    .out_03(out_03),
    .out_04(out_04),
    .out_05(out_05),
    .out_06(out_06),
    .out_07(out_07),
    .out_08(out_08),
    .out_09(out_09),
    .out_10(out_10),
    .out_11(out_11),
    .out_12(out_12),
    .out_13(out_13),
    .out_14(out_14),
    .out_15(out_15),
    .out_16(out_16),
    .out_17(out_17),
    .out_18(out_18),
    .out_19(out_19),
    .out_20(out_20),
    .send(send),
    .data_ready(data_ready)
  );
endmodule
