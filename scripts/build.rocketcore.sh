#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "${SCRIPTS}/set.env.sh"

# Build Rocket Core

source /opt/Xilinx/Vivado/${VIVADO}/settings64.sh
cd ${TOP}/${BOARD}
make riscv_rocketcore

