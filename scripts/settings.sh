#!/bin/bash

BOARD=zedboard
export BOARD
echo "\$BOARD set to ${BOARD}"

JOBS=16
export JOBS
echo "\$JOBS set to ${JOBS}"

VIVADO_PATH=/opt/Xilinx/Vivado
export VIVADO_PATH
echo "Vivado path set to ${VIVADO_PATH}"

VIVADO_VERSION=2018.2
export VIVADO_VERSION
echo "Vivado version set to ${VIVADO_VERSION}"

PETALINUX_PATH=/opt/Xilinx/PetaLinux
export PETALINUX_PATH
echo "PetaLinux path set to ${PETALINUX_PATH}"
