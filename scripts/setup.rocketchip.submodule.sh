#!/bin/bash

# Initialize the Rocket Chip submodule
cd ${TOP}
git submodule update --init  -- ${ROCKETCHIP}

# Initialize the Rocket Chip submodule submodules (!)
cd ${ROCKETCHIP}
git submodule update --init

