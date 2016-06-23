#!/bin/bash

# Clean build directory
rm -rf parallella_riscv_rv64g

# Package Parallella Base and RISC-V RV64 IPs
vivado -mode batch -source package_parallella.tcl
vivado -mode batch -source package_riscv.tcl

# Create bitstream
vivado -mode batch -source run.tcl

# Make final bitstream image (bin instead of bit)
cp ./parallella_riscv/system.runs/impl_1/system_wrapper.bit ./bitstream.bit
bootgen -image bit2bin.bif -split bin 
#cp parallella.bit.bin parallella_backup.bit.bin
mv bitstream.bit.bin parallella.bit.bin

# Clean up
rm bit2bin.bin

