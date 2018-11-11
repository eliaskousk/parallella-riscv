#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "${SCRIPTS}/set.env.sh"

# Setup git submodules
source "${SCRIPTS}/setup.rocketchip.submodule.sh"

# Build RISC-V Toolchain

cd ${TOP}/${BOARD}
make riscv_toolchain

