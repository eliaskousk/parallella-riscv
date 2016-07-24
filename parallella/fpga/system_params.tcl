#Design name ("system" recommended)
set design system

#Project directory
set projdir ./parallella_riscv/

set parallella "../../parallella/oh"

#Device name
set partname "xc7z020clg400-1"

#Board part
set boardpart ""

#Paths to all IP blocks to use in Vivado "system.bd"

set ip_repos [list \
              "./parallella_base" \
              "./riscv_rv64" \
             ]

#All source files
set hdl_files []

#All constraints files
set constraints_files [list \
                       $parallella/parallella/fpga/parallella_timing.xdc \
                       $parallella/parallella/fpga/parallella_io.xdc \
                       $parallella/parallella/fpga/parallella_7020_io.xdc \
                      ]
