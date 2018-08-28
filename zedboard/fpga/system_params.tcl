# Design name ("system" recommended)
set design system

# Vivado project directory
set projdir ./zedboard_riscv/

# FPGA device name
set partname $::env(BOARD_DEVICE)

# Board name (Zedboard)
set boardpart $::env(BOARD_PART)

# Paths to all IP blocks to use in Vivado "system.bd"
set ip_repos [list "./riscv_rv64"]

# HDL source file list
set hdl_files []

# Constraints file list
set constraints_files []

# RISC-V Core architecture (RV64IMA or IMAFD)
set riscv_core_arch $::env(RISCV_CORE_ARCH)

# Set MMCM settings for the RISC-V Core
#
# Clocks supported:
# - 50 MHz for RV64IMA Core
# - 25 MHz for RV64IMAFD Core
#
if {$riscv_core_arch == "RV64IMA" } {
    set rv64_clk_jitter 151.636
    set rv64_clk_phase_error 98.575
    set rv64_clk_request_freq 50.000
    set rv64_clk_multiplier 10.000
    set rv64_clk_divider1 20.000
    set rv64_clk_divider2 1
}

if {$riscv_core_arch == "RV64IMAFD" } {
    set rv64_clk_jitter 181.828
    set rv64_clk_phase_error 104.359
    set rv64_clk_request_freq 25.000
    set rv64_clk_multiplier 9.125
    set rv64_clk_divider1 36.500
    set rv64_clk_divider2 1
}
