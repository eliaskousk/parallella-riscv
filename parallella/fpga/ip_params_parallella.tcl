set design parallella_base

set projdir ./parallella_base/

set parallella "../../parallella/oh"

# Device name
set partname "xc7z020clg400-1"

# Board part
set boardpart ""

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

set ip_files   [list \
                $parallella/xilibs/ip/fifo_async_104x32.xci \
               ]

set constraints_files []

set clk_m_axi "sys_clk"
set clk_m0_axi ""
set clk_m1_axi ""
set clk_s_axi "sys_clk"

