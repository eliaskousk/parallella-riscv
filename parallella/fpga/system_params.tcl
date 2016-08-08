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

set rv64_clk_jitter 181.828
set rv64_clk_phase_error 104.359
set rv64_clk_request_freq 25.000
set rv64_clk_multiplier 9.125
set rv64_clk_divider1 36.500
set rv64_clk_divider2 1

#set rv64_clk_jitter 151.636
#set rv64_clk_phase_error 98.575
#set rv64_clk_request_freq 50.000
#set rv64_clk_multiplier 10.000
#set rv64_clk_divider1 20.000
#set rv64_clk_divider2 1
