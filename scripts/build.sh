#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "$SCRIPTS/set.env.sh"

# The rest of these sections should be inserted in the Makefrag
# so that the user doesn't have to run everything and instead
# select what he wants to do. They are placed here for development.

# Initialize the Rocket Chip submodule
cd ${TOP}
git submodule update --init  -- ${ROCKETCHIP}
# Initialize the Rocket Chip submodule submodules (!)
cd ${ROCKETCHIP}
git submodule update --init

# Install necessary packages (Ubuntu)
sudo apt-get install autoconf automake autotools-dev curl \
libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex \
texinfo gperf libtool patchutils bc

# Build the RISC-V Toolchain (Newlib version for use without an OS)
cd ${ROCKETCHIP}/riscv-tools
git submodule update --init --recursive
# Change number of jobs for make
sed -i "s/JOBS=\([0-9]\{\0,2\}\)/JOBS=${JOBS}/g" build.common
./build.sh
# Restore number of jobs for make
sed -i "s/JOBS=${JOBS}/JOBS=16/g" build.common

# Build the Rocket Chip emulator
cd ${ROCKETCHIP}/emulator
make -j${JOBS}

# Build the Rocket Chip Verilog RTL (for FPGAs)
FPGAConfig="DefaultFPGAConfig"
RocketCoreIPName="RISCV_Rocket_Core_RV64G_1.0"
cd ${TOP}/fsim
make verilog CONFIG=${FPGAConfig}
make verilog MODEL=ZynqAdapter CONFIG=${FPGAConfig}
cp generated-src/Top.${FPGAConfig}.v ${TOP}/ip/${RocketCoreIPName}/src/RV64G.Core.v
cp generated-src/ZynqAdapter.${FPGAConfig}.v ${TOP}/ip/${RocketCoreIPName}/src/RV64G.HostIO.Adapter.v

# Build Vivado Project
source /opt/Xilinx/Vivado/2015.4/settings64.sh
cd ${TOP}/${BOARD}/fpga
./build.sh

# Build U-Boot
#source /opt/Xilinx/Vivado/2015.4/settings64.sh
# Unset LD_LIBRARY_PATH that points to Xilinx libraries
# in order to not break the u-boot Build
#export LD_LIBRARY_PATH=
#cd ${TOP}/common/dtc/
#make
#export PATH=$PATH:$i{TOP}/common/dtc
u
#cd ${TOP}/${BOARD}
#make arm-uboot
