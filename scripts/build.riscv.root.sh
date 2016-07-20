#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "${SCRIPTS}/set.env.sh"

# Build RISC-V Root Image

POKY_DIR=${BOOT}/riscv-poky
git submodule update --init ${POKY_DIR}
cd ${POKY_DIR}
source oe-init-build-env
sed -i "s/MACHINE = \"qemuriscv64\"/MACHINE = \"riscv64\"/g" conf/local.conf
bitbake core-image-riscv
sed -i "s/MACHINE = \"riscv64\"/MACHINE = \"qemuriscv64\"/g" conf/local.conf
