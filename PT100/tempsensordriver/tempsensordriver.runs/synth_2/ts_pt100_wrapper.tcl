# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_param xicom.use_bitstream_version_check 0
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.cache/wt [current_project]
set_property parent.project_path /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/div_frecuencias.vh
add_files /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/sources_1/bd/ts_pt100/ts_pt100.bd
set_property used_in_implementation false [get_files -all /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/sources_1/bd/ts_pt100/ip/ts_pt100_clk_wiz_0_0/ts_pt100_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/sources_1/bd/ts_pt100/ip/ts_pt100_clk_wiz_0_0/ts_pt100_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/sources_1/bd/ts_pt100/ip/ts_pt100_clk_wiz_0_0/ts_pt100_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/sources_1/bd/ts_pt100/ts_pt100_ooc.xdc]
set_property is_locked true [get_files /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/sources_1/bd/ts_pt100/ts_pt100.bd]

read_verilog -library xil_defaultlib -sv {
  {/home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/David Module/divisor_f.sv}
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/negar.sv
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/lowpass_filter.sv
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/alarm_HT.sv
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/AD_driver.sv
  {/home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/David Module/signal_gen_pin.sv}
  {/home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/David Module/div_f_pin.sv}
  {/home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/David Module/pin_tx.sv}
  {/home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/David Module/pin_rx.sv}
  {/home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/David Module/pack_ext.sv}
}
read_verilog -library xil_defaultlib {
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/qtwosComp.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/qdiv.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/qmult.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/qadd.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/div_v.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/bits2temp1.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/alarm_HT_v.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/AD1_driver_v.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/fixedPoint.v
  {/home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/David Module/package_ext.v}
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/pt100/clk_box.v
  /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/sources_1/bd/ts_pt100/hdl/ts_pt100_wrapper.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/constrs_1/imports/digilent-xdc-master/Arty-A7-100-Master.xdc
set_property used_in_implementation false [get_files /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.srcs/constrs_1/imports/digilent-xdc-master/Arty-A7-100-Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top ts_pt100_wrapper -part xc7a35tcsg324-1


write_checkpoint -force -noxdef ts_pt100_wrapper.dcp

catch { report_utilization -file ts_pt100_wrapper_utilization_synth.rpt -pb ts_pt100_wrapper_utilization_synth.pb }
