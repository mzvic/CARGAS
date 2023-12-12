//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Tue Nov 29 11:29:33 2022
//Host        : DESKTOP-0L13E69 running 64-bit major release  (build 9200)
//Command     : generate_target SDC_CLL.bd
//Design      : SDC_CLL
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SDC_CLL,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SDC_CLL,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=12,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "SDC_CLL.hwdef" *) 
module SDC_CLL
   (JB_0,
    JB_4,
    JB_5,
    JB_6,
    JB_7,
    JC_0,
    JC_1,
    JC_2,
    JC_3,
    JC_4,
    JC_5,
    JC_6,
    JC_7,
    JD_0,
    JD_1,
    JD_2,
    JD_3,
    JD_4,
    JD_5,
    JD_6,
    JD_7,
    clk,
    led1,
    led4,
    led_01,
    uart_rxd_in,
    uart_txd_out);
  output JB_0;
  output JB_4;
  input JB_5;
  input JB_6;
  output JB_7;
  output JC_0;
  input JC_1;
  input JC_2;
  output JC_3;
  output JC_4;
  input JC_5;
  input JC_6;
  output JC_7;
  output JD_0;
  input JD_1;
  input JD_2;
  output JD_3;
  output JD_4;
  input JD_5;
  input JD_6;
  output JD_7;
  input clk;
  output [2:0]led1;
  output [2:0]led4;
  output led_01;
  input uart_rxd_in;
  output uart_txd_out;

  wire AD1_driver_v_0_CS;
  wire AD1_driver_v_0_SCLK;
  wire [11:0]AD1_driver_v_0_data0;
  wire [11:0]AD1_driver_v_0_data1;
  wire AD1_driver_v_1_CS;
  wire AD1_driver_v_1_SCLK;
  wire [11:0]AD1_driver_v_1_data0;
  wire [11:0]AD1_driver_v_1_data1;
  wire AD1_driver_v_2_CS;
  wire AD1_driver_v_2_SCLK;
  wire [11:0]AD1_driver_v_2_data0;
  wire [11:0]AD1_driver_v_2_data1;
  wire AD1_driver_v_3_CS;
  wire AD1_driver_v_3_SCLK;
  wire [11:0]AD1_driver_v_3_data0;
  wire [11:0]AD1_driver_v_3_data1;
  wire AD1_driver_v_4_CS;
  wire AD1_driver_v_4_SCLK;
  wire [11:0]AD1_driver_v_4_data0;
  wire [11:0]AD1_driver_v_4_data1;
  wire D0_1;
  wire D0_1_1;
  wire D0_2;
  wire D0_3;
  wire D0_4;
  wire D1_1;
  wire D1_1_1;
  wire D1_2;
  wire D1_3;
  wire D1_4;
  wire PWM_0_pin_pwm;
  wire [13:0]alarm_HT_v_0_HT_on;
  wire alarm_HT_v_0_stop_out;
  wire [27:0]alarm_HT_v_0_yT1_1;
  wire [27:0]alarm_HT_v_0_yT1_2;
  wire [27:0]alarm_HT_v_0_yT1_3;
  wire [27:0]alarm_HT_v_0_yT2_1;
  wire [27:0]alarm_HT_v_0_yT2_2;
  wire [27:0]alarm_HT_v_0_yT2_3;
  wire [27:0]alarm_HT_v_0_yT3_1;
  wire [27:0]alarm_HT_v_0_yT3_2;
  wire [27:0]alarm_HT_v_0_yT3_3;
  wire clk_1;
  wire clk_box_0_divClk1;
  wire clk_box_0_divClk2;
  wire clk_box_0_divClk3;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_clk_out3;
  wire clk_wiz_0_clk_out4;
  wire [13:0]fixedPoint_0_sal_1;
  wire [13:0]fixedPoint_0_sal_2;
  wire [13:0]fixedPoint_0_sal_3;
  wire [13:0]fixedPoint_0_sal_4;
  wire [13:0]fixedPoint_0_sal_5;
  wire [13:0]fixedPoint_0_sal_6;
  wire [13:0]fixedPoint_0_sal_7;
  wire [13:0]fixedPoint_0_sal_8;
  wire [13:0]fixedPoint_0_sal_9;
  wire [20:0]package_ext_0_out_01;
  wire [20:0]package_ext_0_out_02;
  wire [20:0]package_ext_0_out_03;
  wire [20:0]package_ext_0_out_04;
  wire [20:0]package_ext_0_out_05;
  wire [20:0]package_ext_0_out_06;
  wire [20:0]package_ext_0_out_07;
  wire [20:0]package_ext_0_out_08;
  wire [20:0]package_ext_0_out_09;
  wire [20:0]package_ext_0_out_10;
  wire [20:0]package_ext_0_out_11;
  wire [20:0]package_ext_0_out_12;
  wire [20:0]package_ext_0_out_13;
  wire [20:0]package_ext_0_out_14;
  wire [20:0]package_ext_0_out_15;
  wire [20:0]package_ext_0_out_16;
  wire package_ext_0_send;
  wire package_ext_0_tx;
  wire [27:0]pre_process_0_SP_1;
  wire [27:0]pre_process_0_Td_1;
  wire [27:0]pre_process_0_Ti_1;
  wire [2:0]pre_process_0_ind_config;
  wire [27:0]pre_process_0_kc_1;
  wire [2:0]pre_process_0_modo_1;
  wire [27:0]pre_process_0_yT_1;
  wire [9:0]process_v_0_CV;
  wire process_v_0_clk_tm;
  wire [2:0]process_v_0_mode_ind;
  wire rx_1;

  assign D0_1 = JD_1;
  assign D0_1_1 = JC_5;
  assign D0_2 = JC_1;
  assign D0_3 = JD_5;
  assign D0_4 = JB_5;
  assign D1_1 = JD_2;
  assign D1_1_1 = JC_6;
  assign D1_2 = JC_2;
  assign D1_3 = JD_6;
  assign D1_4 = JB_6;
  assign JB_0 = PWM_0_pin_pwm;
  assign JB_4 = AD1_driver_v_4_CS;
  assign JB_7 = AD1_driver_v_4_SCLK;
  assign JC_0 = AD1_driver_v_1_CS;
  assign JC_3 = AD1_driver_v_1_SCLK;
  assign JC_4 = AD1_driver_v_3_CS;
  assign JC_7 = AD1_driver_v_3_SCLK;
  assign JD_0 = AD1_driver_v_0_CS;
  assign JD_3 = AD1_driver_v_0_SCLK;
  assign JD_4 = AD1_driver_v_2_CS;
  assign JD_7 = AD1_driver_v_2_SCLK;
  assign clk_1 = clk;
  assign led1[2:0] = process_v_0_mode_ind;
  assign led4[2:0] = pre_process_0_ind_config;
  assign led_01 = process_v_0_clk_tm;
  assign rx_1 = uart_rxd_in;
  assign uart_txd_out = package_ext_0_tx;
  SDC_CLL_AD1_driver_v_0_2 AD1_driver_v_0
       (.CS(AD1_driver_v_0_CS),
        .D0(D0_1),
        .D1(D1_1),
        .SCLK(AD1_driver_v_0_SCLK),
        .clk(clk_wiz_0_clk_out2),
        .data0(AD1_driver_v_0_data0),
        .data1(AD1_driver_v_0_data1),
        .divClk(clk_box_0_divClk1),
        .start(package_ext_0_send));
  SDC_CLL_AD1_driver_v_1_0 AD1_driver_v_1
       (.CS(AD1_driver_v_1_CS),
        .D0(D0_2),
        .D1(D1_2),
        .SCLK(AD1_driver_v_1_SCLK),
        .clk(clk_wiz_0_clk_out2),
        .data0(AD1_driver_v_1_data0),
        .data1(AD1_driver_v_1_data1),
        .divClk(clk_box_0_divClk1),
        .start(package_ext_0_send));
  SDC_CLL_AD1_driver_v_2_0 AD1_driver_v_2
       (.CS(AD1_driver_v_2_CS),
        .D0(D0_3),
        .D1(D1_3),
        .SCLK(AD1_driver_v_2_SCLK),
        .clk(clk_wiz_0_clk_out2),
        .data0(AD1_driver_v_2_data0),
        .data1(AD1_driver_v_2_data1),
        .divClk(clk_box_0_divClk1),
        .start(package_ext_0_send));
  SDC_CLL_AD1_driver_v_1_1 AD1_driver_v_3
       (.CS(AD1_driver_v_3_CS),
        .D0(D0_1_1),
        .D1(D1_1_1),
        .SCLK(AD1_driver_v_3_SCLK),
        .clk(clk_wiz_0_clk_out2),
        .data0(AD1_driver_v_3_data0),
        .data1(AD1_driver_v_3_data1),
        .divClk(clk_box_0_divClk1),
        .start(package_ext_0_send));
  SDC_CLL_AD1_driver_v_3_0 AD1_driver_v_4
       (.CS(AD1_driver_v_4_CS),
        .D0(D0_4),
        .D1(D1_4),
        .SCLK(AD1_driver_v_4_SCLK),
        .clk(clk_wiz_0_clk_out2),
        .data0(AD1_driver_v_4_data0),
        .data1(AD1_driver_v_4_data1),
        .divClk(clk_box_0_divClk3),
        .start(clk_box_0_divClk2));
  SDC_CLL_PWM_0_0 PWM_0
       (.clk(clk_wiz_0_clk_out1),
        .duty(process_v_0_CV),
        .pin_pwm(PWM_0_pin_pwm),
        .sync_sin(AD1_driver_v_4_data1));
  SDC_CLL_alarm_HT_v_0_0 alarm_HT_v_0
       (.HT_on(alarm_HT_v_0_HT_on),
        .clk(clk_wiz_0_clk_out4),
        .start(package_ext_0_send),
        .stop_in(package_ext_0_out_15),
        .stop_out(alarm_HT_v_0_stop_out),
        .yT1_1(alarm_HT_v_0_yT1_1),
        .yT1_2(alarm_HT_v_0_yT1_2),
        .yT1_3(alarm_HT_v_0_yT1_3),
        .yT2_1(alarm_HT_v_0_yT2_1),
        .yT2_2(alarm_HT_v_0_yT2_2),
        .yT2_3(alarm_HT_v_0_yT2_3),
        .yT3_1(alarm_HT_v_0_yT3_1),
        .yT3_2(alarm_HT_v_0_yT3_2),
        .yT3_3(alarm_HT_v_0_yT3_3),
        .yk1_1(AD1_driver_v_0_data0),
        .yk1_2(AD1_driver_v_2_data1),
        .yk1_3(AD1_driver_v_3_data0),
        .yk2_1(AD1_driver_v_0_data1),
        .yk2_2(AD1_driver_v_1_data0),
        .yk2_3(AD1_driver_v_3_data1),
        .yk3_1(AD1_driver_v_2_data0),
        .yk3_2(AD1_driver_v_1_data1),
        .yk3_3(AD1_driver_v_4_data0));
  SDC_CLL_clk_box_0_0 clk_box_0
       (.clk(clk_wiz_0_clk_out2),
        .divClk1(clk_box_0_divClk1),
        .divClk2(clk_box_0_divClk2),
        .divClk3(clk_box_0_divClk3));
  SDC_CLL_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2),
        .clk_out3(clk_wiz_0_clk_out3),
        .clk_out4(clk_wiz_0_clk_out4));
  SDC_CLL_fixedPoint_0_0 fixedPoint_0
       (.ent_1(alarm_HT_v_0_yT1_1),
        .ent_2(alarm_HT_v_0_yT2_1),
        .ent_3(alarm_HT_v_0_yT3_1),
        .ent_4(alarm_HT_v_0_yT1_2),
        .ent_5(alarm_HT_v_0_yT2_2),
        .ent_6(alarm_HT_v_0_yT3_2),
        .ent_7(alarm_HT_v_0_yT1_3),
        .ent_8(alarm_HT_v_0_yT2_3),
        .ent_9(alarm_HT_v_0_yT3_3),
        .sal_1(fixedPoint_0_sal_1),
        .sal_2(fixedPoint_0_sal_2),
        .sal_3(fixedPoint_0_sal_3),
        .sal_4(fixedPoint_0_sal_4),
        .sal_5(fixedPoint_0_sal_5),
        .sal_6(fixedPoint_0_sal_6),
        .sal_7(fixedPoint_0_sal_7),
        .sal_8(fixedPoint_0_sal_8),
        .sal_9(fixedPoint_0_sal_9));
  SDC_CLL_package_ext_0_1 package_ext_0
       (.clk(clk_wiz_0_clk_out3),
        .in_01(fixedPoint_0_sal_1),
        .in_02(fixedPoint_0_sal_2),
        .in_03(fixedPoint_0_sal_3),
        .in_04(fixedPoint_0_sal_4),
        .in_05(fixedPoint_0_sal_5),
        .in_06(fixedPoint_0_sal_6),
        .in_07(fixedPoint_0_sal_7),
        .in_08(fixedPoint_0_sal_8),
        .in_09(fixedPoint_0_sal_9),
        .in_10(process_v_0_CV),
        .in_11({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_12({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_13(alarm_HT_v_0_HT_on),
        .out_01(package_ext_0_out_01),
        .out_02(package_ext_0_out_02),
        .out_03(package_ext_0_out_03),
        .out_04(package_ext_0_out_04),
        .out_05(package_ext_0_out_05),
        .out_06(package_ext_0_out_06),
        .out_07(package_ext_0_out_07),
        .out_08(package_ext_0_out_08),
        .out_09(package_ext_0_out_09),
        .out_10(package_ext_0_out_10),
        .out_11(package_ext_0_out_11),
        .out_12(package_ext_0_out_12),
        .out_13(package_ext_0_out_13),
        .out_14(package_ext_0_out_14),
        .out_15(package_ext_0_out_15),
        .out_16(package_ext_0_out_16),
        .rx(rx_1),
        .send(package_ext_0_send),
        .tx(package_ext_0_tx));
  SDC_CLL_pre_process_0_0 pre_process_0
       (.SP1(package_ext_0_out_01),
        .SP2(package_ext_0_out_02),
        .SP3(package_ext_0_out_03[13:0]),
        .SP_1(pre_process_0_SP_1),
        .Td_1(pre_process_0_Td_1),
        .Ti_1(pre_process_0_Ti_1),
        .clk(clk_wiz_0_clk_out4),
        .config_mode(package_ext_0_out_16),
        .ind_config(pre_process_0_ind_config),
        .kc_1(pre_process_0_kc_1),
        .modo(package_ext_0_out_13),
        .modo_1(pre_process_0_modo_1),
        .param1_1(package_ext_0_out_04),
        .param1_2(package_ext_0_out_07),
        .param1_3(package_ext_0_out_10),
        .param2_1(package_ext_0_out_05),
        .param2_2(package_ext_0_out_08),
        .param2_3(package_ext_0_out_11),
        .param3_1(package_ext_0_out_06),
        .param3_2(package_ext_0_out_09),
        .param3_3(package_ext_0_out_12),
        .sensor(package_ext_0_out_14),
        .stop(alarm_HT_v_0_stop_out),
        .yT1_1(alarm_HT_v_0_yT1_1),
        .yT1_2(alarm_HT_v_0_yT1_2),
        .yT1_3(alarm_HT_v_0_yT1_3),
        .yT2_1(alarm_HT_v_0_yT2_1),
        .yT2_2(alarm_HT_v_0_yT2_2),
        .yT2_3(alarm_HT_v_0_yT2_3),
        .yT3_1(alarm_HT_v_0_yT3_1),
        .yT3_2(alarm_HT_v_0_yT3_2),
        .yT3_3(alarm_HT_v_0_yT3_3),
        .yT_1(pre_process_0_yT_1));
  SDC_CLL_process_v_0_0 process_v_0
       (.CV(process_v_0_CV),
        .MODO(pre_process_0_modo_1),
        .SP(pre_process_0_SP_1),
        .clk(clk_wiz_0_clk_out4),
        .ind_ctrl(process_v_0_clk_tm),
        .mode_ind(process_v_0_mode_ind),
        .param1(pre_process_0_kc_1),
        .param2(pre_process_0_Ti_1),
        .param3(pre_process_0_Td_1),
        .yk(pre_process_0_yT_1));
endmodule
