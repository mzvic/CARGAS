#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.1"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 79ff1e77c424479bb13756226d042408 -m64 --debug typical --relax --mt 8 --maxdelay -L xil_defaultlib -L simprims_ver -L secureip --snapshot package_ext_time_impl -transport_int_delays -pulse_r 0 -pulse_int_r 0 xil_defaultlib.package_ext xil_defaultlib.glbl -log elaborate.log
