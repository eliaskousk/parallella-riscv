set design riscv_rv64g

set projdir ./riscv_rv64g/

set root "../../parallella"

# Device name
set partname "xc7z020clg400-1"

# Board part
set boardpart ""

set hdl_files [list \
                $root/hdl/riscv.rv64g/ \
              ]

set ip_files   []

set constraints_files []

set clk_m_axi "m_axi_aclk"
set clk_s_axi "s_axi_aclk"

