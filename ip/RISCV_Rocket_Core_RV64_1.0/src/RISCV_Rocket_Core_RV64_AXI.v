`timescale 1 ns / 1 ps

`include "settings.vh"
`include "RV64IMA.Core.vh"

module RISCV_Rocket_Core_RV64_AXI #
(
    parameter integer C_DRAM_BASE        = 3'd1,
    parameter integer C_DRAM_BITS        = 29,

    // AXI Master

    // Thread ID Width
    parameter integer C_M_AXI_ID_WIDTH   = 5,
    // Width of Address Bus
    parameter integer C_M_AXI_ADDR_WIDTH = 32,
    // Width of Data Bus
    parameter integer C_M_AXI_DATA_WIDTH = 64,

    // AXI Slave

    // Width of ID for for write address, write data, read address and read data
    parameter integer C_S_AXI_ID_WIDTH     = 12,
    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH   = 32,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH   = 32
)
(
    // AXI Master

    // Global Clock Signal.
    input wire                                M_AXI_ACLK,
    // Global Reset Singal. This Signal is Active Low
    input wire                                M_AXI_ARESETN,
    // Master Interface Write Address ID
    output wire [C_M_AXI_ID_WIDTH-1 : 0]      M_AXI_AWID,
    // Master Interface Write Address
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0]    M_AXI_AWADDR,
    // Burst length. The burst length gives the exact number of transfers in a burst
    output wire [7 : 0]                       M_AXI_AWLEN,
    // Burst size. This signal indicates the size of each transfer in the burst
    output wire [2 : 0]                       M_AXI_AWSIZE,
    // Burst type. The burst type and the size information,
    // determine how the address for each transfer within the burst is calculated.
    output wire [1 : 0]                       M_AXI_AWBURST,
    // Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
    output wire                               M_AXI_AWLOCK,
    // Memory type. This signal indicates how transactions
    // are required to progress through a system.
    output wire [3 : 0]                       M_AXI_AWCACHE,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    output wire [2 : 0]                       M_AXI_AWPROT,
    // Quality of Service, QoS identifier sent for each write transaction.
    output wire [3 : 0]                       M_AXI_AWQOS,
    // Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
    output wire [3 : 0]                       M_AXI_AWREGION,
    // Write address valid. This signal indicates that
    // the channel is signaling valid write address and control information.
    output wire                               M_AXI_AWVALID,
    // Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
    input wire                                M_AXI_AWREADY,
    // Master Interface Write Data.
    output wire [C_M_AXI_DATA_WIDTH-1 : 0]    M_AXI_WDATA,
    // Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
    output wire [C_M_AXI_DATA_WIDTH/8-1 : 0]  M_AXI_WSTRB,
    // Write last. This signal indicates the last transfer in a write burst.
    output wire  M_AXI_WLAST,
    // Write valid. This signal indicates that valid write
    // data and strobes are available
    output wire                               M_AXI_WVALID,
    // Write ready. This signal indicates that the slave
    // can accept the write data.
    input wire                                M_AXI_WREADY,
    // Master Interface Write Response.
    input wire [C_M_AXI_ID_WIDTH-1 : 0]       M_AXI_BID,
    // Write response. This signal indicates the status of the write transaction.
    input wire [1 : 0] M_AXI_BRESP,
    // Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
    input wire                                M_AXI_BVALID,
    // Response ready. This signal indicates that the master
    // can accept a write response.
    output wire                               M_AXI_BREADY,
    // Master Interface Read Address.
    output wire [C_M_AXI_ID_WIDTH-1 : 0]      M_AXI_ARID,
    // Read address. This signal indicates the initial
    // address of a read burst transaction.
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0]    M_AXI_ARADDR,
    // Burst length. The burst length gives the exact number of transfers in a burst
    output wire [7 : 0]                       M_AXI_ARLEN,
    // Burst size. This signal indicates the size of each transfer in the burst
    output wire [2 : 0]                       M_AXI_ARSIZE,
    // Burst type. The burst type and the size information,
    // determine how the address for each transfer within the burst is calculated.
    output wire [1 : 0]                       M_AXI_ARBURST,
    // Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
    output wire                               M_AXI_ARLOCK,
    // Memory type. This signal indicates how transactions
    // are required to progress through a system.
    output wire [3 : 0]                       M_AXI_ARCACHE,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    output wire [2 : 0]                       M_AXI_ARPROT,
    // Quality of Service, QoS identifier sent for each read transaction
    output wire [3 : 0]                       M_AXI_ARQOS,
    // Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
    output wire [3 : 0]                       M_AXI_ARREGION,
    // Write address valid. This signal indicates that
    // the channel is signaling valid read address and control information
    output wire                               M_AXI_ARVALID,
    // Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
    input wire                                M_AXI_ARREADY,
    // Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
    input wire [C_M_AXI_ID_WIDTH-1 : 0]       M_AXI_RID,
    // Master Read Data
    input wire [C_M_AXI_DATA_WIDTH-1 : 0]     M_AXI_RDATA,
    // Read response. This signal indicates the status of the read transfer
    input wire [1 : 0]                        M_AXI_RRESP,
    // Read last. This signal indicates the last transfer in a read burst
    input wire                                M_AXI_RLAST,
    // Read valid. This signal indicates that the channel
    // is signaling the required read data.
    input wire                                M_AXI_RVALID,
    // Read ready. This signal indicates that the master can
    // accept the read data and response information.
    output wire                               M_AXI_RREADY,

    // =========
    // AXI Slave
    // =========

    // Global Clock Signal
    input wire                                S_AXI_ACLK,
    // Global Reset Signal. This Signal is Active LOW
    input wire                                S_AXI_ARESETN,
    // Write Address ID
    input wire [C_S_AXI_ID_WIDTH-1 : 0]       S_AXI_AWID,
    // Write address
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
    // Burst length. The burst length gives the exact number of transfers in a burst
    input wire [7 : 0]                        S_AXI_AWLEN,
    // Burst size. This signal indicates the size of each transfer in the burst
    input wire [2 : 0]                        S_AXI_AWSIZE,
    // Burst type. The burst type and the size information,
    // determine how the address for each transfer within the burst is calculated.
    input wire [1 : 0]                        S_AXI_AWBURST,
    // Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
    input wire                                S_AXI_AWLOCK,
    // Memory type. This signal indicates how transactions
    // are required to progress through a system.
    input wire [3 : 0]                        S_AXI_AWCACHE,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    input wire [2 : 0]                        S_AXI_AWPROT,
    // Quality of Service, QoS identifier sent for each
    // write transaction.
    input wire [3 : 0]                        S_AXI_AWQOS,
    // Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
    input wire [3 : 0]                        S_AXI_AWREGION,
    // Write address valid. This signal indicates that
    // the channel is signaling valid write address and
    // control information.
    input wire                                S_AXI_AWVALID,
    // Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated
    // control signals.
    output wire                               S_AXI_AWREADY,
    // Write Data
    input wire [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
    // Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    // Write last. This signal indicates the last transfer
    // in a write burst.
    input wire                                S_AXI_WLAST,
    // Write valid. This signal indicates that valid write
    // data and strobes are available.
    input wire                                S_AXI_WVALID,
    // Write ready. This signal indicates that the slave
    // can accept the write data.
    output wire                               S_AXI_WREADY,
    // Response ID tag. This signal is the ID tag of the
    // write response.
    output wire [C_S_AXI_ID_WIDTH-1 : 0]      S_AXI_BID,
    // Write response. This signal indicates the status
    // of the write transaction.
    output wire [1 : 0]                       S_AXI_BRESP,
    // Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
    output wire                               S_AXI_BVALID,
    // Response ready. This signal indicates that the master
    // can accept a write response.
    input wire                                S_AXI_BREADY,
    // Read address ID. This signal is the identification
    // tag for the read address group of signals.
    input wire [C_S_AXI_ID_WIDTH-1 : 0]       S_AXI_ARID,
    // Read address. This signal indicates the initial
    // address of a read burst transaction.
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
    // Burst length. The burst length gives the exact number of transfers in a burst
    input wire [7 : 0]                        S_AXI_ARLEN,
    // Burst size. This signal indicates the size of each transfer in the burst
    input wire [2 : 0]                        S_AXI_ARSIZE,
    // Burst type. The burst type and the size information,
    // determine how the address for each transfer within the burst is calculated.
    input wire [1 : 0]                        S_AXI_ARBURST,
    // Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
    input wire                                S_AXI_ARLOCK,
    // Memory type. This signal indicates how transactions
    // are required to progress through a system.
    input wire [3 : 0]                        S_AXI_ARCACHE,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    input wire [2 : 0]                        S_AXI_ARPROT,
    // Quality of Service, QoS identifier sent for each
    // read transaction.
    input wire [3 : 0]                        S_AXI_ARQOS,
    // Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
    input wire [3 : 0]                        S_AXI_ARREGION,
    // Write address valid. This signal indicates that
    // the channel is signaling valid read address and
    // control information.
    input wire                                S_AXI_ARVALID,
    // Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated
    // control signals.
    output wire                               S_AXI_ARREADY,
    // Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
    output wire [C_S_AXI_ID_WIDTH-1 : 0]      S_AXI_RID,
    // Read Data
    output wire [C_S_AXI_DATA_WIDTH-1 : 0]    S_AXI_RDATA,
    // Read response. This signal indicates the status of
    // the read transfer.
    output wire [1 : 0]                       S_AXI_RRESP,
    // Read last. This signal indicates the last transfer
    // in a read burst.
    output wire                               S_AXI_RLAST,
    // Read valid. This signal indicates that the channel
    // is signaling the required read data.
    output wire                               S_AXI_RVALID,
    // Read ready. This signal indicates that the master can
    // accept the read data and response information.
    input wire                                S_AXI_RREADY
);

    wire reset;
    wire reset_cpu;
    wire host_clk;
    wire host_in_valid;
    wire host_in_ready;
    wire host_out_ready;
    wire host_out_valid;
    wire [15:0] host_in_bits;
    wire [15:0] host_out_bits;

    assign reset = !S_AXI_ARESETN;

    BUFG bufg_host_clk (.I(S_AXI_ACLK), .O(host_clk));

    // ===========================
    // AXI Slave to HostIO Adapter
    // ===========================

    ZynqAdapter RV64_AXI_HostIO_Adapter (
        .clk                     (host_clk),
        .reset                   (reset),

        // ========================================================
        // HostIO Interface
        // ========================================================
        // Host IO AXI Slave Adapter to Rocket Core
        // Connects the HostIO AXI Slave interface with Rocket Core
        // ========================================================

        .io_reset                (reset_cpu),
        .io_host_in_ready        (host_in_ready),
        .io_host_in_valid        (host_in_valid),
        .io_host_in_bits         (host_in_bits),

        .io_host_out_ready       (host_out_ready),
        .io_host_out_valid       (host_out_valid),
        .io_host_out_bits        (host_out_bits),

        // =================================================================
        // HostIO AXI Slave Interface
        // =================================================================
        // Host IO AXI Slave Adapter to PS AXI Master
        // Connects the adapter and thus Rocket Core to an AXI Master on PS
        // =================================================================

        .io_nasti_aw_ready       (S_AXI_AWREADY),
        .io_nasti_aw_valid       (S_AXI_AWVALID),
        .io_nasti_aw_bits_addr   (S_AXI_AWADDR),
        .io_nasti_aw_bits_len    (S_AXI_AWLEN),
        .io_nasti_aw_bits_size   (S_AXI_AWSIZE),
        .io_nasti_aw_bits_burst  (S_AXI_AWBURST),
        .io_nasti_aw_bits_id     (S_AXI_AWID),
        .io_nasti_aw_bits_lock   (),
        .io_nasti_aw_bits_prot   (),
        .io_nasti_aw_bits_qos    (),
        .io_nasti_aw_bits_region (),

        .io_nasti_ar_ready       (S_AXI_ARREADY),
        .io_nasti_ar_valid       (S_AXI_ARVALID),
        .io_nasti_ar_bits_addr   (S_AXI_ARADDR),
        .io_nasti_ar_bits_len    (S_AXI_ARLEN),
        .io_nasti_ar_bits_size   (S_AXI_ARSIZE),
        .io_nasti_ar_bits_burst  (S_AXI_ARBURST),
        .io_nasti_ar_bits_id     (S_AXI_ARID),
        .io_nasti_ar_bits_lock   (),
        .io_nasti_ar_bits_prot   (),
        .io_nasti_ar_bits_qos    (),
        .io_nasti_ar_bits_region (),

        .io_nasti_w_valid        (S_AXI_WVALID),
        .io_nasti_w_ready        (S_AXI_WREADY),
        .io_nasti_w_bits_data    (S_AXI_WDATA),
        .io_nasti_w_bits_strb    (S_AXI_WSTRB),
        .io_nasti_w_bits_last    (S_AXI_WLAST),

        .io_nasti_r_valid        (S_AXI_RVALID),
        .io_nasti_r_ready        (S_AXI_RREADY),
        .io_nasti_r_bits_id      (S_AXI_RID),
        .io_nasti_r_bits_resp    (S_AXI_RRESP),
        .io_nasti_r_bits_data    (S_AXI_RDATA),
        .io_nasti_r_bits_last    (S_AXI_RLAST),

        .io_nasti_b_valid        (S_AXI_BVALID),
        .io_nasti_b_ready        (S_AXI_BREADY),
        .io_nasti_b_bits_id      (S_AXI_BID),
        .io_nasti_b_bits_resp    (S_AXI_BRESP)
    );

    // ======================
    // Rocket Core with MemIO
    // ======================

    wire [31:0] mem_araddr;
    wire [31:0] mem_awaddr;

    assign M_AXI_ARADDR = {C_DRAM_BASE, mem_araddr[C_DRAM_BITS-1:0]};
    assign M_AXI_AWADDR = {C_DRAM_BASE, mem_awaddr[C_DRAM_BITS-1:0]};

`ifdef RISCV_CORE_ARCH_RV64IMAFD
    Rocket_Core_RV64IMAFD RV64IMAFD_Rocket_Core (
`elsif RISCV_CORE_ARCH_RV64IMA
    Rocket_Core_RV64IMA RV64IMA_Rocket_Core (
`endif
        .clk                     (host_clk),
        .reset                   (reset_cpu),

        // ==============================================================
        // HostIO Interface
        // ==============================================================
        // Rocket Core to HostIO AXI Slave Adapter
        // Connects the Rocket Core to the above HostIO AXI Slave Adapter
        // ==============================================================

        .io_host_in_ready        (host_in_ready),
        .io_host_in_valid        (host_in_valid),
        .io_host_in_bits         (host_in_bits),

        .io_host_out_ready       (host_out_ready),
        .io_host_out_valid       (host_out_valid),
        .io_host_out_bits        (host_out_bits),

        // =========================================================
        // MemIO AXI Master Interface
        // =========================================================
        // PL AXI Master to PS AXI Slave
        // Connects to S_AXI_HP port on PS for access to DDR3 memory
        // =========================================================

        .io_mem_0_ar_valid       (M_AXI_ARVALID),
        .io_mem_0_ar_ready       (M_AXI_ARREADY),
        .io_mem_0_ar_bits_addr   (mem_araddr),
        .io_mem_0_ar_bits_id     (M_AXI_ARID),
        .io_mem_0_ar_bits_size   (M_AXI_ARSIZE),
        .io_mem_0_ar_bits_len    (M_AXI_ARLEN),
        .io_mem_0_ar_bits_burst  (M_AXI_ARBURST),
        .io_mem_0_ar_bits_cache  (M_AXI_ARCACHE),
        .io_mem_0_ar_bits_lock   (M_AXI_ARLOCK),
        .io_mem_0_ar_bits_prot   (M_AXI_ARPROT),
        .io_mem_0_ar_bits_qos    (M_AXI_ARQOS),
        .io_mem_0_ar_bits_region (M_AXI_ARREGION),

        .io_mem_0_aw_valid       (M_AXI_AWVALID),
        .io_mem_0_aw_ready       (M_AXI_AWREADY),
        .io_mem_0_aw_bits_addr   (mem_awaddr),
        .io_mem_0_aw_bits_id     (M_AXI_AWID),
        .io_mem_0_aw_bits_size   (M_AXI_AWSIZE),
        .io_mem_0_aw_bits_len    (M_AXI_AWLEN),
        .io_mem_0_aw_bits_burst  (M_AXI_AWBURST),
        .io_mem_0_aw_bits_cache  (M_AXI_AWCACHE),
        .io_mem_0_aw_bits_lock   (M_AXI_AWLOCK),
        .io_mem_0_aw_bits_prot   (M_AXI_AWPROT),
        .io_mem_0_aw_bits_qos    (M_AXI_AWQOS),
        .io_mem_0_aw_bits_region (M_AXI_AWREGION),

        .io_mem_0_w_valid        (M_AXI_WVALID),
        .io_mem_0_w_ready        (M_AXI_WREADY),
        .io_mem_0_w_bits_strb    (M_AXI_WSTRB),
        .io_mem_0_w_bits_data    (M_AXI_WDATA),
        .io_mem_0_w_bits_last    (M_AXI_WLAST),

        .io_mem_0_b_valid        (M_AXI_BVALID),
        .io_mem_0_b_ready        (M_AXI_BREADY),
        .io_mem_0_b_bits_resp    (M_AXI_BRESP),
        .io_mem_0_b_bits_id      (M_AXI_BID),

        .io_mem_0_r_valid        (M_AXI_RVALID),
        .io_mem_0_r_ready        (M_AXI_RREADY),
        .io_mem_0_r_bits_resp    (M_AXI_RRESP),
        .io_mem_0_r_bits_id      (M_AXI_RID),
        .io_mem_0_r_bits_data    (M_AXI_RDATA),
        .io_mem_0_r_bits_last    (M_AXI_RLAST)
    );

endmodule
