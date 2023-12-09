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
ExecStep $xv_path/bin/xelab -wto 79ff1e77c424479bb13756226d042408 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip --snapshot package_ext_behav xil_defaultlib.package_ext xil_defaultlib.glbl -log elaborate.log
