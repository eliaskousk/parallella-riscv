#
# Do not run directly!
# It is sourced by each board's subdirectory
#

base_dir = $(abspath ..)

output_dir = $(base_dir)/$(BOARD_NAME)/output

boot_build_dir = $(output_dir)/boot

final_output_dir = $(output_dir)/final

default: $(BOARD_NAME)


#
# ----------------------------------------------------------
# Bitstream / boot image
# ----------------------------------------------------------
# Parallella: Binary bitstream image (no board flash needed)
# ZedBoard  : Full boot image (FSBL + bitstream + U-Boot)
# ----------------------------------------------------------
#

parallella_bitstream = $(final_output_dir)/parallella.bit.bin
$(parallella_bitstream): bitstream
  # Make final Parallella bitstream image (bin instead of bit)
	cd $(boot_build_dir) && \
	bootgen -image bit2bin.bif -w on -split bin && \
	rm bit2bin.bin && \
	cp parallella.bit.bin $(final_output_dir)/
parallella_bitstream: $(parallella_bitstream)

zedboard_bitstream = $(final_output_dir)/boot.bin
$(zedboard_bitstream): bitstream
  # Make final ZedBoard boot image (FSBL + bitstream + U-Boot)
	cd $(boot_build_dir) && \
	bootgen -image boot.bif -w on -o boot.bin && \
	cp boot.bin $(final_output_dir)/
zedboard_bitstream: $(zedboard_bitstream)


#
# -------------------------------------------
# IP, System Project and Bitstream Generation
# -------------------------------------------
#

RocketCoreIPName = "RISCV_Rocket_Core_RV64_1.0"
RocketCoreIPDir = $(base_dir)/ip/$(RocketCoreIPName)/src
fpga_dir = $(base_dir)/$(BOARD_NAME)/fpga

bitstream = $(fpga_dir)/$(BOARD_NAME).bit
$(bitstream): $(BOARD_NAME)_ip_deps $(fpga_dir)/system_params.tcl
	sed -i "s/^\(set scripts_vivado_version \)[0-9]\{4\}\.[0-9]/\1${VIVADO_VERSION}/" $(fpga_dir)/system_bd.tcl
	cd $(fpga_dir) && \
	rm -rf $(BOARD_NAME)_riscv && \
	export BOARD_DEVICE=$(BOARD_DEVICE) && \
	export BOARD_PART=$(BOARD_PART) && \
	export RISCV_CORE_ARCH=$(RISCV_CORE_ARCH) && \
	vivado -mode tcl -source $(fpga_dir)/system_bitstream.tcl && \
	cp ./$(BOARD_NAME)_riscv/system.runs/impl_1/system_wrapper.bit $(fpga_dir)/$(BOARD_NAME).bit
	cd $(boot_build_dir) && \
	ln -sf $(fpga_dir)/$(BOARD_NAME).bit .
bitstream: $(bitstream)

system_project = $(fpga_dir)/$(BOARD_NAME)_riscv/system.xpr
$(system_project): $(BOARD_NAME)_ip_deps $(fpga_dir)/system_params.tcl
	sed -i "s/^\(set scripts_vivado_version \)[0-9]\{4\}\.[0-9]/\1${VIVADO_VERSION}/" $(fpga_dir)/system_bd.tcl
	cd $(fpga_dir) && \
	rm -rf $(BOARD_NAME)_riscv && \
	export BOARD_DEVICE=$(BOARD_DEVICE) && \
	export BOARD_PART=$(BOARD_PART) && \
	export RISCV_CORE_ARCH=$(RISCV_CORE_ARCH) && \
	vivado -mode tcl -source $(fpga_dir)/system_project.tcl
system_project: $(system_project)

parallella_ip_deps: parallella_ip_package riscv_ip_setup riscv_ip_package
zedboard_ip_deps: riscv_ip_setup riscv_ip_package

parallella_ip_package = $(fpga_dir)/parallella_base/parallella_base.xpr
$(parallella_ip_package): $(fpga_dir)/ip_params_parallella.tcl
	${SCRIPTS}/setup.parallella.oh.submodule.sh
	cd $(fpga_dir) && \
	rm -rf parallella_base && \
	export BOARD_DEVICE=$(BOARD_DEVICE) && \
	export BOARD_PART=$(BOARD_PART) && \
	export RISCV_CORE_ARCH=$(RISCV_CORE_ARCH) && \
	vivado -mode tcl -source $(fpga_dir)/ip_package_parallella.tcl
