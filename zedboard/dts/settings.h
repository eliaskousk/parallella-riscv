#ifndef settings_h
#define settings_h

//
// Define base and size of DRAM memory to use for the RISC-V core.
// The base of the allocated memory is also defined in the RISC-V
// Verilog RTL and the size on the mem kernel commandline parameter
// of RISC-V Linux
//


#define RISCV_DRAM_BASE 0x10000000
#define RISCV_DRAM_SIZE 0x10000000

#endif // settings_h
