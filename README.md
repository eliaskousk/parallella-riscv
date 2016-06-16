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

## Build instructions

In order to build a bitstream run the following:

* **Parallella**

```bash
./parallella/fpga/build.sh
```
You can view / edit the Parallella design by opening the `./parallella/fpga/parallella_riscv_rv64g/system.xpr` Vivado project.

* **Zedboard** (Only for development and testing)

```bash
./zedboard/fpga/build.sh
```
You can view / edit the Zedboard design by opening the `./zedboard/fpga/zedboard_riscv_rv64g/system.xpr` Vivado project.

## Design

Currently the design contains a RISC-V RV64G Core produced by [Rocket Chip Generator](https://github.com/ucb-bar/rocket-chip).

It communicates with the rest of the ARM SoC of the Zynq FPGA device using AXI interfaces:

* **AXI Master**: RV64G Core to DDR3 via ARM  (memory access of the core)

* **AXI Slave**:  ARM to HostIO of RV64G Core (boot / control the core)

![Vivado Block Diagram](doc/images/vivado.parallella.riscv.rv64g.bd.png)

## Links

[FOSSi](http://www.fossi-foundation.org)

[Parallella](https://www.parallella.org)

[RISC-V](http://riscv.org)

[Google Summer of Code](https://developers.google.com/open-source/gsoc/)

[FOSSi GSoC'16 Projects](https://summerofcode.withgoogle.com/organizations/5516229267685376/#projects)

## Contributors

- Elias Kouskoumvekakis

