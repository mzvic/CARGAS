@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto a83484e03625464c92049bc649f3b7d9 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_transm_SDEC_behav xil_defaultlib.tb_transm_SDEC xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
