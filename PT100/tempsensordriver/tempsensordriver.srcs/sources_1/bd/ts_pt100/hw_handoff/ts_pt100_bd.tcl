
################################################################
# This is a generated script based on design: ts_pt100
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
# source ts_pt100_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# AD1_driver_v, alarm_HT_v, clk_box, fixedPoint, package_ext

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
}


# CHANGE DESIGN NAME HERE
set design_name ts_pt100

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
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
 ] $clk
  set jc0 [ create_bd_port -dir O jc0 ]
  set jc1 [ create_bd_port -dir I jc1 ]
  set jc2 [ create_bd_port -dir I jc2 ]
  set jc3 [ create_bd_port -dir O jc3 ]
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
  
  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {263.048} \
CONFIG.CLKOUT1_PHASE_ERROR {296.868} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {60.000} \
CONFIG.CLKOUT2_JITTER {359.525} \
CONFIG.CLKOUT2_PHASE_ERROR {296.868} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {10.000} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.MMCM_CLKFBOUT_MULT_F {49.500} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {16.500} \
CONFIG.MMCM_CLKOUT1_DIVIDE {99} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.MMCM_DIVCLK_DIVIDE {5} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.USE_LOCKED {false} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
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

  # Create port connections
  connect_bd_net -net AD1_driver_v_0_CS [get_bd_ports jc0] [get_bd_pins AD1_driver_v_0/CS]
  connect_bd_net -net AD1_driver_v_0_SCLK [get_bd_ports jc3] [get_bd_pins AD1_driver_v_0/SCLK]
  connect_bd_net -net AD1_driver_v_0_data0 [get_bd_pins AD1_driver_v_0/data0] [get_bd_pins alarm_HT_v_0/yk1_1]
  connect_bd_net -net AD1_driver_v_0_data1 [get_bd_pins AD1_driver_v_0/data1] [get_bd_pins alarm_HT_v_0/yk2_1]
  connect_bd_net -net alarm_HT_v_0_yT1_1 [get_bd_pins alarm_HT_v_0/yT1_1] [get_bd_pins fixedPoint_0/ent_1]
  connect_bd_net -net alarm_HT_v_0_yT2_1 [get_bd_pins alarm_HT_v_0/yT2_1] [get_bd_pins fixedPoint_0/ent_2]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_box_0_divClk1 [get_bd_pins AD1_driver_v_0/divClk] [get_bd_pins clk_box_0/divClk1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins AD1_driver_v_0/clk] [get_bd_pins clk_box_0/clk] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins package_ext_0/clk]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins alarm_HT_v_0/clk] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net fixedPoint_0_sal_1 [get_bd_pins fixedPoint_0/sal_1] [get_bd_pins package_ext_0/in_01]
  connect_bd_net -net jc1_1 [get_bd_ports jc1] [get_bd_pins AD1_driver_v_0/D0]
  connect_bd_net -net jc2_1 [get_bd_ports jc2] [get_bd_pins AD1_driver_v_0/D1]
  connect_bd_net -net package_ext_0_send [get_bd_pins AD1_driver_v_0/start] [get_bd_pins alarm_HT_v_0/start] [get_bd_pins package_ext_0/send]
  connect_bd_net -net package_ext_0_tx [get_bd_ports uart_txd_out] [get_bd_pins package_ext_0/tx]
  connect_bd_net -net uart_rxd_in_1 [get_bd_ports uart_rxd_in] [get_bd_pins package_ext_0/rx]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port jc0 -pg 1 -y -140 -defaultsOSRD
preplace port jc1 -pg 1 -y -130 -defaultsOSRD
preplace port jc2 -pg 1 -y -110 -defaultsOSRD
preplace port jc3 -pg 1 -y -120 -defaultsOSRD
preplace port uart_txd_out -pg 1 -y 60 -defaultsOSRD
preplace port uart_rxd_in -pg 1 -y 160 -defaultsOSRD
preplace port clk -pg 1 -y 60 -defaultsOSRD
preplace inst alarm_HT_v_0 -pg 1 -lvl 4 -y 300 -defaultsOSRD
preplace inst fixedPoint_0 -pg 1 -lvl 4 -y 600 -defaultsOSRD
preplace inst package_ext_0 -pg 1 -lvl 3 -y 280 -defaultsOSRD
preplace inst AD1_driver_v_0 -pg 1 -lvl 3 -y -150 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 1 -y 20 -defaultsOSRD
preplace inst clk_box_0 -pg 1 -lvl 2 -y 260 -defaultsOSRD
preplace netloc package_ext_0_tx 1 3 2 NJ 60 N
preplace netloc uart_rxd_in_1 1 0 3 NJ 160 NJ 160 N
preplace netloc alarm_HT_v_0_yT1_1 1 3 2 620 140 1160
preplace netloc AD1_driver_v_0_SCLK 1 3 2 N -120 NJ
preplace netloc jc2_1 1 0 3 NJ -110 NJ -110 NJ
preplace netloc clk_1 1 0 1 -100
preplace netloc alarm_HT_v_0_yT2_1 1 3 2 610 120 1170
preplace netloc jc1_1 1 0 3 NJ -130 NJ -130 NJ
preplace netloc AD1_driver_v_0_data0 1 3 1 600
preplace netloc clk_wiz_0_clk_out1 1 1 2 NJ 0 260
preplace netloc clk_box_0_divClk1 1 2 1 270
preplace netloc AD1_driver_v_0_data1 1 3 1 590
preplace netloc clk_wiz_0_clk_out2 1 1 3 NJ 10 NJ 10 NJ
preplace netloc package_ext_0_send 1 2 2 280 -40 NJ
preplace netloc fixedPoint_0_sal_1 1 2 3 280 0 NJ 0 1180
preplace netloc AD1_driver_v_0_CS 1 3 2 N -140 NJ
levelinfo -pg 1 -120 0 180 450 1030 1350 -top -230 -bot 760
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


