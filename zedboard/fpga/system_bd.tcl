
################################################################
# This is a generated script based on design: system
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg484-1
#    set_property BOARD_PART em.avnet.com:zed:part0:1.3 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name system

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports

  # Create instance: RISCV_Rocket_Core_RV64G_0, and set properties
  set RISCV_Rocket_Core_RV64G_0 [ create_bd_cell -type ip -vlnv www.parallella.org:user:RISCV_Rocket_Core_RV64G: RISCV_Rocket_Core_RV64G_0 ]

  # Create instance: axi_mem_intercon_PS_master, and set properties
  set axi_mem_intercon_PS_master [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: axi_mem_intercon_PS_master ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_mem_intercon_PS_master

  # Create instance: axi_mem_intercon_PS_slave, and set properties
  set axi_mem_intercon_PS_slave [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: axi_mem_intercon_PS_slave ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_mem_intercon_PS_slave

  # Create instance: clk_wiz_0_100M_to_25M, and set properties
  set clk_wiz_0_100M_to_25M [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz: clk_wiz_0_100M_to_25M ]
  set_property -dict [ list \
CONFIG.CLKOUT1_DRIVES {BUFG} \
CONFIG.CLKOUT1_JITTER {181.828} \
CONFIG.CLKOUT1_PHASE_ERROR {104.359} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25} \
CONFIG.CLKOUT2_DRIVES {BUFG} \
CONFIG.CLKOUT3_DRIVES {BUFG} \
CONFIG.CLKOUT4_DRIVES {BUFG} \
CONFIG.CLKOUT5_DRIVES {BUFG} \
CONFIG.CLKOUT6_DRIVES {BUFG} \
CONFIG.CLKOUT7_DRIVES {BUFG} \
CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
CONFIG.CLK_IN2_BOARD_INTERFACE {Custom} \
CONFIG.MMCM_CLKFBOUT_MULT_F {9.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {36.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.RESET_BOARD_INTERFACE {Custom} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
CONFIG.SECONDARY_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.USE_BOARD_FLOW {true} \
CONFIG.USE_PHASE_ALIGNMENT {true} \
 ] $clk_wiz_0_100M_to_25M

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7: processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.preset {ZedBoard} \
 ] $processing_system7_0

  # Create instance: rst_processing_system7_0_25M, and set properties
  set rst_processing_system7_0_25M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset: rst_processing_system7_0_25M ]

  # Create interface connections
  connect_bd_intf_net -intf_net RISCV_Rocket_Core_RV64G_0_M_AXI [get_bd_intf_pins RISCV_Rocket_Core_RV64G_0/m_axi] [get_bd_intf_pins axi_mem_intercon_PS_slave/S00_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_1_M00_AXI [get_bd_intf_pins axi_mem_intercon_PS_slave/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins RISCV_Rocket_Core_RV64G_0/s_axi] [get_bd_intf_pins axi_mem_intercon_PS_master/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_mem_intercon_PS_master/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins RISCV_Rocket_Core_RV64G_0/m_axi_aclk] [get_bd_pins RISCV_Rocket_Core_RV64G_0/s_axi_aclk] [get_bd_pins axi_mem_intercon_PS_master/ACLK] [get_bd_pins axi_mem_intercon_PS_master/M00_ACLK] [get_bd_pins axi_mem_intercon_PS_master/S00_ACLK] [get_bd_pins axi_mem_intercon_PS_slave/ACLK] [get_bd_pins axi_mem_intercon_PS_slave/M00_ACLK] [get_bd_pins axi_mem_intercon_PS_slave/S00_ACLK] [get_bd_pins clk_wiz_0_100M_to_25M/clk_out1] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins rst_processing_system7_0_25M/slowest_sync_clk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0_100M_to_25M/locked] [get_bd_pins rst_processing_system7_0_25M/dcm_locked]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins clk_wiz_0_100M_to_25M/clk_in1] [get_bd_pins processing_system7_0/FCLK_CLK0]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_25M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_25M_interconnect_aresetn [get_bd_pins axi_mem_intercon_PS_master/ARESETN] [get_bd_pins axi_mem_intercon_PS_slave/ARESETN] [get_bd_pins rst_processing_system7_0_25M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_25M_peripheral_aresetn [get_bd_pins RISCV_Rocket_Core_RV64G_0/m_axi_aresetn] [get_bd_pins RISCV_Rocket_Core_RV64G_0/s_axi_aresetn] [get_bd_pins axi_mem_intercon_PS_master/M00_ARESETN] [get_bd_pins axi_mem_intercon_PS_master/S00_ARESETN] [get_bd_pins axi_mem_intercon_PS_slave/M00_ARESETN] [get_bd_pins axi_mem_intercon_PS_slave/S00_ARESETN] [get_bd_pins rst_processing_system7_0_25M/peripheral_aresetn]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces RISCV_Rocket_Core_RV64G_0/m_axi] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x1000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs RISCV_Rocket_Core_RV64G_0/s_axi/axi_lite] SEG_RISCV_Rocket_Core_RV64G_0_axi_lite


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


