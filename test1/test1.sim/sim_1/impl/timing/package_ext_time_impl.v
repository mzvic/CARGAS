// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
// Date        : Tue Oct 24 13:12:20 2023
// Host        : mzvic running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/mzvic/voltage_receptor_fpga/test1/test1.sim/sim_1/impl/timing/package_ext_time_impl.v
// Design      : arch_wrapper
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module AD1_driver_v
   (data0,
    data1,
    CS,
    \state_reg[0] ,
    start,
    clk,
    D0,
    D1,
    divClk);
  output [11:0]data0;
  output [11:0]data1;
  output CS;
  output \state_reg[0] ;
  input start;
  input clk;
  input D0;
  input D1;
  input divClk;

  wire CS;
  wire clk;
  wire divClk;
  wire start;
  wire \state_reg[0] ;
  wire NLW_AD1_D0_UNCONNECTED;
  wire NLW_AD1_D1_UNCONNECTED;
  wire [11:0]NLW_AD1_data0_UNCONNECTED;
  wire [11:0]NLW_AD1_data1_UNCONNECTED;

  AD_driver AD1
       (.CS(CS),
        .D0(NLW_AD1_D0_UNCONNECTED),
        .D1(NLW_AD1_D1_UNCONNECTED),
        .clk(clk),
        .data0(NLW_AD1_data0_UNCONNECTED[11:0]),
        .data1(NLW_AD1_data1_UNCONNECTED[11:0]),
        .divClk(divClk),
        .start(start),
        .\state_reg[0]_0 (\state_reg[0] ));
endmodule

