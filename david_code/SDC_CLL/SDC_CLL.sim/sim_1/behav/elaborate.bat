@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto 716d1d434af9406c84ce5fc14f03ae24 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_rediv_behav xil_defaultlib.tb_rediv xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
