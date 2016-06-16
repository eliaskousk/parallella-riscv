#!/bin/bash

# This script sets the needed environment variables for building
# and should be sourced before running additional build commands

echo "Setting Parallela RISC-V environment"
echo "You must source this script"

if [ "$TOP" = "" ]; then
    TOP=$(dirname "$(dirname "$(readlink -f "$0")")")
    export TOP
    echo "\$TOP was set to $TOP"
fi

SCRIPTS=$TOP/scripts
export SCRIPTS
echo "\$SCRIPTS directory was set to $SCRIPTS"

ROCKETCHIP=$TOP/ip/rocket-chip
export ROCKETCHIP
echo "\$ROCKETCHIP directory was set to $ROCKETCHIP"

RISCV=$ROCKETCHIP/riscv-tools
export RISCV
echo "\$RISCV directory was set to $RISCV"

PATH=$PATH:$RISCV/bin
export PATH
echo "\$RISCV=$RISCV/bin was added to \$PATH"

BOARD=zedboard
export BOARD
echo "\$BOARD=$BOARD"