module AD_driver
   (data0,
    data1,
    CS,
    \state_reg[0]_0 ,
    start,
    clk,
    D0,
    D1,
    divClk);
  output [11:0]data0;
  output [11:0]data1;
  output CS;
  output \state_reg[0]_0 ;
  input start;
  input clk;
  input D0;
  input D1;
  input divClk;

  wire CS;
  wire CS3_out;
  wire CS_i_2_n_0;
  wire CS_i_3_n_0;
  wire SCLK_i_1_n_0;
  wire clk;
  wire divClk;
  wire start;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[2]_i_1_n_0 ;
  wire \state[3]_i_1_n_0 ;
  wire \state[4]_i_1_n_0 ;
  wire \state[4]_i_2_n_0 ;
  wire \state_reg[0]_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire \state_reg_n_0_[3] ;
  wire \state_reg_n_0_[4] ;

  LUT6 #(
    .INIT(64'h5555001000000000)) 
    CS_i_1
       (.I0(\state_reg[0]_0 ),
        .I1(\state_reg_n_0_[3] ),
        .I2(CS_i_3_n_0),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[4] ),
        .I5(divClk),
        .O(CS3_out));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    CS_i_2
       (.I0(\state_reg_n_0_[3] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[4] ),
        .O(CS_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    CS_i_3
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .O(CS_i_3_n_0));
  FDSE #(
    .INIT(1'b1)) 
    CS_reg
       (.C(clk),
        .CE(CS3_out),
        .D(CS_i_2_n_0),
        .Q(CS),
        .S(start));
  LUT3 #(
    .INIT(8'hF6)) 
    SCLK_i_1
       (.I0(\state_reg[0]_0 ),
        .I1(divClk),
        .I2(start),
        .O(SCLK_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    SCLK_reg
       (.C(clk),
        .CE(1'b1),
        .D(SCLK_i_1_n_0),
        .Q(\state_reg[0]_0 ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \state[0]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[4] ),
        .O(\state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \state[1]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[4] ),
        .O(\state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \state[2]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[4] ),
        .O(\state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \state[3]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[3] ),
        .I4(\state_reg_n_0_[4] ),
        .O(\state[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \state[4]_i_1 
       (.I0(\state_reg[0]_0 ),
        .I1(\state_reg_n_0_[4] ),
        .I2(divClk),
        .O(\state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \state[4]_i_2 
       (.I0(\state_reg_n_0_[3] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[4] ),
        .O(\state[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clk),
        .CE(\state[4]_i_1_n_0 ),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg_n_0_[0] ),
        .R(start));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clk),
        .CE(\state[4]_i_1_n_0 ),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg_n_0_[1] ),
        .R(start));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(clk),
        .CE(\state[4]_i_1_n_0 ),
        .D(\state[2]_i_1_n_0 ),
        .Q(\state_reg_n_0_[2] ),
        .R(start));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[3] 
       (.C(clk),
        .CE(\state[4]_i_1_n_0 ),
        .D(\state[3]_i_1_n_0 ),
        .Q(\state_reg_n_0_[3] ),
        .R(start));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[4] 
       (.C(clk),
        .CE(\state[4]_i_1_n_0 ),
        .D(\state[4]_i_2_n_0 ),
        .Q(\state_reg_n_0_[4] ),
        .R(start));
endmodule

module SDC_CLL_AD1_driver_v_0_2
   (data0,
    data1,
    CS,
    \state_reg[0] ,
    start,
    clk,
    D0,
    D1,
    divClk);
  output [11:0]data0;
  output [11:0]data1;
  output CS;
  output \state_reg[0] ;
  input start;
  input clk;
  input D0;
  input D1;
  input divClk;

  wire CS;
  wire clk;
  wire divClk;
  wire start;
  wire \state_reg[0] ;
  wire NLW_inst_D0_UNCONNECTED;
  wire NLW_inst_D1_UNCONNECTED;
  wire [11:0]NLW_inst_data0_UNCONNECTED;
  wire [11:0]NLW_inst_data1_UNCONNECTED;

  AD1_driver_v inst
       (.CS(CS),
        .D0(NLW_inst_D0_UNCONNECTED),
        .D1(NLW_inst_D1_UNCONNECTED),
        .clk(clk),
        .data0(NLW_inst_data0_UNCONNECTED[11:0]),
        .data1(NLW_inst_data1_UNCONNECTED[11:0]),
        .divClk(divClk),
        .start(start),
        .\state_reg[0] (\state_reg[0] ));
endmodule

module SDC_CLL_clk_box_0_0
   (divClk3,
    divClk2,
    clk);
  output divClk3;
  output divClk2;
  input clk;

  wire clk;
  wire divClk3;
  wire NLW_inst_divClk2_UNCONNECTED;

  clk_box inst
       (.clk(clk),
        .divClk2(NLW_inst_divClk2_UNCONNECTED),
        .divClk3(divClk3));
endmodule

(* HW_HANDOFF = "arch.hwdef" *) 
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

  wire JD_0;
  wire JD_3;
  wire Net;
  wire SDC_CLL_clk_box_0_0_0_divClk1;
  wire clk;
  wire clk_wiz_0_clk_out2;
  wire package_ext_0_send;
  wire uart_txd_out;
  wire [13:0]xlconstant_0_dout;
  wire NLW_SDC_CLL_AD1_driver_v_0_2_0_D0_UNCONNECTED;
  wire NLW_SDC_CLL_AD1_driver_v_0_2_0_D1_UNCONNECTED;
  wire [11:0]NLW_SDC_CLL_AD1_driver_v_0_2_0_data0_UNCONNECTED;
  wire [11:0]NLW_SDC_CLL_AD1_driver_v_0_2_0_data1_UNCONNECTED;
  wire NLW_SDC_CLL_clk_box_0_0_0_divClk2_UNCONNECTED;
  wire NLW_SDC_CLL_clk_box_0_0_0_divClk3_UNCONNECTED;
  wire NLW_package_ext_0_data_ready_UNCONNECTED;
  wire NLW_package_ext_0_rx_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_01_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_02_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_03_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_04_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_05_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_06_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_07_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_08_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_09_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_10_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_11_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_12_UNCONNECTED;
  wire [13:0]NLW_package_ext_0_in_13_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_01_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_02_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_03_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_04_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_05_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_06_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_07_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_08_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_09_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_10_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_11_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_12_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_13_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_14_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_15_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_16_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_17_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_18_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_19_UNCONNECTED;
  wire [20:0]NLW_package_ext_0_out_20_UNCONNECTED;
  wire [13:0]NLW_xlconstant_0_dout_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "arch_SDC_CLL_AD1_driver_v_0_2_0_0,SDC_CLL_AD1_driver_v_0_2,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "SDC_CLL_AD1_driver_v_0_2,Vivado 2016.1" *) 
  arch_SDC_CLL_AD1_driver_v_0_2_0_0 SDC_CLL_AD1_driver_v_0_2_0
       (.CS(JD_0),
        .D0(NLW_SDC_CLL_AD1_driver_v_0_2_0_D0_UNCONNECTED),
        .D1(NLW_SDC_CLL_AD1_driver_v_0_2_0_D1_UNCONNECTED),
        .SCLK(JD_3),
        .clk(Net),
        .data0(NLW_SDC_CLL_AD1_driver_v_0_2_0_data0_UNCONNECTED[11:0]),
        .data1(NLW_SDC_CLL_AD1_driver_v_0_2_0_data1_UNCONNECTED[11:0]),
        .divClk(SDC_CLL_clk_box_0_0_0_divClk1),
        .start(package_ext_0_send));
  (* CHECK_LICENSE_TYPE = "arch_SDC_CLL_clk_box_0_0_0_0,SDC_CLL_clk_box_0_0,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "SDC_CLL_clk_box_0_0,Vivado 2016.1" *) 
  arch_SDC_CLL_clk_box_0_0_0_0 SDC_CLL_clk_box_0_0_0
       (.clk(Net),
        .divClk1(SDC_CLL_clk_box_0_0_0_divClk1),
        .divClk2(NLW_SDC_CLL_clk_box_0_0_0_divClk2_UNCONNECTED),
        .divClk3(NLW_SDC_CLL_clk_box_0_0_0_divClk3_UNCONNECTED));
  arch_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk),
        .clk_out1(Net),
        .clk_out2(clk_wiz_0_clk_out2));
  (* CHECK_LICENSE_TYPE = "arch_package_ext_0_0,package_ext,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "package_ext,Vivado 2016.1" *) 
  arch_package_ext_0_0 package_ext_0
       (.clk(clk_wiz_0_clk_out2),
        .data_ready(NLW_package_ext_0_data_ready_UNCONNECTED),
        .in_01({NLW_package_ext_0_in_01_UNCONNECTED[13:9],xlconstant_0_dout[8:4],NLW_package_ext_0_in_01_UNCONNECTED[3],xlconstant_0_dout[2],NLW_package_ext_0_in_01_UNCONNECTED[1:0]}),
        .in_02(NLW_package_ext_0_in_02_UNCONNECTED[13:0]),
        .in_03(NLW_package_ext_0_in_03_UNCONNECTED[13:0]),
        .in_04(NLW_package_ext_0_in_04_UNCONNECTED[13:0]),
        .in_05(NLW_package_ext_0_in_05_UNCONNECTED[13:0]),
        .in_06(NLW_package_ext_0_in_06_UNCONNECTED[13:0]),
        .in_07(NLW_package_ext_0_in_07_UNCONNECTED[13:0]),
        .in_08(NLW_package_ext_0_in_08_UNCONNECTED[13:0]),
        .in_09(NLW_package_ext_0_in_09_UNCONNECTED[13:0]),
        .in_10(NLW_package_ext_0_in_10_UNCONNECTED[13:0]),
        .in_11(NLW_package_ext_0_in_11_UNCONNECTED[13:0]),
        .in_12(NLW_package_ext_0_in_12_UNCONNECTED[13:0]),
        .in_13(NLW_package_ext_0_in_13_UNCONNECTED[13:0]),
        .out_01(NLW_package_ext_0_out_01_UNCONNECTED[20:0]),
        .out_02(NLW_package_ext_0_out_02_UNCONNECTED[20:0]),
        .out_03(NLW_package_ext_0_out_03_UNCONNECTED[20:0]),
        .out_04(NLW_package_ext_0_out_04_UNCONNECTED[20:0]),
        .out_05(NLW_package_ext_0_out_05_UNCONNECTED[20:0]),
        .out_06(NLW_package_ext_0_out_06_UNCONNECTED[20:0]),
        .out_07(NLW_package_ext_0_out_07_UNCONNECTED[20:0]),
        .out_08(NLW_package_ext_0_out_08_UNCONNECTED[20:0]),
        .out_09(NLW_package_ext_0_out_09_UNCONNECTED[20:0]),
        .out_10(NLW_package_ext_0_out_10_UNCONNECTED[20:0]),
        .out_11(NLW_package_ext_0_out_11_UNCONNECTED[20:0]),
        .out_12(NLW_package_ext_0_out_12_UNCONNECTED[20:0]),
        .out_13(NLW_package_ext_0_out_13_UNCONNECTED[20:0]),
        .out_14(NLW_package_ext_0_out_14_UNCONNECTED[20:0]),
        .out_15(NLW_package_ext_0_out_15_UNCONNECTED[20:0]),
        .out_16(NLW_package_ext_0_out_16_UNCONNECTED[20:0]),
        .out_17(NLW_package_ext_0_out_17_UNCONNECTED[20:0]),
        .out_18(NLW_package_ext_0_out_18_UNCONNECTED[20:0]),
        .out_19(NLW_package_ext_0_out_19_UNCONNECTED[20:0]),
        .out_20(NLW_package_ext_0_out_20_UNCONNECTED[20:0]),
        .rx(NLW_package_ext_0_rx_UNCONNECTED),
        .send(package_ext_0_send),
        .tx(uart_txd_out));
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  arch_xlconstant_0_0 xlconstant_0
       (.dout({NLW_xlconstant_0_dout_UNCONNECTED[13:9],xlconstant_0_dout[8:4],NLW_xlconstant_0_dout_UNCONNECTED[3],xlconstant_0_dout[2],NLW_xlconstant_0_dout_UNCONNECTED[1:0]}));
endmodule

(* CHECK_LICENSE_TYPE = "arch_SDC_CLL_AD1_driver_v_0_2_0_0,SDC_CLL_AD1_driver_v_0_2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "SDC_CLL_AD1_driver_v_0_2,Vivado 2016.1" *) 
module arch_SDC_CLL_AD1_driver_v_0_2_0_0
   (clk,
    start,
    divClk,
    data0,
    data1,
    D0,
    D1,
    CS,
    SCLK);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) input clk;
  input start;
  input divClk;
  output [11:0]data0;
  output [11:0]data1;
  input D0;
  input D1;
  output CS;
  output SCLK;

  wire CS;
  wire SCLK;
  wire clk;
  wire divClk;
  wire start;
  wire NLW_inst_D0_UNCONNECTED;
  wire NLW_inst_D1_UNCONNECTED;
  wire [11:0]NLW_inst_data0_UNCONNECTED;
  wire [11:0]NLW_inst_data1_UNCONNECTED;

  (* X_CORE_INFO = "AD1_driver_v,Vivado 2016.1" *) 
  SDC_CLL_AD1_driver_v_0_2 inst
       (.CS(CS),
        .D0(NLW_inst_D0_UNCONNECTED),
        .D1(NLW_inst_D1_UNCONNECTED),
        .clk(clk),
        .data0(NLW_inst_data0_UNCONNECTED[11:0]),
        .data1(NLW_inst_data1_UNCONNECTED[11:0]),
        .divClk(divClk),
        .start(start),
        .\state_reg[0] (SCLK));
endmodule

(* CHECK_LICENSE_TYPE = "arch_SDC_CLL_clk_box_0_0_0_0,SDC_CLL_clk_box_0_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "SDC_CLL_clk_box_0_0,Vivado 2016.1" *) 
module arch_SDC_CLL_clk_box_0_0_0_0
   (clk,
    divClk1,
    divClk2,
    divClk3);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) input clk;
  output divClk1;
  output divClk2;
  output divClk3;

  wire clk;
  wire \^divClk3 ;
  wire NLW_inst_divClk2_UNCONNECTED;

  assign divClk1 = \^divClk3 ;
  (* X_CORE_INFO = "clk_box,Vivado 2016.1" *) 
  SDC_CLL_clk_box_0_0 inst
       (.clk(clk),
        .divClk2(NLW_inst_divClk2_UNCONNECTED),
        .divClk3(\^divClk3 ));
endmodule

module arch_clk_wiz_0_0
   (clk_in1,
    clk_out1,
    clk_out2);
  input clk_in1;
  output clk_out1;
  output clk_out2;

  wire clk_in1;
  wire clk_out1;
  wire clk_out2;

  arch_clk_wiz_0_0_clk_wiz inst
       (.clk_in1(clk_in1),
        .clk_out1(clk_out1),
        .clk_out2(clk_out2));
endmodule

module arch_clk_wiz_0_0_clk_wiz
   (clk_in1,
    clk_out1,
    clk_out2);
  input clk_in1;
  output clk_out1;
  output clk_out2;

  wire clk_in1;
  wire clk_in1_arch_clk_wiz_0_0;
  wire clk_out1;
  wire clk_out1_arch_clk_wiz_0_0;
  wire clk_out2;
  wire clk_out2_arch_clk_wiz_0_0;
  wire clkfbout_arch_clk_wiz_0_0;
  wire clkfbout_buf_arch_clk_wiz_0_0;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_LOCKED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_arch_clk_wiz_0_0),
        .O(clkfbout_buf_arch_clk_wiz_0_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF #(
    .IOSTANDARD("DEFAULT")) 
    clkin1_ibufg
       (.I(clk_in1),
        .O(clk_in1_arch_clk_wiz_0_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkout1_buf
       (.I(clk_out1_arch_clk_wiz_0_0),
        .O(clk_out1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkout2_buf
       (.I(clk_out2_arch_clk_wiz_0_0),
        .O(clk_out2));
  (* BOX_TYPE = "PRIMITIVE" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(51.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(10.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(17.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(17),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(5),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    mmcm_adv_inst
       (.CLKFBIN(clkfbout_buf_arch_clk_wiz_0_0),
        .CLKFBOUT(clkfbout_arch_clk_wiz_0_0),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_in1_arch_clk_wiz_0_0),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_out1_arch_clk_wiz_0_0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(clk_out2_arch_clk_wiz_0_0),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(NLW_mmcm_adv_inst_LOCKED_UNCONNECTED),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "arch_package_ext_0_0,package_ext,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "package_ext,Vivado 2016.1" *) 
module arch_package_ext_0_0
   (clk,
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
    data_ready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) input clk;
  input rx;
  input [13:0]in_01;
  input [13:0]in_02;
  input [13:0]in_03;
  input [13:0]in_04;
  input [13:0]in_05;
  input [13:0]in_06;
  input [13:0]in_07;
  input [13:0]in_08;
  input [13:0]in_09;
  input [13:0]in_10;
  input [13:0]in_11;
  input [13:0]in_12;
  input [13:0]in_13;
  output tx;
  output [20:0]out_01;
  output [20:0]out_02;
  output [20:0]out_03;
  output [20:0]out_04;
  output [20:0]out_05;
  output [20:0]out_06;
  output [20:0]out_07;
  output [20:0]out_08;
  output [20:0]out_09;
  output [20:0]out_10;
  output [20:0]out_11;
  output [20:0]out_12;
  output [20:0]out_13;
  output [20:0]out_14;
  output [20:0]out_15;
  output [20:0]out_16;
  output [20:0]out_17;
  output [20:0]out_18;
  output [20:0]out_19;
  output [20:0]out_20;
  output send;
  output data_ready;

  wire clk;
  wire [13:0]in_01;
  wire send;
  wire tx;
  wire NLW_inst_data_ready_UNCONNECTED;
  wire NLW_inst_rx_UNCONNECTED;
  wire [13:0]NLW_inst_in_01_UNCONNECTED;
  wire [13:0]NLW_inst_in_02_UNCONNECTED;
  wire [13:0]NLW_inst_in_03_UNCONNECTED;
  wire [13:0]NLW_inst_in_04_UNCONNECTED;
  wire [13:0]NLW_inst_in_05_UNCONNECTED;
  wire [13:0]NLW_inst_in_06_UNCONNECTED;
  wire [13:0]NLW_inst_in_07_UNCONNECTED;
  wire [13:0]NLW_inst_in_08_UNCONNECTED;
  wire [13:0]NLW_inst_in_09_UNCONNECTED;
  wire [13:0]NLW_inst_in_10_UNCONNECTED;
  wire [13:0]NLW_inst_in_11_UNCONNECTED;
  wire [13:0]NLW_inst_in_12_UNCONNECTED;
  wire [13:0]NLW_inst_in_13_UNCONNECTED;
  wire [20:0]NLW_inst_out_01_UNCONNECTED;
  wire [20:0]NLW_inst_out_02_UNCONNECTED;
  wire [20:0]NLW_inst_out_03_UNCONNECTED;
  wire [20:0]NLW_inst_out_04_UNCONNECTED;
  wire [20:0]NLW_inst_out_05_UNCONNECTED;
  wire [20:0]NLW_inst_out_06_UNCONNECTED;
  wire [20:0]NLW_inst_out_07_UNCONNECTED;
  wire [20:0]NLW_inst_out_08_UNCONNECTED;
  wire [20:0]NLW_inst_out_09_UNCONNECTED;
  wire [20:0]NLW_inst_out_10_UNCONNECTED;
  wire [20:0]NLW_inst_out_11_UNCONNECTED;
  wire [20:0]NLW_inst_out_12_UNCONNECTED;
  wire [20:0]NLW_inst_out_13_UNCONNECTED;
  wire [20:0]NLW_inst_out_14_UNCONNECTED;
  wire [20:0]NLW_inst_out_15_UNCONNECTED;
  wire [20:0]NLW_inst_out_16_UNCONNECTED;
  wire [20:0]NLW_inst_out_17_UNCONNECTED;
  wire [20:0]NLW_inst_out_18_UNCONNECTED;
  wire [20:0]NLW_inst_out_19_UNCONNECTED;
  wire [20:0]NLW_inst_out_20_UNCONNECTED;

  package_ext inst
       (.E(send),
        .clk(clk),
        .data_ready(NLW_inst_data_ready_UNCONNECTED),
        .in_01({NLW_inst_in_01_UNCONNECTED[13:9],in_01[8:4],NLW_inst_in_01_UNCONNECTED[3],in_01[2],NLW_inst_in_01_UNCONNECTED[1:0]}),
        .in_02(NLW_inst_in_02_UNCONNECTED[13:0]),
        .in_03(NLW_inst_in_03_UNCONNECTED[13:0]),
        .in_04(NLW_inst_in_04_UNCONNECTED[13:0]),
        .in_05(NLW_inst_in_05_UNCONNECTED[13:0]),
        .in_06(NLW_inst_in_06_UNCONNECTED[13:0]),
        .in_07(NLW_inst_in_07_UNCONNECTED[13:0]),
        .in_08(NLW_inst_in_08_UNCONNECTED[13:0]),
        .in_09(NLW_inst_in_09_UNCONNECTED[13:0]),
        .in_10(NLW_inst_in_10_UNCONNECTED[13:0]),
        .in_11(NLW_inst_in_11_UNCONNECTED[13:0]),
        .in_12(NLW_inst_in_12_UNCONNECTED[13:0]),
        .in_13(NLW_inst_in_13_UNCONNECTED[13:0]),
        .out_01(NLW_inst_out_01_UNCONNECTED[20:0]),
        .out_02(NLW_inst_out_02_UNCONNECTED[20:0]),
        .out_03(NLW_inst_out_03_UNCONNECTED[20:0]),
        .out_04(NLW_inst_out_04_UNCONNECTED[20:0]),
        .out_05(NLW_inst_out_05_UNCONNECTED[20:0]),
        .out_06(NLW_inst_out_06_UNCONNECTED[20:0]),
        .out_07(NLW_inst_out_07_UNCONNECTED[20:0]),
        .out_08(NLW_inst_out_08_UNCONNECTED[20:0]),
        .out_09(NLW_inst_out_09_UNCONNECTED[20:0]),
        .out_10(NLW_inst_out_10_UNCONNECTED[20:0]),
        .out_11(NLW_inst_out_11_UNCONNECTED[20:0]),
        .out_12(NLW_inst_out_12_UNCONNECTED[20:0]),
        .out_13(NLW_inst_out_13_UNCONNECTED[20:0]),
        .out_14(NLW_inst_out_14_UNCONNECTED[20:0]),
        .out_15(NLW_inst_out_15_UNCONNECTED[20:0]),
        .out_16(NLW_inst_out_16_UNCONNECTED[20:0]),
        .out_17(NLW_inst_out_17_UNCONNECTED[20:0]),
        .out_18(NLW_inst_out_18_UNCONNECTED[20:0]),
        .out_19(NLW_inst_out_19_UNCONNECTED[20:0]),
        .out_20(NLW_inst_out_20_UNCONNECTED[20:0]),
        .rx(NLW_inst_rx_UNCONNECTED),
        .tx(tx));
endmodule

(* ECO_CHECKSUM = "1980b411" *) 
(* NotValidForBitStream *)
module arch_wrapper
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

  wire JD_0;
  wire JD_0_OBUF;
  wire JD_3;
  wire JD_3_OBUF;
  (* IBUF_LOW_PWR *) wire clk;
  wire uart_txd_out;
  wire uart_txd_out_OBUF;
  wire NLW_arch_i_JD_1_UNCONNECTED;
  wire NLW_arch_i_JD_2_UNCONNECTED;
  wire NLW_arch_i_uart_rxd_in_UNCONNECTED;

initial begin
 $sdf_annotate("package_ext_time_impl.sdf",,,,"tool_control");
end
  OBUF JD_0_OBUF_inst
       (.I(JD_0_OBUF),
        .O(JD_0));
  OBUF JD_3_OBUF_inst
       (.I(JD_3_OBUF),
        .O(JD_3));
  (* HW_HANDOFF = "arch.hwdef" *) 
  arch arch_i
       (.JD_0(JD_0_OBUF),
        .JD_1(NLW_arch_i_JD_1_UNCONNECTED),
        .JD_2(NLW_arch_i_JD_2_UNCONNECTED),
        .JD_3(JD_3_OBUF),
        .clk(clk),
        .uart_rxd_in(NLW_arch_i_uart_rxd_in_UNCONNECTED),
        .uart_txd_out(uart_txd_out_OBUF));
  OBUF uart_txd_out_OBUF_inst
       (.I(uart_txd_out_OBUF),
        .O(uart_txd_out));
endmodule

(* DowngradeIPIdentifiedWarnings = "yes" *) 
module arch_xlconstant_0_0
   (dout);
  output [13:0]dout;

  wire \<const1> ;

  assign dout[8] = \<const1> ;
  assign dout[7] = \<const1> ;
  assign dout[6] = \<const1> ;
  assign dout[5] = \<const1> ;
  assign dout[4] = \<const1> ;
  assign dout[2] = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
endmodule

module clk_box
   (divClk3,
    divClk2,
    clk);
  output divClk3;
  output divClk2;
  input clk;

  wire clk;
  wire divClk3;

  divisor_f clk_divClk1
       (.clk(clk),
        .divClk3(divClk3));
endmodule

module divisor_f
   (divClk3,
    clk);
  output divClk3;
  input clk;

  wire clk;
  wire [2:0]cont;
  wire \cont[0]_i_1__0_n_0 ;
  wire divClk3;
  wire [2:1]p_0_in;

  LUT3 #(
    .INIT(8'h01)) 
    clk_out
       (.I0(cont[2]),
        .I1(cont[0]),
        .I2(cont[1]),
        .O(divClk3));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cont[0]_i_1__0 
       (.I0(cont[0]),
        .O(\cont[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h26)) 
    \cont[1]_i_1 
       (.I0(cont[1]),
        .I1(cont[0]),
        .I2(cont[2]),
        .O(p_0_in[1]));
  LUT3 #(
    .INIT(8'h38)) 
    \cont[2]_i_1 
       (.I0(cont[1]),
        .I1(cont[0]),
        .I2(cont[2]),
        .O(p_0_in[2]));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont[0]_i_1__0_n_0 ),
        .Q(cont[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(cont[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(cont[2]),
        .R(1'b0));
endmodule

module pack_ext
   (data_ready,
    E,
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
    in_13);
  output data_ready;
  output [0:0]E;
  output tx;
  output [20:0]out_01;
  output [20:0]out_02;
  output [20:0]out_03;
  output [20:0]out_04;
  output [20:0]out_05;
  output [20:0]out_06;
  output [20:0]out_07;
  output [20:0]out_08;
  output [20:0]out_09;
  output [20:0]out_10;
  output [20:0]out_11;
  output [20:0]out_12;
  output [20:0]out_13;
  output [20:0]out_14;
  output [20:0]out_15;
  output [20:0]out_16;
  output [20:0]out_17;
  output [20:0]out_18;
  output [20:0]out_19;
  output [20:0]out_20;
  input clk;
  input rx;
  input [13:0]in_01;
  input [13:0]in_02;
  input [13:0]in_03;
  input [13:0]in_04;
  input [13:0]in_05;
  input [13:0]in_06;
  input [13:0]in_07;
  input [13:0]in_08;
  input [13:0]in_09;
  input [13:0]in_10;
  input [13:0]in_11;
  input [13:0]in_12;
  input [13:0]in_13;

  wire [0:0]E;
  wire \FSM_sequential_state_send[0]_i_1_n_0 ;
  wire \FSM_sequential_state_send[1]_i_1_n_0 ;
  wire \FSM_sequential_state_send[2]_i_1_n_0 ;
  wire \FSM_sequential_state_send[3]_i_1_n_0 ;
  wire \FSM_sequential_state_send[4]_i_1_n_0 ;
  wire \FSM_sequential_state_send[5]_i_1_n_0 ;
  wire TX0_n_0;
  wire TX0_n_2;
  wire capt_data;
  wire clk;
  wire [7:0]data_out;
  wire \data_out[0]_i_12_n_0 ;
  wire \data_out[0]_i_13_n_0 ;
  wire \data_out[0]_i_14_n_0 ;
  wire \data_out[0]_i_15_n_0 ;
  wire \data_out[0]_i_16_n_0 ;
  wire \data_out[0]_i_17_n_0 ;
  wire \data_out[0]_i_18_n_0 ;
  wire \data_out[0]_i_19_n_0 ;
  wire \data_out[0]_i_1_n_0 ;
  wire \data_out[0]_i_20_n_0 ;
  wire \data_out[0]_i_21_n_0 ;
  wire \data_out[0]_i_22_n_0 ;
  wire \data_out[0]_i_23_n_0 ;
  wire \data_out[0]_i_2_n_0 ;
  wire \data_out[1]_i_13_n_0 ;
  wire \data_out[1]_i_15_n_0 ;
  wire \data_out[1]_i_17_n_0 ;
  wire \data_out[1]_i_19_n_0 ;
  wire \data_out[1]_i_1_n_0 ;
  wire \data_out[1]_i_20_n_0 ;
  wire \data_out[1]_i_21_n_0 ;
  wire \data_out[1]_i_23_n_0 ;
  wire \data_out[2]_i_14_n_0 ;
  wire \data_out[2]_i_15_n_0 ;
  wire \data_out[2]_i_18_n_0 ;
  wire \data_out[2]_i_19_n_0 ;
  wire \data_out[2]_i_1_n_0 ;
  wire \data_out[2]_i_20_n_0 ;
  wire \data_out[2]_i_22_n_0 ;
  wire \data_out[2]_i_23_n_0 ;
  wire \data_out[3]_i_12_n_0 ;
  wire \data_out[3]_i_13_n_0 ;
  wire \data_out[3]_i_14_n_0 ;
  wire \data_out[3]_i_15_n_0 ;
  wire \data_out[3]_i_1_n_0 ;
  wire \data_out[3]_i_20_n_0 ;
  wire \data_out[3]_i_21_n_0 ;
  wire \data_out[3]_i_22_n_0 ;
  wire \data_out[3]_i_23_n_0 ;
  wire \data_out[4]_i_12_n_0 ;
  wire \data_out[4]_i_13_n_0 ;
  wire \data_out[4]_i_14_n_0 ;
  wire \data_out[4]_i_15_n_0 ;
  wire \data_out[4]_i_16_n_0 ;
  wire \data_out[4]_i_17_n_0 ;
  wire \data_out[4]_i_18_n_0 ;
  wire \data_out[4]_i_19_n_0 ;
  wire \data_out[4]_i_1_n_0 ;
  wire \data_out[4]_i_20_n_0 ;
  wire \data_out[5]_i_1_n_0 ;
  wire \data_out[5]_i_20_n_0 ;
  wire \data_out[6]_i_12_n_0 ;
  wire \data_out[6]_i_13_n_0 ;
  wire \data_out[6]_i_14_n_0 ;
  wire \data_out[6]_i_15_n_0 ;
  wire \data_out[6]_i_16_n_0 ;
  wire \data_out[6]_i_17_n_0 ;
  wire \data_out[6]_i_18_n_0 ;
  wire \data_out[6]_i_19_n_0 ;
  wire \data_out[6]_i_1_n_0 ;
  wire \data_out[6]_i_20_n_0 ;
  wire \data_out[6]_i_21_n_0 ;
  wire \data_out[6]_i_22_n_0 ;
  wire \data_out[6]_i_23_n_0 ;
  wire \data_out[7]_i_2_n_0 ;
  wire \data_out[7]_i_3_n_0 ;
  wire \data_out_reg[0]_i_10_n_0 ;
  wire \data_out_reg[0]_i_11_n_0 ;
  wire \data_out_reg[0]_i_3_n_0 ;
  wire \data_out_reg[0]_i_4_n_0 ;
  wire \data_out_reg[0]_i_5_n_0 ;
  wire \data_out_reg[0]_i_6_n_0 ;
  wire \data_out_reg[0]_i_7_n_0 ;
  wire \data_out_reg[0]_i_8_n_0 ;
  wire \data_out_reg[0]_i_9_n_0 ;
  wire \data_out_reg[1]_i_10_n_0 ;
  wire \data_out_reg[1]_i_11_n_0 ;
  wire \data_out_reg[1]_i_3_n_0 ;
  wire \data_out_reg[1]_i_4_n_0 ;
  wire \data_out_reg[1]_i_5_n_0 ;
  wire \data_out_reg[1]_i_6_n_0 ;
  wire \data_out_reg[1]_i_7_n_0 ;
  wire \data_out_reg[1]_i_8_n_0 ;
  wire \data_out_reg[1]_i_9_n_0 ;
  wire \data_out_reg[2]_i_10_n_0 ;
  wire \data_out_reg[2]_i_11_n_0 ;
  wire \data_out_reg[2]_i_3_n_0 ;
  wire \data_out_reg[2]_i_4_n_0 ;
  wire \data_out_reg[2]_i_5_n_0 ;
  wire \data_out_reg[2]_i_7_n_0 ;
  wire \data_out_reg[2]_i_9_n_0 ;
  wire \data_out_reg[3]_i_10_n_0 ;
  wire \data_out_reg[3]_i_11_n_0 ;
  wire \data_out_reg[3]_i_3_n_0 ;
  wire \data_out_reg[3]_i_5_n_0 ;
  wire \data_out_reg[3]_i_6_n_0 ;
  wire \data_out_reg[3]_i_7_n_0 ;
  wire \data_out_reg[4]_i_10_n_0 ;
  wire \data_out_reg[4]_i_3_n_0 ;
  wire \data_out_reg[4]_i_4_n_0 ;
  wire \data_out_reg[4]_i_5_n_0 ;
  wire \data_out_reg[4]_i_6_n_0 ;
  wire \data_out_reg[4]_i_7_n_0 ;
  wire \data_out_reg[4]_i_8_n_0 ;
  wire \data_out_reg[4]_i_9_n_0 ;
  wire \data_out_reg[5]_i_10_n_0 ;
  wire \data_out_reg[5]_i_5_n_0 ;
  wire \data_out_reg[6]_i_10_n_0 ;
  wire \data_out_reg[6]_i_11_n_0 ;
  wire \data_out_reg[6]_i_3_n_0 ;
  wire \data_out_reg[6]_i_4_n_0 ;
  wire \data_out_reg[6]_i_5_n_0 ;
  wire \data_out_reg[6]_i_6_n_0 ;
  wire \data_out_reg[6]_i_7_n_0 ;
  wire \data_out_reg[6]_i_8_n_0 ;
  wire \data_out_reg[6]_i_9_n_0 ;
  wire [13:0]in_01;
  wire [6:0]in_01_lsB;
  wire [6:0]in_01_msB;
  (* RTL_KEEP = "yes" *) wire [5:0]state_send;
  wire tx;

  LUT5 #(
    .INIT(32'h0000777F)) 
    \FSM_sequential_state_send[0]_i_1 
       (.I0(state_send[4]),
        .I1(state_send[5]),
        .I2(state_send[2]),
        .I3(state_send[3]),
        .I4(state_send[0]),
        .O(\FSM_sequential_state_send[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0666066606666666)) 
    \FSM_sequential_state_send[1]_i_1 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .I2(state_send[4]),
        .I3(state_send[5]),
        .I4(state_send[2]),
        .I5(state_send[3]),
        .O(\FSM_sequential_state_send[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h07707070)) 
    \FSM_sequential_state_send[2]_i_1 
       (.I0(state_send[5]),
        .I1(state_send[4]),
        .I2(state_send[2]),
        .I3(state_send[0]),
        .I4(state_send[1]),
        .O(\FSM_sequential_state_send[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0770707070707070)) 
    \FSM_sequential_state_send[3]_i_1 
       (.I0(state_send[5]),
        .I1(state_send[4]),
        .I2(state_send[3]),
        .I3(state_send[0]),
        .I4(state_send[1]),
        .I5(state_send[2]),
        .O(\FSM_sequential_state_send[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h15575757C0000000)) 
    \FSM_sequential_state_send[4]_i_1 
       (.I0(state_send[5]),
        .I1(state_send[2]),
        .I2(state_send[3]),
        .I3(state_send[0]),
        .I4(state_send[1]),
        .I5(state_send[4]),
        .O(\FSM_sequential_state_send[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4000AAAA0222AAAA)) 
    \FSM_sequential_state_send[5]_i_1 
       (.I0(state_send[5]),
        .I1(state_send[3]),
        .I2(state_send[1]),
        .I3(state_send[0]),
        .I4(state_send[4]),
        .I5(state_send[2]),
        .O(\FSM_sequential_state_send[5]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_send_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\FSM_sequential_state_send[0]_i_1_n_0 ),
        .Q(state_send[0]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_send_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\FSM_sequential_state_send[1]_i_1_n_0 ),
        .Q(state_send[1]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_send_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\FSM_sequential_state_send[2]_i_1_n_0 ),
        .Q(state_send[2]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_send_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\FSM_sequential_state_send[3]_i_1_n_0 ),
        .Q(state_send[3]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_send_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\FSM_sequential_state_send[4]_i_1_n_0 ),
        .Q(state_send[4]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_send_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\FSM_sequential_state_send[5]_i_1_n_0 ),
        .Q(state_send[5]),
        .R(1'b0));
  pin_tx TX0
       (.E(TX0_n_0),
        .\FSM_sequential_state_send_reg[0] (E),
        .\FSM_sequential_state_send_reg[4] (\data_out[7]_i_3_n_0 ),
        .Q(data_out),
        .capt_data_reg(TX0_n_2),
        .capt_data_reg_0(capt_data),
        .clk(clk),
        .out(state_send),
        .tx(tx));
  FDRE #(
    .INIT(1'b0)) 
    capt_data_reg
       (.C(clk),
        .CE(1'b1),
        .D(TX0_n_2),
        .Q(capt_data),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data_out[0]_i_1 
       (.I0(\data_out[0]_i_2_n_0 ),
        .I1(\data_out_reg[0]_i_3_n_0 ),
        .I2(state_send[5]),
        .I3(\data_out_reg[0]_i_4_n_0 ),
        .I4(state_send[4]),
        .I5(\data_out_reg[0]_i_5_n_0 ),
        .O(\data_out[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_12 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_13 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_14 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_15 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_16 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_17 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_18 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_19 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_2 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h62)) 
    \data_out[0]_i_20 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .I2(in_01_msB[0]),
        .O(\data_out[0]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_21 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_22 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_23 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .O(\data_out[0]_i_23_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \data_out[1]_i_1 
       (.I0(\data_out_reg[1]_i_3_n_0 ),
        .I1(state_send[5]),
        .I2(\data_out_reg[1]_i_4_n_0 ),
        .I3(state_send[4]),
        .I4(\data_out_reg[1]_i_5_n_0 ),
        .O(\data_out[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[1]_i_13 
       (.I0(state_send[0]),
        .O(\data_out[1]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[1]_i_15 
       (.I0(state_send[0]),
        .O(\data_out[1]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[1]_i_17 
       (.I0(state_send[0]),
        .O(\data_out[1]_i_17_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[1]_i_19 
       (.I0(state_send[0]),
        .O(\data_out[1]_i_19_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \data_out[1]_i_20 
       (.I0(state_send[1]),
        .I1(state_send[0]),
        .I2(in_01_msB[1]),
        .O(\data_out[1]_i_20_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[1]_i_21 
       (.I0(state_send[0]),
        .O(\data_out[1]_i_21_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[1]_i_23 
       (.I0(state_send[0]),
        .O(\data_out[1]_i_23_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \data_out[2]_i_1 
       (.I0(\data_out_reg[2]_i_3_n_0 ),
        .I1(state_send[5]),
        .I2(\data_out_reg[2]_i_4_n_0 ),
        .I3(state_send[4]),
        .I4(\data_out_reg[2]_i_5_n_0 ),
        .O(\data_out[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[2]_i_14 
       (.I0(state_send[0]),
        .O(\data_out[2]_i_14_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[2]_i_15 
       (.I0(state_send[0]),
        .O(\data_out[2]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[2]_i_18 
       (.I0(state_send[0]),
        .O(\data_out[2]_i_18_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[2]_i_19 
       (.I0(state_send[0]),
        .O(\data_out[2]_i_19_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \data_out[2]_i_20 
       (.I0(in_01_lsB[2]),
        .I1(state_send[1]),
        .I2(state_send[0]),
        .O(\data_out[2]_i_20_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[2]_i_22 
       (.I0(state_send[0]),
        .O(\data_out[2]_i_22_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[2]_i_23 
       (.I0(state_send[0]),
        .O(\data_out[2]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h0B08)) 
    \data_out[3]_i_1 
       (.I0(\data_out_reg[3]_i_3_n_0 ),
        .I1(state_send[5]),
        .I2(state_send[4]),
        .I3(\data_out_reg[3]_i_5_n_0 ),
        .O(\data_out[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[3]_i_12 
       (.I0(state_send[0]),
        .O(\data_out[3]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[3]_i_13 
       (.I0(state_send[0]),
        .O(\data_out[3]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[3]_i_14 
       (.I0(state_send[0]),
        .O(\data_out[3]_i_14_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[3]_i_15 
       (.I0(state_send[0]),
        .O(\data_out[3]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[3]_i_20 
       (.I0(state_send[0]),
        .O(\data_out[3]_i_20_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[3]_i_21 
       (.I0(state_send[0]),
        .O(\data_out[3]_i_21_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[3]_i_22 
       (.I0(state_send[0]),
        .O(\data_out[3]_i_22_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[3]_i_23 
       (.I0(state_send[0]),
        .O(\data_out[3]_i_23_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \data_out[4]_i_1 
       (.I0(\data_out_reg[4]_i_3_n_0 ),
        .I1(state_send[5]),
        .I2(\data_out_reg[4]_i_4_n_0 ),
        .I3(state_send[4]),
        .I4(\data_out_reg[4]_i_5_n_0 ),
        .O(\data_out[4]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[4]_i_12 
       (.I0(state_send[0]),
        .O(\data_out[4]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[4]_i_13 
       (.I0(state_send[0]),
        .O(\data_out[4]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[4]_i_14 
       (.I0(state_send[0]),
        .O(\data_out[4]_i_14_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[4]_i_15 
       (.I0(state_send[0]),
        .O(\data_out[4]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[4]_i_16 
       (.I0(state_send[0]),
        .O(\data_out[4]_i_16_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[4]_i_17 
       (.I0(state_send[0]),
        .O(\data_out[4]_i_17_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[4]_i_18 
       (.I0(state_send[0]),
        .O(\data_out[4]_i_18_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[4]_i_19 
       (.I0(state_send[0]),
        .O(\data_out[4]_i_19_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \data_out[4]_i_20 
       (.I0(in_01_lsB[4]),
        .I1(state_send[1]),
        .I2(state_send[0]),
        .O(\data_out[4]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h4340)) 
    \data_out[5]_i_1 
       (.I0(state_send[0]),
        .I1(state_send[5]),
        .I2(state_send[4]),
        .I3(\data_out_reg[5]_i_5_n_0 ),
        .O(\data_out[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \data_out[5]_i_20 
       (.I0(in_01_lsB[5]),
        .I1(state_send[1]),
        .I2(state_send[0]),
        .O(\data_out[5]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h5F50CFCF5F50C0C0)) 
    \data_out[6]_i_1 
       (.I0(state_send[0]),
        .I1(\data_out_reg[6]_i_3_n_0 ),
        .I2(state_send[5]),
        .I3(\data_out_reg[6]_i_4_n_0 ),
        .I4(state_send[4]),
        .I5(\data_out_reg[6]_i_5_n_0 ),
        .O(\data_out[6]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_12 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_13 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_14 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_14_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_15 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_16 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_16_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_17 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_17_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_18 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_18_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_19 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_19_n_0 ));
  LUT3 #(
    .INIT(8'h8F)) 
    \data_out[6]_i_20 
       (.I0(in_01_lsB[6]),
        .I1(state_send[1]),
        .I2(state_send[0]),
        .O(\data_out[6]_i_20_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_21 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_21_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_22 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_22_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[6]_i_23 
       (.I0(state_send[0]),
        .O(\data_out[6]_i_23_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[7]_i_2 
       (.I0(state_send[0]),
        .O(\data_out[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \data_out[7]_i_3 
       (.I0(state_send[4]),
        .I1(state_send[5]),
        .O(\data_out[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_out_reg[0] 
       (.C(clk),
        .CE(TX0_n_0),
        .D(\data_out[0]_i_1_n_0 ),
        .Q(data_out[0]),
        .R(1'b0));
  MUXF7 \data_out_reg[0]_i_10 
       (.I0(\data_out[0]_i_20_n_0 ),
        .I1(\data_out[0]_i_21_n_0 ),
        .O(\data_out_reg[0]_i_10_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[0]_i_11 
       (.I0(\data_out[0]_i_22_n_0 ),
        .I1(\data_out[0]_i_23_n_0 ),
        .O(\data_out_reg[0]_i_11_n_0 ),
        .S(state_send[2]));
  MUXF8 \data_out_reg[0]_i_3 
       (.I0(\data_out_reg[0]_i_6_n_0 ),
        .I1(\data_out_reg[0]_i_7_n_0 ),
        .O(\data_out_reg[0]_i_3_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[0]_i_4 
       (.I0(\data_out_reg[0]_i_8_n_0 ),
        .I1(\data_out_reg[0]_i_9_n_0 ),
        .O(\data_out_reg[0]_i_4_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[0]_i_5 
       (.I0(\data_out_reg[0]_i_10_n_0 ),
        .I1(\data_out_reg[0]_i_11_n_0 ),
        .O(\data_out_reg[0]_i_5_n_0 ),
        .S(state_send[3]));
  MUXF7 \data_out_reg[0]_i_6 
       (.I0(\data_out[0]_i_12_n_0 ),
        .I1(\data_out[0]_i_13_n_0 ),
        .O(\data_out_reg[0]_i_6_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[0]_i_7 
       (.I0(\data_out[0]_i_14_n_0 ),
        .I1(\data_out[0]_i_15_n_0 ),
        .O(\data_out_reg[0]_i_7_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[0]_i_8 
       (.I0(\data_out[0]_i_16_n_0 ),
        .I1(\data_out[0]_i_17_n_0 ),
        .O(\data_out_reg[0]_i_8_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[0]_i_9 
       (.I0(\data_out[0]_i_18_n_0 ),
        .I1(\data_out[0]_i_19_n_0 ),
        .O(\data_out_reg[0]_i_9_n_0 ),
        .S(state_send[2]));
  FDRE #(
    .INIT(1'b0)) 
    \data_out_reg[1] 
       (.C(clk),
        .CE(TX0_n_0),
        .D(\data_out[1]_i_1_n_0 ),
        .Q(data_out[1]),
        .R(1'b0));
  MUXF7 \data_out_reg[1]_i_10 
       (.I0(\data_out[1]_i_20_n_0 ),
        .I1(\data_out[1]_i_21_n_0 ),
        .O(\data_out_reg[1]_i_10_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[1]_i_11 
       (.I0(1'b0),
        .I1(\data_out[1]_i_23_n_0 ),
        .O(\data_out_reg[1]_i_11_n_0 ),
        .S(state_send[2]));
  MUXF8 \data_out_reg[1]_i_3 
       (.I0(\data_out_reg[1]_i_6_n_0 ),
        .I1(\data_out_reg[1]_i_7_n_0 ),
        .O(\data_out_reg[1]_i_3_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[1]_i_4 
       (.I0(\data_out_reg[1]_i_8_n_0 ),
        .I1(\data_out_reg[1]_i_9_n_0 ),
        .O(\data_out_reg[1]_i_4_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[1]_i_5 
       (.I0(\data_out_reg[1]_i_10_n_0 ),
        .I1(\data_out_reg[1]_i_11_n_0 ),
        .O(\data_out_reg[1]_i_5_n_0 ),
        .S(state_send[3]));
  MUXF7 \data_out_reg[1]_i_6 
       (.I0(1'b0),
        .I1(\data_out[1]_i_13_n_0 ),
        .O(\data_out_reg[1]_i_6_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[1]_i_7 
       (.I0(1'b0),
        .I1(\data_out[1]_i_15_n_0 ),
        .O(\data_out_reg[1]_i_7_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[1]_i_8 
       (.I0(1'b0),
        .I1(\data_out[1]_i_17_n_0 ),
        .O(\data_out_reg[1]_i_8_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[1]_i_9 
       (.I0(1'b0),
        .I1(\data_out[1]_i_19_n_0 ),
        .O(\data_out_reg[1]_i_9_n_0 ),
        .S(state_send[2]));
  FDRE #(
    .INIT(1'b0)) 
    \data_out_reg[2] 
       (.C(clk),
        .CE(TX0_n_0),
        .D(\data_out[2]_i_1_n_0 ),
        .Q(data_out[2]),
        .R(1'b0));
  MUXF7 \data_out_reg[2]_i_10 
       (.I0(\data_out[2]_i_20_n_0 ),
        .I1(1'b0),
        .O(\data_out_reg[2]_i_10_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[2]_i_11 
       (.I0(\data_out[2]_i_22_n_0 ),
        .I1(\data_out[2]_i_23_n_0 ),
        .O(\data_out_reg[2]_i_11_n_0 ),
        .S(state_send[2]));
  MUXF8 \data_out_reg[2]_i_3 
       (.I0(1'b0),
        .I1(\data_out_reg[2]_i_7_n_0 ),
        .O(\data_out_reg[2]_i_3_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[2]_i_4 
       (.I0(1'b0),
        .I1(\data_out_reg[2]_i_9_n_0 ),
        .O(\data_out_reg[2]_i_4_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[2]_i_5 
       (.I0(\data_out_reg[2]_i_10_n_0 ),
        .I1(\data_out_reg[2]_i_11_n_0 ),
        .O(\data_out_reg[2]_i_5_n_0 ),
        .S(state_send[3]));
  MUXF7 \data_out_reg[2]_i_7 
       (.I0(\data_out[2]_i_14_n_0 ),
        .I1(\data_out[2]_i_15_n_0 ),
        .O(\data_out_reg[2]_i_7_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[2]_i_9 
       (.I0(\data_out[2]_i_18_n_0 ),
        .I1(\data_out[2]_i_19_n_0 ),
        .O(\data_out_reg[2]_i_9_n_0 ),
        .S(state_send[2]));
  FDRE #(
    .INIT(1'b0)) 
    \data_out_reg[3] 
       (.C(clk),
        .CE(TX0_n_0),
        .D(\data_out[3]_i_1_n_0 ),
        .Q(data_out[3]),
        .R(1'b0));
  MUXF7 \data_out_reg[3]_i_10 
       (.I0(\data_out[3]_i_20_n_0 ),
        .I1(\data_out[3]_i_21_n_0 ),
        .O(\data_out_reg[3]_i_10_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[3]_i_11 
       (.I0(\data_out[3]_i_22_n_0 ),
        .I1(\data_out[3]_i_23_n_0 ),
        .O(\data_out_reg[3]_i_11_n_0 ),
        .S(state_send[2]));
  MUXF8 \data_out_reg[3]_i_3 
       (.I0(\data_out_reg[3]_i_6_n_0 ),
        .I1(\data_out_reg[3]_i_7_n_0 ),
        .O(\data_out_reg[3]_i_3_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[3]_i_5 
       (.I0(\data_out_reg[3]_i_10_n_0 ),
        .I1(\data_out_reg[3]_i_11_n_0 ),
        .O(\data_out_reg[3]_i_5_n_0 ),
        .S(state_send[3]));
  MUXF7 \data_out_reg[3]_i_6 
       (.I0(\data_out[3]_i_12_n_0 ),
        .I1(\data_out[3]_i_13_n_0 ),
        .O(\data_out_reg[3]_i_6_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[3]_i_7 
       (.I0(\data_out[3]_i_14_n_0 ),
        .I1(\data_out[3]_i_15_n_0 ),
        .O(\data_out_reg[3]_i_7_n_0 ),
        .S(state_send[2]));
  FDRE #(
    .INIT(1'b0)) 
    \data_out_reg[4] 
       (.C(clk),
        .CE(TX0_n_0),
        .D(\data_out[4]_i_1_n_0 ),
        .Q(data_out[4]),
        .R(1'b0));
  MUXF7 \data_out_reg[4]_i_10 
       (.I0(\data_out[4]_i_20_n_0 ),
        .I1(1'b0),
        .O(\data_out_reg[4]_i_10_n_0 ),
        .S(state_send[2]));
  MUXF8 \data_out_reg[4]_i_3 
       (.I0(\data_out_reg[4]_i_6_n_0 ),
        .I1(\data_out_reg[4]_i_7_n_0 ),
        .O(\data_out_reg[4]_i_3_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[4]_i_4 
       (.I0(\data_out_reg[4]_i_8_n_0 ),
        .I1(\data_out_reg[4]_i_9_n_0 ),
        .O(\data_out_reg[4]_i_4_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[4]_i_5 
       (.I0(\data_out_reg[4]_i_10_n_0 ),
        .I1(1'b0),
        .O(\data_out_reg[4]_i_5_n_0 ),
        .S(state_send[3]));
  MUXF7 \data_out_reg[4]_i_6 
       (.I0(\data_out[4]_i_12_n_0 ),
        .I1(\data_out[4]_i_13_n_0 ),
        .O(\data_out_reg[4]_i_6_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[4]_i_7 
       (.I0(\data_out[4]_i_14_n_0 ),
        .I1(\data_out[4]_i_15_n_0 ),
        .O(\data_out_reg[4]_i_7_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[4]_i_8 
       (.I0(\data_out[4]_i_16_n_0 ),
        .I1(\data_out[4]_i_17_n_0 ),
        .O(\data_out_reg[4]_i_8_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[4]_i_9 
       (.I0(\data_out[4]_i_18_n_0 ),
        .I1(\data_out[4]_i_19_n_0 ),
        .O(\data_out_reg[4]_i_9_n_0 ),
        .S(state_send[2]));
  FDRE #(
    .INIT(1'b0)) 
    \data_out_reg[5] 
       (.C(clk),
        .CE(TX0_n_0),
        .D(\data_out[5]_i_1_n_0 ),
        .Q(data_out[5]),
        .R(1'b0));
  MUXF7 \data_out_reg[5]_i_10 
       (.I0(\data_out[5]_i_20_n_0 ),
        .I1(1'b0),
        .O(\data_out_reg[5]_i_10_n_0 ),
        .S(state_send[2]));
  MUXF8 \data_out_reg[5]_i_5 
       (.I0(\data_out_reg[5]_i_10_n_0 ),
        .I1(1'b0),
        .O(\data_out_reg[5]_i_5_n_0 ),
        .S(state_send[3]));
  FDRE #(
    .INIT(1'b0)) 
    \data_out_reg[6] 
       (.C(clk),
        .CE(TX0_n_0),
        .D(\data_out[6]_i_1_n_0 ),
        .Q(data_out[6]),
        .R(1'b0));
  MUXF7 \data_out_reg[6]_i_10 
       (.I0(\data_out[6]_i_20_n_0 ),
        .I1(\data_out[6]_i_21_n_0 ),
        .O(\data_out_reg[6]_i_10_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[6]_i_11 
       (.I0(\data_out[6]_i_22_n_0 ),
        .I1(\data_out[6]_i_23_n_0 ),
        .O(\data_out_reg[6]_i_11_n_0 ),
        .S(state_send[2]));
  MUXF8 \data_out_reg[6]_i_3 
       (.I0(\data_out_reg[6]_i_6_n_0 ),
        .I1(\data_out_reg[6]_i_7_n_0 ),
        .O(\data_out_reg[6]_i_3_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[6]_i_4 
       (.I0(\data_out_reg[6]_i_8_n_0 ),
        .I1(\data_out_reg[6]_i_9_n_0 ),
        .O(\data_out_reg[6]_i_4_n_0 ),
        .S(state_send[3]));
  MUXF8 \data_out_reg[6]_i_5 
       (.I0(\data_out_reg[6]_i_10_n_0 ),
        .I1(\data_out_reg[6]_i_11_n_0 ),
        .O(\data_out_reg[6]_i_5_n_0 ),
        .S(state_send[3]));
  MUXF7 \data_out_reg[6]_i_6 
       (.I0(\data_out[6]_i_12_n_0 ),
        .I1(\data_out[6]_i_13_n_0 ),
        .O(\data_out_reg[6]_i_6_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[6]_i_7 
       (.I0(\data_out[6]_i_14_n_0 ),
        .I1(\data_out[6]_i_15_n_0 ),
        .O(\data_out_reg[6]_i_7_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[6]_i_8 
       (.I0(\data_out[6]_i_16_n_0 ),
        .I1(\data_out[6]_i_17_n_0 ),
        .O(\data_out_reg[6]_i_8_n_0 ),
        .S(state_send[2]));
  MUXF7 \data_out_reg[6]_i_9 
       (.I0(\data_out[6]_i_18_n_0 ),
        .I1(\data_out[6]_i_19_n_0 ),
        .O(\data_out_reg[6]_i_9_n_0 ),
        .S(state_send[2]));
  FDRE #(
    .INIT(1'b0)) 
    \data_out_reg[7] 
       (.C(clk),
        .CE(TX0_n_0),
        .D(\data_out[7]_i_2_n_0 ),
        .Q(data_out[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in_01_lsB_reg[2] 
       (.C(clk),
        .CE(capt_data),
        .D(in_01[2]),
        .Q(in_01_lsB[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in_01_lsB_reg[4] 
       (.C(clk),
        .CE(capt_data),
        .D(in_01[4]),
        .Q(in_01_lsB[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in_01_lsB_reg[5] 
       (.C(clk),
        .CE(capt_data),
        .D(in_01[5]),
        .Q(in_01_lsB[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in_01_lsB_reg[6] 
       (.C(clk),
        .CE(capt_data),
        .D(in_01[6]),
        .Q(in_01_lsB[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in_01_msB_reg[0] 
       (.C(clk),
        .CE(capt_data),
        .D(in_01[7]),
        .Q(in_01_msB[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in_01_msB_reg[1] 
       (.C(clk),
        .CE(capt_data),
        .D(in_01[8]),
        .Q(in_01_msB[1]),
        .R(1'b0));
endmodule

module package_ext
   (data_ready,
    E,
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
    in_13);
  output data_ready;
  output [0:0]E;
  output tx;
  output [20:0]out_01;
  output [20:0]out_02;
  output [20:0]out_03;
  output [20:0]out_04;
  output [20:0]out_05;
  output [20:0]out_06;
  output [20:0]out_07;
  output [20:0]out_08;
  output [20:0]out_09;
  output [20:0]out_10;
  output [20:0]out_11;
  output [20:0]out_12;
  output [20:0]out_13;
  output [20:0]out_14;
  output [20:0]out_15;
  output [20:0]out_16;
  output [20:0]out_17;
  output [20:0]out_18;
  output [20:0]out_19;
  output [20:0]out_20;
  input clk;
  input rx;
  input [13:0]in_01;
  input [13:0]in_02;
  input [13:0]in_03;
  input [13:0]in_04;
  input [13:0]in_05;
  input [13:0]in_06;
  input [13:0]in_07;
  input [13:0]in_08;
  input [13:0]in_09;
  input [13:0]in_10;
  input [13:0]in_11;
  input [13:0]in_12;
  input [13:0]in_13;

  wire [0:0]E;
  wire clk;
  wire [13:0]in_01;
  wire tx;
  wire NLW_pack1_ext_data_ready_UNCONNECTED;
  wire NLW_pack1_ext_rx_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_01_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_02_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_03_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_04_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_05_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_06_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_07_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_08_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_09_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_10_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_11_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_12_UNCONNECTED;
  wire [13:0]NLW_pack1_ext_in_13_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_01_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_02_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_03_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_04_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_05_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_06_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_07_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_08_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_09_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_10_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_11_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_12_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_13_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_14_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_15_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_16_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_17_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_18_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_19_UNCONNECTED;
  wire [20:0]NLW_pack1_ext_out_20_UNCONNECTED;

  pack_ext pack1_ext
       (.E(E),
        .clk(clk),
        .data_ready(NLW_pack1_ext_data_ready_UNCONNECTED),
        .in_01({NLW_pack1_ext_in_01_UNCONNECTED[13:9],in_01[8:4],NLW_pack1_ext_in_01_UNCONNECTED[3],in_01[2],NLW_pack1_ext_in_01_UNCONNECTED[1:0]}),
        .in_02(NLW_pack1_ext_in_02_UNCONNECTED[13:0]),
        .in_03(NLW_pack1_ext_in_03_UNCONNECTED[13:0]),
        .in_04(NLW_pack1_ext_in_04_UNCONNECTED[13:0]),
        .in_05(NLW_pack1_ext_in_05_UNCONNECTED[13:0]),
        .in_06(NLW_pack1_ext_in_06_UNCONNECTED[13:0]),
        .in_07(NLW_pack1_ext_in_07_UNCONNECTED[13:0]),
        .in_08(NLW_pack1_ext_in_08_UNCONNECTED[13:0]),
        .in_09(NLW_pack1_ext_in_09_UNCONNECTED[13:0]),
        .in_10(NLW_pack1_ext_in_10_UNCONNECTED[13:0]),
        .in_11(NLW_pack1_ext_in_11_UNCONNECTED[13:0]),
        .in_12(NLW_pack1_ext_in_12_UNCONNECTED[13:0]),
        .in_13(NLW_pack1_ext_in_13_UNCONNECTED[13:0]),
        .out_01(NLW_pack1_ext_out_01_UNCONNECTED[20:0]),
        .out_02(NLW_pack1_ext_out_02_UNCONNECTED[20:0]),
        .out_03(NLW_pack1_ext_out_03_UNCONNECTED[20:0]),
        .out_04(NLW_pack1_ext_out_04_UNCONNECTED[20:0]),
        .out_05(NLW_pack1_ext_out_05_UNCONNECTED[20:0]),
        .out_06(NLW_pack1_ext_out_06_UNCONNECTED[20:0]),
        .out_07(NLW_pack1_ext_out_07_UNCONNECTED[20:0]),
        .out_08(NLW_pack1_ext_out_08_UNCONNECTED[20:0]),
        .out_09(NLW_pack1_ext_out_09_UNCONNECTED[20:0]),
        .out_10(NLW_pack1_ext_out_10_UNCONNECTED[20:0]),
        .out_11(NLW_pack1_ext_out_11_UNCONNECTED[20:0]),
        .out_12(NLW_pack1_ext_out_12_UNCONNECTED[20:0]),
        .out_13(NLW_pack1_ext_out_13_UNCONNECTED[20:0]),
        .out_14(NLW_pack1_ext_out_14_UNCONNECTED[20:0]),
        .out_15(NLW_pack1_ext_out_15_UNCONNECTED[20:0]),
        .out_16(NLW_pack1_ext_out_16_UNCONNECTED[20:0]),
        .out_17(NLW_pack1_ext_out_17_UNCONNECTED[20:0]),
        .out_18(NLW_pack1_ext_out_18_UNCONNECTED[20:0]),
        .out_19(NLW_pack1_ext_out_19_UNCONNECTED[20:0]),
        .out_20(NLW_pack1_ext_out_20_UNCONNECTED[20:0]),
        .rx(NLW_pack1_ext_rx_UNCONNECTED),
        .tx(tx));
endmodule

module pin_tx
   (E,
    \FSM_sequential_state_send_reg[0] ,
    capt_data_reg,
    tx,
    clk,
    out,
    \FSM_sequential_state_send_reg[4] ,
    Q,
    capt_data_reg_0);
  output [0:0]E;
  output [0:0]\FSM_sequential_state_send_reg[0] ;
  output capt_data_reg;
  output tx;
  input clk;
  input [5:0]out;
  input \FSM_sequential_state_send_reg[4] ;
  input [7:0]Q;
  input [0:0]capt_data_reg_0;

  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_send_reg[0] ;
  wire \FSM_sequential_state_send_reg[4] ;
  wire [7:0]Q;
  wire capt_data_reg;
  wire [0:0]capt_data_reg_0;
  wire clk;
  wire [5:0]cont_reg__0;
  wire [19:1]data_shift;
  wire \data_shift[0]_i_4_n_0 ;
  wire \data_shift_reg[11]_inst_pack1_ext_TX0_data_shift_reg_s_6_n_0 ;
  wire \data_shift_reg[12]_srl7____inst_pack1_ext_TX0_data_shift_reg_s_5_n_0 ;
  wire data_shift_reg_gate_n_0;
  wire data_shift_reg_s_0_n_0;
  wire data_shift_reg_s_1_n_0;
  wire data_shift_reg_s_2_n_0;
  wire data_shift_reg_s_3_n_0;
  wire data_shift_reg_s_4_n_0;
  wire data_shift_reg_s_5_n_0;
  wire data_shift_reg_s_6_n_0;
  wire data_shift_reg_s_n_0;
  wire dut0_n_0;
  wire dut0_n_1;
  wire dut0_n_14;
  wire dut0_n_4;
  wire [5:0]out;
  wire [5:0]p_0_in__2;
  wire [9:1]p_1_in;
  wire tx;

  LUT1 #(
    .INIT(2'h1)) 
    \cont[0]_i_1__0 
       (.I0(cont_reg__0[0]),
        .O(p_0_in__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cont[1]_i_1__0 
       (.I0(cont_reg__0[0]),
        .I1(cont_reg__0[1]),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cont[2]_i_1 
       (.I0(cont_reg__0[1]),
        .I1(cont_reg__0[0]),
        .I2(cont_reg__0[2]),
        .O(p_0_in__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cont[3]_i_1 
       (.I0(cont_reg__0[2]),
        .I1(cont_reg__0[0]),
        .I2(cont_reg__0[1]),
        .I3(cont_reg__0[3]),
        .O(p_0_in__2[3]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cont[4]_i_1 
       (.I0(cont_reg__0[3]),
        .I1(cont_reg__0[1]),
        .I2(cont_reg__0[0]),
        .I3(cont_reg__0[2]),
        .I4(cont_reg__0[4]),
        .O(p_0_in__2[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cont[5]_i_2 
       (.I0(cont_reg__0[4]),
        .I1(cont_reg__0[2]),
        .I2(cont_reg__0[0]),
        .I3(cont_reg__0[1]),
        .I4(cont_reg__0[3]),
        .I5(cont_reg__0[5]),
        .O(p_0_in__2[5]));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[0] 
       (.C(clk),
        .CE(dut0_n_14),
        .D(p_0_in__2[0]),
        .Q(cont_reg__0[0]),
        .R(dut0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[1] 
       (.C(clk),
        .CE(dut0_n_14),
        .D(p_0_in__2[1]),
        .Q(cont_reg__0[1]),
        .R(dut0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[2] 
       (.C(clk),
        .CE(dut0_n_14),
        .D(p_0_in__2[2]),
        .Q(cont_reg__0[2]),
        .R(dut0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[3] 
       (.C(clk),
        .CE(dut0_n_14),
        .D(p_0_in__2[3]),
        .Q(cont_reg__0[3]),
        .R(dut0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[4] 
       (.C(clk),
        .CE(dut0_n_14),
        .D(p_0_in__2[4]),
        .Q(cont_reg__0[4]),
        .R(dut0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[5] 
       (.C(clk),
        .CE(dut0_n_14),
        .D(p_0_in__2[5]),
        .Q(cont_reg__0[5]),
        .R(dut0_n_0));
  LUT6 #(
    .INIT(64'h0000000055575757)) 
    \data_shift[0]_i_4 
       (.I0(cont_reg__0[4]),
        .I1(cont_reg__0[3]),
        .I2(cont_reg__0[2]),
        .I3(cont_reg__0[1]),
        .I4(cont_reg__0[0]),
        .I5(cont_reg__0[5]),
        .O(\data_shift[0]_i_4_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \data_shift_reg[0] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift[1]),
        .Q(tx),
        .S(dut0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    \data_shift_reg[10] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift_reg_gate_n_0),
        .Q(data_shift[10]),
        .S(dut0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[11]_inst_pack1_ext_TX0_data_shift_reg_s_6 
       (.C(clk),
        .CE(dut0_n_1),
        .D(\data_shift_reg[12]_srl7____inst_pack1_ext_TX0_data_shift_reg_s_5_n_0 ),
        .Q(\data_shift_reg[11]_inst_pack1_ext_TX0_data_shift_reg_s_6_n_0 ),
        .R(1'b0));
  (* srl_bus_name = "arch_i/package_ext_0/\inst/pack1_ext/TX0/data_shift_reg " *) 
  (* srl_name = "arch_i/package_ext_0/\inst/pack1_ext/TX0/data_shift_reg[12]_srl7____inst_pack1_ext_TX0_data_shift_reg_s_5 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_shift_reg[12]_srl7____inst_pack1_ext_TX0_data_shift_reg_s_5 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(dut0_n_1),
        .CLK(clk),
        .D(data_shift[19]),
        .Q(\data_shift_reg[12]_srl7____inst_pack1_ext_TX0_data_shift_reg_s_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[19] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(dut0_n_4),
        .Q(data_shift[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[1] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[1]),
        .Q(data_shift[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[2] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[2]),
        .Q(data_shift[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[3] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[3]),
        .Q(data_shift[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[4] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[4]),
        .Q(data_shift[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[5] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[5]),
        .Q(data_shift[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[6] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[6]),
        .Q(data_shift[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[7] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[7]),
        .Q(data_shift[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[8] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[8]),
        .Q(data_shift[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_shift_reg[9] 
       (.C(clk),
        .CE(dut0_n_1),
        .D(p_1_in[9]),
        .Q(data_shift[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    data_shift_reg_gate
       (.I0(\data_shift_reg[11]_inst_pack1_ext_TX0_data_shift_reg_s_6_n_0 ),
        .I1(data_shift_reg_s_6_n_0),
        .O(data_shift_reg_gate_n_0));
  FDSE #(
    .INIT(1'b1)) 
    data_shift_reg_s
       (.C(clk),
        .CE(dut0_n_1),
        .D(1'b0),
        .Q(data_shift_reg_s_n_0),
        .S(dut0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    data_shift_reg_s_0
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift_reg_s_n_0),
        .Q(data_shift_reg_s_0_n_0),
        .S(dut0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    data_shift_reg_s_1
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift_reg_s_0_n_0),
        .Q(data_shift_reg_s_1_n_0),
        .S(dut0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    data_shift_reg_s_2
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift_reg_s_1_n_0),
        .Q(data_shift_reg_s_2_n_0),
        .S(dut0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    data_shift_reg_s_3
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift_reg_s_2_n_0),
        .Q(data_shift_reg_s_3_n_0),
        .S(dut0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    data_shift_reg_s_4
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift_reg_s_3_n_0),
        .Q(data_shift_reg_s_4_n_0),
        .S(dut0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    data_shift_reg_s_5
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift_reg_s_4_n_0),
        .Q(data_shift_reg_s_5_n_0),
        .S(dut0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    data_shift_reg_s_6
       (.C(clk),
        .CE(dut0_n_1),
        .D(data_shift_reg_s_5_n_0),
        .Q(data_shift_reg_s_6_n_0),
        .S(dut0_n_0));
  signal_gen_pin dut0
       (.D({dut0_n_4,p_1_in}),
        .E(E),
        .\FSM_sequential_state_send_reg[0] (\FSM_sequential_state_send_reg[0] ),
        .\FSM_sequential_state_send_reg[4] (\FSM_sequential_state_send_reg[4] ),
        .Q(Q),
        .SR(dut0_n_0),
        .capt_data_reg(capt_data_reg),
        .capt_data_reg_0(capt_data_reg_0),
        .clk(clk),
        .\cont_reg[4]_0 (\data_shift[0]_i_4_n_0 ),
        .\cont_reg[5]_0 (dut0_n_14),
        .data_shift(data_shift[10:2]),
        .\data_shift_reg[10] (dut0_n_1),
        .out(out));
endmodule

module signal_gen_pin
   (SR,
    \data_shift_reg[10] ,
    E,
    \FSM_sequential_state_send_reg[0] ,
    D,
    \cont_reg[5]_0 ,
    capt_data_reg,
    \cont_reg[4]_0 ,
    out,
    \FSM_sequential_state_send_reg[4] ,
    data_shift,
    Q,
    capt_data_reg_0,
    clk);
  output [0:0]SR;
  output \data_shift_reg[10] ;
  output [0:0]E;
  output [0:0]\FSM_sequential_state_send_reg[0] ;
  output [9:0]D;
  output [0:0]\cont_reg[5]_0 ;
  output capt_data_reg;
  input \cont_reg[4]_0 ;
  input [5:0]out;
  input \FSM_sequential_state_send_reg[4] ;
  input [8:0]data_shift;
  input [7:0]Q;
  input [0:0]capt_data_reg_0;
  input clk;

  wire [9:0]\^D ;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_send_reg[0] ;
  wire \FSM_sequential_state_send_reg[4] ;
  wire [7:0]Q;
  wire [0:0]SR;
  wire capt_data_i_2_n_0;
  wire capt_data_reg;
  wire [0:0]capt_data_reg_0;
  wire clk;
  wire \cont[0]_i_1__1_n_0 ;
  wire \cont[17]_i_1_n_0 ;
  wire \cont[17]_i_3_n_0 ;
  wire \cont[17]_i_4_n_0 ;
  wire [11:0]cont_B;
  wire \cont_B[0]_i_1_n_0 ;
  wire \cont_B[11]_i_1_n_0 ;
  wire \cont_B[11]_i_3_n_0 ;
  wire \cont_B[11]_i_4_n_0 ;
  wire \cont_B[11]_i_5_n_0 ;
  wire \cont_B[11]_i_6_n_0 ;
  wire \cont_B[11]_i_7_n_0 ;
  wire [11:1]cont_B_0;
  wire \cont_B_reg[11]_i_8_n_5 ;
  wire \cont_B_reg[11]_i_8_n_6 ;
  wire \cont_B_reg[11]_i_8_n_7 ;
  wire \cont_B_reg[4]_i_2_n_0 ;
  wire \cont_B_reg[4]_i_2_n_4 ;
  wire \cont_B_reg[4]_i_2_n_5 ;
  wire \cont_B_reg[4]_i_2_n_6 ;
  wire \cont_B_reg[4]_i_2_n_7 ;
  wire \cont_B_reg[8]_i_2_n_0 ;
  wire \cont_B_reg[8]_i_2_n_4 ;
  wire \cont_B_reg[8]_i_2_n_5 ;
  wire \cont_B_reg[8]_i_2_n_6 ;
  wire \cont_B_reg[8]_i_2_n_7 ;
  wire \cont_reg[12]_i_1_n_0 ;
  wire \cont_reg[12]_i_1_n_4 ;
  wire \cont_reg[12]_i_1_n_5 ;
  wire \cont_reg[12]_i_1_n_6 ;
  wire \cont_reg[12]_i_1_n_7 ;
  wire \cont_reg[16]_i_1_n_0 ;
  wire \cont_reg[16]_i_1_n_4 ;
  wire \cont_reg[16]_i_1_n_5 ;
  wire \cont_reg[16]_i_1_n_6 ;
  wire \cont_reg[16]_i_1_n_7 ;
  wire \cont_reg[17]_i_2_n_7 ;
  wire \cont_reg[4]_0 ;
  wire \cont_reg[4]_i_1__0_n_0 ;
  wire \cont_reg[4]_i_1__0_n_4 ;
  wire \cont_reg[4]_i_1__0_n_5 ;
  wire \cont_reg[4]_i_1__0_n_6 ;
  wire \cont_reg[4]_i_1__0_n_7 ;
  wire [0:0]\cont_reg[5]_0 ;
  wire \cont_reg[8]_i_1__0_n_0 ;
  wire \cont_reg[8]_i_1__0_n_4 ;
  wire \cont_reg[8]_i_1__0_n_5 ;
  wire \cont_reg[8]_i_1__0_n_6 ;
  wire \cont_reg[8]_i_1__0_n_7 ;
  wire \cont_reg_n_0_[0] ;
  wire \cont_reg_n_0_[10] ;
  wire \cont_reg_n_0_[11] ;
  wire \cont_reg_n_0_[12] ;
  wire \cont_reg_n_0_[13] ;
  wire \cont_reg_n_0_[14] ;
  wire \cont_reg_n_0_[15] ;
  wire \cont_reg_n_0_[16] ;
  wire \cont_reg_n_0_[17] ;
  wire \cont_reg_n_0_[1] ;
  wire \cont_reg_n_0_[2] ;
  wire \cont_reg_n_0_[3] ;
  wire \cont_reg_n_0_[4] ;
  wire \cont_reg_n_0_[5] ;
  wire \cont_reg_n_0_[6] ;
  wire \cont_reg_n_0_[7] ;
  wire \cont_reg_n_0_[8] ;
  wire \cont_reg_n_0_[9] ;
  wire [8:0]data_shift;
  wire \data_shift[0]_i_10_n_0 ;
  wire \data_shift[0]_i_5_n_0 ;
  wire \data_shift[0]_i_6_n_0 ;
  wire \data_shift[0]_i_7_n_0 ;
  wire \data_shift[0]_i_8_n_0 ;
  wire \data_shift[0]_i_9_n_0 ;
  wire \data_shift_reg[10] ;
  wire [5:0]out;
  wire send_INST_0_i_1_n_0;
  wire send_INST_0_i_2_n_0;
  wire send_INST_0_i_3_n_0;
  wire send_INST_0_i_4_n_0;
  wire [3:0]\NLW_cont_B_reg[11]_i_8_CO_UNCONNECTED ;
  wire [3:3]\NLW_cont_B_reg[11]_i_8_O_UNCONNECTED ;
  wire [2:0]\NLW_cont_B_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_cont_B_reg[8]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_cont_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_cont_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_cont_reg[17]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_cont_reg[17]_i_2_O_UNCONNECTED ;
  wire [2:0]\NLW_cont_reg[4]_i_1__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_cont_reg[8]_i_1__0_CO_UNCONNECTED ;

  assign D[9] = SR;
  assign D[8:0] = \^D [8:0];
  LUT6 #(
    .INIT(64'hFFFFF2FF00000200)) 
    capt_data_i_1
       (.I0(\FSM_sequential_state_send_reg[4] ),
        .I1(out[0]),
        .I2(send_INST_0_i_1_n_0),
        .I3(capt_data_i_2_n_0),
        .I4(send_INST_0_i_2_n_0),
        .I5(capt_data_reg_0),
        .O(capt_data_reg));
  LUT6 #(
    .INIT(64'h0000000000000015)) 
    capt_data_i_2
       (.I0(out[2]),
        .I1(out[5]),
        .I2(out[4]),
        .I3(out[3]),
        .I4(out[1]),
        .I5(\cont_reg_n_0_[1] ),
        .O(capt_data_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \cont[0]_i_1__1 
       (.I0(\cont_reg_n_0_[0] ),
        .O(\cont[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \cont[17]_i_1 
       (.I0(\cont[17]_i_3_n_0 ),
        .I1(\cont_reg_n_0_[7] ),
        .I2(\cont_reg_n_0_[0] ),
        .I3(\cont_reg_n_0_[17] ),
        .I4(\cont_reg_n_0_[11] ),
        .I5(\cont[17]_i_4_n_0 ),
        .O(\cont[17]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \cont[17]_i_3 
       (.I0(\cont_reg_n_0_[4] ),
        .I1(\cont_reg_n_0_[3] ),
        .I2(\cont_reg_n_0_[2] ),
        .O(\cont[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \cont[17]_i_4 
       (.I0(\cont_reg_n_0_[6] ),
        .I1(\cont_reg_n_0_[5] ),
        .I2(send_INST_0_i_4_n_0),
        .I3(\cont_reg_n_0_[13] ),
        .I4(\cont_reg_n_0_[16] ),
        .I5(\cont_reg_n_0_[1] ),
        .O(\cont[17]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \cont[5]_i_1 
       (.I0(\cont_reg[4]_0 ),
        .I1(\data_shift[0]_i_5_n_0 ),
        .I2(\data_shift[0]_i_6_n_0 ),
        .I3(\data_shift[0]_i_7_n_0 ),
        .O(\cont_reg[5]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cont_B[0]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(cont_B[0]),
        .O(\cont_B[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[10]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[11]_i_8_n_6 ),
        .O(cont_B_0[10]));
  LUT6 #(
    .INIT(64'hFFFFFFFFF4F4F4FF)) 
    \cont_B[11]_i_1 
       (.I0(\cont_B[11]_i_3_n_0 ),
        .I1(\cont_B[11]_i_4_n_0 ),
        .I2(\cont_B[11]_i_5_n_0 ),
        .I3(\cont_reg_n_0_[16] ),
        .I4(\cont_reg_n_0_[17] ),
        .I5(\cont_B[11]_i_6_n_0 ),
        .O(\cont_B[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[11]_i_2 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[11]_i_8_n_5 ),
        .O(cont_B_0[11]));
  LUT3 #(
    .INIT(8'hFE)) 
    \cont_B[11]_i_3 
       (.I0(\cont_reg_n_0_[6] ),
        .I1(\cont_reg_n_0_[5] ),
        .I2(send_INST_0_i_4_n_0),
        .O(\cont_B[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000007FFF)) 
    \cont_B[11]_i_4 
       (.I0(\cont_reg_n_0_[1] ),
        .I1(\cont_reg_n_0_[4] ),
        .I2(\cont_reg_n_0_[3] ),
        .I3(\cont_reg_n_0_[2] ),
        .I4(\cont_reg_n_0_[17] ),
        .I5(\cont_reg_n_0_[11] ),
        .O(\cont_B[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cont_B[11]_i_5 
       (.I0(\cont_reg_n_0_[17] ),
        .I1(\cont_reg_n_0_[13] ),
        .I2(\cont_reg_n_0_[15] ),
        .I3(\cont_reg_n_0_[14] ),
        .O(\cont_B[11]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cont_B[11]_i_6 
       (.I0(\cont_reg_n_0_[7] ),
        .I1(\cont_reg_n_0_[11] ),
        .I2(\cont_reg_n_0_[17] ),
        .I3(send_INST_0_i_4_n_0),
        .O(\cont_B[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFBF)) 
    \cont_B[11]_i_7 
       (.I0(\data_shift[0]_i_7_n_0 ),
        .I1(cont_B[5]),
        .I2(cont_B[4]),
        .I3(cont_B[7]),
        .I4(cont_B[6]),
        .I5(\data_shift[0]_i_5_n_0 ),
        .O(\cont_B[11]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[1]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[4]_i_2_n_7 ),
        .O(cont_B_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[2]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[4]_i_2_n_6 ),
        .O(cont_B_0[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[3]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[4]_i_2_n_5 ),
        .O(cont_B_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[4]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[4]_i_2_n_4 ),
        .O(cont_B_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[5]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[8]_i_2_n_7 ),
        .O(cont_B_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[6]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[8]_i_2_n_6 ),
        .O(cont_B_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[7]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[8]_i_2_n_5 ),
        .O(cont_B_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[8]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[8]_i_2_n_4 ),
        .O(cont_B_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cont_B[9]_i_1 
       (.I0(\cont_B[11]_i_7_n_0 ),
        .I1(\cont_B_reg[11]_i_8_n_7 ),
        .O(cont_B_0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_B[0]_i_1_n_0 ),
        .Q(cont_B[0]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[10]),
        .Q(cont_B[10]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[11]),
        .Q(cont_B[11]),
        .R(\cont_B[11]_i_1_n_0 ));
  CARRY4 \cont_B_reg[11]_i_8 
       (.CI(\cont_B_reg[8]_i_2_n_0 ),
        .CO(\NLW_cont_B_reg[11]_i_8_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cont_B_reg[11]_i_8_O_UNCONNECTED [3],\cont_B_reg[11]_i_8_n_5 ,\cont_B_reg[11]_i_8_n_6 ,\cont_B_reg[11]_i_8_n_7 }),
        .S({1'b0,cont_B[11:9]}));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[1]),
        .Q(cont_B[1]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[2]),
        .Q(cont_B[2]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[3]),
        .Q(cont_B[3]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[4]),
        .Q(cont_B[4]),
        .R(\cont_B[11]_i_1_n_0 ));
  CARRY4 \cont_B_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cont_B_reg[4]_i_2_n_0 ,\NLW_cont_B_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(cont_B[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cont_B_reg[4]_i_2_n_4 ,\cont_B_reg[4]_i_2_n_5 ,\cont_B_reg[4]_i_2_n_6 ,\cont_B_reg[4]_i_2_n_7 }),
        .S(cont_B[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[5]),
        .Q(cont_B[5]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[6]),
        .Q(cont_B[6]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[7]),
        .Q(cont_B[7]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[8]),
        .Q(cont_B[8]),
        .R(\cont_B[11]_i_1_n_0 ));
  CARRY4 \cont_B_reg[8]_i_2 
       (.CI(\cont_B_reg[4]_i_2_n_0 ),
        .CO({\cont_B_reg[8]_i_2_n_0 ,\NLW_cont_B_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cont_B_reg[8]_i_2_n_4 ,\cont_B_reg[8]_i_2_n_5 ,\cont_B_reg[8]_i_2_n_6 ,\cont_B_reg[8]_i_2_n_7 }),
        .S(cont_B[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \cont_B_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(cont_B_0[9]),
        .Q(cont_B[9]),
        .R(\cont_B[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont[0]_i_1__1_n_0 ),
        .Q(\cont_reg_n_0_[0] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[12]_i_1_n_6 ),
        .Q(\cont_reg_n_0_[10] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[12]_i_1_n_5 ),
        .Q(\cont_reg_n_0_[11] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[12]_i_1_n_4 ),
        .Q(\cont_reg_n_0_[12] ),
        .R(\cont[17]_i_1_n_0 ));
  CARRY4 \cont_reg[12]_i_1 
       (.CI(\cont_reg[8]_i_1__0_n_0 ),
        .CO({\cont_reg[12]_i_1_n_0 ,\NLW_cont_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cont_reg[12]_i_1_n_4 ,\cont_reg[12]_i_1_n_5 ,\cont_reg[12]_i_1_n_6 ,\cont_reg[12]_i_1_n_7 }),
        .S({\cont_reg_n_0_[12] ,\cont_reg_n_0_[11] ,\cont_reg_n_0_[10] ,\cont_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[16]_i_1_n_7 ),
        .Q(\cont_reg_n_0_[13] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[16]_i_1_n_6 ),
        .Q(\cont_reg_n_0_[14] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[16]_i_1_n_5 ),
        .Q(\cont_reg_n_0_[15] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[16]_i_1_n_4 ),
        .Q(\cont_reg_n_0_[16] ),
        .R(\cont[17]_i_1_n_0 ));
  CARRY4 \cont_reg[16]_i_1 
       (.CI(\cont_reg[12]_i_1_n_0 ),
        .CO({\cont_reg[16]_i_1_n_0 ,\NLW_cont_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cont_reg[16]_i_1_n_4 ,\cont_reg[16]_i_1_n_5 ,\cont_reg[16]_i_1_n_6 ,\cont_reg[16]_i_1_n_7 }),
        .S({\cont_reg_n_0_[16] ,\cont_reg_n_0_[15] ,\cont_reg_n_0_[14] ,\cont_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[17]_i_2_n_7 ),
        .Q(\cont_reg_n_0_[17] ),
        .R(\cont[17]_i_1_n_0 ));
  CARRY4 \cont_reg[17]_i_2 
       (.CI(\cont_reg[16]_i_1_n_0 ),
        .CO(\NLW_cont_reg[17]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cont_reg[17]_i_2_O_UNCONNECTED [3:1],\cont_reg[17]_i_2_n_7 }),
        .S({1'b0,1'b0,1'b0,\cont_reg_n_0_[17] }));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[4]_i_1__0_n_7 ),
        .Q(\cont_reg_n_0_[1] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[4]_i_1__0_n_6 ),
        .Q(\cont_reg_n_0_[2] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[4]_i_1__0_n_5 ),
        .Q(\cont_reg_n_0_[3] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[4]_i_1__0_n_4 ),
        .Q(\cont_reg_n_0_[4] ),
        .R(\cont[17]_i_1_n_0 ));
  CARRY4 \cont_reg[4]_i_1__0 
       (.CI(1'b0),
        .CO({\cont_reg[4]_i_1__0_n_0 ,\NLW_cont_reg[4]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(\cont_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cont_reg[4]_i_1__0_n_4 ,\cont_reg[4]_i_1__0_n_5 ,\cont_reg[4]_i_1__0_n_6 ,\cont_reg[4]_i_1__0_n_7 }),
        .S({\cont_reg_n_0_[4] ,\cont_reg_n_0_[3] ,\cont_reg_n_0_[2] ,\cont_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[8]_i_1__0_n_7 ),
        .Q(\cont_reg_n_0_[5] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[8]_i_1__0_n_6 ),
        .Q(\cont_reg_n_0_[6] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[8]_i_1__0_n_5 ),
        .Q(\cont_reg_n_0_[7] ),
        .R(\cont[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[8]_i_1__0_n_4 ),
        .Q(\cont_reg_n_0_[8] ),
        .R(\cont[17]_i_1_n_0 ));
  CARRY4 \cont_reg[8]_i_1__0 
       (.CI(\cont_reg[4]_i_1__0_n_0 ),
        .CO({\cont_reg[8]_i_1__0_n_0 ,\NLW_cont_reg[8]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cont_reg[8]_i_1__0_n_4 ,\cont_reg[8]_i_1__0_n_5 ,\cont_reg[8]_i_1__0_n_6 ,\cont_reg[8]_i_1__0_n_7 }),
        .S({\cont_reg_n_0_[8] ,\cont_reg_n_0_[7] ,\cont_reg_n_0_[6] ,\cont_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \cont_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\cont_reg[12]_i_1_n_7 ),
        .Q(\cont_reg_n_0_[9] ),
        .R(\cont[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000004445)) 
    \data_out[7]_i_1 
       (.I0(send_INST_0_i_1_n_0),
        .I1(\FSM_sequential_state_send_reg[4] ),
        .I2(out[2]),
        .I3(out[3]),
        .I4(\cont_reg_n_0_[1] ),
        .I5(send_INST_0_i_2_n_0),
        .O(E));
  LUT2 #(
    .INIT(4'hE)) 
    \data_shift[0]_i_10 
       (.I0(\cont_reg_n_0_[5] ),
        .I1(\cont_reg_n_0_[6] ),
        .O(\data_shift[0]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0002)) 
    \data_shift[0]_i_2 
       (.I0(\cont_reg[4]_0 ),
        .I1(\data_shift[0]_i_5_n_0 ),
        .I2(\data_shift[0]_i_6_n_0 ),
        .I3(\data_shift[0]_i_7_n_0 ),
        .I4(SR),
        .O(\data_shift_reg[10] ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \data_shift[0]_i_3 
       (.I0(send_INST_0_i_3_n_0),
        .I1(\data_shift[0]_i_8_n_0 ),
        .I2(\cont_reg_n_0_[1] ),
        .I3(\data_shift[0]_i_9_n_0 ),
        .I4(send_INST_0_i_4_n_0),
        .I5(\data_shift[0]_i_10_n_0 ),
        .O(SR));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \data_shift[0]_i_5 
       (.I0(cont_B[0]),
        .I1(cont_B[1]),
        .I2(cont_B[2]),
        .I3(cont_B[3]),
        .O(\data_shift[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \data_shift[0]_i_6 
       (.I0(cont_B[5]),
        .I1(cont_B[4]),
        .I2(cont_B[7]),
        .I3(cont_B[6]),
        .O(\data_shift[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \data_shift[0]_i_7 
       (.I0(cont_B[9]),
        .I1(cont_B[8]),
        .I2(cont_B[11]),
        .I3(cont_B[10]),
        .O(\data_shift[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \data_shift[0]_i_8 
       (.I0(\cont_reg_n_0_[2] ),
        .I1(\cont_reg_n_0_[0] ),
        .I2(\cont_reg_n_0_[4] ),
        .I3(\cont_reg_n_0_[3] ),
        .O(\data_shift[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \data_shift[0]_i_9 
       (.I0(\cont_reg_n_0_[13] ),
        .I1(\cont_reg_n_0_[16] ),
        .O(\data_shift[0]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \data_shift[1]_i_1 
       (.I0(SR),
        .I1(data_shift[0]),
        .O(\^D [0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_shift[2]_i_1 
       (.I0(data_shift[1]),
        .I1(SR),
        .I2(Q[0]),
        .O(\^D [1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_shift[3]_i_1 
       (.I0(data_shift[2]),
        .I1(SR),
        .I2(Q[1]),
        .O(\^D [2]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_shift[4]_i_1 
       (.I0(data_shift[3]),
        .I1(SR),
        .I2(Q[2]),
        .O(\^D [3]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_shift[5]_i_1 
       (.I0(data_shift[4]),
        .I1(SR),
        .I2(Q[3]),
        .O(\^D [4]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_shift[6]_i_1 
       (.I0(data_shift[5]),
        .I1(SR),
        .I2(Q[4]),
        .O(\^D [5]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_shift[7]_i_1 
       (.I0(data_shift[6]),
        .I1(SR),
        .I2(Q[5]),
        .O(\^D [6]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_shift[8]_i_1 
       (.I0(data_shift[7]),
        .I1(SR),
        .I2(Q[6]),
        .O(\^D [7]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_shift[9]_i_1 
       (.I0(data_shift[8]),
        .I1(SR),
        .I2(Q[7]),
        .O(\^D [8]));
  LUT3 #(
    .INIT(8'h01)) 
    send_INST_0
       (.I0(\cont_reg_n_0_[1] ),
        .I1(send_INST_0_i_1_n_0),
        .I2(send_INST_0_i_2_n_0),
        .O(\FSM_sequential_state_send_reg[0] ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    send_INST_0_i_1
       (.I0(\cont_reg_n_0_[3] ),
        .I1(\cont_reg_n_0_[4] ),
        .I2(\cont_reg_n_0_[0] ),
        .I3(\cont_reg_n_0_[2] ),
        .I4(send_INST_0_i_3_n_0),
        .O(send_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    send_INST_0_i_2
       (.I0(\cont_reg_n_0_[16] ),
        .I1(\cont_reg_n_0_[13] ),
        .I2(send_INST_0_i_4_n_0),
        .I3(\cont_reg_n_0_[5] ),
        .I4(\cont_reg_n_0_[6] ),
        .O(send_INST_0_i_2_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    send_INST_0_i_3
       (.I0(\cont_reg_n_0_[17] ),
        .I1(\cont_reg_n_0_[11] ),
        .I2(\cont_reg_n_0_[7] ),
        .O(send_INST_0_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    send_INST_0_i_4
       (.I0(\cont_reg_n_0_[14] ),
        .I1(\cont_reg_n_0_[15] ),
        .I2(\cont_reg_n_0_[10] ),
        .I3(\cont_reg_n_0_[12] ),
        .I4(\cont_reg_n_0_[9] ),
        .I5(\cont_reg_n_0_[8] ),
        .O(send_INST_0_i_4_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
