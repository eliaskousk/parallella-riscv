#!/bin/bash

# This script sets the needed environment variables for building
# and should be sourced before running additional build commands

# Fix SBT error if TERM is set to xterm-256color
export TERM=xterm-color

echo "Setting Parallela RISC-V environment"
echo "You must source this script"

if [ "${TOP}" = "" ]; then
    TOP=$(dirname "$(dirname "$(readlink -f "$0")")")
    export TOP
    echo "\${TOP} was set to ${TOP}"
fi

SCRIPTS=${TOP}/scripts
export SCRIPTS
echo "\$SCRIPTS directory was set to ${SCRIPTS}"

BOOT=${TOP}/boot
export BOOT
echo "\$BOOT directory was set to ${BOOT}"

IP=${TOP}/ip
export IP
echo "\$IP directory was set to ${IP}"

ROCKETCHIP=${IP}/rocket-chip
export ROCKETCHIP
echo "\$ROCKETCHIP directory was set to ${ROCKETCHIP}"

TESTCHIPIP=${IP}/testchipip
export TESTCHIPIP
echo "\$TESTCHIPIP directory was set to ${TESTCHIPIP}"

RISCVTOOLS=${ROCKETCHIP}/riscv-tools
export RISCVTOOLS
echo "\$RISCVTOOLS directory was set to ${RISCVTOOLS}"

RISCV=${IP}/toolchain
export RISCV
echo "\$RISCV directory was set to ${RISCV}"

PATH=${PATH}:${RISCV}/bin
export PATH
echo "\$PATH extended with ${RISCV}/bin"

source ${SCRIPTS}/settings.sh


