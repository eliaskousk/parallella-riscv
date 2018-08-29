# Design name
set design riscv_rv64

# Project directory
set projdir ./riscv_rv64/

# FPGA device name
set partname $::env(BOARD_DEVICE)

# Board part
set boardpart $::env(BOARD_PART)

# HDL file list
set hdl_files [list \
                ../hdl/riscv.rv64/ \
              ]

# Other IP file list
set ip_files   []

# Constraint file list
set constraints_files []

# Top module
set top_module RISCV_Rocket_Core_RV64

set clk_m_axi "m_axi_aclk"
set clk_s_axi "s_axi_aclk"
