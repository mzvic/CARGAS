
################################################################
# This is a generated script based on design: DIG_INT
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
# source DIG_INT_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# AD1_driver_v, package

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35ticsg324-1L
}


# CHANGE DESIGN NAME HERE
set design_name DIG_INT

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
  set JA_0 [ create_bd_port -dir O JA_0 ]
  set JA_1 [ create_bd_port -dir I JA_1 ]
  set JA_2 [ create_bd_port -dir I JA_2 ]
  set JA_3 [ create_bd_port -dir O JA_3 ]
  set clk [ create_bd_port -dir I -type clk clk ]
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
  
  # Create port connections
  connect_bd_net -net AD1_driver_v_0_CS [get_bd_ports JA_0] [get_bd_pins AD1_driver_v_0/CS]
  connect_bd_net -net AD1_driver_v_0_SCLK [get_bd_ports JA_3] [get_bd_pins AD1_driver_v_0/SCLK]
  connect_bd_net -net AD1_driver_v_0_data0 [get_bd_pins AD1_driver_v_0/data0] [get_bd_pins package_0/PV1]
  connect_bd_net -net D0_1 [get_bd_ports JA_1] [get_bd_pins AD1_driver_v_0/D0]
  connect_bd_net -net D1_1 [get_bd_ports JA_2] [get_bd_pins AD1_driver_v_0/D1]
  connect_bd_net -net clk_1_1 [get_bd_ports clk] [get_bd_pins AD1_driver_v_0/clk] [get_bd_pins package_0/clk] [get_bd_pins package_0/clk_2]
  connect_bd_net -net package_0_tx [get_bd_ports uart_txd_out] [get_bd_pins package_0/tx]
  connect_bd_net -net rx_1 [get_bd_ports uart_rxd_in] [get_bd_pins package_0/rx]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port uart_rxd_in -pg 1 -y 280 -defaultsOSRD
preplace port uart_txd_out -pg 1 -y 250 -defaultsOSRD
preplace port JA_0 -pg 1 -y 500 -defaultsOSRD
preplace port JA_1 -pg 1 -y 480 -defaultsOSRD
preplace port JA_2 -pg 1 -y 500 -defaultsOSRD
preplace port JA_3 -pg 1 -y 520 -defaultsOSRD
preplace port clk -pg 1 -y 460 -defaultsOSRD
preplace inst package_0 -pg 1 -lvl 2 -y 300 -defaultsOSRD
preplace inst AD1_driver_v_0 -pg 1 -lvl 1 -y 480 -defaultsOSRD
preplace netloc rx_1 1 0 2 NJ 280 NJ
preplace netloc clk_1_1 1 0 2 NJ 260 NJ
preplace netloc D0_1 1 0 1 N
preplace netloc package_0_tx 1 2 1 N
preplace netloc AD1_driver_v_0_SCLK 1 1 2 NJ 520 NJ
preplace netloc AD1_driver_v_0_data0 1 1 1 -40
preplace netloc D1_1 1 0 1 N
preplace netloc AD1_driver_v_0_CS 1 1 2 NJ 500 NJ
levelinfo -pg 1 -250 -130 130 460 -top -120 -bot 610
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


