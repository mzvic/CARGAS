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


// IP VLNV: xilinx.com:module_ref:fixedPoint:1.0
// IP Revision: 1

(* X_CORE_INFO = "fixedPoint,Vivado 2016.1" *)
(* CHECK_LICENSE_TYPE = "ts_pt100_fixedPoint_0_0,fixedPoint,{}" *)
(* CORE_GENERATION_INFO = "ts_pt100_fixedPoint_0_0,fixedPoint,{x_ipProduct=Vivado 2016.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fixedPoint,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,Q=15,N=28}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module ts_pt100_fixedPoint_0_0 (
  ent_1,
  ent_2,
  ent_3,
  ent_4,
  ent_5,
  ent_6,
  ent_7,
  ent_8,
  ent_9,
  sal_1,
  sal_2,
  sal_3,
  sal_4,
  sal_5,
  sal_6,
  sal_7,
  sal_8,
  sal_9
);

input wire [27 : 0] ent_1;
input wire [27 : 0] ent_2;
input wire [27 : 0] ent_3;
input wire [27 : 0] ent_4;
input wire [27 : 0] ent_5;
input wire [27 : 0] ent_6;
input wire [27 : 0] ent_7;
input wire [27 : 0] ent_8;
input wire [27 : 0] ent_9;
output wire [13 : 0] sal_1;
output wire [13 : 0] sal_2;
output wire [13 : 0] sal_3;
output wire [13 : 0] sal_4;
output wire [13 : 0] sal_5;
output wire [13 : 0] sal_6;
output wire [13 : 0] sal_7;
output wire [13 : 0] sal_8;
output wire [13 : 0] sal_9;

  fixedPoint #(
    .Q(15),
    .N(28)
  ) inst (
    .ent_1(ent_1),
    .ent_2(ent_2),
    .ent_3(ent_3),
    .ent_4(ent_4),
    .ent_5(ent_5),
    .ent_6(ent_6),
    .ent_7(ent_7),
    .ent_8(ent_8),
    .ent_9(ent_9),
    .sal_1(sal_1),
    .sal_2(sal_2),
    .sal_3(sal_3),
    .sal_4(sal_4),
    .sal_5(sal_5),
    .sal_6(sal_6),
    .sal_7(sal_7),
    .sal_8(sal_8),
    .sal_9(sal_9)
  );
endmodule
