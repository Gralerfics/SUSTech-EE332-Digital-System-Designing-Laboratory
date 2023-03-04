@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Fri Mar 03 12:44:01 +0800 2023
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 23bdc9ad2f16410eb67dc21791a3dcd2 --incr --debug typical --relax --mt 32 -L xil_defaultlib -L secureip --snapshot full_adder_nbits_tb_behav xil_defaultlib.full_adder_nbits_tb -log elaborate.log"
call xelab  -wto 23bdc9ad2f16410eb67dc21791a3dcd2 --incr --debug typical --relax --mt 32 -L xil_defaultlib -L secureip --snapshot full_adder_nbits_tb_behav xil_defaultlib.full_adder_nbits_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
