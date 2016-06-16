#!/bin/bash

# Install Verilator or add it to your path

(http://www.veripool.org/projects/verilator/wiki/Installing)

INSTALL_DIR=/opt/verilator

if [ ! -f $INSTALL_DIR/bin/verilator ]; then
  mkdir -p $INSTALL_DIR
  git clone http://git.veripool.org/git/verilator
  unset VERILATOR_ROOT
  cd verilator
  git pull
  git checkout verilator_3_884
  autoconf
  ./configure --prefix=$INSTALL_DIR
  make
  make install
  VERILATOR_ROOT=$INSTALL_DIR
  # Fix verilator for local install (http://www.lowrisc.org/docs/untether-v0.2/verilator/)
  ln -s $VERILATOR_ROOT/share/verilator/include $VERILATOR_ROOT/include
  ln -s $VERILATOR_ROOT/share/verilator/bin/verilator_includer $VERILATOR_ROOT/bin/verilator_includer
fi

export VERILATOR_ROOT=$INSTALL_DIR
export PATH=$PATH:$VERILATOR_ROOT/bin

