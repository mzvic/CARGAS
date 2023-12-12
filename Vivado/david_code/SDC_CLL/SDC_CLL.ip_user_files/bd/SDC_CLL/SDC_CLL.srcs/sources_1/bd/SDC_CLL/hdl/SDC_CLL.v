//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Fri Sep 14 10:53:27 2018
//Host        : DESKTOP-VFDGOU2 running 64-bit major release  (build 9200)
//Command     : generate_target SDC_CLL.bd
//Design      : SDC_CLL
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SDC_CLL,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SDC_CLL,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=7,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "SDC_CLL.hwdef" *) 
module SDC_CLL
   (JA_0,
    JA_1,
    JA_2,
    JA_3,
    JB_0,
    JB_1,
    JB_2,
    JD_0,
    JD_1,
    JD_2,
    JD_3,
    clk,
    led,
    led_ind,
    uart_rxd_in,
    uart_txd_out);
  output JA_0;
  input JA_1;
  input JA_2;
  output JA_3;
  output JB_0;
  output JB_1;
  output JB_2;
  output JD_0;
  input JD_1;
  input JD_2;
  output JD_3;
  input clk;
  output [2:0]led;
  output led_ind;
  input uart_rxd_in;
  output uart_txd_out;

  wire AD1_driver_v_0_CS;
  wire AD1_driver_v_0_SCLK;
  wire [11:0]AD1_driver_v_0_data0;
  wire AD1_driver_v_1_CS;
  wire AD1_driver_v_1_SCLK;
  wire [11:0]AD1_driver_v_1_data0;
  wire D0_1;
  wire D0_2;
  wire D1_1;
  wire D1_2;
  wire PWM_0_aux1;
  wire PWM_0_pin_pwm;
  wire PWM_0_sync_out;
  wire [27:0]bits2temp2_0_yT;
  wire clk_1;
  wire clk_box_0_divClk1;
  wire clk_box_0_divClk2;
  wire clk_box_0_divClk3;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_clk_out4;
  wire clk_wiz_0_clk_out5;
  wire clk_wiz_0_clk_out6;
  wire clk_wiz_0_clk_out7;
  wire [2:0]package_0_MODO;
  wire [15:0]package_0_SP;
  wire [15:0]package_0_param1;
  wire [15:0]package_0_param2;
  wire [15:0]package_0_param3;
  wire package_0_send;
  wire package_0_tx;
  wire [9:0]process_v_0_CV;
  wire process_v_0_clk_tm;
  wire [2:0]process_v_0_mode_ind;
  wire process_v_0_read_data;
  wire uart_rxd_in_1;

  assign D0_1 = JD_1;
  assign D0_2 = JA_1;
  assign D1_1 = JD_2;
  assign D1_2 = JA_2;
  assign JA_0 = AD1_driver_v_1_CS;
  assign JA_3 = AD1_driver_v_1_SCLK;
  assign JB_0 = PWM_0_pin_pwm;
  assign JB_1 = PWM_0_aux1;
  assign JB_2 = PWM_0_sync_out;
  assign JD_0 = AD1_driver_v_0_CS;
  assign JD_3 = AD1_driver_v_0_SCLK;
  assign clk_1 = clk;
  assign led[2:0] = process_v_0_mode_ind;
  assign led_ind = process_v_0_clk_tm;
  assign uart_rxd_in_1 = uart_rxd_in;
  assign uart_txd_out = package_0_tx;
  SDC_CLL_AD1_driver_v_0_2 AD1_driver_v_0
       (.CS(AD1_driver_v_0_CS),
        .D0(D0_1),
        .D1(D1_1),
        .SCLK(AD1_driver_v_0_SCLK),
        .clk(clk_wiz_0_clk_out5),
        .data0(AD1_driver_v_0_data0),
        .divClk(clk_box_0_divClk1),
        .start(package_0_send));
  SDC_CLL_AD1_driver_v_1_0 AD1_driver_v_1
       (.CS(AD1_driver_v_1_CS),
        .D0(D0_2),
        .D1(D1_2),
        .SCLK(AD1_driver_v_1_SCLK),
        .clk(clk_wiz_0_clk_out6),
        .data0(AD1_driver_v_1_data0),
        .divClk(clk_box_0_divClk3),
        .start(clk_box_0_divClk2));
  SDC_CLL_PWM_0_0 PWM_0
       (.aux1(PWM_0_aux1),
        .clk(clk_wiz_0_clk_out2),
        .duty(process_v_0_CV),
        .pin_pwm(PWM_0_pin_pwm),
        .sync_out(PWM_0_sync_out),
        .sync_sin(AD1_driver_v_1_data0));
  SDC_CLL_bits2temp2_0_0 bits2temp2_0
       (.clk(clk_wiz_0_clk_out4),
        .read_data(process_v_0_read_data),
        .yT(bits2temp2_0_yT),
        .yk(AD1_driver_v_0_data0));
  SDC_CLL_clk_box_0_0 clk_box_0
       (.clk(clk_wiz_0_clk_out6),
        .divClk1(clk_box_0_divClk1),
        .divClk2(clk_box_0_divClk2),
        .divClk3(clk_box_0_divClk3));
  SDC_CLL_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2),
        .clk_out4(clk_wiz_0_clk_out4),
        .clk_out5(clk_wiz_0_clk_out5),
        .clk_out6(clk_wiz_0_clk_out6),
        .clk_out7(clk_wiz_0_clk_out7));
  SDC_CLL_package_0_1 package_0
       (.CV(process_v_0_CV),
        .MODO(package_0_MODO),
        .PV1(AD1_driver_v_0_data0),
        .PV2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PV3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SP(package_0_SP),
        .clk(clk_wiz_0_clk_out1),
        .clk_2(clk_wiz_0_clk_out7),
        .param1(package_0_param1),
        .param2(package_0_param2),
        .param3(package_0_param3),
        .rx(uart_rxd_in_1),
        .send(package_0_send),
        .tx(package_0_tx));
  SDC_CLL_process_v_0_0 process_v_0
       (.CV(process_v_0_CV),
        .MODO(package_0_MODO),
        .SP(package_0_SP),
        .clk(clk_wiz_0_clk_out1),
        .ind_ctrl(process_v_0_clk_tm),
        .mode_ind(process_v_0_mode_ind),
        .param1(package_0_param1),
        .param2(package_0_param2),
        .param3(package_0_param3),
        .read_data(process_v_0_read_data),
        .yk(bits2temp2_0_yT));
endmodule
