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


// IP VLNV: xilinx.com:module_ref:AD1_driver_v:1.0
// IP Revision: 1

(* X_CORE_INFO = "AD1_driver_v,Vivado 2016.1" *)
(* CHECK_LICENSE_TYPE = "SDC_CLL_AD1_driver_v_3_0,AD1_driver_v,{}" *)
(* CORE_GENERATION_INFO = "SDC_CLL_AD1_driver_v_3_0,AD1_driver_v,{x_ipProduct=Vivado 2016.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=AD1_driver_v,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=VERILOG}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module SDC_CLL_AD1_driver_v_3_0 (
  clk,
  start,
  divClk,
  data0,
  data1,
  D0,
  D1,
  CS,
  SCLK
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
input wire start;
input wire divClk;
output wire [11 : 0] data0;
output wire [11 : 0] data1;
input wire D0;
input wire D1;
output wire CS;
output wire SCLK;

  AD1_driver_v inst (
    .clk(clk),
    .start(start),
    .divClk(divClk),
    .data0(data0),
    .data1(data1),
    .D0(D0),
    .D1(D1),
    .CS(CS),
    .SCLK(SCLK)
  );
endmodule
