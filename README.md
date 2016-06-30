# RISC-V port to Parallella Board

## A Google Summer of Code 2016 Project

With this project I hope to benefit the open-source hardware enthusiast
community with work related to the incredible Parallella board used by thousands
of students and hobbyists around the world. This project will focus on the
integration of the RISC-V rocket core, inside the Zynq FPGA device of Parallella.
The RISC-V rocket core is an implementation of the RISV-V ISA that has gotten a
lot of attention and support due to being clean, modular and power efficient.

This project will allow owners of Parallella boards to write and execute RISC-V
programs with minimal effort from their side. The system will work out of the
box with a prebuilt binary image ready to be placed in an SD card and users
will be able to re-build it with minimal effort. Moreover, a tutorial document
will be created to aid inexperienced users make the most of this work and allow
them to modify it for their own needs and purposes with custom hardware and /
or software code.

## Build Instructions


### Setup Dependencies

This repository uses the following Git submodules. You can initialize each one separately if needed.

* [Parallella Open Hardware](https://github.com/parallella/oh)
  - Mapped to `root_dir/parallella/oh/`
  - Run in root dir: `git submodule update --init -- parallella/oh`
  - Needed to build the bitstream for Parallella or Zedboard (dev)
    inside the `root_dir/$board/fpga/` folder

* [Rocket-Chip Generator](https://github.com/ucb-bar/rocket-chip)
  - Mapped to `root_dir/ip/rocket-chip/`
  - Run in root dir: `git submodule update --init -- ip/rocket-chip`
  - Needed to update the generated RISC-V Rocket Core RV64G IP
    inside the `root_dir/ip/RISCV_Rocket_Core_RV64G_1.0/` folder

In order to build the boot images (U-Boot, Linux Kernel) for Parallella board target:

* [Parallella U-Boot Bootloader](https://github.com/parallella/parallella-uboot)
  - Mapped to `root_dir/boot/parallella-uboot`
  - Run in root dir: `git submodule update --init -- boot/parallella-uboot`
  - Needed to build the Parallella U-Boot bootloader (u-boot.elf)
    inside the `root_dir/$board/output/boot/` folder
  - Currently deprecated since we prefer not having to replace U-Boot
    or the FSBL by flashing the board (unsafe and needs JTAG or serial cable)

* [Parallella Linux Kernel](https://github.com/parallella/parallella-linux)
  - Mapped to `root_dir/boot/parallella-linux`
  - Run in root dir: `git submodule update --init -- boot/parallella-linux`
  - Needed to build the Zynq ARM Linux kernel of Parallella (uImage)
    inside the `root_dir/$board/output/final/` folder

In order to build the boot images (U-Boot, Linux Kernel) for ZedBoard board target (development only):

* [Xilinx U-Boot Bootloader](https://github.com/Xilinx/u-boot-xlnx)
  - Mapped to `root_dir/boot/u-boot-xlnx`
  - Run in root dir: `git submodule update --init -- boot/u-boot-xlnx`
  - Needed to build the ZedBoard U-Boot bootloader (u-boot.elf)
    inside the `root_dir/$board/output/boot/` folder

* [Xilinx Linux Kernel](https://github.com/Xilinx/linux-xlnx)
  - Mapped to `root_dir/boot/linux-xlnx/`
  - Run in root dir: `git submodule update --init -- boot/linux-xlnx`
  - Needed to build the ZedBoard Linux kernel (uImage)
    inside the `root_dir/$board/output/final/` folder

* [Device Tree Compiler](https://git.kernel.org/cgit/utils/dtc/dtc.git)
  - Mapped to `root_dir/boot/dtc`
  - Run in root dir: `git submodule update --init -- boot/dtc`
  - Needed to build the ZedBoard U-Boot bootloader (u-boot.elf)
    inside the `root_dir/board/output/boot/` folder and possibly
    a new device tree blob (devicetree.dtb) inside the
    `root_dir/$board/output/final/` folder

### Build Bitstream and / or Platform Software

In order to build a bitstream and / or the necessary platform software to boot the board, first populate
the Parallella OH submodule (see above) and edit the `BOARD`, `JOBS`, `VIVADO_PATH` and `VIVADO_VERSION`
variables in `${TOP}/scripts/settings.sh` if you need to change the target board (to e.g `zedboard` instead
of the default `parallella`) or the number of jobs your machine can simultaneously handle while building
(default is `8`) or the installation path and version of Vivado tools you have installed on your system.

Then run the following from the root directory:

* Build just the bitstream

This will build either the `parallella.bit.bin` for Parallella board or `zedboard.bit` fo

```bash
./scripts/build.bitstream.sh
```

You can view / edit the design in Vivado by opening the `${TOP}/${BOARD}/fpga/${BOARD}_riscv/system.xpr` project.

* Build just the software

The following will build U-Boot, the Linux kernel uImage (optional for Parallella if you it's official ESDK
from below) and the DTB (Device Tree Blob - necessary for both the Parallella and ZedBoard in order to use Rocket Core's
Host I/O interface)

```bash
./scripts/build.software.sh
```

* Build both the bitstream and the software

To build both the software and bitstream run the following.

You must run them in this order for Zedboard
since the bitstream step will also generate the final boot.bin image which contains FSBL + bitstream + U-Boot.

```bash
./scripts/build.software.sh
./scripts/build.bitstream.sh
```

All the final output files are placed in the `${TOP}/${BOARD}/output/final/` directory and should be placed in your SD card.

Before booting your board though you need the following:

1. Linux Root Image
2. RISC-V Frontend Server
3. A RISC-V program to test

See below on how to obtain these.

### Linux Root Image

The software above does not include a root image for Linux. If you don't want to bother with building
your own you can use an existing from the following repositories:

* [Parallella](https://github.com/parallella/pubuntu/releases)

If you use the `Parallella ESDK` image linked here you also have the choice of not building the Linux kernel yourself.
This image contains both the Linux kernel and the root image to boot Parallella so you only need to build (see above)
and copy on your SD card the DTB (Device Tree Blob) and of-course the bitstream.

* [ZedBoard](https://github.com/ucb-bar/fpga-images-zedboard/blob/master/uramdisk.image.gz)

This is just a root image and to use it you still need to build the Linux Kernel and the Device Tree Blob (see above), besides
the bitstream.

### RISC-V Frontend Server and Proxy Kernel

Make sure your image or your SD card contains the RISC-V frontend server `${TOP}/ip/toolchain/bin/fesvr-zedboard` for both
Parallella (...) and ZedBoard along with the proxy kernel `${TOP}/ip/toolchain/riscv64-unknown-elf/bin/pk`. These are automatically
built with the RISC-V toolchain (see below). When installing fesvr-zynq, don't forget to copy the library located at
`${TOP}/ip/toolchain/lib/libfesvr.so` to `/usr/local/lib` on the root image.

Then fesvr and pk can be used to load RISC-V programs from ARM like this:

```bash
root@zynq:~# ./fesvr pk hello
hello!
```

Instructions on booting Linux on your RISC-V core will follow soon.

### Build the RISC-V Toolchain

You can build the RISC-V toolchain by running the following script from the root directory:

```bash
./scripts/build.toolchain.sh
```

Building the RISC-V toolchain might take a lot of time and is NOT necessary to build the FPGA bitstream and
platform software (see above).

### Re-Build the RISC-V RV64G Rocket Core (Optional)

In case you want to (re)build the RISC-V RV64G rocket core IP you can run the following script from the root directory:

```bash
./scripts/build.rocketcore.sh
```

Building the RISC-V emulator is NOT necessary to build the FPGA bitstream or the RISC-V Toolchain (see above).

Do not attempt to generate a new rocket-core with the latest rocket-chip upstream since the UCB guys have replaced
the HTIF port (Host I/O interface) with a new Debug port. This means that their AXI -> HTIF adapter needs to be
rewritten for AXI -> Debug if one wants to use a latest rocket-core inside Zynq. This repo has a core generated with
an older rocket-chip version from May 2016 so hopefully this will work fine for now. You can of-course regenerate one
yourself using an earlier than June 23rd 2016 where HTIF was removed.

### Build the RISC-V Emulator (Optional)

You can build the RISC-V emulator which simulates the rocket core with Verilator by running the following script
from the root directory:

```bash
./scripts/build.emulator.sh
```

Building the RISC-V emulator is NOT necessary to build the FPGA bitstream or the RISC-V Toolchain (see above).

### Run Make Targets Manually

All the above scripts just run the respective make targets inside `${TOP}/scripts/Makefrag` which is included
in `${TOP}/${BOARD}/Makefile`. You can enter your desired `${TOP}/${BOARD}/` folder and manually run the targets
in a the sequence you desire. Make sure you source the `${TOP}/scripts/set.env.sh` first though to set the
necessary environment variables or your Vivado settings64.sh file if you need to use Vivado to e.g build a bitstream.


## Design

![Vivado Block Diagram](doc/images/vivado.parallella.riscv.bd.png)

### Parallella Base Component
This design contains the Parallella Base component connected to the ARM cores via AXI4.
The Parallella Base component contains the `E-Link` needed for communication with the `Epiphany` chip on-board Parallella
along with `GPIO` single ended passthrough (PL <-> PS connections) and `I2C` bus connection to the on-board power regulators
that power mangage the Epiphany chip. All these mean that the bitstreams produced here have identical functionality with
those provided by Parallella plus the RISC-V core (see below).

### RISC-V RV64G Core
The design contains a `RISC-V RV64G` (**G** = **IMAFD** = **I**nteger, **M**ultiply/Division, **A**tomic,
**F**loating Point with Single or **D**ouble Precision extensions) Core produced by
[Rocket Chip Generator](https://github.com/ucb-bar/rocket-chip).

It communicates with the rest of the ARM SoC of the Zynq FPGA device using AXI4 interfaces:

* **AXI Master**: RV64G Core to DDR3 via ARM  (memory access of the core)

* **AXI Slave**:  ARM to HostIO of RV64G Core (boot / control the core)

### Timing
The Parallella Base component runs with a 100 MHz clock and the RISC-V RV64G core runs with a 25 MHz clock.
It can be synthesized and implemented with the latest Xilinx Vivado tools (tested with 2015.4 and 2016.1).

You can select your version of the Xilinx tools by editing the `VIVADO` variable in `${TOP}/scripts/set.env.sh`
before running the build scripts to produce a bitstream (see above).

## Links

[FOSSi](http://www.fossi-foundation.org)

[Parallella](https://www.parallella.org)

[RISC-V](http://riscv.org)

[Google Summer of Code](https://developers.google.com/open-source/gsoc/)

[FOSSi GSoC'16 Projects](https://summerofcode.withgoogle.com/organizations/5516229267685376/#projects)

## Contributors

### Code

- Elias Kouskoumvekakis ([Blog](http://eliaskousk.teamdac.com))

### GSoC Mentors

- Olof    Kindgren ([OpenRISC](http://openrisc.io))
- Andreas Olofsson ([Adapteva](http://www.adapteva.com))