parallella_ip_package: $(parallella_ip_package)

riscv_ip_package = $(fpga_dir)/riscv_rv64g/riscv_rv64g.xpr
$(riscv_ip_package): $(fpga_dir)/ip_params_riscv.tcl
	cd $(fpga_dir) && \
	rm -rf riscv_rv64 && \
	export BOARD_DEVICE=$(BOARD_DEVICE) && \
	export BOARD_PART=$(BOARD_PART) && \
	export RISCV_CORE_ARCH=$(RISCV_CORE_ARCH) && \
	vivado -mode tcl -source $(fpga_dir)/ip_package_riscv.tcl
riscv_ip_package: $(riscv_ip_package)

riscv_ip_setup:
	sed -i "s/^\(\`define RISCV_CORE_ARCH_\)[a-zA-Z0-9]*/\1$(RISCV_CORE_ARCH)/" $(RocketCoreIPDir)/settings.vh
	sed -i "s/^\(\`define RISCV_DRAM_BASE\) [0-9]\'d[0-9]/\1 $(RISCV_DRAM_BASE_RTL)/" $(RocketCoreIPDir)/settings.vh
	sed -i "s/^\(\`define RISCV_DRAM_BITS\) [0-9]\{2\}/\1 $(RISCV_DRAM_BITS_RTL)/" $(RocketCoreIPDir)/settings.vh
	sed -i "s/^\(\`include \"\)[a-zA-Z0-9]*\(\.Core\.vh\"\)/\1$(RISCV_CORE_ARCH)\2/" $(RocketCoreIPDir)/RISCV_Rocket_Core_RV64_AXI.v


#
# ----------------------------
# Platform software generation
# ----------------------------
#

arm_linux_dir = $(base_dir)/boot/$(LINUX_REPO)

uboot_dir = $(base_dir)/boot/$(UBOOT_REPO)

dtc_dir = $(base_dir)/boot/dtc

dtb_dir = $(arm_linux_dir)/arch/arm/boot/dts

dts_dir = $(base_dir)/$(BOARD_NAME)/dts

CROSS_TOOLCHAIN_LINUX = arm-linux-gnueabihf


# Unset LD_LIBRARY_PATH that points to Xilinx libraries (from sourcing setting64.sh)
# in order to not break various commandline tools that are used during building (e.g awk)
export LD_LIBRARY_PATH=

$(BOARD_NAME)_software: arm-uboot-$(BOARD_NAME) arm-linux arm-dtb

arm-linux: arm-uboot-$(BOARD_NAME) # Must first build uboot because we need its tools
  # Compile kernel
	git submodule update --init $(arm_linux_dir)
  # No make clean included here since one copy of linux should work on all boards
  # Configure Linux kernel
	cd $(arm_linux_dir) && \
	make ARCH=arm CROSS_COMPILE=$(CROSS_TOOLCHAIN_LINUX) $(LINUX_CONFIG)_defconfig
  # Build Linux kernel
	cd $(arm_linux_dir) && \
	make ARCH=arm CROSS_COMPILE=$(CROSS_TOOLCHAIN_LINUX) -j${JOBS}
  # Convert zImage to uImage
	cd $(arm_linux_dir) && \
	export PATH=$(uboot_dir)/tools:$$PATH && \
	make ARCH=arm CROSS_COMPILE=$(CROSS_TOOLCHAIN_LINUX) UIMAGE_LOADADDR=0x8000 uImage
	mkdir -p $(final_output_dir)
	cp $(arm_linux_dir)/arch/arm/boot/uImage $(final_output_dir)/

arm-uboot-parallella: arm-uboot
arm-uboot-zedboard: arm-dtc arm-uboot # We need dtc to build ZedBoard's U-Boot from upstream u-boot-xlnx repo

arm-uboot:
  # Compile board-compatible u-boot
	git submodule update --init $(uboot_dir)
  # Copy relevant configuration files
	cp uboot/$(UBOOT_CONFIG).h $(uboot_dir)/include/configs/
  # Fix missing GCC configuration (for Parallella's U-Boot)
ifeq ($(BOARD_NAME),parallella)
	cp $(uboot_dir)/include/linux/compiler-gcc5.h $(uboot_dir)/include/linux/compiler-gcc7.h
