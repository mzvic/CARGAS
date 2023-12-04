
################################################################
# This is a generated script based on design: probe_rcv
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
# source probe_rcv_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# PWM, package, process_v, syncro_v, syncro_v

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35ticsg324-1L
}


# CHANGE DESIGN NAME HERE
set design_name probe_rcv

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
  set clk [ create_bd_port -dir I -type clk clk ]
  set uart_rxd_in [ create_bd_port -dir I uart_rxd_in ]
  set uart_txd_out [ create_bd_port -dir O uart_txd_out ]

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
  
  # Create instance: package_0, and set properties
  set block_name package
  set block_cell_name package_0
  if { [catch {set package_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $package_0 eq "" } {
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
  
  # Create instance: syncro_v_0, and set properties
  set block_name syncro_v
  set block_cell_name syncro_v_0
  if { [catch {set syncro_v_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $syncro_v_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: syncro_v_1, and set properties
  set block_name syncro_v
  set block_cell_name syncro_v_1
  if { [catch {set syncro_v_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $syncro_v_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net PWM_0_pin_pwm [get_bd_ports JB_0] [get_bd_pins PWM_0/pin_pwm]
  connect_bd_net -net PWM_0_read_duty [get_bd_pins PWM_0/read_duty] [get_bd_pins syncro_v_1/sync_out]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins PWM_0/clk] [get_bd_pins package_0/clk] [get_bd_pins process_v_0/clk] [get_bd_pins syncro_v_0/clk]
  connect_bd_net -net package_0_MODO [get_bd_pins package_0/MODO] [get_bd_pins syncro_v_0/data_in2]
  connect_bd_net -net package_0_SP [get_bd_pins package_0/SP] [get_bd_pins syncro_v_0/data_in1]
  connect_bd_net -net package_0_data_ready [get_bd_pins package_0/data_ready] [get_bd_pins syncro_v_0/sync_in]
  connect_bd_net -net package_0_param1 [get_bd_pins package_0/param1] [get_bd_pins syncro_v_0/data_in3]
  connect_bd_net -net package_0_param2 [get_bd_pins package_0/param2] [get_bd_pins syncro_v_0/data_in4]
  connect_bd_net -net package_0_param3 [get_bd_pins package_0/param3] [get_bd_pins syncro_v_0/data_in5]
  connect_bd_net -net package_0_tx [get_bd_ports uart_txd_out] [get_bd_pins package_0/tx] [get_bd_pins syncro_v_1/clk]
  connect_bd_net -net process_v_0_CV [get_bd_pins process_v_0/CV] [get_bd_pins syncro_v_1/data_in6]
  connect_bd_net -net process_v_0_ctrl_ready [get_bd_pins process_v_0/ctrl_ready] [get_bd_pins syncro_v_1/sync_in]
  connect_bd_net -net process_v_0_read_data [get_bd_pins process_v_0/read_data] [get_bd_pins syncro_v_0/sync_out]
  connect_bd_net -net rx_1 [get_bd_ports uart_rxd_in] [get_bd_pins package_0/rx]
  connect_bd_net -net syncro_v_0_data_out1 [get_bd_pins process_v_0/SP] [get_bd_pins syncro_v_0/data_out1]
  connect_bd_net -net syncro_v_0_data_out2 [get_bd_pins process_v_0/MODO] [get_bd_pins syncro_v_0/data_out2]
  connect_bd_net -net syncro_v_0_data_out3 [get_bd_pins process_v_0/param1] [get_bd_pins syncro_v_0/data_out3]
  connect_bd_net -net syncro_v_0_data_out4 [get_bd_pins process_v_0/param2] [get_bd_pins syncro_v_0/data_out4]
  connect_bd_net -net syncro_v_0_data_out5 [get_bd_pins process_v_0/param3] [get_bd_pins syncro_v_0/data_out5]
  connect_bd_net -net syncro_v_1_data_out6 [get_bd_pins PWM_0/duty] [get_bd_pins syncro_v_1/data_out6]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port JB_0 -pg 1 -y 50 -defaultsOSRD
preplace port uart_txd_out -pg 1 -y -40 -defaultsOSRD
preplace port uart_rxd_in -pg 1 -y 0 -defaultsOSRD
preplace port clk -pg 1 -y -40 -defaultsOSRD
preplace inst process_v_0 -pg 1 -lvl 3 -y 110 -defaultsOSRD
preplace inst package_0 -pg 1 -lvl 1 -y 20 -defaultsOSRD
preplace inst PWM_0 -pg 1 -lvl 5 -y 70 -defaultsOSRD
preplace inst syncro_v_0 -pg 1 -lvl 2 -y 320 -defaultsOSRD
preplace inst syncro_v_1 -pg 1 -lvl 4 -y 320 -defaultsOSRD
preplace netloc process_v_0_CV 1 3 1 840
preplace netloc syncro_v_0_data_out4 1 2 1 560
preplace netloc rx_1 1 0 1 N
preplace netloc syncro_v_0_data_out5 1 2 1 570
preplace netloc PWM_0_pin_pwm 1 5 1 1380
preplace netloc syncro_v_1_data_out6 1 4 1 1140
preplace netloc package_0_param1 1 1 1 210
preplace netloc package_0_param2 1 1 1 190
preplace netloc package_0_MODO 1 1 1 220
preplace netloc package_0_param3 1 1 1 180
preplace netloc package_0_SP 1 1 1 230
preplace netloc package_0_tx 1 1 5 NJ -50 NJ -50 NJ -40 NJ -40 NJ
preplace netloc clk_1 1 0 5 -60 140 NJ 50 NJ -10 NJ -10 NJ
preplace netloc process_v_0_ctrl_ready 1 3 1 830
preplace netloc PWM_0_read_duty 1 3 3 860 150 NJ 150 1380
preplace netloc syncro_v_0_data_out1 1 2 1 530
preplace netloc package_0_data_ready 1 1 1 200
preplace netloc syncro_v_0_data_out2 1 2 1 540
preplace netloc syncro_v_0_data_out3 1 2 1 550
preplace netloc process_v_0_read_data 1 1 3 250 0 NJ 0 830
levelinfo -pg 1 -80 60 390 700 1000 1260 1400 -top -90 -bot 450
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


