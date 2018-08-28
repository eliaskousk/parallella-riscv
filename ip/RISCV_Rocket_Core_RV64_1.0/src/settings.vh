`ifndef settings_vh
`define settings_vh


//
// RV64 Core Name
//

`define RISCV_CORE_ARCH_RV64IMA

//
// Memory address base and width to use
//
// The base and size of the allocated memory is also defined in the device tree of
// ARM Linux and the size on the mem kernel commandline parameter of RISC-V Linux
//

`define RISCV_DRAM_BASE 3'd1
`define RISCV_DRAM_BITS 28


`endif // settings_vh
