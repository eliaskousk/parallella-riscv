#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "${SCRIPTS}/set.env.sh"

# Build Bitstream

cd ${TOP}/${BOARD}
make riscv_toolchain

