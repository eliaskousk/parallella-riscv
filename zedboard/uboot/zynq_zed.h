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
// 256 MB from the 512 MB available on-board which means
// the ARM cores and the RISC-V will own equal memory.
// This is the only change needed from the default Zedboard
// configuration in the U-Boot tree.

#define CONFIG_SYS_SDRAM_SIZE		(256 * 1024 * 1024)

#define CONFIG_SYS_NO_FLASH

#define CONFIG_ZYNQ_USB
#define CONFIG_ZYNQ_SDHCI0

#include <configs/zynq-common.h>

#endif /* __CONFIG_ZYNQ_ZED_H */
