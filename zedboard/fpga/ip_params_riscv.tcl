# Design name
set design riscv_rv64

# Vivado project directory
set projdir ./riscv_rv64/

# IP directory
set ip_dir ../../ip/RISCV_Rocket_Core_RV64_1.0

# FPGA device name
set partname $::env(BOARD_DEVICE)

# Board name (Zedboard)
set boardpart $::env(BOARD_PART)

# HDL source file list
set hdl_files [list \
               ../hdl/riscv.rv64/ \
              ]

# Other IP HDL file list
set ip_files   []

# Constraints file list
set constraints_files []

# Top module
set top_module RISCV_Rocket_Core_RV64

# Clocks
set clk_m_axi "m_axi_aclk"
set clk_s_axi "s_axi_aclk"