endif
  # Install openssl development package (Ubuntu)
	sudo apt install libssl-dev
  # Configure U-Boot
	cd $(uboot_dir) && \
	make CROSS_COMPILE=$(CROSS_TOOLCHAIN_LINUX) $(UBOOT_CONFIG)_defconfig
  # Build U-Boot
	export PATH=$(dtc_dir):$$PATH && \
	cd $(uboot_dir) && make CROSS_COMPILE=$(CROSS_TOOLCHAIN_LINUX) -j${JOBS}
	mkdir -p $(boot_build_dir)
	cp $(uboot_dir)/u-boot $(boot_build_dir)/u-boot.elf

arm-dtc:
  # Compile device tree compiler (needed by upstream U-Boot for ZedBoard)
	git submodule update --init $(dtc_dir)
  # Install flex & bison software packages (Ubuntu)
	sudo apt install flex bison
	cd $(dtc_dir) && make -j${JOBS}

arm-dtb:
	sed -i "s/^\(#define RISCV_DRAM_BASE\) 0x[0-9A-Fa-f]\{8\}/\1 $(RISCV_DRAM_BASE_DTS)/" $(dts_dir)/settings.h
	sed -i "s/^\(#define RISCV_DRAM_SIZE\) 0x[0-9A-Fa-f]\{8\}/\1 $(RISCV_DRAM_SIZE_DTS)/" $(dts_dir)/settings.h
	cp $(dts_dir)/settings.h $(dtb_dir)
	cp $(dts_dir)/$(LINUX_DTS).dts* $(dtb_dir)
	cd $(arm_linux_dir) && \
	make ARCH=arm CROSS_COMPILE=$(CROSS_TOOLCHAIN_LINUX) $(LINUX_DTB).dtb
	cp $(dtb_dir)/$(LINUX_DTB).dtb $(final_output_dir)/devicetree.dtb

# Instead of using the above you can use the following to build locally (not in Linux repo)
# if you don't want to init its huge repo just for a device tree build. This will of-course
# use the local dts that may be out of date and also needs the dtc repo as the ZedBoard U-Boot target.
arm-dtb-local: arm-dtc
	export PATH=$(arm_linux_dir)/scripts/dtc:$$PATH && \
	dtc -I dts -O dtb -o $(final_output_dir)/devicetree.dtb $(dts_dir)/$(LINUX_DTB).dts


#
# ---------------------------------
# RISC-V Rocket Cores and Toolchain
# ---------------------------------
#

ROCKET_ZYNQ = ${IP}/rocket-zynq
ROCKET_ZYNQ_BUILD = ${ROCKET_ZYNQ}/build
SCALA_VERSION=2.11.12
bootrom_img = $(TESTCHIPIP)/bootrom/bootrom.rv64.img $(TESTCHIPIP)/bootrom/bootrom.rv32.img
rocketchip_stamp = $(ROCKET_ZYNQ)/lib/rocketchip.stamp
extra_stamps = $(addprefix $(ROCKET_ZYNQ)/lib/,$(addsuffix .stamp,testchipip))

# Taken from rocket chip 2a5aeea. TODO: Maybe source this directly from makefrag?
SBT ?= java -Xmx2G -Xss8M -XX:MaxPermSize=256M -jar $(ROCKETCHIP)/sbt-launch.jar

FIRRTL_JAR ?= $(ROCKETCHIP)/firrtl/utils/bin/firrtl.jar
FIRRTL ?= java -Xmx2G -Xss8M -XX:MaxPermSize=256M -cp $(FIRRTL_JAR) firrtl.Driver

$(FIRRTL_JAR): $(shell find $(ROCKETCHIP)/firrtl/src/main/scala -iname "*.scala" 2> /dev/null)
	$(MAKE) -C $(ROCKETCHIP)/firrtl SBT="$(SBT)" root_dir=$(ROCKETCHIP)/firrtl build-scala

CHISEL_ARGS := $(ROCKET_ZYNQ_BUILD)

lookup_scala_srcs = $(shell find $(1)/. -iname "*.scala" 2> /dev/null)

$(RocketCoreIPDir)/%.v: $(ROCKETCHIP)/vsrc/%.v
	cp $< $@

