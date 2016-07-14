
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
#    create_project project_1 myproj -part xc7z020clg400-1

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
  set cclk_n [ create_bd_port -dir O cclk_n ]
  set cclk_p [ create_bd_port -dir O cclk_p ]
  set chip_nreset [ create_bd_port -dir O chip_nreset ]
  set gpio_n [ create_bd_port -dir IO -from 23 -to 0 gpio_n ]
  set gpio_p [ create_bd_port -dir IO -from 23 -to 0 gpio_p ]
  set hdmi_clk [ create_bd_port -dir O hdmi_clk ]
  set hdmi_d [ create_bd_port -dir O -from 23 -to 8 hdmi_d ]
  set hdmi_de [ create_bd_port -dir O hdmi_de ]
  set hdmi_hsync [ create_bd_port -dir O hdmi_hsync ]
  set hdmi_int [ create_bd_port -dir I hdmi_int ]
  set hdmi_spdif [ create_bd_port -dir O hdmi_spdif ]
  set hdmi_vsync [ create_bd_port -dir O hdmi_vsync ]
  set i2c_scl [ create_bd_port -dir IO i2c_scl ]
  set i2c_sda [ create_bd_port -dir IO i2c_sda ]
  set rxi_data_n [ create_bd_port -dir I -from 7 -to 0 rxi_data_n ]
  set rxi_data_p [ create_bd_port -dir I -from 7 -to 0 rxi_data_p ]
  set rxi_frame_n [ create_bd_port -dir I rxi_frame_n ]
  set rxi_frame_p [ create_bd_port -dir I rxi_frame_p ]
  set rxi_lclk_n [ create_bd_port -dir I rxi_lclk_n ]
  set rxi_lclk_p [ create_bd_port -dir I rxi_lclk_p ]
  set rxo_rd_wait_n [ create_bd_port -dir O rxo_rd_wait_n ]
  set rxo_rd_wait_p [ create_bd_port -dir O rxo_rd_wait_p ]
  set rxo_wr_wait_n [ create_bd_port -dir O rxo_wr_wait_n ]
  set rxo_wr_wait_p [ create_bd_port -dir O rxo_wr_wait_p ]
  set txi_rd_wait_n [ create_bd_port -dir I txi_rd_wait_n ]
  set txi_rd_wait_p [ create_bd_port -dir I txi_rd_wait_p ]
  set txi_wr_wait_n [ create_bd_port -dir I txi_wr_wait_n ]
  set txi_wr_wait_p [ create_bd_port -dir I txi_wr_wait_p ]
  set txo_data_n [ create_bd_port -dir O -from 7 -to 0 txo_data_n ]
  set txo_data_p [ create_bd_port -dir O -from 7 -to 0 txo_data_p ]
  set txo_frame_n [ create_bd_port -dir O txo_frame_n ]
  set txo_frame_p [ create_bd_port -dir O txo_frame_p ]
  set txo_lclk_n [ create_bd_port -dir O txo_lclk_n ]
  set txo_lclk_p [ create_bd_port -dir O txo_lclk_p ]

  # Create instance: RISCV_Rocket_Core_RV64G_0, and set properties
  set RISCV_Rocket_Core_RV64G_0 [ create_bd_cell -type ip -vlnv www.parallella.org:user:RISCV_Rocket_Core_RV64G: RISCV_Rocket_Core_RV64G_0 ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_mem_intercon

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
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25.000} \
CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} \
CONFIG.MMCM_CLKFBOUT_MULT_F {9.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {36.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_SOURCE {No_buffer} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_0_100M_to_25M

  # Create instance: parallella_base_0, and set properties
  set parallella_base_0 [ create_bd_cell -type ip -vlnv www.parallella.org:user:parallella_base: parallella_base_0 ]
  set_property -dict [ list \
CONFIG.NGPIO {24} \
 ] $parallella_base_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset: proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7: processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_CORE0_FIQ_INTR {0} \
CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_EN_CLK3_PORT {1} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
CONFIG.PCW_I2C0_I2C0_IO {EMIO} \
CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_I2C0_RESET_ENABLE {0} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_IRQ_F2P_MODE {DIRECT} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD1_SD1_IO {MIO 10 .. 15} \
CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_UART1_IO {MIO 8 .. 9} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.434} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.398} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.410} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.455} \
CONFIG.PCW_UIPARAM_DDR_CL {9} \
CONFIG.PCW_UIPARAM_DDR_CWL {9} \
CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {8192 MBits} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.315} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.391} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.374} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.271} \
CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {32 Bits} \
CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {400.00} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {Custom} \
CONFIG.PCW_UIPARAM_DDR_T_FAW {50} \
CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {40} \
CONFIG.PCW_UIPARAM_DDR_T_RC {60} \
CONFIG.PCW_UIPARAM_DDR_T_RCD {9} \
CONFIG.PCW_UIPARAM_DDR_T_RP {9} \
CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {1} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_USB0_RESET_ENABLE {0} \
CONFIG.PCW_USB1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_M_AXI_GP0 {1} \
CONFIG.PCW_USE_M_AXI_GP1 {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.PCW_USE_S_AXI_HP1 {1} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: processing_system7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $processing_system7_0_axi_periph

  # Create instance: rst_processing_system7_0_25M, and set properties
  set rst_processing_system7_0_25M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset: rst_processing_system7_0_25M ]

  # Create instance: sys_concat_intc, and set properties
  set sys_concat_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat: sys_concat_intc ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {16} \
 ] $sys_concat_intc

  # Create interface connections
  connect_bd_intf_net -intf_net RISCV_Rocket_Core_RV64G_0_M_AXI [get_bd_intf_pins RISCV_Rocket_Core_RV64G_0/m_axi] [get_bd_intf_pins axi_mem_intercon_PS_slave/S00_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_1_M00_AXI [get_bd_intf_pins axi_mem_intercon_PS_slave/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP1]
  connect_bd_intf_net -intf_net axi_mem_intercon_RV64G_M00_AXI [get_bd_intf_pins RISCV_Rocket_Core_RV64G_0/s_axi] [get_bd_intf_pins axi_mem_intercon_PS_master/M00_AXI]
  connect_bd_intf_net -intf_net parallella_base_0_m_axi [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins parallella_base_0/m_axi]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_mem_intercon_PS_master/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP1 [get_bd_intf_pins processing_system7_0/M_AXI_GP1] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins parallella_base_0/s_axi] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]

  # Create port connections
  connect_bd_net -net Net [get_bd_ports gpio_n] [get_bd_pins parallella_base_0/gpio_n]
  connect_bd_net -net Net1 [get_bd_ports gpio_p] [get_bd_pins parallella_base_0/gpio_p]
  connect_bd_net -net Net2 [get_bd_ports i2c_scl] [get_bd_pins parallella_base_0/i2c_scl]
  connect_bd_net -net Net3 [get_bd_ports i2c_sda] [get_bd_pins parallella_base_0/i2c_sda]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins RISCV_Rocket_Core_RV64G_0/m_axi_aclk] [get_bd_pins RISCV_Rocket_Core_RV64G_0/s_axi_aclk] [get_bd_pins axi_mem_intercon_PS_master/ACLK] [get_bd_pins axi_mem_intercon_PS_master/M00_ACLK] [get_bd_pins axi_mem_intercon_PS_master/S00_ACLK] [get_bd_pins axi_mem_intercon_PS_slave/ACLK] [get_bd_pins axi_mem_intercon_PS_slave/M00_ACLK] [get_bd_pins axi_mem_intercon_PS_slave/S00_ACLK] [get_bd_pins clk_wiz_0_100M_to_25M/clk_out1] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins rst_processing_system7_0_25M/slowest_sync_clk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0_100M_to_25M/locked] [get_bd_pins rst_processing_system7_0_25M/dcm_locked]
  connect_bd_net -net parallella_base_0_cclk_n [get_bd_ports cclk_n] [get_bd_pins parallella_base_0/cclk_n]
  connect_bd_net -net parallella_base_0_cclk_p [get_bd_ports cclk_p] [get_bd_pins parallella_base_0/cclk_p]
  connect_bd_net -net parallella_base_0_chip_resetb [get_bd_ports chip_nreset] [get_bd_pins parallella_base_0/chip_nreset]
  connect_bd_net -net parallella_base_0_constant_zero [get_bd_pins parallella_base_0/constant_zero] [get_bd_pins sys_concat_intc/In0] [get_bd_pins sys_concat_intc/In1] [get_bd_pins sys_concat_intc/In2] [get_bd_pins sys_concat_intc/In3] [get_bd_pins sys_concat_intc/In4] [get_bd_pins sys_concat_intc/In5] [get_bd_pins sys_concat_intc/In6] [get_bd_pins sys_concat_intc/In7] [get_bd_pins sys_concat_intc/In8] [get_bd_pins sys_concat_intc/In9] [get_bd_pins sys_concat_intc/In10] [get_bd_pins sys_concat_intc/In12] [get_bd_pins sys_concat_intc/In13] [get_bd_pins sys_concat_intc/In14] [get_bd_pins sys_concat_intc/In15]
  connect_bd_net -net parallella_base_0_i2c_scl_i [get_bd_pins parallella_base_0/i2c_scl_i] [get_bd_pins processing_system7_0/I2C0_SCL_I]
  connect_bd_net -net parallella_base_0_i2c_sda_i [get_bd_pins parallella_base_0/i2c_sda_i] [get_bd_pins processing_system7_0/I2C0_SDA_I]
  connect_bd_net -net parallella_base_0_mailbox_irq [get_bd_pins parallella_base_0/mailbox_irq] [get_bd_pins sys_concat_intc/In11]
  connect_bd_net -net parallella_base_0_ps_gpio_i [get_bd_pins parallella_base_0/ps_gpio_i] [get_bd_pins processing_system7_0/GPIO_I]
  connect_bd_net -net parallella_base_0_rxo_rd_wait_n [get_bd_ports rxo_rd_wait_n] [get_bd_pins parallella_base_0/rxo_rd_wait_n]
  connect_bd_net -net parallella_base_0_rxo_rd_wait_p [get_bd_ports rxo_rd_wait_p] [get_bd_pins parallella_base_0/rxo_rd_wait_p]
  connect_bd_net -net parallella_base_0_rxo_wr_wait_n [get_bd_ports rxo_wr_wait_n] [get_bd_pins parallella_base_0/rxo_wr_wait_n]
  connect_bd_net -net parallella_base_0_rxo_wr_wait_p [get_bd_ports rxo_wr_wait_p] [get_bd_pins parallella_base_0/rxo_wr_wait_p]
  connect_bd_net -net parallella_base_0_txo_data_n [get_bd_ports txo_data_n] [get_bd_pins parallella_base_0/txo_data_n]
  connect_bd_net -net parallella_base_0_txo_data_p [get_bd_ports txo_data_p] [get_bd_pins parallella_base_0/txo_data_p]
  connect_bd_net -net parallella_base_0_txo_frame_n [get_bd_ports txo_frame_n] [get_bd_pins parallella_base_0/txo_frame_n]
  connect_bd_net -net parallella_base_0_txo_frame_p [get_bd_ports txo_frame_p] [get_bd_pins parallella_base_0/txo_frame_p]
  connect_bd_net -net parallella_base_0_txo_lclk_n [get_bd_ports txo_lclk_n] [get_bd_pins parallella_base_0/txo_lclk_n]
  connect_bd_net -net parallella_base_0_txo_lclk_p [get_bd_ports txo_lclk_p] [get_bd_pins parallella_base_0/txo_lclk_p]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins processing_system7_0_axi_periph/ARESETN]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins parallella_base_0/m_axi_aresetn] [get_bd_pins parallella_base_0/s_axi_aresetn] [get_bd_pins parallella_base_0/sys_nreset] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins parallella_base_0/sys_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP1_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP1_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_CLK3 [get_bd_pins clk_wiz_0_100M_to_25M/clk_in1] [get_bd_pins processing_system7_0/FCLK_CLK3]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins clk_wiz_0_100M_to_25M/resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_25M/ext_reset_in]
  connect_bd_net -net processing_system7_0_GPIO_O [get_bd_pins parallella_base_0/ps_gpio_o] [get_bd_pins processing_system7_0/GPIO_O]
  connect_bd_net -net processing_system7_0_GPIO_T [get_bd_pins parallella_base_0/ps_gpio_t] [get_bd_pins processing_system7_0/GPIO_T]
  connect_bd_net -net processing_system7_0_I2C0_SCL_O [get_bd_pins parallella_base_0/i2c_scl_o] [get_bd_pins processing_system7_0/I2C0_SCL_O]
  connect_bd_net -net processing_system7_0_I2C0_SCL_T [get_bd_pins parallella_base_0/i2c_scl_t] [get_bd_pins processing_system7_0/I2C0_SCL_T]
  connect_bd_net -net processing_system7_0_I2C0_SDA_O [get_bd_pins parallella_base_0/i2c_sda_o] [get_bd_pins processing_system7_0/I2C0_SDA_O]
  connect_bd_net -net processing_system7_0_I2C0_SDA_T [get_bd_pins parallella_base_0/i2c_sda_t] [get_bd_pins processing_system7_0/I2C0_SDA_T]
  connect_bd_net -net rst_processing_system7_0_25M_interconnect_aresetn [get_bd_pins axi_mem_intercon_PS_master/ARESETN] [get_bd_pins axi_mem_intercon_PS_slave/ARESETN] [get_bd_pins rst_processing_system7_0_25M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_25M_peripheral_aresetn [get_bd_pins RISCV_Rocket_Core_RV64G_0/m_axi_aresetn] [get_bd_pins RISCV_Rocket_Core_RV64G_0/s_axi_aresetn] [get_bd_pins axi_mem_intercon_PS_master/M00_ARESETN] [get_bd_pins axi_mem_intercon_PS_master/S00_ARESETN] [get_bd_pins axi_mem_intercon_PS_slave/M00_ARESETN] [get_bd_pins axi_mem_intercon_PS_slave/S00_ARESETN] [get_bd_pins rst_processing_system7_0_25M/peripheral_aresetn]
  connect_bd_net -net rxi_data_n_1 [get_bd_ports rxi_data_n] [get_bd_pins parallella_base_0/rxi_data_n]
  connect_bd_net -net rxi_data_p_1 [get_bd_ports rxi_data_p] [get_bd_pins parallella_base_0/rxi_data_p]
  connect_bd_net -net rxi_frame_n_1 [get_bd_ports rxi_frame_n] [get_bd_pins parallella_base_0/rxi_frame_n]
  connect_bd_net -net rxi_frame_p_1 [get_bd_ports rxi_frame_p] [get_bd_pins parallella_base_0/rxi_frame_p]
  connect_bd_net -net rxi_lclk_n_1 [get_bd_ports rxi_lclk_n] [get_bd_pins parallella_base_0/rxi_lclk_n]
  connect_bd_net -net rxi_lclk_p_1 [get_bd_ports rxi_lclk_p] [get_bd_pins parallella_base_0/rxi_lclk_p]
  connect_bd_net -net sys_concat_intc_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins sys_concat_intc/dout]
  connect_bd_net -net txi_rd_wait_n_1 [get_bd_ports txi_rd_wait_n] [get_bd_pins parallella_base_0/txi_rd_wait_n]
  connect_bd_net -net txi_rd_wait_p_1 [get_bd_ports txi_rd_wait_p] [get_bd_pins parallella_base_0/txi_rd_wait_p]
  connect_bd_net -net txi_wr_wait_n_1 [get_bd_ports txi_wr_wait_n] [get_bd_pins parallella_base_0/txi_wr_wait_n]
  connect_bd_net -net txi_wr_wait_p_1 [get_bd_ports txi_wr_wait_p] [get_bd_pins parallella_base_0/txi_wr_wait_p]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces RISCV_Rocket_Core_RV64G_0/m_axi] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces parallella_base_0/m_axi] [get_bd_addr_segs processing_system7_0/S_AXI_HP1/HP1_DDR_LOWOCM] SEG_processing_system7_0_HP1_DDR_LOWOCM
  create_bd_addr_seg -range 0x1000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs RISCV_Rocket_Core_RV64G_0/s_axi/axi_lite] SEG_RISCV_Rocket_Core_RV64G_0_axi_lite
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs parallella_base_0/s_axi/axi_lite] SEG_parallella_base_0_axi_lite


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


