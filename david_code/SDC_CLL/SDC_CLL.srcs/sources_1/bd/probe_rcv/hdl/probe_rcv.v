//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
//Date        : Wed Aug 22 18:36:46 2018
//Host        : DESKTOP-VFDGOU2 running 64-bit major release  (build 9200)
//Command     : generate_target probe_rcv.bd
//Design      : probe_rcv
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "probe_rcv,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=probe_rcv,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "probe_rcv.hwdef" *) 
module probe_rcv
   (JB_0,
    clk,
    uart_rxd_in,
    uart_txd_out);
  output JB_0;
  input clk;
  input uart_rxd_in;
  output uart_txd_out;

  wire PWM_0_pin_pwm;
  wire PWM_0_read_duty;
  wire clk_1;
  wire [2:0]package_0_MODO;
  wire [15:0]package_0_SP;
  wire package_0_data_ready;
  wire [15:0]package_0_param1;
  wire [15:0]package_0_param2;
  wire [15:0]package_0_param3;
  wire package_0_tx;
  wire [9:0]process_v_0_CV;
  wire process_v_0_ctrl_ready;
  wire process_v_0_read_data;
  wire rx_1;
  wire [15:0]syncro_v_0_data_out1;
  wire [2:0]syncro_v_0_data_out2;
  wire [15:0]syncro_v_0_data_out3;
  wire [15:0]syncro_v_0_data_out4;
  wire [15:0]syncro_v_0_data_out5;
  wire [9:0]syncro_v_1_data_out6;

  assign JB_0 = PWM_0_pin_pwm;
  assign clk_1 = clk;
  assign rx_1 = uart_rxd_in;
  assign uart_txd_out = package_0_tx;
  probe_rcv_PWM_0_0 PWM_0
       (.clk(clk_1),
        .duty(syncro_v_1_data_out6),
        .pin_pwm(PWM_0_pin_pwm),
        .read_duty(PWM_0_read_duty),
        .sync_sin({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  probe_rcv_package_0_0 package_0
       (.CV({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MODO(package_0_MODO),
        .PV1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PV2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PV3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SP(package_0_SP),
        .clk(clk_1),
        .clk_2(1'b0),
        .data_ready(package_0_data_ready),
        .param1(package_0_param1),
        .param2(package_0_param2),
        .param3(package_0_param3),
        .rx(rx_1),
        .tx(package_0_tx));
  probe_rcv_process_v_0_0 process_v_0
       (.CV(process_v_0_CV),
        .MODO(syncro_v_0_data_out2),
        .SP(syncro_v_0_data_out1),
        .clk(clk_1),
        .ctrl_ready(process_v_0_ctrl_ready),
        .param1(syncro_v_0_data_out3),
        .param2(syncro_v_0_data_out4),
        .param3(syncro_v_0_data_out5),
        .read_data(process_v_0_read_data),
        .yT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  probe_rcv_syncro_v_0_0 syncro_v_0
       (.clk(clk_1),
        .data_in1(package_0_SP),
        .data_in2(package_0_MODO),
        .data_in3(package_0_param1),
        .data_in4(package_0_param2),
        .data_in5(package_0_param3),
        .data_in6({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .data_out1(syncro_v_0_data_out1),
        .data_out2(syncro_v_0_data_out2),
        .data_out3(syncro_v_0_data_out3),
        .data_out4(syncro_v_0_data_out4),
        .data_out5(syncro_v_0_data_out5),
        .sync_in(package_0_data_ready),
        .sync_out(process_v_0_read_data));
  probe_rcv_syncro_v_1_0 syncro_v_1
       (.clk(package_0_tx),
        .data_in1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .data_in2({1'b0,1'b0,1'b0}),
        .data_in3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .data_in4({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .data_in5({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .data_in6(process_v_0_CV),
        .data_out6(syncro_v_1_data_out6),
        .sync_in(process_v_0_ctrl_ready),
        .sync_out(PWM_0_read_duty));
endmodule