$(ROCKETCHIP)/lib/firrtl.jar: $(FIRRTL_JAR)
	mkdir -p $(@D)
	cp $< $@

$(rocketchip_stamp): $(call lookup_scala_srcs, $(ROCKETCHIP)) $(ROCKETCHIP)/lib/firrtl.jar
	cd $(ROCKETCHIP) && $(SBT) pack
	mkdir -p $(ROCKET_ZYNQ)/lib
	cp $(ROCKETCHIP)/target/pack/lib/* $(ROCKET_ZYNQ)/lib
	touch $(rocketchip_stamp)

$(ROCKET_ZYNQ)/Makefrag.pkgs: $(ROCKET_ZYNQ)/generate-pkg-mk.sh
	bash $(ROCKET_ZYNQ)/generate-pkg-mk.sh testchipip > $@

-include $(ROCKET_ZYNQ)/Makefrag.pkgs

$(ROCKET_ZYNQ_BUILD)/Top.$(RISCV_CORE_CONFIG).fir: arm-dtc $(rocketchip_stamp) $(extra_stamps) $(bootrom_img) $(call lookup_scala_srcs,$(ROCKET_ZYNQ))
	mkdir -p $(@D)
	export PATH=$(arm_linux_dir)/scripts/dtc:$$PATH && \
	cd $(ROCKET_ZYNQ) && $(SBT) "run $(CHISEL_ARGS) zynq Top zynq $(RISCV_CORE_CONFIG)"

$(ROCKET_ZYNQ_BUILD)/Top.$(RISCV_CORE_CONFIG).v: $(ROCKET_ZYNQ_BUILD)/Top.$(RISCV_CORE_CONFIG).fir $(FIRRTL_JAR)
	$(FIRRTL) -i $< -o $@ -X verilog

$(RocketCoreIPDir)/$(RISCV_CORE_ARCH).Core.vh: $(ROCKET_ZYNQ_BUILD)/Top.$(RISCV_CORE_CONFIG).v
	cp $< $@

riscv_rocketcore: $(RocketCoreIPDir)/$(RISCV_CORE_ARCH).Core.vh
	sed -i "s/^\(module\) Top(/\1 Rocket_Core_$(RISCV_CORE_ARCH)(/" $(RocketCoreIPDir)/$(RISCV_CORE_ARCH).Core.vh

riscv_toolchain:
  # Install necessary packages (Ubuntu)
	# sudo apt-get install autoconf automake autotools-dev curl \
	# libmpc-dev libmpfr-dev libgmp-dev libusb-1.0-0-dev gawk build-essential bison flex \
	# texinfo gperf libtool patchutils bc zlib1g-dev device-tree-compiler pkg-config
  # Switch to the master (priv1.7 ISA) branch and setup build script
	# cd ${RISCVTOOLS} && \
	# git checkout -B current && \
	# git checkout master && \
	# git submodule update --init --recursive
	# sed -i "s/^\(build_project riscv-gnu-toolchain --prefix=\$$RISCV\)\( --with-arch=RV64[A-Z]\{1,5\}\)\{0,1\}/\1 --with-arch=$(RISCV_CORE_ARCH)/" ${RISCVTOOLS}/build.sh
	# sed -i "s/^\(build_project riscv-tests\)/#\1/" ${RISCVTOOLS}/build.sh
  # Build the RISC-V Toolchain
  # (First Newlib version for use without an OS, then the Linux version with glibc)
	cd ${RISCVTOOLS} && \
	export MAKEFLAGS=-j${JOBS} && \
	./build.sh && \
	cd riscv-gnu-toolchain && \
	./configure --prefix=${RISCV} && \
	make linux # && \
	# cd ${RISCVTOOLS} && \
	# git checkout current && \
	# git checkout -- build.sh && \
	# git submodule update --init --recursive


#
# -----------------------------
# RISC-V Software, Linux Kernel
# -----------------------------
#

riscv_software: riscv_baremetal riscv_linux

riscv_baremetal: riscv_fesvr riscv_pk riscv_hello

fesvr-main = fesvr-zynq
fesvr-srcs = \
	$(ROCKET_ZYNQ)/csrc/fesvr_zynq.cc \
	$(ROCKET_ZYNQ)/csrc/zynq_driver.cc \
	$(TESTCHIPIP)/csrc/blkdev.cc \

fesvr-hdrs = \
	$(ROCKET_ZYNQ)/csrc/zynq_driver.h \
	$(TESTCHIPIP)/csrc/blkdev.h \

fesvr-lib = $(ROCKET_ZYNQ_BUILD)/libfesvr.so

CXX_FPGA      = $(CROSS_TOOLCHAIN_LINUX)-g++
CXXFLAGS_FPGA = -O2 -std=c++11 -Wall -L$(ROCKET_ZYNQ_BUILD) -lfesvr \
                -Wl,-rpath,/usr/local/lib \
		-I $(ROCKET_ZYNQ)/csrc -I $(TESTCHIPIP)/csrc \
		-I $(ROCKETCHIP)/riscv-tools/riscv-fesvr/ \
		-Wl,-rpath,/usr/local/lib \

$(fesvr-lib):
	mkdir -p $(ROCKET_ZYNQ_BUILD)
	cd $(ROCKET_ZYNQ_BUILD) && \
	$(ROCKETCHIP)/riscv-tools/riscv-fesvr/configure \
		--host=$(CROSS_TOOLCHAIN_LINUX) && \
	make libfesvr.so

$(ROCKET_ZYNQ_BUILD)/$(fesvr-main): $(fesvr-lib) $(fesvr-srcs) $(fesvr-hdrs)
	$(CXX_FPGA) $(CXXFLAGS_FPGA) -o $(ROCKET_ZYNQ_BUILD)/$(fesvr-main) $(fesvr-srcs)

riscv_fesvr: $(ROCKET_ZYNQ_BUILD)/$(fesvr-main)
	cp $(ROCKET_ZYNQ_BUILD)/$(fesvr-main) $(final_output_dir)/riscv/fesvr
	cp $(fesvr-lib) $(final_output_dir)/riscv/

riscv_pk:
	cd ${RISCV}/riscv64-unknown-elf/bin/ && \
	chmod 755 pk && cp pk $(final_output_dir)/riscv/

riscv_hello:
	cd $(base_dir)/examples/hello/ && \
	CFLAGS="-march=$(RISCV_CORE_ARCH)" riscv64-unknown-elf-gcc -o hello hello.c && \
	cp hello $(final_output_dir)/riscv/

RISCVLinuxVersion = 4.1.17

riscv_linux: riscv_fesvr riscv_bbl riscv_kernel

riscv_bbl:
	cd ${RISCV}/riscv64-unknown-elf/bin/ && \
	chmod 755 bbl && cp bbl $(final_output_dir)/riscv/

riscv_kernel:
	git submodule update --init  -- ${BOOT}/riscv-linux
	cd ${BOOT} && \
	curl -L https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-$(RISCVLinuxVersion).tar.xz | tar -xJkf - && \
	rsync -a --ignore-existing linux-$(RISCVLinuxVersion)/ riscv-linux/ && \
	rm -rf linux-$(RISCVLinuxVersion) && \
	cd riscv-linux && \
	sed -i "s/^\(CONFIG_CMDLINE=\"root=\/dev\/htifblk0\)\"/\1 mem=$(RISCV_DRAM_SIZE_LINUX)\"/" arch/riscv/configs/riscv64_spike && \
	make ARCH=riscv defconfig && \
	make -j${JOBS} ARCH=riscv vmlinux && \
	cp vmlinux $(final_output_dir)/riscv/

#
# ---------------------
# Handle ramdisk images
# ---------------------
#

ramdisk-open:
	mkdir ramdisk
	dd if=$(output_delivery)/uramdisk.image.gz  bs=64 skip=1 | \
	gunzip -c | sudo sh -c 'cd ramdisk/ && cpio -i'

ramdisk-close: arm-uboot # must first build uboot because we need tools
	@if [ ! -d "ramdisk" ]; then \
		echo "No ramdisk to close (use make ramdisk-open first)"; \
		exit 1; \
	fi
	sh -c 'cd ramdisk/ && sudo find . | sudo cpio -H newc -o' | gzip -9 > uramdisk.cpio.gz
	mkimage -A arm -O linux -T ramdisk -d uramdisk.cpio.gz $(output_delivery)/uramdisk.image.gz
	rm uramdisk.cpio.gz
	@echo "Don't forget to remove ramdisk before opening it again (sudo rm -rf ramdisk)"

clean:

.PHONY: clean
