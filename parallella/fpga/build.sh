#!/bin/bash

# Clean build directories
rm -rf riscv_rv64g
rm -rf parallella_base
rm -rf parallella_riscv

# Find Vivado version string and place it in system_bd.tcl
VIVADO=$(vivado -version | grep -oh '[0-9]\{4\}\.[0-9]')
sed -i "s/\(set scripts_vivado_version \)[0-9]\{4\}\.[0-9]/\1${VIVADO}/" system_bd.tcl

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

