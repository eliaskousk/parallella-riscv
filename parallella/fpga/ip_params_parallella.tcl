# Design name
set design parallella_base

# Project directory
set projdir ./parallella_base/

# Parallella IP directory
set parallella "../oh"

# FPGA device name
#set partname "xc7z020clg400-1"
set partname $::env(BOARD_DEVICE)

# Board part
set boardpart $::env(BOARD_PART)

# HDL file list
set hdl_files [list \
                $parallella/parallella/hdl \
                $parallella/common/hdl/ \
                $parallella/emesh/hdl \
                $parallella/emmu/hdl \
                $parallella/axi/hdl \
                $parallella/emailbox/hdl \
                $parallella/edma/hdl \
                $parallella/elink/hdl \
                ]

# Other IP file list
set ip_files   [list \
                $parallella/xilibs/ip/fifo_async_104x32.xci \
               ]

# Constraints file list
set constraints_files []

# Top module
set top_module parallella_base

set clk_m_axi "sys_clk"
set clk_s_axi "sys_clk"

