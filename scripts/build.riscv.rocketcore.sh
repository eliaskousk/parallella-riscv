#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "${SCRIPTS}/set.env.sh"

# Setup git submodules
source "${SCRIPTS}/setup.rocketchip.submodule.sh"

# Build RISC-V Rocket Core

source ${VIVADO_PATH}/${VIVADO_VERSION}/settings64.sh
cd ${TOP}/${BOARD}
make riscv_rocketcore

