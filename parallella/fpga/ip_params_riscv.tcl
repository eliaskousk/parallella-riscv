set design riscv_rv64

set projdir ./riscv_rv64/

set root "../../parallella"

# Device name
#set partname "xc7z020clg400-1"
set partname $::env(BOARD_DEVICE)

# Board part
#set boardpart ""
set boardpart $::env(BOARD_PART)

set hdl_files [list \
                $root/hdl/riscv.rv64/ \
              ]

set ip_files   []

set constraints_files []

set clk_m_axi "m_axi_aclk"
set clk_s_axi "s_axi_aclk"

