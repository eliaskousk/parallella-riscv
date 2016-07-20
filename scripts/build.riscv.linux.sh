#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "${SCRIPTS}/set.env.sh"

# Build RISC-V Linux

cd ${TOP}/${BOARD}
make riscv_linux
