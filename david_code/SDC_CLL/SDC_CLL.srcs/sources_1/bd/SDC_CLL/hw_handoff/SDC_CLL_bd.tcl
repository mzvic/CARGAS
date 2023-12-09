
################################################################
# This is a generated script based on design: SDC_CLL
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source SDC_CLL_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# AD1_driver_v, AD1_driver_v, AD1_driver_v, AD1_driver_v, AD1_driver_v, PWM, alarm_HT_v, clk_box, fixedPoint, package_ext, pre_process, process_v

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35ticsg324-1L
}


# CHANGE DESIGN NAME HERE
set design_name SDC_CLL

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set JB_0 [ create_bd_port -dir O JB_0 ]
  set JB_4 [ create_bd_port -dir O JB_4 ]
  set JB_5 [ create_bd_port -dir I JB_5 ]
  set JB_6 [ create_bd_port -dir I JB_6 ]
  set JB_7 [ create_bd_port -dir O JB_7 ]
  set JC_0 [ create_bd_port -dir O JC_0 ]
  set JC_1 [ create_bd_port -dir I JC_1 ]
  set JC_2 [ create_bd_port -dir I JC_2 ]
  set JC_3 [ create_bd_port -dir O JC_3 ]
  set JC_4 [ create_bd_port -dir O JC_4 ]
  set JC_5 [ create_bd_port -dir I JC_5 ]
  set JC_6 [ create_bd_port -dir I JC_6 ]
  set JC_7 [ create_bd_port -dir O JC_7 ]
  set JD_0 [ create_bd_port -dir O JD_0 ]
  set JD_1 [ create_bd_port -dir I JD_1 ]
  set JD_2 [ create_bd_port -dir I JD_2 ]
  set JD_3 [ create_bd_port -dir O JD_3 ]
  set JD_4 [ create_bd_port -dir O JD_4 ]
  set JD_5 [ create_bd_port -dir I JD_5 ]
  set JD_6 [ create_bd_port -dir I JD_6 ]
  set JD_7 [ create_bd_port -dir O JD_7 ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set led1 [ create_bd_port -dir O -from 2 -to 0 led1 ]
  set led4 [ create_bd_port -dir O -from 2 -to 0 led4 ]
  set led_01 [ create_bd_port -dir O led_01 ]
  set uart_rxd_in [ create_bd_port -dir I uart_rxd_in ]
  set uart_txd_out [ create_bd_port -dir O uart_txd_out ]

  # Create instance: AD1_driver_v_0, and set properties
  set block_name AD1_driver_v
  set block_cell_name AD1_driver_v_0
  if { [catch {set AD1_driver_v_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AD1_driver_v_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: AD1_driver_v_1, and set properties
  set block_name AD1_driver_v
  set block_cell_name AD1_driver_v_1
  if { [catch {set AD1_driver_v_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AD1_driver_v_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: AD1_driver_v_2, and set properties
  set block_name AD1_driver_v
  set block_cell_name AD1_driver_v_2
  if { [catch {set AD1_driver_v_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AD1_driver_v_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: AD1_driver_v_3, and set properties
  set block_name AD1_driver_v
  set block_cell_name AD1_driver_v_3
  if { [catch {set AD1_driver_v_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AD1_driver_v_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: AD1_driver_v_4, and set properties
  set block_name AD1_driver_v
  set block_cell_name AD1_driver_v_4
  if { [catch {set AD1_driver_v_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AD1_driver_v_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PWM_0, and set properties
  set block_name PWM
  set block_cell_name PWM_0
  if { [catch {set PWM_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PWM_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: alarm_HT_v_0, and set properties
  set block_name alarm_HT_v
  set block_cell_name alarm_HT_v_0
  if { [catch {set alarm_HT_v_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $alarm_HT_v_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_box_0, and set properties
  set block_name clk_box
  set block_cell_name clk_box_0
  if { [catch {set clk_box_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $clk_box_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
CONFIG.RATE1 {6} \
CONFIG.RATE2 {204} \
CONFIG.RATE3 {6} \
 ] $clk_box_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_DRIVES {BUFG} \
CONFIG.CLKOUT1_JITTER {254.384} \
CONFIG.CLKOUT1_PHASE_ERROR {300.046} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {60} \
CONFIG.CLKOUT1_REQUESTED_PHASE {0} \
CONFIG.CLKOUT1_USED {true} \
CONFIG.CLKOUT2_DRIVES {BUFG} \
CONFIG.CLKOUT2_JITTER {254.384} \
CONFIG.CLKOUT2_PHASE_ERROR {300.046} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {60} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_DRIVES {BUFG} \
CONFIG.CLKOUT3_JITTER {254.384} \
CONFIG.CLKOUT3_PHASE_ERROR {300.046} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {60} \
CONFIG.CLKOUT3_USED {true} \
CONFIG.CLKOUT4_DRIVES {BUFG} \
CONFIG.CLKOUT4_JITTER {345.967} \
CONFIG.CLKOUT4_PHASE_ERROR {300.046} \
CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {10} \
CONFIG.CLKOUT4_USED {true} \
CONFIG.CLKOUT5_DRIVES {BUFG} \
CONFIG.CLKOUT5_JITTER {345.967} \
CONFIG.CLKOUT5_PHASE_ERROR {300.046} \
CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {10} \
CONFIG.CLKOUT5_USED {false} \
CONFIG.CLKOUT6_DRIVES {BUFG} \
CONFIG.CLKOUT6_JITTER {137.681} \
CONFIG.CLKOUT6_PHASE_ERROR {105.461} \
CONFIG.CLKOUT6_REQUESTED_OUT_FREQ {300} \
CONFIG.CLKOUT6_USED {false} \
CONFIG.CLKOUT7_DRIVES {BUFG} \
CONFIG.CLKOUT7_JITTER {137.681} \
CONFIG.CLKOUT7_PHASE_ERROR {105.461} \
CONFIG.CLKOUT7_REQUESTED_OUT_FREQ {6.4512} \
CONFIG.CLKOUT7_USED {false} \
CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} \
CONFIG.MMCM_CLKFBOUT_MULT_F {51.000} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {17.000} \
CONFIG.MMCM_CLKOUT0_PHASE {0.000} \
CONFIG.MMCM_CLKOUT1_DIVIDE {17} \
CONFIG.MMCM_CLKOUT2_DIVIDE {17} \
CONFIG.MMCM_CLKOUT3_DIVIDE {102} \
CONFIG.MMCM_CLKOUT4_DIVIDE {1} \
CONFIG.MMCM_CLKOUT5_DIVIDE {1} \
CONFIG.MMCM_CLKOUT6_DIVIDE {1} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.MMCM_DIVCLK_DIVIDE {5} \
CONFIG.NUM_OUT_CLKS {4} \
CONFIG.PRIMITIVE {MMCM} \
CONFIG.USE_LOCKED {false} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_0

  # Create instance: fixedPoint_0, and set properties
  set block_name fixedPoint
  set block_cell_name fixedPoint_0
  if { [catch {set fixedPoint_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $fixedPoint_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: package_ext_0, and set properties
  set block_name package_ext
  set block_cell_name package_ext_0
  if { [catch {set package_ext_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $package_ext_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
CONFIG.BAUD {3126} \
CONFIG.SEND_RATE {133280} \
 ] $package_ext_0

  # Create instance: pre_process_0, and set properties
  set block_name pre_process
  set block_cell_name pre_process_0
  if { [catch {set pre_process_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pre_process_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: process_v_0, and set properties
  set block_name process_v
  set block_cell_name process_v_0
  if { [catch {set process_v_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $process_v_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net AD1_driver_v_0_CS [get_bd_ports JD_0] [get_bd_pins AD1_driver_v_0/CS]
  connect_bd_net -net AD1_driver_v_0_SCLK [get_bd_ports JD_3] [get_bd_pins AD1_driver_v_0/SCLK]
  connect_bd_net -net AD1_driver_v_0_data0 [get_bd_pins AD1_driver_v_0/data0] [get_bd_pins alarm_HT_v_0/yk1_1]
  connect_bd_net -net AD1_driver_v_0_data1 [get_bd_pins AD1_driver_v_0/data1] [get_bd_pins alarm_HT_v_0/yk2_1]
  connect_bd_net -net AD1_driver_v_1_CS [get_bd_ports JC_0] [get_bd_pins AD1_driver_v_1/CS]
  connect_bd_net -net AD1_driver_v_1_SCLK [get_bd_ports JC_3] [get_bd_pins AD1_driver_v_1/SCLK]
  connect_bd_net -net AD1_driver_v_1_data0 [get_bd_pins AD1_driver_v_1/data0] [get_bd_pins alarm_HT_v_0/yk2_2]
  connect_bd_net -net AD1_driver_v_1_data1 [get_bd_pins AD1_driver_v_1/data1] [get_bd_pins alarm_HT_v_0/yk3_2]
  connect_bd_net -net AD1_driver_v_2_CS [get_bd_ports JD_4] [get_bd_pins AD1_driver_v_2/CS]
  connect_bd_net -net AD1_driver_v_2_SCLK [get_bd_ports JD_7] [get_bd_pins AD1_driver_v_2/SCLK]
  connect_bd_net -net AD1_driver_v_2_data0 [get_bd_pins AD1_driver_v_2/data0] [get_bd_pins alarm_HT_v_0/yk3_1]
  connect_bd_net -net AD1_driver_v_2_data1 [get_bd_pins AD1_driver_v_2/data1] [get_bd_pins alarm_HT_v_0/yk1_2]
  connect_bd_net -net AD1_driver_v_3_CS [get_bd_ports JC_4] [get_bd_pins AD1_driver_v_3/CS]
  connect_bd_net -net AD1_driver_v_3_SCLK [get_bd_ports JC_7] [get_bd_pins AD1_driver_v_3/SCLK]
  connect_bd_net -net AD1_driver_v_3_data0 [get_bd_pins AD1_driver_v_3/data0] [get_bd_pins alarm_HT_v_0/yk1_3]
  connect_bd_net -net AD1_driver_v_3_data1 [get_bd_pins AD1_driver_v_3/data1] [get_bd_pins alarm_HT_v_0/yk2_3]
  connect_bd_net -net AD1_driver_v_4_CS [get_bd_ports JB_4] [get_bd_pins AD1_driver_v_4/CS]
  connect_bd_net -net AD1_driver_v_4_SCLK [get_bd_ports JB_7] [get_bd_pins AD1_driver_v_4/SCLK]
  connect_bd_net -net AD1_driver_v_4_data0 [get_bd_pins AD1_driver_v_4/data0] [get_bd_pins alarm_HT_v_0/yk3_3]
  connect_bd_net -net AD1_driver_v_4_data1 [get_bd_pins AD1_driver_v_4/data1] [get_bd_pins PWM_0/sync_sin]
  connect_bd_net -net D0_1 [get_bd_ports JD_1] [get_bd_pins AD1_driver_v_0/D0]
  connect_bd_net -net D0_1_1 [get_bd_ports JC_5] [get_bd_pins AD1_driver_v_3/D0]
  connect_bd_net -net D0_2 [get_bd_ports JC_1] [get_bd_pins AD1_driver_v_1/D0]
  connect_bd_net -net D0_3 [get_bd_ports JD_5] [get_bd_pins AD1_driver_v_2/D0]
  connect_bd_net -net D0_4 [get_bd_ports JB_5] [get_bd_pins AD1_driver_v_4/D0]
  connect_bd_net -net D1_1 [get_bd_ports JD_2] [get_bd_pins AD1_driver_v_0/D1]
  connect_bd_net -net D1_1_1 [get_bd_ports JC_6] [get_bd_pins AD1_driver_v_3/D1]
  connect_bd_net -net D1_2 [get_bd_ports JC_2] [get_bd_pins AD1_driver_v_1/D1]
  connect_bd_net -net D1_3 [get_bd_ports JD_6] [get_bd_pins AD1_driver_v_2/D1]
  connect_bd_net -net D1_4 [get_bd_ports JB_6] [get_bd_pins AD1_driver_v_4/D1]
  connect_bd_net -net PWM_0_pin_pwm [get_bd_ports JB_0] [get_bd_pins PWM_0/pin_pwm]
  connect_bd_net -net alarm_HT_v_0_HT_on [get_bd_pins alarm_HT_v_0/HT_on] [get_bd_pins package_ext_0/in_13]
  connect_bd_net -net alarm_HT_v_0_stop_out [get_bd_pins alarm_HT_v_0/stop_out] [get_bd_pins pre_process_0/stop]
  connect_bd_net -net alarm_HT_v_0_yT1_1 [get_bd_pins alarm_HT_v_0/yT1_1] [get_bd_pins fixedPoint_0/ent_1] [get_bd_pins pre_process_0/yT1_1]
  connect_bd_net -net alarm_HT_v_0_yT1_2 [get_bd_pins alarm_HT_v_0/yT1_2] [get_bd_pins fixedPoint_0/ent_4] [get_bd_pins pre_process_0/yT1_2]
  connect_bd_net -net alarm_HT_v_0_yT1_3 [get_bd_pins alarm_HT_v_0/yT1_3] [get_bd_pins fixedPoint_0/ent_7] [get_bd_pins pre_process_0/yT1_3]
  connect_bd_net -net alarm_HT_v_0_yT2_1 [get_bd_pins alarm_HT_v_0/yT2_1] [get_bd_pins fixedPoint_0/ent_2] [get_bd_pins pre_process_0/yT2_1]
  connect_bd_net -net alarm_HT_v_0_yT2_2 [get_bd_pins alarm_HT_v_0/yT2_2] [get_bd_pins fixedPoint_0/ent_5] [get_bd_pins pre_process_0/yT2_2]
  connect_bd_net -net alarm_HT_v_0_yT2_3 [get_bd_pins alarm_HT_v_0/yT2_3] [get_bd_pins fixedPoint_0/ent_8] [get_bd_pins pre_process_0/yT2_3]
  connect_bd_net -net alarm_HT_v_0_yT3_1 [get_bd_pins alarm_HT_v_0/yT3_1] [get_bd_pins fixedPoint_0/ent_3] [get_bd_pins pre_process_0/yT3_1]
  connect_bd_net -net alarm_HT_v_0_yT3_2 [get_bd_pins alarm_HT_v_0/yT3_2] [get_bd_pins fixedPoint_0/ent_6] [get_bd_pins pre_process_0/yT3_2]
  connect_bd_net -net alarm_HT_v_0_yT3_3 [get_bd_pins alarm_HT_v_0/yT3_3] [get_bd_pins fixedPoint_0/ent_9] [get_bd_pins pre_process_0/yT3_3]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_box_0_divClk1 [get_bd_pins AD1_driver_v_0/divClk] [get_bd_pins AD1_driver_v_1/divClk] [get_bd_pins AD1_driver_v_2/divClk] [get_bd_pins AD1_driver_v_3/divClk] [get_bd_pins clk_box_0/divClk1]
  connect_bd_net -net clk_box_0_divClk2 [get_bd_pins AD1_driver_v_4/start] [get_bd_pins clk_box_0/divClk2]
  connect_bd_net -net clk_box_0_divClk3 [get_bd_pins AD1_driver_v_4/divClk] [get_bd_pins clk_box_0/divClk3]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins PWM_0/clk] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins AD1_driver_v_0/clk] [get_bd_pins AD1_driver_v_1/clk] [get_bd_pins AD1_driver_v_2/clk] [get_bd_pins AD1_driver_v_3/clk] [get_bd_pins AD1_driver_v_4/clk] [get_bd_pins clk_box_0/clk] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins package_ext_0/clk]
  connect_bd_net -net clk_wiz_0_clk_out4 [get_bd_pins alarm_HT_v_0/clk] [get_bd_pins clk_wiz_0/clk_out4] [get_bd_pins pre_process_0/clk] [get_bd_pins process_v_0/clk]
  connect_bd_net -net fixedPoint_0_sal_1 [get_bd_pins fixedPoint_0/sal_1] [get_bd_pins package_ext_0/in_01]
  connect_bd_net -net fixedPoint_0_sal_2 [get_bd_pins fixedPoint_0/sal_2] [get_bd_pins package_ext_0/in_02]
  connect_bd_net -net fixedPoint_0_sal_3 [get_bd_pins fixedPoint_0/sal_3] [get_bd_pins package_ext_0/in_03]
  connect_bd_net -net fixedPoint_0_sal_4 [get_bd_pins fixedPoint_0/sal_4] [get_bd_pins package_ext_0/in_04]
  connect_bd_net -net fixedPoint_0_sal_5 [get_bd_pins fixedPoint_0/sal_5] [get_bd_pins package_ext_0/in_05]
  connect_bd_net -net fixedPoint_0_sal_6 [get_bd_pins fixedPoint_0/sal_6] [get_bd_pins package_ext_0/in_06]
  connect_bd_net -net fixedPoint_0_sal_7 [get_bd_pins fixedPoint_0/sal_7] [get_bd_pins package_ext_0/in_07]
  connect_bd_net -net fixedPoint_0_sal_8 [get_bd_pins fixedPoint_0/sal_8] [get_bd_pins package_ext_0/in_08]
  connect_bd_net -net fixedPoint_0_sal_9 [get_bd_pins fixedPoint_0/sal_9] [get_bd_pins package_ext_0/in_09]
  connect_bd_net -net package_ext_0_out_01 [get_bd_pins package_ext_0/out_01] [get_bd_pins pre_process_0/SP1]
  connect_bd_net -net package_ext_0_out_02 [get_bd_pins package_ext_0/out_02] [get_bd_pins pre_process_0/SP2]
  connect_bd_net -net package_ext_0_out_03 [get_bd_pins package_ext_0/out_03] [get_bd_pins pre_process_0/SP3]
  connect_bd_net -net package_ext_0_out_04 [get_bd_pins package_ext_0/out_04] [get_bd_pins pre_process_0/param1_1]
  connect_bd_net -net package_ext_0_out_05 [get_bd_pins package_ext_0/out_05] [get_bd_pins pre_process_0/param2_1]
  connect_bd_net -net package_ext_0_out_06 [get_bd_pins package_ext_0/out_06] [get_bd_pins pre_process_0/param3_1]
  connect_bd_net -net package_ext_0_out_07 [get_bd_pins package_ext_0/out_07] [get_bd_pins pre_process_0/param1_2]
  connect_bd_net -net package_ext_0_out_08 [get_bd_pins package_ext_0/out_08] [get_bd_pins pre_process_0/param2_2]
  connect_bd_net -net package_ext_0_out_09 [get_bd_pins package_ext_0/out_09] [get_bd_pins pre_process_0/param3_2]
  connect_bd_net -net package_ext_0_out_10 [get_bd_pins package_ext_0/out_10] [get_bd_pins pre_process_0/param1_3]
  connect_bd_net -net package_ext_0_out_11 [get_bd_pins package_ext_0/out_11] [get_bd_pins pre_process_0/param2_3]
  connect_bd_net -net package_ext_0_out_12 [get_bd_pins package_ext_0/out_12] [get_bd_pins pre_process_0/param3_3]
  connect_bd_net -net package_ext_0_out_13 [get_bd_pins package_ext_0/out_13] [get_bd_pins pre_process_0/modo]
  connect_bd_net -net package_ext_0_out_14 [get_bd_pins package_ext_0/out_14] [get_bd_pins pre_process_0/sensor]
  connect_bd_net -net package_ext_0_out_15 [get_bd_pins alarm_HT_v_0/stop_in] [get_bd_pins package_ext_0/out_15]
  connect_bd_net -net package_ext_0_out_16 [get_bd_pins package_ext_0/out_16] [get_bd_pins pre_process_0/config_mode]
  connect_bd_net -net package_ext_0_send [get_bd_pins AD1_driver_v_0/start] [get_bd_pins AD1_driver_v_1/start] [get_bd_pins AD1_driver_v_2/start] [get_bd_pins AD1_driver_v_3/start] [get_bd_pins alarm_HT_v_0/start] [get_bd_pins package_ext_0/send]
  connect_bd_net -net package_ext_0_tx [get_bd_ports uart_txd_out] [get_bd_pins package_ext_0/tx]
  connect_bd_net -net pre_process_0_SP_1 [get_bd_pins pre_process_0/SP_1] [get_bd_pins process_v_0/SP]
  connect_bd_net -net pre_process_0_Td_1 [get_bd_pins pre_process_0/Td_1] [get_bd_pins process_v_0/param3]
  connect_bd_net -net pre_process_0_Ti_1 [get_bd_pins pre_process_0/Ti_1] [get_bd_pins process_v_0/param2]
  connect_bd_net -net pre_process_0_ind_config [get_bd_ports led4] [get_bd_pins pre_process_0/ind_config]
  connect_bd_net -net pre_process_0_kc_1 [get_bd_pins pre_process_0/kc_1] [get_bd_pins process_v_0/param1]
  connect_bd_net -net pre_process_0_modo_1 [get_bd_pins pre_process_0/modo_1] [get_bd_pins process_v_0/MODO]
  connect_bd_net -net pre_process_0_yT_1 [get_bd_pins pre_process_0/yT_1] [get_bd_pins process_v_0/yk]
  connect_bd_net -net process_v_0_CV [get_bd_pins PWM_0/duty] [get_bd_pins package_ext_0/in_10] [get_bd_pins process_v_0/CV]
  connect_bd_net -net process_v_0_clk_tm [get_bd_ports led_01] [get_bd_pins process_v_0/ind_ctrl]
  connect_bd_net -net process_v_0_mode_ind [get_bd_ports led1] [get_bd_pins process_v_0/mode_ind]
  connect_bd_net -net rx_1 [get_bd_ports uart_rxd_in] [get_bd_pins package_ext_0/rx]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port JB_7 -pg 1 -y 1120 -defaultsOSRD
preplace port JC_2 -pg 1 -y 770 -defaultsOSRD
preplace port JC_3 -pg 1 -y 760 -defaultsOSRD
preplace port JC_4 -pg 1 -y 920 -defaultsOSRD
preplace port JC_5 -pg 1 -y 930 -defaultsOSRD
preplace port JD_0 -pg 1 -y 430 -defaultsOSRD
preplace port JC_6 -pg 1 -y 950 -defaultsOSRD
preplace port JD_1 -pg 1 -y 470 -defaultsOSRD
preplace port JC_7 -pg 1 -y 940 -defaultsOSRD
preplace port JD_2 -pg 1 -y 490 -defaultsOSRD
preplace port uart_txd_out -pg 1 -y -380 -defaultsOSRD
preplace port uart_rxd_in -pg 1 -y -110 -defaultsOSRD
preplace port JD_3 -pg 1 -y 450 -defaultsOSRD
preplace port JB_0 -pg 1 -y -160 -defaultsOSRD
preplace port JD_4 -pg 1 -y 580 -defaultsOSRD
preplace port JD_5 -pg 1 -y 630 -defaultsOSRD
preplace port led_01 -pg 1 -y 20 -defaultsOSRD
preplace port JD_6 -pg 1 -y 650 -defaultsOSRD
preplace port JB_4 -pg 1 -y 1100 -defaultsOSRD
preplace port JD_7 -pg 1 -y 600 -defaultsOSRD
preplace port clk -pg 1 -y -190 -defaultsOSRD
preplace port JB_5 -pg 1 -y 1110 -defaultsOSRD
preplace port JC_0 -pg 1 -y 740 -defaultsOSRD
preplace port JB_6 -pg 1 -y 1130 -defaultsOSRD
preplace port JC_1 -pg 1 -y 750 -defaultsOSRD
preplace portBus led1 -pg 1 -y 0 -defaultsOSRD
preplace portBus led4 -pg 1 -y 300 -defaultsOSRD
preplace inst alarm_HT_v_0 -pg 1 -lvl 4 -y 290 -defaultsOSRD
preplace inst AD1_driver_v_4 -pg 1 -lvl 3 -y 1090 -defaultsOSRD
preplace inst process_v_0 -pg 1 -lvl 6 -y -20 -defaultsOSRD
preplace inst fixedPoint_0 -pg 1 -lvl 2 -y -270 -defaultsOSRD
preplace inst pre_process_0 -pg 1 -lvl 5 -y 120 -defaultsOSRD
preplace inst PWM_0 -pg 1 -lvl 7 -y -130 -defaultsOSRD -resize 200 120
preplace inst package_ext_0 -pg 1 -lvl 3 -y 30 -defaultsOSRD
preplace inst AD1_driver_v_0 -pg 1 -lvl 3 -y 410 -defaultsOSRD
preplace inst AD1_driver_v_1 -pg 1 -lvl 3 -y 730 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 1 -y -190 -defaultsOSRD
preplace inst clk_box_0 -pg 1 -lvl 2 -y 560 -defaultsOSRD
preplace inst AD1_driver_v_2 -pg 1 -lvl 3 -y 570 -defaultsOSRD
preplace inst AD1_driver_v_3 -pg 1 -lvl 3 -y 910 -defaultsOSRD
preplace netloc AD1_driver_v_4_data0 1 3 1 970
preplace netloc AD1_driver_v_4_data1 1 3 4 900 -190 NJ -190 NJ -190 NJ
preplace netloc pre_process_0_yT_1 1 5 1 N
preplace netloc D0_1 1 0 3 NJ 430 NJ 430 NJ
preplace netloc package_ext_0_out_01 1 3 2 NJ -170 1560
preplace netloc D0_2 1 0 3 NJ 750 NJ 750 NJ
preplace netloc AD1_driver_v_3_data0 1 3 1 950
preplace netloc alarm_HT_v_0_yT3_1 1 1 4 120 -130 NJ -280 NJ -280 1400
preplace netloc pre_process_0_ind_config 1 5 3 NJ 300 NJ 300 NJ
preplace netloc package_ext_0_out_02 1 3 2 NJ -150 1550
preplace netloc D0_3 1 0 3 NJ 630 NJ 630 NJ
preplace netloc AD1_driver_v_1_SCLK 1 3 5 NJ 760 NJ 760 NJ 760 NJ 760 NJ
preplace netloc D0_4 1 0 3 NJ 1110 NJ 1110 NJ
preplace netloc AD1_driver_v_3_data1 1 3 1 960
preplace netloc alarm_HT_v_0_yT3_2 1 1 4 110 310 NJ 310 NJ 110 1330
preplace netloc package_ext_0_out_03 1 3 2 NJ -120 1540
preplace netloc package_ext_0_out_04 1 3 2 NJ -110 1530
preplace netloc PWM_0_pin_pwm 1 7 1 NJ
preplace netloc alarm_HT_v_0_yT3_3 1 1 4 130 300 NJ 300 NJ 120 1350
preplace netloc package_ext_0_out_05 1 3 2 NJ -90 1520
preplace netloc package_ext_0_out_06 1 3 2 NJ -70 1510
preplace netloc package_ext_0_out_10 1 3 2 NJ 10 1410
preplace netloc AD1_driver_v_2_SCLK 1 3 5 NJ 600 NJ 600 NJ 600 NJ 600 NJ
preplace netloc package_ext_0_tx 1 3 5 NJ -380 NJ -380 NJ -380 NJ -380 NJ
preplace netloc package_ext_0_out_07 1 3 2 NJ -50 1500
preplace netloc package_ext_0_out_11 1 3 2 NJ 30 1390
preplace netloc package_ext_0_out_12 1 3 2 NJ 100 1370
preplace netloc package_ext_0_out_08 1 3 2 NJ -30 1460
preplace netloc package_ext_0_out_13 1 3 2 NJ 70 1380
preplace netloc package_ext_0_out_09 1 3 2 NJ -10 1420
preplace netloc package_ext_0_out_14 1 3 2 NJ 80 1360
preplace netloc pre_process_0_kc_1 1 5 1 N
preplace netloc fixedPoint_0_sal_1 1 2 1 540
preplace netloc package_ext_0_out_15 1 3 1 840
preplace netloc fixedPoint_0_sal_2 1 2 1 530
preplace netloc process_v_0_mode_ind 1 6 2 N 0 NJ
preplace netloc package_ext_0_out_16 1 3 2 NJ 130 1340
preplace netloc fixedPoint_0_sal_3 1 2 1 520
preplace netloc fixedPoint_0_sal_4 1 2 1 430
preplace netloc AD1_driver_v_3_SCLK 1 3 5 NJ 940 NJ 940 NJ 940 NJ 940 NJ
preplace netloc D1_1_1 1 0 3 NJ 950 NJ 950 NJ
preplace netloc AD1_driver_v_2_data0 1 3 1 910
preplace netloc alarm_HT_v_0_yT2_1 1 1 4 120 -430 NJ -430 NJ -430 1440
preplace netloc pre_process_0_Ti_1 1 5 1 N
preplace netloc pre_process_0_Td_1 1 5 1 N
preplace netloc fixedPoint_0_sal_5 1 2 1 510
preplace netloc AD1_driver_v_2_data1 1 3 1 920
preplace netloc alarm_HT_v_0_yT2_2 1 1 4 100 -420 NJ -420 NJ -420 1490
preplace netloc fixedPoint_0_sal_6 1 2 1 490
preplace netloc alarm_HT_v_0_yT2_3 1 1 4 140 -140 NJ -290 NJ -290 1470
preplace netloc fixedPoint_0_sal_7 1 2 1 470
preplace netloc AD1_driver_v_1_CS 1 3 5 NJ 740 NJ 740 NJ 740 NJ 740 NJ
preplace netloc fixedPoint_0_sal_8 1 2 1 450
preplace netloc pre_process_0_modo_1 1 5 1 N
preplace netloc fixedPoint_0_sal_9 1 2 1 420
preplace netloc AD1_driver_v_0_CS 1 3 5 880 460 NJ 430 NJ 430 NJ 430 NJ
preplace netloc clk_box_0_divClk1 1 2 1 NJ
preplace netloc AD1_driver_v_0_data0 1 3 1 880
preplace netloc AD1_driver_v_4_CS 1 3 5 NJ 1100 NJ 1100 NJ 1100 NJ 1100 NJ
preplace netloc clk_box_0_divClk2 1 2 1 470
preplace netloc AD1_driver_v_0_data1 1 3 1 890
preplace netloc rx_1 1 0 3 NJ -110 NJ -90 NJ
preplace netloc clk_box_0_divClk3 1 2 1 440
preplace netloc alarm_HT_v_0_stop_out 1 4 1 1320
preplace netloc AD1_driver_v_0_SCLK 1 3 5 850 450 NJ 450 NJ 450 NJ 450 NJ
preplace netloc AD1_driver_v_2_CS 1 3 5 NJ 580 NJ 580 NJ 580 NJ 580 NJ
preplace netloc AD1_driver_v_3_CS 1 3 5 NJ 920 NJ 920 NJ 920 NJ 920 NJ
preplace netloc process_v_0_clk_tm 1 6 2 N 20 NJ
preplace netloc package_ext_0_send 1 2 2 560 320 870
preplace netloc D0_1_1 1 0 3 NJ 930 NJ 930 NJ
preplace netloc AD1_driver_v_1_data0 1 3 1 930
preplace netloc AD1_driver_v_1_data1 1 3 1 940
preplace netloc D1_1 1 0 3 NJ 450 NJ 450 NJ
preplace netloc clk_wiz_0_clk_out1 1 1 6 NJ -120 NJ -260 NJ -260 NJ -260 NJ -260 2140
preplace netloc alarm_HT_v_0_yT1_1 1 1 4 110 -440 NJ -440 NJ -440 1450
preplace netloc AD1_driver_v_4_SCLK 1 3 5 NJ 1120 NJ 1120 NJ 1120 NJ 1120 NJ
preplace netloc D1_2 1 0 3 NJ 770 NJ 770 NJ
preplace netloc clk_wiz_0_clk_out2 1 1 2 NJ 370 500
preplace netloc alarm_HT_v_0_yT1_2 1 1 4 140 -410 NJ -410 NJ -410 1430
preplace netloc D1_3 1 0 3 NJ 490 NJ 490 NJ
preplace netloc clk_wiz_0_clk_out3 1 1 2 NJ -110 NJ
preplace netloc alarm_HT_v_0_yT1_3 1 1 4 130 -400 NJ -400 NJ -400 1480
preplace netloc D1_4 1 0 3 NJ 1130 NJ 1130 NJ
preplace netloc clk_wiz_0_clk_out4 1 1 5 NJ -100 NJ -240 930 -130 NJ -180 NJ
preplace netloc alarm_HT_v_0_HT_on 1 2 3 550 -310 NJ -310 1310
preplace netloc pre_process_0_SP_1 1 5 1 N
preplace netloc clk_1 1 0 1 NJ
preplace netloc process_v_0_CV 1 2 5 560 -250 NJ -250 NJ -250 NJ -250 2130
levelinfo -pg 1 -140 -20 300 720 1180 1710 1990 2260 2400 -top -570 -bot 1370
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


