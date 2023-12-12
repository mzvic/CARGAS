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
echo "xvlog -m64 --relax -prj package_ext_vlog.prj"
ExecStep $xv_path/bin/xvlog -m64 --relax -prj package_ext_vlog.prj 2>&1 | tee compile.log
