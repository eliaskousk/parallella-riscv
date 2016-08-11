# =================
# Zedboard Makefile
# =================

#
# See ./parallella/Makefile for explanation
# of all the variables below
#

BOARD_NAME = zedboard

BOARD_EDITION = none

BOARD_PART = em.avnet.com:zed:part0:1.0

BOARD_DEVICE = xc7z020clg484-1

LINUX_REPO = linux-xlnx

LINUX_CONFIG = xilinx_zynq

LINUX_DTS = zynq-zed

LINUX_DTB = zynq-zed

UBOOT_REPO = u-boot-xlnx

UBOOT_CONFIG = zynq_zed

RISCV_CORE_ARCH = RV64IMA

RISCV_CORE_CONFIG = DefaultFPGANoFPUConfig

RISCV_DRAM_BASE_RTL = "4\'d1"

RISCV_DRAM_BITS_RTL = 28

RISCV_DRAM_BASE_DTS = 0x10000000

RISCV_DRAM_SIZE_DTS = 0x10000000

RISCV_DRAM_SIZE_LINUX = 256M

# Include the rest of the make configuration
# which is common for all boards
include ../scripts/Makefrag

