#!/bin/bash

SCRIPTS=$(dirname "$(readlink -f "$0")")
source "${SCRIPTS}/set.env.sh"

# Build Software

source ${VIVADO_PATH}/${VIVADO_VERSION}/settings64.sh
cd ${TOP}/${BOARD}
make ${BOARD}_software

