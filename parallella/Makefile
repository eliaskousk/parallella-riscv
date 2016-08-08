# ===================
# Parallella Makefile
# ===================

#
# BOARD
#


# For Parallella Desktop or MiniServer
# change the BOARD_PART to xc7z010clg400-1
# This will soon happen automatically
# if you change the BOARD_EDITION variable.

BOARD_NAME = parallella

BOARD_EDITION = kickstarter

BOARD_MODEL = none

BOARD_PART = xc7z020clg400-1


#
# LINUX
#

# Change the variables below only if you
# need to use a different Linux repo (./boot/REPO)
# or Linux config (config_defconfig) or device tree
# source file (dts/dts_source.dts/dtsi
# to copy on the Linux arch/boot/dts folder)
# or device tree blob target (dtb). See the
# related arm-linux/dts make rules in the
# ./scripts/Makefrag file if you can't
# make sense of the above!

LINUX_REPO = parallella-linux

LINUX_CONFIG = parallella

LINUX_DTS = zynq-parallella1

LINUX_DTB = zynq-parallella-headless


#
# U-Boot
#

# Change the variables below only if you want
# to flash Parallella to replace its U-Boot and you
# need to use another U-Boot repo (./boot/REPO)
# or U-Boot config (config_defconfig). Flashing
# your board is not recommended since you may end up
# with a bricked board. The default U-Boot works fine!

UBOOT_REPO = parallella-uboot

UBOOT_CONFIG = adapteva_parallella


#
# RISC-V Core Arch and Configuration
#

# Currently only the RV64IMA and RV64IMAFD
# core architectures are supported.
#
# The default is to use the core without
# the standard F and D extensions (single and
# double floating point support) using an
# optional FPU inside the core.
#
# In order to use the optional FPU on your
# Parallella Embedded or Kickstarter editions
# change the variables below to RV64IMAFD and
# DefalutFPGAConfig respectively.
#
# On the Desktop and Miniserver editions that have
# the smaller Zynq FPGA devices the FPU will not fit
# and thus they cannot fit RISC-V cores with the F or D
# extensions.
#
# Keep in mind that the RV64IMA runs at 50 MHz and the
# RV64IMAFD runs at 25 MHz. So although the latter can
# execute floating point instructions, the former is
# much faster at everything else and thus it is the
# preferred core architecture for all Parallella editions.


RISCV_CORE_ARCH = RV64IMA

RISCV_CORE_CONFIG = DefaultFPGANormalConfig


#
# RISC-V DRAM Memory
#

# The below allocated 384 MB of memory should
# be plenty enough for basic tasks on the
# core. This memory starts from the second 512 MB
# half of the total 1GB memory that Parallella
# provides (the last 32 MB are reserved for the
# Epiphany / E-Link).
#
# If you need to use more (up to 480 MB)
# change the following (e.g for 480 MB):
# RISCV_DRAM_SIZE_DTS = 0x1e000000
# RISCV_DRAM_SIZE_LINUX = 480M
#
# If you need to use even more memory out of the 1GB
# provided by Parallella it is more tricky and besides
# changing the size to what you need (no more than 736!)
# you should also change the other 3 variables
# to start from a lower DRAM address base e.g 0x10000000
# onRISCV_DRAM_BASE_DTS and set the RTL variables to
# 4\'d1 and 32 - 4 = 28 respectively.

RISCV_DRAM_BASE_RTL = "3\'d1"

RISCV_DRAM_BITS_RTL = 29

RISCV_DRAM_BASE_DTS = 0x20000000

RISCV_DRAM_SIZE_DTS = 0x18000000

RISCV_DRAM_SIZE_LINUX = 384M


#
# Include make rules
#

# Include the rest of the make configuration
# which is common for all boards
include ../scripts/Makefrag

