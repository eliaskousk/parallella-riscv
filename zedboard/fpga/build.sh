#!/bin/bash

#clean build directory
rm -rf zedboard_riscv

#package IP
vivado -mode batch -source ip_package_riscv.tcl

#create bit stream
vivado -mode batch -source system_project.tcl
vivado -mode batch -source system_bitstream.tcl

cp ./zedboard_riscv/system.runs/impl_1/system_wrapper.bit ./zedboard_riscv.bit

