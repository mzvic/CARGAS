# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "RATE1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RATE2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RATE3" -parent ${Page_0}


}

proc update_PARAM_VALUE.RATE1 { PARAM_VALUE.RATE1 } {
	# Procedure called to update RATE1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RATE1 { PARAM_VALUE.RATE1 } {
	# Procedure called to validate RATE1
	return true
}

proc update_PARAM_VALUE.RATE2 { PARAM_VALUE.RATE2 } {
	# Procedure called to update RATE2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RATE2 { PARAM_VALUE.RATE2 } {
	# Procedure called to validate RATE2
	return true
}

proc update_PARAM_VALUE.RATE3 { PARAM_VALUE.RATE3 } {
	# Procedure called to update RATE3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RATE3 { PARAM_VALUE.RATE3 } {
	# Procedure called to validate RATE3
	return true
}


proc update_MODELPARAM_VALUE.RATE1 { MODELPARAM_VALUE.RATE1 PARAM_VALUE.RATE1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RATE1}] ${MODELPARAM_VALUE.RATE1}
}

proc update_MODELPARAM_VALUE.RATE2 { MODELPARAM_VALUE.RATE2 PARAM_VALUE.RATE2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RATE2}] ${MODELPARAM_VALUE.RATE2}
}

proc update_MODELPARAM_VALUE.RATE3 { MODELPARAM_VALUE.RATE3 PARAM_VALUE.RATE3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RATE3}] ${MODELPARAM_VALUE.RATE3}
}

