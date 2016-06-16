/*
 * (C) Copyright 2013 Xilinx, Inc.
 *
 * Configuration for Zynq Evaluation and Development Board - ZedBoard
 * See zynq-common.h for Zynq common configs
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#ifndef __CONFIG_ZYNQ_ZED_H
#define __CONFIG_ZYNQ_ZED_H

// We specify here the SDRAM size to be used. We selected
// 512 MB from the 1024 MB available on-board Parallela v1
// which means the ARM cores + Epiphany and the RISC-V will
// own equal memory.
// This might be the only change needed from the default
// Zedboard configuration in the U-Boot tree.

#define CONFIG_SYS_SDRAM_SIZE		(512 * 1024 * 1024)

#define CONFIG_SYS_NO_FLASH

#define CONFIG_ZYNQ_USB
#define CONFIG_ZYNQ_SDHCI0

#include <configs/zynq-common.h>

#endif /* __CONFIG_ZYNQ_ZED_H */
