set design RISCV_Rocket_Core_RV64G
set projdir ./zedboard_riscv_rv64g/
set root "../../parallella/oh"

# Device name
set partname "xc7z020clg484-1"

# Board name (Zedboard)
set boardpart "em.avnet.com:zed:part0:1.3"

set hdl_files [list \
                ../hdl/ \
                $root/common/hdl/ \
                $root/emesh/hdl \
                $root/emmu/hdl \
                $root/axi/hdl \
                $root/emailbox/hdl \
                $root/edma/hdl \
                $root/elink/hdl \
                ]

set ip_files   []

set constraints_files []

