set_property SRC_FILE_INFO {cfile:/home/mzvic/CePIA/CARGAS/test1/test1.srcs/sources_1/bd/arch/ip/arch_clk_wiz_0_0/arch_clk_wiz_0_0.xdc rfile:../../../test1.srcs/sources_1/bd/arch/ip/arch_clk_wiz_0_0/arch_clk_wiz_0_0.xdc id:1 order:EARLY scoped_inst:arch_i/clk_wiz_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/mzvic/CePIA/CARGAS/david_code/SDC_CLL/SDC_CLL.srcs/constrs_1/imports/Mods/Arty_Master.xdc rfile:../../../../david_code/SDC_CLL/SDC_CLL.srcs/constrs_1/imports/Mods/Arty_Master.xdc id:2} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
set_property src_info {type:XDC file:2 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
set_property src_info {type:XDC file:2 line:79 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports JD_0]
set_property src_info {type:XDC file:2 line:80 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN D3 IOSTANDARD LVCMOS33} [get_ports JD_1]
set_property src_info {type:XDC file:2 line:81 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS33} [get_ports JD_2]
set_property src_info {type:XDC file:2 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports JD_3]
set_property src_info {type:XDC file:2 line:93 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33} [get_ports uart_txd_out]
set_property src_info {type:XDC file:2 line:94 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN A9 IOSTANDARD LVCMOS33} [get_ports uart_rxd_in]