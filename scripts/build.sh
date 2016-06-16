#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "$SCRIPTS/set.env.sh"

# Download and initialize the Rocket Chip repository
#cd $TOP
#git clone https://github.com/ucb-bar/rocket-chip.git
#cd rocket-chip
#git submodule update --init

# Build the RISC-V Toolchain
cd $RISCV
#git submodule update --init --recursive
#./build.sh

# Build the Rocket Chip emulator
#cd $ROCKETCHIP/emulator
#make

# Build the Rocket Chip Verilog RTL
cd $TOP/$BOARD
make rocket

# Build Vivado Project
source /opt/Xilinx/Vivado/2015.4/settings64.sh
cd $TOP/$BOARD
make project

# Build Bitstream
source /opt/Xilinx/Vivado/2015.4/settings64.sh
cd $TOP/$BOARD
make bitstream

# Build U-Boot
source /opt/Xilinx/Vivado/2015.4/settings64.sh
# Unset LD_LIBRARY_PATH that points to Xilinx libraries
# in order to not break the u-boot Build
export LD_LIBRARY_PATH=
cd $TOP/common/dtc/
make
export PATH=$PATH:$TOP/common/dtc
cd $TOP/$BOARD
make arm-uboot

