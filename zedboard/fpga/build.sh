#!/bin/bash

#clean build directory
rm -rf zedboard_riscv_rv64g

#package IP
vivado -mode batch -source package.tcl

#create bit stream
vivado -mode batch -source run.tcl

cp ./zedboard_riscv_rv64g/system.runs/impl_1/system_wrapper.bit ./bitstream.bit

