# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.cache/wt [current_project]
set_property parent.project_path /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog {
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/sources_1/imports/new/div_frecuencias.vh
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/sources_1/imports/new/baudrate_list.vh
}
add_files /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.srcs/sources_1/bd/arch/arch.bd
set_property used_in_implementation false [get_files -all /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.srcs/sources_1/bd/arch/ip/arch_clk_wiz_0_0/arch_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.srcs/sources_1/bd/arch/ip/arch_clk_wiz_0_0/arch_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.srcs/sources_1/bd/arch/ip/arch_clk_wiz_0_0/arch_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.srcs/sources_1/bd/arch/arch_ooc.xdc]
set_property is_locked true [get_files /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.srcs/sources_1/bd/arch/arch.bd]

read_verilog -library xil_defaultlib -sv {
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/Mod_COM_pines_A/signal_gen_pin.sv
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/Mod_COM_pines_A/div_f_pin.sv
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/Mod_COM_pines_A/divisor_f.sv
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/Mod_COM_pines_A/pin_tx.sv
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/Mod_COM_pines_A/pin_rx.sv
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/Mod_COM_pines_A/pack_ext.sv
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/sources_1/imports/new/AD_driver.sv
}
read_verilog -library xil_defaultlib {
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/Mod_COM_pines_A/package_ext.v
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/sources_1/new/AD1_driver_v.v
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/sources_1/bd/SDC_CLL/ip/SDC_CLL_AD1_driver_v_0_2/synth/SDC_CLL_AD1_driver_v_0_2.v
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/sources_1/new/clk_box.v
  /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/sources_1/bd/SDC_CLL/ip/SDC_CLL_clk_box_0_0/synth/SDC_CLL_clk_box_0_0.v
  /home/mzvic/CePIA/CARGAS/Vivado/test1/test1.srcs/sources_1/bd/arch/hdl/arch_wrapper.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/constrs_1/imports/Mods/Arty_Master.xdc
set_property used_in_implementation false [get_files /home/mzvic/CePIA/CARGAS/Vivado/david_code/SDC_CLL/SDC_CLL.srcs/constrs_1/imports/Mods/Arty_Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top arch_wrapper -part xc7a35tcsg324-1


write_checkpoint -force -noxdef arch_wrapper.dcp

catch { report_utilization -file arch_wrapper_utilization_synth.rpt -pb arch_wrapper_utilization_synth.pb }
