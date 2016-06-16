#!/bin/bash

#package IP
vivado -mode batch -source package.tcl

#create bit stream
vivado -mode batch -source run.tcl

#make final bitstream image (bin instead of bit)
cp ./parallella_riscv_rv64g/system.runs/impl_1/system_wrapper.bit ./bitstream.bit
bootgen -image bit2bin.bif -split bin 
#cp parallella.bit.bin parallella_backup.bit.bin
mv system_wrapper.bit.bin parallella.bit.bin

#clean up
rm bit2bin.bin

