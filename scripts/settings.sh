#!/bin/bash

BOARD=parallella
export BOARD
echo "\$BOARD set to ${BOARD}"

JOBS=8
export JOBS
echo "\$JOBS set to ${JOBS}"

VIVADO_PATH=/opt/Xilinx/Vivado
export VIVADO_PATH
echo "Vivado path set to ${VIVADO_PATH}"

VIVADO_VERSION=2015.4
export VIVADO_VERSION
echo "Vivado version set to ${VIVADO_VERSION}"

