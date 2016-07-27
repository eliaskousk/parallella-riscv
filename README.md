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

### Build Bitstream and Platform Software

In order to build a bitstream and / or the necessary platform software to boot the board you must first
edit the `BOARD`, `JOBS`, `VIVADO_PATH` and `VIVADO_VERSION` variables in `${TOP}/scripts/settings.sh`
if you need to change the target board (to e.g `zedboard` instead of the default `parallella`) or the
number of jobs your machine can simultaneously handle while building (default is `8`) or the installation
path and version of Vivado tools you have installed on your system. The system can be synthesized and
implemented with the latest Xilinx Vivado tools (tested with 2015.4 and later).

Then you can do the following:

* Build only the Host Software

The host software consists of U-Boot, the Linux kernel and the devicetree DTB file (Device Tree Blob).

- **U-Boot** is not currently used for Parallella since the one contained in its Flash chip is fine and
there is always a risk when performing re-flashes.

- **The Linux kernel (uImage)** is also identical with the one provided by the latest E-SDK and it's a
matter of preference to use the one you build or the fefault from the E-SDK.

- **The device tree DTB file** is necessary for both the Parallella and ZedBoard in order to use Rocket
Core's Host I/O interface and thus the RISC-V RV64 core.

You can build all three of them by running the following:

```bash
./scripts/build.host.software.sh
```

* Build only the FPGA Bitstream

This will build either the `parallella.bit.bin` FPGA bitstream for Parallella board or `zedboard.bit`
for Zedboard:

```bash
./scripts/build.fpga.bitstream.sh
```

After it finishes you can view / edit the design in Vivado by opening the
`${TOP}/${BOARD}/fpga/${BOARD}_riscv/system.xpr` project.

Keep in mind that everytime you run the above build bitstream script the project's folder is
deleted so any modifications you have made there will be lost.

* Build both the Host Software and the FPGA Bitstream

To build both the host software and FPGA Bitstream run the following:

```bash
./scripts/build.software.sh
./scripts/build.bitstream.sh
```

You must run them in this order for Zedboard since the bitstream step will also generate the final
`boot.bin` image which contains `FSBL (First Stage Bootloader) + FPGA Bitstream + U-Boot Bootloader`.

All the final output files are placed in the `${TOP}/${BOARD}/output/final/` directory and should be placed
in your SD card.

### Obtain an ARM Host Linux Root Image

The software above does not include a root image for the Linux host running on the ARM cores of Zynq.
If you don't want to bother with building your own you can use an existing from the following repositories:

* [Parallella](https://github.com/parallella/pubuntu/releases)

If you use the `Parallella ESDK` image linked here you also have the choice of not building the ARM Linux
kernel yourself. This image contains both the Linux kernel and the root image to boot Parallella so you
only need to build (see above) and copy on your SD card the device tree DTB file (Device Tree Blob) and
of-course the bitstream.

* [ZedBoard](https://github.com/ucb-bar/fpga-images-zedboard/blob/master/uramdisk.image.gz)

This is just a root image with very limited functionality and to use it you still need to build the Linux
Kernel and the device tree DTB file (see above on `Host Software`), besides the FPGA Bitstream.

### Build the RISC-V Toolchain

In order to compile RISC-V programs of your own or the proxy kernel (bbl), the Berkeley bootloader (bbl)
and the RISC-V Linux you must build the RISC-V toolchain by running the following script:

```bash
./scripts/build.riscv.toolchain.sh
```

Building the RISC-V toolchain might take a lot of time and if you change RISC-V core configurations
(using the **IMAFD** arch in place of the default **IMA**) you need to rebuild it after each change.

The toolchain will be installed in the `${TOP}/ip/toolchain/` directory.

You can use this toolchain to build RISC-V baremetal programs or the RISC-V Linux kernel (see below).

### RISC-V Baremetal

In order to run baremetal programs on the board run the following script:

```bash
./scripts/build.riscv.baremetal.sh
```

All the output files will be placed in the  `${TOP}/${BOARD}/final/output/riscv/` folder.

To copy the built files to an already booted board you can run the following (assuming your Parallella
can be reached inside your network with the `parallella` host (you can replace this with its IP):

```bash
cd parallella/output/final/riscv/
scp fesvr parallella:~/
scp libfesvr.so parallella:~/
scp pk parallella:~/
scp hello parallella:~/
```

All the above tranfered files will be placed in the home directory of the parallella user but you can
of-course transfer them wherever you wish on your SD card's root or boot partition.

For the frontend server don't forget to copy the shared library `libfesvr.so` to `/usr/local/lib` on your
board and running `sudo ldconfig` to update the library cache.

parallella@parallella:~/$ sudo cp libfesvr.so /usr/local/lib/
parallella@parallella:~/$ sudo ldconfig

Then fesvr and pk can be used to load RISC-V baremetal programs like this:

```bash
parallella@parallella:~/$ sudo ./fesvr pk hello
Hello World!
```

### RISC-V Linux And Root Disk Image

You can build the RISC-V Linux kernel with the following script:

```bash
./scripts/build.riscv.linux.sh
```

Afterwards you can build the RISC-V Linux root disk image with the following script:

```bash
./scripts/build.riscv.root.sh
```

This might take a long time depending on the machine's computational power and network
connectivity so please be patient. We suggest you download the prebuilt image from here (coming soon!).

All the output files will be placed in the  `${TOP}/${BOARD}/final/output/riscv/` folder.

To copy the built files to an already booted board you can run the following (assuming your Parallella
can be reached inside your network with the `parallella` host (you can replace this with its IP):

```bash
cd parallella/output/final/riscv/
scp bbl parallella:~/
scp vmlinux parallella:~/
scp root.bin parallella:~/
```

All the above tranfered files will be placed in the home directory of the parallella user but you can
of-course transfer them wherever you wish on your SD card's root or boot partition.

Then fesvr and bbl can be used to boot RISC-V Linux and perform simple tasks like shown below:

```bash
parallella@parallella:~/$ sudo ./fesvr +disk=root.bin bbl vmlinux
              vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
                  vvvvvvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrr       vvvvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrr      vvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrr      vvvvvvvvvvvvvvvvvvvvvv  
rrrrrrrrrrrrr       vvvvvvvvvvvvvvvvvvvvvv    
rr                vvvvvvvvvvvvvvvvvvvvvv      
rr            vvvvvvvvvvvvvvvvvvvvvvvv      rr
rrrr      vvvvvvvvvvvvvvvvvvvvvvvvvv      rrrr
rrrrrr      vvvvvvvvvvvvvvvvvvvvvv      rrrrrr
rrrrrrrr      vvvvvvvvvvvvvvvvvv      rrrrrrrr
rrrrrrrrrr      vvvvvvvvvvvvvv      rrrrrrrrrr
rrrrrrrrrrrr      vvvvvvvvvv      rrrrrrrrrrrr
rrrrrrrrrrrrrr      vvvvvv      rrrrrrrrrrrrrr
rrrrrrrrrrrrrrrr      vv      rrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrr          rrrrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrr      rrrrrrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrrrr  rrrrrrrrrrrrrrrrrrrrrr

       INSTRUCTION SETS WANT TO BE FREE
[    0.000000] Linux version 4.1.17-g174f395-dirty (lupo@gene) (gcc version 5.3.0 (GCC) ) #9 Mon Jul 25 18:18:14 EEST 2016
[    0.000000] Available physical memory: 1022MB
[    0.000000] Physical memory usage limited to 384MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000200000-0x00000000181fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000200000-0x00000000181fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000200000-0x00000000181fffff]
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 96960
[    0.000000] Kernel command line: root=/dev/htifblk0 mem=384M
[    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 384352K/393216K available (1810K kernel code, 92K rwdata, 396K rodata, 64K init, 210K bss, 8864K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:2
[    0.000000] clocksource riscv_clocksource: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 191126044627 ns
[    0.150000] Calibrating delay using timer specific routine.. 20.02 BogoMIPS (lpj=100104)
[    0.150000] pid_max: default: 32768 minimum: 301
[    0.150000] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
[    0.150000] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 bytes)
[    0.150000] devtmpfs: initialized
[    0.150000] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.150000] NET: Registered protocol family 16
[    0.150000] Switched to clocksource riscv_clocksource
[    0.150000] NET: Registered protocol family 2
[    0.150000] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    0.150000] TCP bind hash table entries: 4096 (order: 3, 32768 bytes)
[    0.150000] TCP: Hash tables configured (established 4096 bind 4096)
[    0.150000] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    0.150000] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    0.150000] NET: Registered protocol family 1
[    0.150000] futex hash table entries: 256 (order: 0, 6144 bytes)
[    0.150000] io scheduler noop registered
[    0.150000] io scheduler cfq registered (default)
[    0.180000] htifcon htif1: detected console
[    0.180000] console [htifcon0] enabled
[    0.180000] htifblk htif2: detected disk
[    0.180000] htifblk htif2: added htifblk0
[    0.180000] VFS: Mounted root (ext2 filesystem) readonly on device 254:0.
[    0.180000] devtmpfs: mounted
[    0.180000] Freeing unused kernel memory: 64K (ffffffff80000000 - ffffffff80010000)
INIT: version 2.88 booting
[    0.430000] random: dd urandom read with 23 bits of entropy available
hwclock: can't open '/dev/misc/rtc': No such file or directory
Sun Jul 17 01:37:12 UTC 2016
hwclock: can't open '/dev/misc/rtc': No such file or directory
INIT: Entering runlevel: 5
Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device
hwclock: can't open '/dev/misc/rtc': No such file or directory
Starting syslogd/klogd: done

Poky (Yocto Project Reference Distro) 2.0+snapshot-20160717 riscv64 /dev/ttyHTIF0

riscv64 login: root

root@riscv64:~# ls -al /
drwxr-xr-x   18 root     root          1024 Jul 17 01:37 .
drwxr-xr-x   18 root     root          1024 Jul 17 01:37 ..
drwxr-xr-x    2 root     root          2048 Jul 17 01:37 bin
drwxr-xr-x    2 root     root          1024 Jul 17 01:17 boot
drwxr-xr-x    3 root     root         10720 Jul 17 01:37 dev
drwxr-xr-x   21 root     root          1024 Jan  1  1970 etc
drwxr-xr-x    3 root     root          1024 Jul 17 01:37 home
drwxr-xr-x    2 root     root          2048 Jul 17 01:37 lib
drwx------    2 root     root         12288 Jul 17 01:37 lost+found
drwxr-xr-x    2 root     root          1024 Jul 17 01:17 media
drwxr-xr-x    2 root     root          1024 Jul 17 01:17 mnt
dr-xr-xr-x   29 root     root             0 Jan  1  1970 proc
drwxr-xr-x    3 root     root           160 Jul 17 01:37 run
drwxr-xr-x    2 root     root          1024 Jul 17 01:37 sbin
drwxr-xr-x    2 root     root          1024 Jul 17 01:17 sys
drwxrwxrwt    2 root     root          1024 Jul 17 01:17 tmp
drwxr-xr-x    9 root     root          1024 Jul 17 01:34 usr
drwxr-xr-x    8 root     root          1024 Jul 17 01:34 var

root@riscv64:~# uname -a
Linux riscv64 4.1.17-g174f395-dirty #9 Mon Jul 25 18:18:14 EEST 2016 riscv GNU/Linux

root@riscv64:~# shutdown -h now
INIT: Switching to runlevel: 0
INIT: Sending processes the TERM signal
root@riscv64:~# logout
hwclock: can't open '/dev/misc/rtc': No such file or directory
Stopping syslogd/klogd: stopped syslogd (pid 142)
stopped klogd (pid 141)
done
Deconfiguring network interfaces... ifdown: interface eth0 not configured
done.
Sending all processes the TERM signal...
Unmounting remote filesystems...
Deactivating swap...
Unmounting local filesystems...
[4.730000] reboot: Power down

parallella@parallella:~/$
```

Congratulations, you now have a working RISC-V RV64 core running RISC-V Linux on your Parallella!

### Re-Build the RISC-V RV64 Rocket Core (Optional)

In case you want to (re)build the RISC-V RV64G rocket core IP you can run the following script:

```bash
./scripts/build.riscv.rocketcore.sh
```

Do not attempt to generate a new rocket-core with the latest rocket-chip upstream since the UCB guys have
replaced the HTIF port (Host I/O interface) with a new Debug port. This means that their AXI -> HTIF
adapter needs to be rewritten for AXI -> Debug if one wants to use a latest rocket-core inside Zynq.

We currently use a core generated with an older rocket-chip version from March 2016 in order to overcome
some RISC-V Linux incompatibilities introduced with later versions.

### Build the RISC-V Emulator (Optional)

You can build the RISC-V emulator which simulates the rocket core with Verilator by running the following
script:

```bash
./scripts/build.riscv.emulator.sh
```

Building the RISC-V emulator is NOT necessary to build the FPGA bitstream or the RISC-V Toolchain
(see above).

### Run Make Targets Manually

All the above scripts just run the respective make targets inside `${TOP}/scripts/Makefrag` which is
included in `${TOP}/${BOARD}/Makefile`. You can enter your desired `${TOP}/${BOARD}/` folder and manually
run the targets in a the sequence you desire. Make sure you source the `${TOP}/scripts/set.env.sh` first
though to set the necessary environment variables and your Vivado settings64.sh file if you need to use
Vivado to e.g build a bitstream.

## Setup Dependencies

This repository uses the following Git submodules. You can initialize each one separately if needed
to clean things up or perform any advanced action but this is normally not needed since the build
system will take care of all the submodule initializations.

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

* [RISC-V Linux](https://github.com/riscv/riscv-linux)
  - Mapped to `root_dir/boot/riscv-linux/`
  - Run in root dir: `git submodule update --init -- boot/riscv-linux`
  - Needed to build the RISC-V Linux kernel
    inside the `root_dir/$board/output/final/riscv/` folder

* [RISC-V Poky](https://github.com/riscv/riscv-poky)
  - Mapped to `root_dir/boot/riscv-linux/`
  - Run in root dir: `git submodule update --init -- boot/riscv-poky`
  - Needed to build the RISC-V Poky root image (distribution) for RISC-V Linux
    inside the `root_dir/$board/output/final/riscv/` folder

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

## Design

![Vivado Block Diagram](doc/images/vivado.parallella.riscv.bd.png)

### Parallella Base Component

This design contains the Parallella Base component connected to the ARM cores via AXI4.
The Parallella Base component contains the `E-Link` needed for communication with the `Epiphany` chip
on-board Parallella along with `GPIO` single ended passthrough (PL <-> PS connections) and `I2C` bus
connection to the on-board power regulators that power mangage the Epiphany chip.

All these mean that the bitstreams produced here have identical functionality with those provided by
Parallella plus the RISC-V core (see below).

### RISC-V RV64 Core

The design contains two `RISC-V RV64` cores generated by [Rocket Chip Generator](https://github.com/ucb-bar/rocket-chip).

The default configuration uses a core generated with support for the **IMA** extensions.
**IMA** means the core contains the **I**nteger, **M**ultiply/Division and **A**tomic extensions.

You can optionally use a core generated with support for the **IMAFD** extensions just by setting the
following variables inside the `${BOARD}/Makefile`:

* `RISCV_CORE_ARCH   = IMAFD` (default is `IMA`)
* `RISCV_CORE_CONFIG = DefaultFPGAConfig` (defailt is `DefailtFPGANormalConfig`)

**IMAFD** = **G** means the core contains the  **I**nteger, **M**ultiply/Division, **A**tomic and
**F**loating Point with Single or **D**ouble Precision extensions.

### RISC-V RV64 DRAM Memory

The default allocated DRAM to the RISC-V core is 384 MB, starting from the second half of the 1 GB
DDR3 memory of parallella. You can change this by setting the following makefile variables and then
rebuilding the bitstream, the device tree for the ARM host and the RISC-V Linux kernel:

* `RISCV_DRAM_BASE_RTL   = "3\'d1"`
* `RISCV_DRAM_BITS_RTL   = 29`
* `RISCV_DRAM_BASE_DTS   = 0x20000000`
* `RISCV_DRAM_SIZE_DTS   = 0x18000000`
* `RISCV_DRAM_SIZE_LINUX = 384M`

```bash
./scripts/build.bitstream.sh
./scripts/build.software.sh
./scripts/build.riscv.linux.sh
```

### RISC-V RV64 AXI Buses

The RISC-V RV64 core communicates with the rest of the ARM SoC of the Zynq FPGA device using AXI4
interfaces:

* **AXI Master**: RV64 Core to DDR3 DRAM via ARM  (memory access of the core)

* **AXI Slave**:  ARM to HostIO of RV64 Core (boot / control the core)

### Clocks

The Parallella Base component runs with a 100 MHz clock and the RISC-V RV64 core runs with a 50 MHz clock
when configured with the **IMA** extensions or with a 25 MHz clock when configured with the **IMAFD**
extensions.

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
