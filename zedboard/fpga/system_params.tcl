#Design name ("system" recommended)
set design system

#Project directory
set projdir ./zedboard_riscv/

#Device name
set partname "xc7z020clg484-1"

# Board name (Zedboard)
set boardpart "em.avnet.com:zed:part0:1.3"

#Paths to all IP blocks to use in Vivado "system.bd"

set ip_repos [list "./riscv_rv64"]

#All source files
set hdl_files []

#All constraints files
set constraints_files []
