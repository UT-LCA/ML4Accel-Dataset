/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used solely      *
*     for design, simulation, implementation and creation of design files      *
*     limited to Xilinx devices or technologies. Use with non-Xilinx           *
*     devices or technologies is expressly prohibited and immediately          *
*     terminates your license.                                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY     *
*     FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY     *
*     PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE              *
*     IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS       *
*     MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY       *
*     CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY        *
*     RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY        *
*     DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE    *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A    *
*     PARTICULAR PURPOSE.                                                      *
*                                                                              *
*     Xilinx products are not intended for use in life support appliances,     *
*     devices, or systems.  Use in such applications are expressly             *
*     prohibited.                                                              *
*                                                                              *
*     (c) Copyright 1995-2012 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/
// You must compile the wrapper file axis_fifo_36W_16D.v when simulating
// the core, axis_fifo_36W_16D. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

`timescale 1ns/1ps

module axis_fifo_36W_16D(
  m_aclk,
  s_aclk,
  s_aresetn,
  s_axis_tvalid,
  s_axis_tready,
  s_axis_tdata,
  s_axis_tuser,
  m_axis_tvalid,
  m_axis_tready,
  m_axis_tdata,
  m_axis_tuser
);

input m_aclk;
input s_aclk;
input s_aresetn;
input s_axis_tvalid;
output s_axis_tready;
input [31 : 0] s_axis_tdata;
input [3 : 0] s_axis_tuser;
output m_axis_tvalid;
input m_axis_tready;
output [31 : 0] m_axis_tdata;
output [3 : 0] m_axis_tuser;

// synthesis translate_off

  FIFO_GENERATOR_V8_4 #(
    .C_ADD_NGC_CONSTRAINT(0),
    .C_APPLICATION_TYPE_AXIS(0),
    .C_APPLICATION_TYPE_RACH(0),
    .C_APPLICATION_TYPE_RDCH(0),
    .C_APPLICATION_TYPE_WACH(0),
    .C_APPLICATION_TYPE_WDCH(0),
    .C_APPLICATION_TYPE_WRCH(0),
    .C_AXI_ADDR_WIDTH(32),
    .C_AXI_ARUSER_WIDTH(1),
    .C_AXI_AWUSER_WIDTH(1),
    .C_AXI_BUSER_WIDTH(1),
    .C_AXI_DATA_WIDTH(64),
    .C_AXI_ID_WIDTH(4),
    .C_AXI_RUSER_WIDTH(1),
    .C_AXI_TYPE(0),
    .C_AXI_WUSER_WIDTH(1),
    .C_AXIS_TDATA_WIDTH(32),
    .C_AXIS_TDEST_WIDTH(4),
    .C_AXIS_TID_WIDTH(8),
    .C_AXIS_TKEEP_WIDTH(4),
    .C_AXIS_TSTRB_WIDTH(4),
    .C_AXIS_TUSER_WIDTH(4),
    .C_AXIS_TYPE(0),
    .C_COMMON_CLOCK(0),
    .C_COUNT_TYPE(0),
    .C_DATA_COUNT_WIDTH(10),
    .C_DEFAULT_VALUE("BlankString"),
    .C_DIN_WIDTH(18),
    .C_DIN_WIDTH_AXIS(36),
    .C_DIN_WIDTH_RACH(32),
    .C_DIN_WIDTH_RDCH(64),
    .C_DIN_WIDTH_WACH(32),
    .C_DIN_WIDTH_WDCH(64),
    .C_DIN_WIDTH_WRCH(2),
    .C_DOUT_RST_VAL("0"),
    .C_DOUT_WIDTH(18),
    .C_ENABLE_RLOCS(0),
    .C_ENABLE_RST_SYNC(1),
    .C_ERROR_INJECTION_TYPE(0),
    .C_ERROR_INJECTION_TYPE_AXIS(0),
    .C_ERROR_INJECTION_TYPE_RACH(0),
    .C_ERROR_INJECTION_TYPE_RDCH(0),
    .C_ERROR_INJECTION_TYPE_WACH(0),
    .C_ERROR_INJECTION_TYPE_WDCH(0),
    .C_ERROR_INJECTION_TYPE_WRCH(0),
    .C_FAMILY("spartan6"),
    .C_FULL_FLAGS_RST_VAL(1),
    .C_HAS_ALMOST_EMPTY(0),
    .C_HAS_ALMOST_FULL(0),
    .C_HAS_AXI_ARUSER(0),
    .C_HAS_AXI_AWUSER(0),
    .C_HAS_AXI_BUSER(0),
    .C_HAS_AXI_RD_CHANNEL(0),
    .C_HAS_AXI_RUSER(0),
    .C_HAS_AXI_WR_CHANNEL(0),
    .C_HAS_AXI_WUSER(0),
    .C_HAS_AXIS_TDATA(1),
    .C_HAS_AXIS_TDEST(0),
    .C_HAS_AXIS_TID(0),
    .C_HAS_AXIS_TKEEP(0),
    .C_HAS_AXIS_TLAST(0),
    .C_HAS_AXIS_TREADY(1),
    .C_HAS_AXIS_TSTRB(0),
    .C_HAS_AXIS_TUSER(1),
    .C_HAS_BACKUP(0),
    .C_HAS_DATA_COUNT(0),
    .C_HAS_DATA_COUNTS_AXIS(0),
    .C_HAS_DATA_COUNTS_RACH(0),
    .C_HAS_DATA_COUNTS_RDCH(0),
    .C_HAS_DATA_COUNTS_WACH(0),
    .C_HAS_DATA_COUNTS_WDCH(0),
    .C_HAS_DATA_COUNTS_WRCH(0),
    .C_HAS_INT_CLK(0),
    .C_HAS_MASTER_CE(0),
    .C_HAS_MEMINIT_FILE(0),
    .C_HAS_OVERFLOW(0),
    .C_HAS_PROG_FLAGS_AXIS(0),
    .C_HAS_PROG_FLAGS_RACH(0),
    .C_HAS_PROG_FLAGS_RDCH(0),
    .C_HAS_PROG_FLAGS_WACH(0),
    .C_HAS_PROG_FLAGS_WDCH(0),
    .C_HAS_PROG_FLAGS_WRCH(0),
    .C_HAS_RD_DATA_COUNT(0),
    .C_HAS_RD_RST(0),
    .C_HAS_RST(1),
    .C_HAS_SLAVE_CE(0),
    .C_HAS_SRST(0),
    .C_HAS_UNDERFLOW(0),
    .C_HAS_VALID(0),
    .C_HAS_WR_ACK(0),
    .C_HAS_WR_DATA_COUNT(0),
    .C_HAS_WR_RST(0),
    .C_IMPLEMENTATION_TYPE(0),
    .C_IMPLEMENTATION_TYPE_AXIS(12),
    .C_IMPLEMENTATION_TYPE_RACH(12),
    .C_IMPLEMENTATION_TYPE_RDCH(11),
    .C_IMPLEMENTATION_TYPE_WACH(12),
    .C_IMPLEMENTATION_TYPE_WDCH(11),
    .C_IMPLEMENTATION_TYPE_WRCH(12),
    .C_INIT_WR_PNTR_VAL(0),
    .C_INTERFACE_TYPE(1),
    .C_MEMORY_TYPE(1),
    .C_MIF_FILE_NAME("BlankString"),
    .C_MSGON_VAL(1),
    .C_OPTIMIZATION_MODE(0),
    .C_OVERFLOW_LOW(0),
    .C_PRELOAD_LATENCY(1),
    .C_PRELOAD_REGS(0),
    .C_PRIM_FIFO_TYPE("4kx4"),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL(2),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS(13),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH(13),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH(1021),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH(13),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH(1021),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH(13),
    .C_PROG_EMPTY_THRESH_NEGATE_VAL(3),
    .C_PROG_EMPTY_TYPE(0),
    .C_PROG_EMPTY_TYPE_AXIS(5),
    .C_PROG_EMPTY_TYPE_RACH(5),
    .C_PROG_EMPTY_TYPE_RDCH(5),
    .C_PROG_EMPTY_TYPE_WACH(5),
    .C_PROG_EMPTY_TYPE_WDCH(5),
    .C_PROG_EMPTY_TYPE_WRCH(5),
    .C_PROG_FULL_THRESH_ASSERT_VAL(1022),
    .C_PROG_FULL_THRESH_ASSERT_VAL_AXIS(15),
    .C_PROG_FULL_THRESH_ASSERT_VAL_RACH(15),
    .C_PROG_FULL_THRESH_ASSERT_VAL_RDCH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WACH(15),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WDCH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WRCH(15),
    .C_PROG_FULL_THRESH_NEGATE_VAL(1021),
    .C_PROG_FULL_TYPE(0),
    .C_PROG_FULL_TYPE_AXIS(5),
    .C_PROG_FULL_TYPE_RACH(5),
    .C_PROG_FULL_TYPE_RDCH(5),
    .C_PROG_FULL_TYPE_WACH(5),
    .C_PROG_FULL_TYPE_WDCH(5),
    .C_PROG_FULL_TYPE_WRCH(5),
    .C_RACH_TYPE(0),
    .C_RD_DATA_COUNT_WIDTH(10),
    .C_RD_DEPTH(1024),
    .C_RD_FREQ(1),
    .C_RD_PNTR_WIDTH(10),
    .C_RDCH_TYPE(0),
    .C_REG_SLICE_MODE_AXIS(0),
    .C_REG_SLICE_MODE_RACH(0),
    .C_REG_SLICE_MODE_RDCH(0),
    .C_REG_SLICE_MODE_WACH(0),
    .C_REG_SLICE_MODE_WDCH(0),
    .C_REG_SLICE_MODE_WRCH(0),
    .C_SYNCHRONIZER_STAGE(2),
    .C_UNDERFLOW_LOW(0),
    .C_USE_COMMON_OVERFLOW(0),
    .C_USE_COMMON_UNDERFLOW(0),
    .C_USE_DEFAULT_SETTINGS(0),
    .C_USE_DOUT_RST(1),
    .C_USE_ECC(0),
    .C_USE_ECC_AXIS(0),
    .C_USE_ECC_RACH(0),
    .C_USE_ECC_RDCH(0),
    .C_USE_ECC_WACH(0),
    .C_USE_ECC_WDCH(0),
    .C_USE_ECC_WRCH(0),
    .C_USE_EMBEDDED_REG(0),
    .C_USE_FIFO16_FLAGS(0),
    .C_USE_FWFT_DATA_COUNT(0),
    .C_VALID_LOW(0),
    .C_WACH_TYPE(0),
    .C_WDCH_TYPE(0),
    .C_WR_ACK_LOW(0),
    .C_WR_DATA_COUNT_WIDTH(10),
    .C_WR_DEPTH(1024),
    .C_WR_DEPTH_AXIS(16),
    .C_WR_DEPTH_RACH(16),
    .C_WR_DEPTH_RDCH(1024),
    .C_WR_DEPTH_WACH(16),
    .C_WR_DEPTH_WDCH(1024),
    .C_WR_DEPTH_WRCH(16),
    .C_WR_FREQ(1),
    .C_WR_PNTR_WIDTH(10),
    .C_WR_PNTR_WIDTH_AXIS(4),
    .C_WR_PNTR_WIDTH_RACH(4),
    .C_WR_PNTR_WIDTH_RDCH(10),
    .C_WR_PNTR_WIDTH_WACH(4),
    .C_WR_PNTR_WIDTH_WDCH(10),
    .C_WR_PNTR_WIDTH_WRCH(4),
    .C_WR_RESPONSE_LATENCY(1),
    .C_WRCH_TYPE(0)
  )
  inst (
    .M_ACLK(m_aclk),
    .S_ACLK(s_aclk),
    .S_ARESETN(s_aresetn),
    .S_AXIS_TVALID(s_axis_tvalid),
    .S_AXIS_TREADY(s_axis_tready),
    .S_AXIS_TDATA(s_axis_tdata),
    .S_AXIS_TUSER(s_axis_tuser),
    .M_AXIS_TVALID(m_axis_tvalid),
    .M_AXIS_TREADY(m_axis_tready),
    .M_AXIS_TDATA(m_axis_tdata),
    .M_AXIS_TUSER(m_axis_tuser),
    .BACKUP(),
    .BACKUP_MARKER(),
    .CLK(),
    .RST(),
    .SRST(),
    .WR_CLK(),
    .WR_RST(),
    .RD_CLK(),
    .RD_RST(),
    .DIN(),
    .WR_EN(),
    .RD_EN(),
    .PROG_EMPTY_THRESH(),
    .PROG_EMPTY_THRESH_ASSERT(),
    .PROG_EMPTY_THRESH_NEGATE(),
    .PROG_FULL_THRESH(),
    .PROG_FULL_THRESH_ASSERT(),
    .PROG_FULL_THRESH_NEGATE(),
    .INT_CLK(),
    .INJECTDBITERR(),
    .INJECTSBITERR(),
    .DOUT(),
    .FULL(),
    .ALMOST_FULL(),
    .WR_ACK(),
    .OVERFLOW(),
    .EMPTY(),
    .ALMOST_EMPTY(),
    .VALID(),
    .UNDERFLOW(),
    .DATA_COUNT(),
    .RD_DATA_COUNT(),
    .WR_DATA_COUNT(),
    .PROG_FULL(),
    .PROG_EMPTY(),
    .SBITERR(),
    .DBITERR(),
    .M_ACLK_EN(),
    .S_ACLK_EN(),
    .S_AXI_AWID(),
    .S_AXI_AWADDR(),
    .S_AXI_AWLEN(),
    .S_AXI_AWSIZE(),
    .S_AXI_AWBURST(),
    .S_AXI_AWLOCK(),
    .S_AXI_AWCACHE(),
    .S_AXI_AWPROT(),
    .S_AXI_AWQOS(),
    .S_AXI_AWREGION(),
    .S_AXI_AWUSER(),
    .S_AXI_AWVALID(),
    .S_AXI_AWREADY(),
    .S_AXI_WID(),
    .S_AXI_WDATA(),
    .S_AXI_WSTRB(),
    .S_AXI_WLAST(),
    .S_AXI_WUSER(),
    .S_AXI_WVALID(),
    .S_AXI_WREADY(),
    .S_AXI_BID(),
    .S_AXI_BRESP(),
    .S_AXI_BUSER(),
    .S_AXI_BVALID(),
    .S_AXI_BREADY(),
    .M_AXI_AWID(),
    .M_AXI_AWADDR(),
    .M_AXI_AWLEN(),
    .M_AXI_AWSIZE(),
    .M_AXI_AWBURST(),
    .M_AXI_AWLOCK(),
    .M_AXI_AWCACHE(),
    .M_AXI_AWPROT(),
    .M_AXI_AWQOS(),
    .M_AXI_AWREGION(),
    .M_AXI_AWUSER(),
    .M_AXI_AWVALID(),
    .M_AXI_AWREADY(),
    .M_AXI_WID(),
    .M_AXI_WDATA(),
    .M_AXI_WSTRB(),
    .M_AXI_WLAST(),
    .M_AXI_WUSER(),
    .M_AXI_WVALID(),
    .M_AXI_WREADY(),
    .M_AXI_BID(),
    .M_AXI_BRESP(),
    .M_AXI_BUSER(),
    .M_AXI_BVALID(),
    .M_AXI_BREADY(),
    .S_AXI_ARID(),
    .S_AXI_ARADDR(),
    .S_AXI_ARLEN(),
    .S_AXI_ARSIZE(),
    .S_AXI_ARBURST(),
    .S_AXI_ARLOCK(),
    .S_AXI_ARCACHE(),
    .S_AXI_ARPROT(),
    .S_AXI_ARQOS(),
    .S_AXI_ARREGION(),
    .S_AXI_ARUSER(),
    .S_AXI_ARVALID(),
    .S_AXI_ARREADY(),
    .S_AXI_RID(),
    .S_AXI_RDATA(),
    .S_AXI_RRESP(),
    .S_AXI_RLAST(),
    .S_AXI_RUSER(),
    .S_AXI_RVALID(),
    .S_AXI_RREADY(),
    .M_AXI_ARID(),
    .M_AXI_ARADDR(),
    .M_AXI_ARLEN(),
    .M_AXI_ARSIZE(),
    .M_AXI_ARBURST(),
    .M_AXI_ARLOCK(),
    .M_AXI_ARCACHE(),
    .M_AXI_ARPROT(),
    .M_AXI_ARQOS(),
    .M_AXI_ARREGION(),
    .M_AXI_ARUSER(),
    .M_AXI_ARVALID(),
    .M_AXI_ARREADY(),
    .M_AXI_RID(),
    .M_AXI_RDATA(),
    .M_AXI_RRESP(),
    .M_AXI_RLAST(),
    .M_AXI_RUSER(),
    .M_AXI_RVALID(),
    .M_AXI_RREADY(),
    .S_AXIS_TSTRB(),
    .S_AXIS_TKEEP(),
    .S_AXIS_TLAST(),
    .S_AXIS_TID(),
    .S_AXIS_TDEST(),
    .M_AXIS_TSTRB(),
    .M_AXIS_TKEEP(),
    .M_AXIS_TLAST(),
    .M_AXIS_TID(),
    .M_AXIS_TDEST(),
    .AXI_AW_INJECTSBITERR(),
    .AXI_AW_INJECTDBITERR(),
    .AXI_AW_PROG_FULL_THRESH(),
    .AXI_AW_PROG_EMPTY_THRESH(),
    .AXI_AW_DATA_COUNT(),
    .AXI_AW_WR_DATA_COUNT(),
    .AXI_AW_RD_DATA_COUNT(),
    .AXI_AW_SBITERR(),
    .AXI_AW_DBITERR(),
    .AXI_AW_OVERFLOW(),
    .AXI_AW_UNDERFLOW(),
    .AXI_W_INJECTSBITERR(),
    .AXI_W_INJECTDBITERR(),
    .AXI_W_PROG_FULL_THRESH(),
    .AXI_W_PROG_EMPTY_THRESH(),
    .AXI_W_DATA_COUNT(),
    .AXI_W_WR_DATA_COUNT(),
    .AXI_W_RD_DATA_COUNT(),
    .AXI_W_SBITERR(),
    .AXI_W_DBITERR(),
    .AXI_W_OVERFLOW(),
    .AXI_W_UNDERFLOW(),
    .AXI_B_INJECTSBITERR(),
    .AXI_B_INJECTDBITERR(),
    .AXI_B_PROG_FULL_THRESH(),
    .AXI_B_PROG_EMPTY_THRESH(),
    .AXI_B_DATA_COUNT(),
    .AXI_B_WR_DATA_COUNT(),
    .AXI_B_RD_DATA_COUNT(),
    .AXI_B_SBITERR(),
    .AXI_B_DBITERR(),
    .AXI_B_OVERFLOW(),
    .AXI_B_UNDERFLOW(),
    .AXI_AR_INJECTSBITERR(),
    .AXI_AR_INJECTDBITERR(),
    .AXI_AR_PROG_FULL_THRESH(),
    .AXI_AR_PROG_EMPTY_THRESH(),
    .AXI_AR_DATA_COUNT(),
    .AXI_AR_WR_DATA_COUNT(),
    .AXI_AR_RD_DATA_COUNT(),
    .AXI_AR_SBITERR(),
    .AXI_AR_DBITERR(),
    .AXI_AR_OVERFLOW(),
    .AXI_AR_UNDERFLOW(),
    .AXI_R_INJECTSBITERR(),
    .AXI_R_INJECTDBITERR(),
    .AXI_R_PROG_FULL_THRESH(),
    .AXI_R_PROG_EMPTY_THRESH(),
    .AXI_R_DATA_COUNT(),
    .AXI_R_WR_DATA_COUNT(),
    .AXI_R_RD_DATA_COUNT(),
    .AXI_R_SBITERR(),
    .AXI_R_DBITERR(),
    .AXI_R_OVERFLOW(),
    .AXI_R_UNDERFLOW(),
    .AXIS_INJECTSBITERR(),
    .AXIS_INJECTDBITERR(),
    .AXIS_PROG_FULL_THRESH(),
    .AXIS_PROG_EMPTY_THRESH(),
    .AXIS_DATA_COUNT(),
    .AXIS_WR_DATA_COUNT(),
    .AXIS_RD_DATA_COUNT(),
    .AXIS_SBITERR(),
    .AXIS_DBITERR(),
    .AXIS_OVERFLOW(),
    .AXIS_UNDERFLOW()
  );

// synthesis translate_on

endmodule
/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used solely      *
*     for design, simulation, implementation and creation of design files      *
*     limited to Xilinx devices or technologies. Use with non-Xilinx           *
*     devices or technologies is expressly prohibited and immediately          *
*     terminates your license.                                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY     *
*     FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY     *
*     PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE              *
*     IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS       *
*     MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY       *
*     CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY        *
*     RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY        *
*     DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE    *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A    *
*     PARTICULAR PURPOSE.                                                      *
*                                                                              *
*     Xilinx products are not intended for use in life support appliances,     *
*     devices, or systems.  Use in such applications are expressly             *
*     prohibited.                                                              *
*                                                                              *
*     (c) Copyright 1995-2012 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/
// You must compile the wrapper file axis_fifo_40W_16D.v when simulating
// the core, axis_fifo_40W_16D. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

`timescale 1ns/1ps

module axis_fifo_40W_16D(
  m_aclk,
  s_aclk,
  s_aresetn,
  s_axis_tvalid,
  s_axis_tready,
  s_axis_tdata,
  s_axis_tuser,
  m_axis_tvalid,
  m_axis_tready,
  m_axis_tdata,
  m_axis_tuser
);

input m_aclk;
input s_aclk;
input s_aresetn;
input s_axis_tvalid;
output s_axis_tready;
input [31 : 0] s_axis_tdata;
input [7 : 0] s_axis_tuser;
output m_axis_tvalid;
input m_axis_tready;
output [31 : 0] m_axis_tdata;
output [7 : 0] m_axis_tuser;

// synthesis translate_off

  FIFO_GENERATOR_V8_4 #(
    .C_ADD_NGC_CONSTRAINT(0),
    .C_APPLICATION_TYPE_AXIS(0),
    .C_APPLICATION_TYPE_RACH(0),
    .C_APPLICATION_TYPE_RDCH(0),
    .C_APPLICATION_TYPE_WACH(0),
    .C_APPLICATION_TYPE_WDCH(0),
    .C_APPLICATION_TYPE_WRCH(0),
    .C_AXI_ADDR_WIDTH(32),
    .C_AXI_ARUSER_WIDTH(1),
    .C_AXI_AWUSER_WIDTH(1),
    .C_AXI_BUSER_WIDTH(1),
    .C_AXI_DATA_WIDTH(64),
    .C_AXI_ID_WIDTH(4),
    .C_AXI_RUSER_WIDTH(1),
    .C_AXI_TYPE(0),
    .C_AXI_WUSER_WIDTH(1),
    .C_AXIS_TDATA_WIDTH(32),
    .C_AXIS_TDEST_WIDTH(4),
    .C_AXIS_TID_WIDTH(8),
    .C_AXIS_TKEEP_WIDTH(4),
    .C_AXIS_TSTRB_WIDTH(4),
    .C_AXIS_TUSER_WIDTH(8),
    .C_AXIS_TYPE(0),
    .C_COMMON_CLOCK(0),
    .C_COUNT_TYPE(0),
    .C_DATA_COUNT_WIDTH(10),
    .C_DEFAULT_VALUE("BlankString"),
    .C_DIN_WIDTH(18),
    .C_DIN_WIDTH_AXIS(40),
    .C_DIN_WIDTH_RACH(32),
    .C_DIN_WIDTH_RDCH(64),
    .C_DIN_WIDTH_WACH(32),
    .C_DIN_WIDTH_WDCH(64),
    .C_DIN_WIDTH_WRCH(2),
    .C_DOUT_RST_VAL("0"),
    .C_DOUT_WIDTH(18),
    .C_ENABLE_RLOCS(0),
    .C_ENABLE_RST_SYNC(1),
    .C_ERROR_INJECTION_TYPE(0),
    .C_ERROR_INJECTION_TYPE_AXIS(0),
    .C_ERROR_INJECTION_TYPE_RACH(0),
    .C_ERROR_INJECTION_TYPE_RDCH(0),
    .C_ERROR_INJECTION_TYPE_WACH(0),
    .C_ERROR_INJECTION_TYPE_WDCH(0),
    .C_ERROR_INJECTION_TYPE_WRCH(0),
    .C_FAMILY("spartan6"),
    .C_FULL_FLAGS_RST_VAL(1),
    .C_HAS_ALMOST_EMPTY(0),
    .C_HAS_ALMOST_FULL(0),
    .C_HAS_AXI_ARUSER(0),
    .C_HAS_AXI_AWUSER(0),
    .C_HAS_AXI_BUSER(0),
    .C_HAS_AXI_RD_CHANNEL(0),
    .C_HAS_AXI_RUSER(0),
    .C_HAS_AXI_WR_CHANNEL(0),
    .C_HAS_AXI_WUSER(0),
    .C_HAS_AXIS_TDATA(1),
    .C_HAS_AXIS_TDEST(0),
    .C_HAS_AXIS_TID(0),
    .C_HAS_AXIS_TKEEP(0),
    .C_HAS_AXIS_TLAST(0),
    .C_HAS_AXIS_TREADY(1),
    .C_HAS_AXIS_TSTRB(0),
    .C_HAS_AXIS_TUSER(1),
    .C_HAS_BACKUP(0),
    .C_HAS_DATA_COUNT(0),
    .C_HAS_DATA_COUNTS_AXIS(0),
    .C_HAS_DATA_COUNTS_RACH(0),
    .C_HAS_DATA_COUNTS_RDCH(0),
    .C_HAS_DATA_COUNTS_WACH(0),
    .C_HAS_DATA_COUNTS_WDCH(0),
    .C_HAS_DATA_COUNTS_WRCH(0),
    .C_HAS_INT_CLK(0),
    .C_HAS_MASTER_CE(0),
    .C_HAS_MEMINIT_FILE(0),
    .C_HAS_OVERFLOW(0),
    .C_HAS_PROG_FLAGS_AXIS(0),
    .C_HAS_PROG_FLAGS_RACH(0),
    .C_HAS_PROG_FLAGS_RDCH(0),
    .C_HAS_PROG_FLAGS_WACH(0),
    .C_HAS_PROG_FLAGS_WDCH(0),
    .C_HAS_PROG_FLAGS_WRCH(0),
    .C_HAS_RD_DATA_COUNT(0),
    .C_HAS_RD_RST(0),
    .C_HAS_RST(1),
    .C_HAS_SLAVE_CE(0),
    .C_HAS_SRST(0),
    .C_HAS_UNDERFLOW(0),
    .C_HAS_VALID(0),
    .C_HAS_WR_ACK(0),
    .C_HAS_WR_DATA_COUNT(0),
    .C_HAS_WR_RST(0),
    .C_IMPLEMENTATION_TYPE(0),
    .C_IMPLEMENTATION_TYPE_AXIS(12),
    .C_IMPLEMENTATION_TYPE_RACH(12),
    .C_IMPLEMENTATION_TYPE_RDCH(11),
    .C_IMPLEMENTATION_TYPE_WACH(12),
    .C_IMPLEMENTATION_TYPE_WDCH(11),
    .C_IMPLEMENTATION_TYPE_WRCH(12),
    .C_INIT_WR_PNTR_VAL(0),
    .C_INTERFACE_TYPE(1),
    .C_MEMORY_TYPE(1),
    .C_MIF_FILE_NAME("BlankString"),
    .C_MSGON_VAL(1),
    .C_OPTIMIZATION_MODE(0),
    .C_OVERFLOW_LOW(0),
    .C_PRELOAD_LATENCY(1),
    .C_PRELOAD_REGS(0),
    .C_PRIM_FIFO_TYPE("4kx4"),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL(2),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS(13),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH(13),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH(1021),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH(13),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH(1021),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH(13),
    .C_PROG_EMPTY_THRESH_NEGATE_VAL(3),
    .C_PROG_EMPTY_TYPE(0),
    .C_PROG_EMPTY_TYPE_AXIS(5),
    .C_PROG_EMPTY_TYPE_RACH(5),
    .C_PROG_EMPTY_TYPE_RDCH(5),
    .C_PROG_EMPTY_TYPE_WACH(5),
    .C_PROG_EMPTY_TYPE_WDCH(5),
    .C_PROG_EMPTY_TYPE_WRCH(5),
    .C_PROG_FULL_THRESH_ASSERT_VAL(1022),
    .C_PROG_FULL_THRESH_ASSERT_VAL_AXIS(15),
    .C_PROG_FULL_THRESH_ASSERT_VAL_RACH(15),
    .C_PROG_FULL_THRESH_ASSERT_VAL_RDCH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WACH(15),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WDCH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WRCH(15),
    .C_PROG_FULL_THRESH_NEGATE_VAL(1021),
    .C_PROG_FULL_TYPE(0),
    .C_PROG_FULL_TYPE_AXIS(5),
    .C_PROG_FULL_TYPE_RACH(5),
    .C_PROG_FULL_TYPE_RDCH(5),
    .C_PROG_FULL_TYPE_WACH(5),
    .C_PROG_FULL_TYPE_WDCH(5),
    .C_PROG_FULL_TYPE_WRCH(5),
    .C_RACH_TYPE(0),
    .C_RD_DATA_COUNT_WIDTH(10),
    .C_RD_DEPTH(1024),
    .C_RD_FREQ(1),
    .C_RD_PNTR_WIDTH(10),
    .C_RDCH_TYPE(0),
    .C_REG_SLICE_MODE_AXIS(0),
    .C_REG_SLICE_MODE_RACH(0),
    .C_REG_SLICE_MODE_RDCH(0),
    .C_REG_SLICE_MODE_WACH(0),
    .C_REG_SLICE_MODE_WDCH(0),
    .C_REG_SLICE_MODE_WRCH(0),
    .C_SYNCHRONIZER_STAGE(2),
    .C_UNDERFLOW_LOW(0),
    .C_USE_COMMON_OVERFLOW(0),
    .C_USE_COMMON_UNDERFLOW(0),
    .C_USE_DEFAULT_SETTINGS(0),
    .C_USE_DOUT_RST(1),
    .C_USE_ECC(0),
    .C_USE_ECC_AXIS(0),
    .C_USE_ECC_RACH(0),
    .C_USE_ECC_RDCH(0),
    .C_USE_ECC_WACH(0),
    .C_USE_ECC_WDCH(0),
    .C_USE_ECC_WRCH(0),
    .C_USE_EMBEDDED_REG(0),
    .C_USE_FIFO16_FLAGS(0),
    .C_USE_FWFT_DATA_COUNT(0),
    .C_VALID_LOW(0),
    .C_WACH_TYPE(0),
    .C_WDCH_TYPE(0),
    .C_WR_ACK_LOW(0),
    .C_WR_DATA_COUNT_WIDTH(10),
    .C_WR_DEPTH(1024),
    .C_WR_DEPTH_AXIS(16),
    .C_WR_DEPTH_RACH(16),
    .C_WR_DEPTH_RDCH(1024),
    .C_WR_DEPTH_WACH(16),
    .C_WR_DEPTH_WDCH(1024),
    .C_WR_DEPTH_WRCH(16),
    .C_WR_FREQ(1),
    .C_WR_PNTR_WIDTH(10),
    .C_WR_PNTR_WIDTH_AXIS(4),
    .C_WR_PNTR_WIDTH_RACH(4),
    .C_WR_PNTR_WIDTH_RDCH(10),
    .C_WR_PNTR_WIDTH_WACH(4),
    .C_WR_PNTR_WIDTH_WDCH(10),
    .C_WR_PNTR_WIDTH_WRCH(4),
    .C_WR_RESPONSE_LATENCY(1),
    .C_WRCH_TYPE(0)
  )
  inst (
    .M_ACLK(m_aclk),
    .S_ACLK(s_aclk),
    .S_ARESETN(s_aresetn),
    .S_AXIS_TVALID(s_axis_tvalid),
    .S_AXIS_TREADY(s_axis_tready),
    .S_AXIS_TDATA(s_axis_tdata),
    .S_AXIS_TUSER(s_axis_tuser),
    .M_AXIS_TVALID(m_axis_tvalid),
    .M_AXIS_TREADY(m_axis_tready),
    .M_AXIS_TDATA(m_axis_tdata),
    .M_AXIS_TUSER(m_axis_tuser),
    .BACKUP(),
    .BACKUP_MARKER(),
    .CLK(),
    .RST(),
    .SRST(),
    .WR_CLK(),
    .WR_RST(),
    .RD_CLK(),
    .RD_RST(),
    .DIN(),
    .WR_EN(),
    .RD_EN(),
    .PROG_EMPTY_THRESH(),
    .PROG_EMPTY_THRESH_ASSERT(),
    .PROG_EMPTY_THRESH_NEGATE(),
    .PROG_FULL_THRESH(),
    .PROG_FULL_THRESH_ASSERT(),
    .PROG_FULL_THRESH_NEGATE(),
    .INT_CLK(),
    .INJECTDBITERR(),
    .INJECTSBITERR(),
    .DOUT(),
    .FULL(),
    .ALMOST_FULL(),
    .WR_ACK(),
    .OVERFLOW(),
    .EMPTY(),
    .ALMOST_EMPTY(),
    .VALID(),
    .UNDERFLOW(),
    .DATA_COUNT(),
    .RD_DATA_COUNT(),
    .WR_DATA_COUNT(),
    .PROG_FULL(),
    .PROG_EMPTY(),
    .SBITERR(),
    .DBITERR(),
    .M_ACLK_EN(),
    .S_ACLK_EN(),
    .S_AXI_AWID(),
    .S_AXI_AWADDR(),
    .S_AXI_AWLEN(),
    .S_AXI_AWSIZE(),
    .S_AXI_AWBURST(),
    .S_AXI_AWLOCK(),
    .S_AXI_AWCACHE(),
    .S_AXI_AWPROT(),
    .S_AXI_AWQOS(),
    .S_AXI_AWREGION(),
    .S_AXI_AWUSER(),
    .S_AXI_AWVALID(),
    .S_AXI_AWREADY(),
    .S_AXI_WID(),
    .S_AXI_WDATA(),
    .S_AXI_WSTRB(),
    .S_AXI_WLAST(),
    .S_AXI_WUSER(),
    .S_AXI_WVALID(),
    .S_AXI_WREADY(),
    .S_AXI_BID(),
    .S_AXI_BRESP(),
    .S_AXI_BUSER(),
    .S_AXI_BVALID(),
    .S_AXI_BREADY(),
    .M_AXI_AWID(),
    .M_AXI_AWADDR(),
    .M_AXI_AWLEN(),
    .M_AXI_AWSIZE(),
    .M_AXI_AWBURST(),
    .M_AXI_AWLOCK(),
    .M_AXI_AWCACHE(),
    .M_AXI_AWPROT(),
    .M_AXI_AWQOS(),
    .M_AXI_AWREGION(),
    .M_AXI_AWUSER(),
    .M_AXI_AWVALID(),
    .M_AXI_AWREADY(),
    .M_AXI_WID(),
    .M_AXI_WDATA(),
    .M_AXI_WSTRB(),
    .M_AXI_WLAST(),
    .M_AXI_WUSER(),
    .M_AXI_WVALID(),
    .M_AXI_WREADY(),
    .M_AXI_BID(),
    .M_AXI_BRESP(),
    .M_AXI_BUSER(),
    .M_AXI_BVALID(),
    .M_AXI_BREADY(),
    .S_AXI_ARID(),
    .S_AXI_ARADDR(),
    .S_AXI_ARLEN(),
    .S_AXI_ARSIZE(),
    .S_AXI_ARBURST(),
    .S_AXI_ARLOCK(),
    .S_AXI_ARCACHE(),
    .S_AXI_ARPROT(),
    .S_AXI_ARQOS(),
    .S_AXI_ARREGION(),
    .S_AXI_ARUSER(),
    .S_AXI_ARVALID(),
    .S_AXI_ARREADY(),
    .S_AXI_RID(),
    .S_AXI_RDATA(),
    .S_AXI_RRESP(),
    .S_AXI_RLAST(),
    .S_AXI_RUSER(),
    .S_AXI_RVALID(),
    .S_AXI_RREADY(),
    .M_AXI_ARID(),
    .M_AXI_ARADDR(),
    .M_AXI_ARLEN(),
    .M_AXI_ARSIZE(),
    .M_AXI_ARBURST(),
    .M_AXI_ARLOCK(),
    .M_AXI_ARCACHE(),
    .M_AXI_ARPROT(),
    .M_AXI_ARQOS(),
    .M_AXI_ARREGION(),
    .M_AXI_ARUSER(),
    .M_AXI_ARVALID(),
    .M_AXI_ARREADY(),
    .M_AXI_RID(),
    .M_AXI_RDATA(),
    .M_AXI_RRESP(),
    .M_AXI_RLAST(),
    .M_AXI_RUSER(),
    .M_AXI_RVALID(),
    .M_AXI_RREADY(),
    .S_AXIS_TSTRB(),
    .S_AXIS_TKEEP(),
    .S_AXIS_TLAST(),
    .S_AXIS_TID(),
    .S_AXIS_TDEST(),
    .M_AXIS_TSTRB(),
    .M_AXIS_TKEEP(),
    .M_AXIS_TLAST(),
    .M_AXIS_TID(),
    .M_AXIS_TDEST(),
    .AXI_AW_INJECTSBITERR(),
    .AXI_AW_INJECTDBITERR(),
    .AXI_AW_PROG_FULL_THRESH(),
    .AXI_AW_PROG_EMPTY_THRESH(),
    .AXI_AW_DATA_COUNT(),
    .AXI_AW_WR_DATA_COUNT(),
    .AXI_AW_RD_DATA_COUNT(),
    .AXI_AW_SBITERR(),
    .AXI_AW_DBITERR(),
    .AXI_AW_OVERFLOW(),
    .AXI_AW_UNDERFLOW(),
    .AXI_W_INJECTSBITERR(),
    .AXI_W_INJECTDBITERR(),
    .AXI_W_PROG_FULL_THRESH(),
    .AXI_W_PROG_EMPTY_THRESH(),
    .AXI_W_DATA_COUNT(),
    .AXI_W_WR_DATA_COUNT(),
    .AXI_W_RD_DATA_COUNT(),
    .AXI_W_SBITERR(),
    .AXI_W_DBITERR(),
    .AXI_W_OVERFLOW(),
    .AXI_W_UNDERFLOW(),
    .AXI_B_INJECTSBITERR(),
    .AXI_B_INJECTDBITERR(),
    .AXI_B_PROG_FULL_THRESH(),
    .AXI_B_PROG_EMPTY_THRESH(),
    .AXI_B_DATA_COUNT(),
    .AXI_B_WR_DATA_COUNT(),
    .AXI_B_RD_DATA_COUNT(),
    .AXI_B_SBITERR(),
    .AXI_B_DBITERR(),
    .AXI_B_OVERFLOW(),
    .AXI_B_UNDERFLOW(),
    .AXI_AR_INJECTSBITERR(),
    .AXI_AR_INJECTDBITERR(),
    .AXI_AR_PROG_FULL_THRESH(),
    .AXI_AR_PROG_EMPTY_THRESH(),
    .AXI_AR_DATA_COUNT(),
    .AXI_AR_WR_DATA_COUNT(),
    .AXI_AR_RD_DATA_COUNT(),
    .AXI_AR_SBITERR(),
    .AXI_AR_DBITERR(),
    .AXI_AR_OVERFLOW(),
    .AXI_AR_UNDERFLOW(),
    .AXI_R_INJECTSBITERR(),
    .AXI_R_INJECTDBITERR(),
    .AXI_R_PROG_FULL_THRESH(),
    .AXI_R_PROG_EMPTY_THRESH(),
    .AXI_R_DATA_COUNT(),
    .AXI_R_WR_DATA_COUNT(),
    .AXI_R_RD_DATA_COUNT(),
    .AXI_R_SBITERR(),
    .AXI_R_DBITERR(),
    .AXI_R_OVERFLOW(),
    .AXI_R_UNDERFLOW(),
    .AXIS_INJECTSBITERR(),
    .AXIS_INJECTDBITERR(),
    .AXIS_PROG_FULL_THRESH(),
    .AXIS_PROG_EMPTY_THRESH(),
    .AXIS_DATA_COUNT(),
    .AXIS_WR_DATA_COUNT(),
    .AXIS_RD_DATA_COUNT(),
    .AXIS_SBITERR(),
    .AXIS_DBITERR(),
    .AXIS_OVERFLOW(),
    .AXIS_UNDERFLOW()
  );

// synthesis translate_on

endmodule
////////////////////////////////////////////////////////////
//
// This confidential and proprietary software may be used
// only as authorized by a licensing agreement from
// Bean Digital Ltd
// In the event of publication, the following notice is
// applicable:
//
// (C)COPYRIGHT 2009 BEAN DIGITAL LTD.
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all
// authorized copies.
//
// File        : det_pos_edge.v
// Author      : J.Bean
// Date        : Nov 2009
// Description : Detect a positive edge.
////////////////////////////////////////////////////////////

`resetall
`timescale 1ns/10ps

module det_pos_edge(
  input  wire clk,
  input  wire rst_n,
  input  wire d,
  output wire q
);

////////////////////////////////////////////////////////////
// Signals
//////////////////////////////////////////////////////////// 

reg d_p1;

////////////////////////////////////////////////////////////
// Comb Assign : Q
// Description : 
////////////////////////////////////////////////////////////

assign q = d & ~d_p1;

////////////////////////////////////////////////////////////
// Seq Block   : Data pipeline
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk)
begin
  if (rst_n == 0) begin
    d_p1 <= 0;
  end else begin
    d_p1 <= d;
  end
end 
            
endmodule

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
////////////////////////////////////////////////////////////
//
// This confidential and proprietary software may be used
// only as authorized by a licensing agreement from
// Bean Digital Ltd
// In the event of publication, the following notice is
// applicable:
//
// (C)COPYRIGHT 2009 BEAN DIGITAL LTD.
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all
// authorized copies.
//
// File        : mux.v
// Author      : J.Bean
// Date        : Sep 2009
// Description : Multiplexer
////////////////////////////////////////////////////////////

`resetall
`timescale 1ns/10ps

module mux
  #(parameter DATA_BITS  = 16,                // Data bits
    parameter IP_NUM     = 4,                 // Number of inputs
    parameter USE_OP_REG = 0)(                // Enable Register on Output 
  input  wire                        clk,     // Clock
  input  wire [IP_NUM*DATA_BITS-1:0] data_i,  // Data Input
  input  wire [7:0]                  sel_i,   // Input Select
  output wire [DATA_BITS-1:0]        data_o   // Data Output
);

////////////////////////////////////////////////////////////
// Signals
//////////////////////////////////////////////////////////// 

genvar i;
reg  [DATA_BITS-1:0] ip_array [0:IP_NUM-1];
wire [DATA_BITS-1:0] data_c;
reg  [DATA_BITS-1:0] data_r;

////////////////////////////////////////////////////////////
// Comb Assign : Data Output
// Description : 
////////////////////////////////////////////////////////////

assign data_o = (USE_OP_REG == 1) ? data_r : data_c;

////////////////////////////////////////////////////////////
// Comb Assign : Data Comb
// Description : Assign an input vector from the array.
////////////////////////////////////////////////////////////

assign data_c = ip_array[sel_i];

////////////////////////////////////////////////////////////
// Generate    : Input array
// Description : Create an array of input vectors.
////////////////////////////////////////////////////////////

generate
  for(i=0; i<IP_NUM; i=i+1) begin: mux_gen  
    always @(*)
    begin
      ip_array[i] = data_i[(i+1)*DATA_BITS-1:i*DATA_BITS];
    end
  end
endgenerate

////////////////////////////////////////////////////////////
// Seq Block   : Data Registered
// Description : 
// Assign an input vector from the array.
////////////////////////////////////////////////////////////

always @(posedge clk)
begin
  data_r <= ip_array[sel_i];
end

endmodule
`define ALIGN_VAL     32'h7B_4A_4A_BC   
`define CONT_VAL      32'h99_99_AA_7C   
`define DMAT_VAL      32'h36_36_B5_7C   
`define EOF_VAL       32'hD5_D5_B5_7C   
`define HOLD_VAL      32'hD5_D5_AA_7C   
`define HOLDA_VAL     32'h95_95_AA_7C   
`define PMACK_VAL     32'h95_95_95_7C   
`define PMNAK_VAL     32'hF5_F5_95_7C   
`define PMREQ_P_VAL   32'h17_17_B5_7C   
`define PMREQ_S_VAL   32'h75_75_95_7C   
`define R_ERR_VAL     32'h56_56_B5_7C   
`define R_IP_VAL      32'h55_55_B5_7C   
`define R_OK_VAL      32'h35_35_B5_7C   
`define R_RDY_VAL     32'h4A_4A_95_7C   
`define SOF_VAL       32'h37_37_B5_7C   
`define SYNC_VAL      32'hB5_B5_95_7C   
`define WTRM_VAL      32'h58_58_B5_7C   
`define X_RDY_VAL     32'h57_57_B5_7C   
                                        ////////////////////////////////////////////////////////////
//
// This confidential and proprietary software may be used
// only as authorized by a licensing agreement from
// Bean Digital Ltd
// In the event of publication, the following notice is
// applicable:
//
// (C)COPYRIGHT 2012 BEAN DIGITAL LTD.
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all
// authorized copies.
//
// File        : sata_phy_dev_ctrl_x6series.v
// Author      : J.Bean
// Date        : Mar 2012
// Description : SATA PHY Layer Device Control Xilinx 6 Series
////////////////////////////////////////////////////////////

`resetall
`timescale 1ns/10ps

`include "sata_constants.v"

module sata_phy_dev_ctrl_x6series
  #(parameter SATA_REV = 1)(              // SATA Revision (1, 2, 3)
  input  wire         clk_phy,	           // Clock PHY
  input  wire         rst_n,	             // Reset
  output reg          link_up_o,          // Link Up     
  // Transceiver  
  input  wire         gt_rst_done_i,      // GT Reset Done
  output reg  [31:0]  gt_tx_data_o,	      // GT Transmit Data
  output reg  [3:0]   gt_tx_charisk_o,	   // GT Transmit K/D
  output reg          gt_tx_com_strt_o,	  // GT Transmit	COM Start
  output reg          gt_tx_com_type_o,	  // GT Transmit COM Type
  output reg          gt_tx_elec_idle_o,  // GT Transmit Electrical Idle	                   
  input  wire [31:0]  gt_rx_data_i,       // GT Receive Data                
  input  wire [2:0]   gt_rx_status_i      // GT Receive Status
);

////////////////////////////////////////////////////////////
// Parameters
//////////////////////////////////////////////////////////// 

// Time delays
parameter SATA1_10MS            = 750000;   // 75MHz * 750000
parameter SATA2_10MS            = 1500000;  // 150MHz * 1500000
parameter SATA3_10MS            = 3000000;  // 300MHz * 3000000
parameter SATA1_55US            = 4095;     // 75MHz * 4095
parameter SATA2_55US            = 8190;     // 150MHz * 8190
parameter SATA3_55US            = 16380;    // 300MHz * 16380

// State machine states
parameter DP1_RESET             = 0;
parameter DP2_COMINIT           = 1;
parameter DP3_AWAIT_COMWAKE     = 2;
parameter DP3B_AWAIT_NO_COMWAKE = 3;
parameter DP4_CALIBRATE         = 4;
parameter DP5_COMWAKE           = 5;
parameter DP6_SEND_ALIGN        = 6;
parameter DP7_READY             = 7;
parameter DP11_ERROR            = 8;

////////////////////////////////////////////////////////////
// Signals
//////////////////////////////////////////////////////////// 

reg  [3:0]   state_cs;          // Current state
reg  [3:0]   state_ns;          // Next state  
reg  [199:0] state_ascii;       // ASCII state
reg	 [31:0]	 align_timeout_cnt; // ALIGN Timeout Count
reg  [31:0]  retry_cnt;         // Retry Count 
wire         comreset_detect;   // COMRESET Detect
wire         comwake_detect;    // COMWAKE Detect
wire         align_detect;      // ALIGN Detected
reg          tx_com_strt;       // Transmit COM Start
wire         tx_com_strt_pedge; // Transmit COM Start Positive Edge
reg          tx_com_done;       // Transmit COM Done

////////////////////////////////////////////////////////////
// Instance    : Transmit Com Start Pos Edge
// Description : Detect positive edge on COM start signal.
////////////////////////////////////////////////////////////
  
det_pos_edge U_tx_com_strt_pedge(
  .clk   (clk_phy),
  .rst_n (rst_n),
  .d     (tx_com_strt),
  .q     (tx_com_strt_pedge));
  
////////////////////////////////////////////////////////////
// Comb Assign : ALIGN primitive detect
// Description : 
////////////////////////////////////////////////////////////

assign align_detect = (gt_rx_data_i == 32'h7B4A4ABC); 

////////////////////////////////////////////////////////////
// Comb Assign : COMWAKE Detect
// Description : 
////////////////////////////////////////////////////////////

assign comwake_detect = gt_rx_status_i[1];

////////////////////////////////////////////////////////////
// Comb Assign : COMRESET Detect
// Description : 
////////////////////////////////////////////////////////////

assign comreset_detect = gt_rx_status_i[2];
 
////////////////////////////////////////////////////////////
// Seq Block   : State machine seq logic
// Description : Sets the current state to the next state.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin
  if (rst_n == 0) begin
    state_cs <= DP1_RESET;   
  end else begin
    if (comreset_detect == 1) begin
      state_cs <= DP1_RESET;   
    end else begin
      state_cs <= state_ns;
    end
  end
end  

////////////////////////////////////////////////////////////
// Comb Block  : State machine ascii 
// Description : Converts the state to ascii for debug.
////////////////////////////////////////////////////////////

always @(*)
begin
  case (state_cs)
    DP1_RESET:             state_ascii = "DP1_RESET";
    DP2_COMINIT:           state_ascii = "DP2_COMINIT";
    DP3_AWAIT_COMWAKE:     state_ascii = "DP3_AWAIT_COMWAKE";
    DP3B_AWAIT_NO_COMWAKE: state_ascii = "DP3B_AWAIT_NO_COMWAKE";
    DP4_CALIBRATE:         state_ascii = "DP4_CALIBRATE";
    DP5_COMWAKE:           state_ascii = "DP5_COMWAKE";
    DP6_SEND_ALIGN:        state_ascii = "DP6_SEND_ALIGN";
    DP7_READY:             state_ascii = "DP7_READY";
    DP11_ERROR:            state_ascii = "DP11_ERROR"; 
  endcase
end

////////////////////////////////////////////////////////////
// Comb Block  : State machine comb logic
// Description : Assigns the next state.
////////////////////////////////////////////////////////////

always @(*)
begin
  state_ns = state_cs;

  case (state_cs)
    // DP1_RESET - Interface quiescent
    DP1_RESET: begin
      if ((gt_rst_done_i == 1) && (comreset_detect == 0)) begin
        state_ns = DP2_COMINIT; 
      end  
    end
    
    // DP2_COMINIT - Send COMINIT
    DP2_COMINIT: begin
      if (tx_com_done == 1) begin
        state_ns = DP3_AWAIT_COMWAKE;
      end  
    end    
    
    // DP3_AWAIT_COMWAKE - Wait for COMWAKE to be detected
    DP3_AWAIT_COMWAKE: begin
      if (comwake_detect == 1) begin
        state_ns = DP3B_AWAIT_NO_COMWAKE; 
      end else begin
        if (retry_cnt == 0) begin
          state_ns = DP1_RESET;
        end
      end    
    end        
    
    // DP3B_AWAIT_NO_COMWAKE - Wait for COMWAKE to finish
    DP3B_AWAIT_NO_COMWAKE: begin
      if (comwake_detect == 0) begin
        state_ns = DP4_CALIBRATE; 
      end          
    end        
    
    // DP4_CALIBRATE 
    DP4_CALIBRATE: begin
      state_ns = DP5_COMWAKE;
    end   

    // DP5_COMWAKE - Send COMWAKE
    DP5_COMWAKE: begin
      if (tx_com_done == 1) begin
        state_ns = DP6_SEND_ALIGN;
      end      
    end     
    
    // DP6_SEND_ALIGN - Send ALIGN
    DP6_SEND_ALIGN: begin
      if (align_detect == 1) begin
        state_ns = DP7_READY; 
      end else begin
        if (align_timeout_cnt == 0) begin
          state_ns = DP11_ERROR;
        end      
      end     
    end   
    
    // DP7_READY - Link ready
    DP7_READY: begin
      state_ns = DP7_READY;    
    end   
    
    // DP11_ERROR
    DP11_ERROR: begin
      state_ns = DP1_RESET; 
    end
    
    default: begin
      state_ns = 'bx;
    end    
  endcase
end

////////////////////////////////////////////////////////////
// Seq Block   : Link Up
// Description : Set when communication has been established
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    link_up_o <= 0;
  end	else begin
    case (state_cs)
      // DP7_READY - Link ready
      DP7_READY: begin
        link_up_o <= 1;
      end 
      
      default: begin
        link_up_o <= 0;
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit COM Start
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_com_strt_o <= 0;
  end	else begin
    gt_tx_com_strt_o <= tx_com_strt_pedge;
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : Transmit COM Type
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_com_type_o <= 0;
  end	else begin
    case (state_cs)
      // DP2_COMINIT - Send COMINIT
      DP2_COMINIT: begin
        gt_tx_com_type_o <= 0;	      
      end          
  
      // DP5_COMWAKE - Send COMWAKE
      DP5_COMWAKE: begin
        gt_tx_com_type_o <= 1;	  
      end  
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit Electrical Idle
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_elec_idle_o <= 0;
  end	else begin
    case (state_cs) 
      // DP5_COMWAKE - Send COMWAKE
      DP5_COMWAKE: begin
        if (tx_com_done == 1) begin
          gt_tx_elec_idle_o <= 0;	
        end         
      end     
    
      // DP6_SEND_ALIGN - Send ALIGN
      DP6_SEND_ALIGN: begin
        gt_tx_elec_idle_o <= 0;	    
      end 
      
      // DP7_READY - Link ready
      DP7_READY: begin
        gt_tx_elec_idle_o <= 0;	    
      end  

      default: begin
        gt_tx_elec_idle_o <= 1;
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit Data
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_data_o <= 0;
  end	else begin
    case (state_cs)  
      // DP6_SEND_ALIGN - Send ALIGN
      DP6_SEND_ALIGN: begin
        gt_tx_data_o <= `ALIGN_VAL; // ALIGN;        
      end 
      
      // DP7_READY - Link ready
      DP7_READY: begin
        gt_tx_data_o <= `SYNC_VAL;  // SYNC;     
      end  
      
      default: begin
        gt_tx_data_o <= 0;      
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit K/D
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_charisk_o <= 0;
  end	else begin
    case (state_cs)  
      // DP6_SEND_ALIGN - Send ALIGN
      DP6_SEND_ALIGN: begin
        gt_tx_charisk_o <= 4'b0001; // ALIGN;        
      end 
      
      // DP7_READY - Link ready
      DP7_READY: begin
        gt_tx_charisk_o <= 4'b0001; // SYNC;     
      end  
      
      default: begin
        gt_tx_charisk_o <= 0;      
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : Transmit COM Start
// Description : Starts transmission of a COM sequence.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    tx_com_strt <= 0;
  end	else begin
    case (state_cs)
      // DP2_COMINIT - Send COMINIT
      DP2_COMINIT: begin
        tx_com_strt <= 1;		     
      end          

      // DP5_COMWAKE - Send COMWAKE
      DP5_COMWAKE: begin
        tx_com_strt <= 1;		         
      end  
      
      default: begin
        tx_com_strt <= 0;   
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : Transmit COM Done
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    tx_com_done <= 0;
  end	else begin
    case (state_cs)   
      // DP1_RESET - Interface quiescent
      DP1_RESET: begin
        tx_com_done <= 0;
      end
      
      // DP2_COMINIT - Send COMINIT
      DP2_COMINIT: begin
        if (gt_rx_status_i[0] == 1) begin
          tx_com_done <= 1;
        end     
      end    
    
      // DP5_COMWAKE - Send COMWAKE
      DP5_COMWAKE: begin
        if (gt_rx_status_i[0] == 1) begin
          tx_com_done <= 1;
        end   
      end  
      
      default: begin
        tx_com_done <= 0;
      end
    endcase     
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : ALIGN Timeout Count
// Description : Error if ALIGN not detected within 54.6us.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
		align_timeout_cnt <= 0;
	end	else begin
    case (state_cs)     
      // DP1_RESET - Interface quiescent
      DP1_RESET: begin
        case (SATA_REV)
          1:       align_timeout_cnt <= SATA1_55US;
          2:       align_timeout_cnt <= SATA2_55US;
          3:       align_timeout_cnt <= SATA3_55US;    
          default: align_timeout_cnt <= SATA1_55US;    
        endcase   
      end  
      
      // DP6_SEND_ALIGN - Send ALIGN
      DP6_SEND_ALIGN: begin
        align_timeout_cnt <= align_timeout_cnt - 1;
      end        
	  endcase
	end
end

////////////////////////////////////////////////////////////
// Seq Block   : Retry Count
// Description : Used to for async signal recovery (10 ms)
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
		retry_cnt <= 0;
	end	else begin
	  case (state_cs)  
      // DP1_RESET - Interface quiescent
      DP1_RESET: begin
        case (SATA_REV)
          1:       retry_cnt <= SATA1_10MS;
          2:       retry_cnt <= SATA2_10MS;
          3:       retry_cnt <= SATA3_10MS;    
          default: retry_cnt <= SATA1_10MS;    
        endcase	       
      end
      
      // DP3_AWAIT_COMWAKE - Wait for COMWAKE to be detected
      DP3_AWAIT_COMWAKE: begin
        retry_cnt <= retry_cnt - 1;
      end  
    endcase	  
	end
end

endmodule////////////////////////////////////////////////////////////
//
// This confidential and proprietary software may be used
// only as authorized by a licensing agreement from
// Bean Digital Ltd
// In the event of publication, the following notice is
// applicable:
//
// (C)COPYRIGHT 2012 BEAN DIGITAL LTD.
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all
// authorized copies.
//
// File        : sata_phy_host_ctrl_x6series.v
// Author      : J.Bean
// Date        : Mar 2012
// Description : SATA PHY Layer Host Control Xilinx 6 Series
////////////////////////////////////////////////////////////

`resetall
`timescale 1ns/10ps

`include "sata_constants.v"

module sata_phy_host_ctrl_x6series
  #(parameter SATA_REV = 1)(              // SATA Revision (1, 2, 3)
  input  wire          clk_phy,           // Clock PHY
  input  wire          rst_n,	            // Reset
  output reg           link_up_o,         // Link Up
  // Transceiver
  input  wire          gt_rst_done_i,     // GT Reset Done
  output reg  [31:0]   gt_tx_data_o,	     // GT Transmit Data
  output reg  [3:0]    gt_tx_charisk_o,	  // GT Transmit K/D
  output reg           gt_tx_com_strt_o,  // GT Transmit	COM Start
  output reg           gt_tx_com_type_o,	 // GT Transmit COM Type
  output reg           gt_tx_elec_idle_o, // GT Transmit Electrical Idle
  input  wire [31:0]   gt_rx_data_i,      // GT Receive Data   
  input  wire [2:0]    gt_rx_status_i,	   // GT Receive Status
  input  wire          gt_rx_elec_idle_i 	// GT Receive Electrical Idle   
);

////////////////////////////////////////////////////////////
// Parameters
//////////////////////////////////////////////////////////// 

// Time delays
parameter SATA1_10MS            = 750000;   // 75MHz * 750000
parameter SATA2_10MS            = 1500000;  // 150MHz * 1500000
parameter SATA3_10MS            = 3000000;  // 300MHz * 3000000
parameter SATA1_873US           = 65535;    // 75MHz * 65535
parameter SATA2_873US           = 131070;   // 150MHz * 131070
parameter SATA3_873US           = 262140;   // 300MHz * 262140

// State machine states
parameter HP1_RESET             = 0;
parameter HP2_AWAIT_COMINIT     = 1;
parameter HP2B_AWAIT_NO_COMINIT = 2;
parameter HP3_CALIBRATE         = 3;
parameter HP4_COMWAKE           = 4;
parameter HP5_AWAIT_COMWAKE     = 5;
parameter HP5B_AWAIT_NO_COMWAKE = 6;
parameter HP6_AWAIT_ALIGN       = 7;
parameter HP7_SEND_ALIGN        = 8;
parameter HP8_READY             = 9;

////////////////////////////////////////////////////////////
// Signals
//////////////////////////////////////////////////////////// 

reg  [3:0]   state_cs;            // Current state
reg  [3:0]   state_ns;            // Next state  
reg  [199:0] state_ascii;         // ASCII state
wire         phy_ctrl_strt;       // PHY Control Start
reg	 [31:0]	 align_timeout_cnt;   // ALIGN Timeout Count
reg  [31:0]  retry_cnt;           // Retry Count 
wire         cominit_detect;      // COMINIT Detect
wire         comwake_detect;      // COMWAKE Detect
wire         align_detect;        // ALIGN Detected
wire         align_timeout;       // ALIGN Timeout
reg  [1:0]   non_align_cnt;       // Non ALIGN Count
reg          tx_com_strt;         // Transmit COM Start
wire         tx_com_strt_pedge;   // Transmit COM Start Positive Edge
reg          tx_com_done;         // Transmit COM Done

////////////////////////////////////////////////////////////
// Instance    : Transmit Com Start Pos Edge
// Description : Detect positive edge on com start signal.
////////////////////////////////////////////////////////////

det_pos_edge U_tx_com_strt_pedge(
  .clk   (clk_phy),
  .rst_n (rst_n),
  .d     (tx_com_strt),
  .q     (tx_com_strt_pedge));

////////////////////////////////////////////////////////////
// Comb Assign : PHY Control Start
// Description : Starts the control.
////////////////////////////////////////////////////////////

assign phy_ctrl_strt = gt_rst_done_i;

////////////////////////////////////////////////////////////
// Comb Assign : COMWAKE Detect
// Description : 
////////////////////////////////////////////////////////////

assign comwake_detect = gt_rx_status_i[1];

////////////////////////////////////////////////////////////
// Comb Assign : COMINIT Detect
// Description : 
////////////////////////////////////////////////////////////

assign cominit_detect = gt_rx_status_i[2];

////////////////////////////////////////////////////////////
// Comb Assign : ALIGN Timeout
// Description : 
////////////////////////////////////////////////////////////

assign align_timeout = (align_timeout_cnt == 0);

////////////////////////////////////////////////////////////
// Comb Assign : ALIGN primitive detect
// Description : 
////////////////////////////////////////////////////////////

assign align_detect = (gt_rx_data_i == 32'h7B4A4ABC); 

////////////////////////////////////////////////////////////
// Seq Block   : State machine seq logic
// Description : Sets the current state to the next state.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin
  if (rst_n == 0) begin
    state_cs <= HP1_RESET;   
  end else begin
    state_cs <= state_ns;
  end
end  

////////////////////////////////////////////////////////////
// Comb Block  : State machine ascii 
// Description : Converts the state to ascii for debug.
////////////////////////////////////////////////////////////

always @(*)
begin
  case (state_cs)
    HP1_RESET:             state_ascii = "HP1_RESET";
    HP2_AWAIT_COMINIT:     state_ascii = "HP2_AWAIT_COMINIT";
    HP2B_AWAIT_NO_COMINIT: state_ascii = "HP2B_AWAIT_NO_COMINIT";
    HP3_CALIBRATE:         state_ascii = "HP3_CALIBRATE";
    HP4_COMWAKE:           state_ascii = "HP4_COMWAKE";
    HP5_AWAIT_COMWAKE:     state_ascii = "HP5_AWAIT_COMWAKE";
    HP5B_AWAIT_NO_COMWAKE: state_ascii = "HP5B_AWAIT_NO_COMWAKE";
    HP6_AWAIT_ALIGN:       state_ascii = "HP6_AWAIT_ALIGN";
    HP7_SEND_ALIGN:        state_ascii = "HP7_SEND_ALIGN";
    HP8_READY:             state_ascii = "HP8_READY"; 
  endcase
end

////////////////////////////////////////////////////////////
// Comb Block  : State machine comb logic
// Description : Assigns the next state.
////////////////////////////////////////////////////////////

always @(*)
begin
  state_ns = state_cs;

  case (state_cs)
    // HP1_RESET - Interface quiescent
    HP1_RESET: begin
      if ((phy_ctrl_strt == 1) && (tx_com_done == 1) && (cominit_detect == 0)) begin
        state_ns = HP2_AWAIT_COMINIT;
      end	      
    end
    
    // HP2_AWAIT_COMINIT - Wait for COMINIT to be detected
    HP2_AWAIT_COMINIT: begin
      if (cominit_detect == 1) begin
        state_ns = HP2B_AWAIT_NO_COMINIT;
      end else begin
        // Test if need to send COMRESET again
        if (retry_cnt == 0) begin
          state_ns = HP1_RESET;
        end
      end
    end

    // HP2B_AWAIT_NO_COMINIT - Wait for COMINIT to finish
    HP2B_AWAIT_NO_COMINIT: begin
      if (cominit_detect == 0) begin
        state_ns = HP3_CALIBRATE;
      end
    end
    
    // HP3_CALIBRATE
    HP3_CALIBRATE: begin
      state_ns = HP4_COMWAKE;
    end
    
    // HP4_COMWAKE - Send COMWAKE
    HP4_COMWAKE: begin
      if (tx_com_done == 1) begin
        state_ns = HP5_AWAIT_COMWAKE;
      end
    end
    
    // HP5_AWAIT_COMWAKE - Wait for COMWAKE to be detected
    HP5_AWAIT_COMWAKE: begin
      if (comwake_detect == 1) begin
        state_ns = HP5B_AWAIT_NO_COMWAKE;
      end else begin
        // Test if need to send COMRESET again
        if (retry_cnt == 0) begin
          state_ns = HP1_RESET;
        end
      end
    end
    
    // HP5B_AWAIT_NO_COMWAKE - Wait for COMWAKE to finish
    HP5B_AWAIT_NO_COMWAKE: begin
      if (comwake_detect == 0) begin
        state_ns = HP6_AWAIT_ALIGN;
      end
    end
    
    // HP6_AWAIT_ALIGN - Wait for ALIGN to be detected
    HP6_AWAIT_ALIGN: begin
      casez({align_detect, align_timeout})
        2'b10:   state_ns = HP7_SEND_ALIGN; 
        2'b01:   state_ns = HP1_RESET; 
        default: state_ns = HP6_AWAIT_ALIGN; 
      endcase
    end
    
    // HP7_SEND_ALIGN - Send ALIGN
    HP7_SEND_ALIGN: begin
      if (non_align_cnt == 3) begin
        state_ns = HP8_READY; 
      end
    end
    
    // HP8_READY - Link ready
    HP8_READY: begin
      if (gt_rx_elec_idle_i == 1) begin
        state_ns = HP1_RESET;
      end     
    end    
    
    default: begin
      state_ns = 'bx;
    end
  endcase
end

////////////////////////////////////////////////////////////
// Seq Block   : Link Up
// Description : Set when communication has been established
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    link_up_o <= 0;
  end	else begin
    case (state_cs)
      // HP8_READY - Link ready
      HP8_READY: begin
        link_up_o <= 1;
      end  
      
      default: begin
        link_up_o <= 0;
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit COM Start
// Description : Transmits the selected COM signal.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_com_strt_o <= 0;
  end	else begin
    gt_tx_com_strt_o <= tx_com_strt_pedge;
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit COM Type
// Description : 0 = COMRESET/COMINIT, 1 = COMWAKE
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_com_type_o <= 0;
  end	else begin
    case (state_cs)
      // HP1_RESET - Interface quiescent
      HP1_RESET: begin
        if (phy_ctrl_strt == 1) begin
          gt_tx_com_type_o <= 0;		
        end	      
      end
      
      // HP4_COMWAKE - Send COMWAKE
      HP4_COMWAKE: begin
        gt_tx_com_type_o <= 1;		
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit Electrical Idle
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_elec_idle_o <= 0;
  end	else begin
    case (state_cs)
      // HP5B_AWAIT_NO_COMWAKE - Wait for COMWAKE to finish
      HP5B_AWAIT_NO_COMWAKE: begin
        if (comwake_detect == 0) begin
          gt_tx_elec_idle_o <= 0;
        end
      end
    
      // HP6_AWAIT_ALIGN - Wait for ALIGN to be detected
      HP6_AWAIT_ALIGN: begin
        gt_tx_elec_idle_o <= 0;
      end
      
      // HP7_SEND_ALIGN - Send ALIGN
      HP7_SEND_ALIGN: begin
        gt_tx_elec_idle_o <= 0;
      end
      
      // HP8_READY - Link ready
      HP8_READY: begin
        gt_tx_elec_idle_o <= 0;
      end          
      
      default: begin
        gt_tx_elec_idle_o <= 1;
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit Data
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_data_o <= 0;
  end	else begin
    case (state_cs)  
      // HP6_AWAIT_ALIGN - Wait for ALIGN to be detected
      HP6_AWAIT_ALIGN: begin
        gt_tx_data_o <= 32'h4A4A4A4A; // D10.2     
      end
      
      // HP7_SEND_ALIGN - Send ALIGN
      HP7_SEND_ALIGN: begin
        gt_tx_data_o <= `ALIGN_VAL;   // ALIGN; 
      end
      
      // HP8_READY - Link ready
      HP8_READY: begin
        gt_tx_data_o <= `SYNC_VAL;    // SYNC;  
      end        
      
      default: begin
        gt_tx_data_o <= 0;      
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Transmit K/D
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    gt_tx_charisk_o <= 0;
  end	else begin
    case (state_cs)  
      // HP6_AWAIT_ALIGN - Wait for ALIGN to be detected
      HP6_AWAIT_ALIGN: begin
        gt_tx_charisk_o <= 4'b0000; // D10.2     
      end
      
      // HP7_SEND_ALIGN - Send ALIGN
      HP7_SEND_ALIGN: begin
        gt_tx_charisk_o <= 4'b0001; // ALIGN; 
      end
      
      // HP8_READY - Link ready
      HP8_READY: begin
        gt_tx_charisk_o <= 4'b0001; // SYNC;  
      end        
      
      default: begin
        gt_tx_charisk_o <= 0;      
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : Transmit COM Start
// Description : Starts transmission of a COM sequence.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    tx_com_strt <= 0;
  end	else begin
    case (state_cs)
      // HP1_RESET - Interface quiescent
      HP1_RESET: begin
        if (phy_ctrl_strt == 1) begin
          tx_com_strt <= 1;	
        end	else begin
          tx_com_strt <= 0;
        end
      end
      
      // HP4_COMWAKE - Send COMWAKE
      HP4_COMWAKE: begin
        tx_com_strt <= 1;	
      end
          
      default: begin
        tx_com_strt <= 0;   
      end
    endcase
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : Transmit COM Done
// Description : Detects when COM signal has been sent.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
    tx_com_done <= 0;
  end	else begin
    case (state_cs)     
      // HP1_RESET - Interface quiescent
      HP1_RESET: begin
        if ((phy_ctrl_strt == 1) && (tx_com_done == 1) && (cominit_detect == 0)) begin
          tx_com_done <= 0;
        end else begin
          if (gt_rx_status_i[0] == 1) begin
            tx_com_done <= 1;
          end
        end     
      end
      
      // HP4_COMWAKE - Send COMWAKE
      HP4_COMWAKE: begin
        if (tx_com_done == 1) begin
          tx_com_done <= 0;
        end else begin
          if (gt_rx_status_i[0] == 1) begin
            tx_com_done <= 1;
          end
        end   
      end
    endcase     
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : ALIGN Timeout Count
// Description : Used to send COMRESET if ALIGN primitives
//               are not detected within 873.8us.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
		align_timeout_cnt <= 0;
	end	else begin
	  case (state_cs)     
      // HP1_RESET - Interface quiescent
      HP1_RESET: begin
        case (SATA_REV)
          1:       align_timeout_cnt <= SATA1_873US;
          2:       align_timeout_cnt <= SATA2_873US;
          3:       align_timeout_cnt <= SATA3_873US;    
          default: align_timeout_cnt <= SATA1_873US;    
        endcase
      end	   
      
      // HP6_AWAIT_ALIGN - Wait for ALIGN to be detected
      HP6_AWAIT_ALIGN: begin
        align_timeout_cnt <= align_timeout_cnt - 1;
      end      
	  endcase
	end
end

////////////////////////////////////////////////////////////
// Seq Block   : Retry Count
// Description : Used to for async signal recovery (10 ms)
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
		retry_cnt <= 0;
	end	else begin
	  case (state_cs)  
      // HP1_RESET - Interface quiescent
      HP1_RESET: begin
        case (SATA_REV)
          1:       retry_cnt <= SATA1_10MS;
          2:       retry_cnt <= SATA2_10MS;
          3:       retry_cnt <= SATA3_10MS;    
          default: retry_cnt <= SATA1_10MS;    
        endcase	       
      end
      
      // HP2_AWAIT_COMINIT - Wait for COMINIT to be detected
      HP2_AWAIT_COMINIT: begin
        retry_cnt <= retry_cnt - 1;
      end	 
      
      // HP2B_AWAIT_NO_COMINIT - Wait for COMINIT to finish
      HP2B_AWAIT_NO_COMINIT: begin
        case (SATA_REV)
          1:       retry_cnt <= SATA1_10MS;
          2:       retry_cnt <= SATA2_10MS;
          3:       retry_cnt <= SATA3_10MS;    
          default: retry_cnt <= SATA1_10MS;    
        endcase	 
      end      
      
      // HP5_AWAIT_COMWAKE - Wait for COMWAKE to be detected
      HP5_AWAIT_COMWAKE: begin
        retry_cnt <= retry_cnt - 1;
      end      
	  endcase	  
	end
end

////////////////////////////////////////////////////////////
// Seq Block   : Non ALIGN Count
// Description : Counts 3 non ALIGN primitives. 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy) 
begin 
  if (rst_n == 0) begin
		non_align_cnt <= 0;
	end	else begin
	  case (state_cs)  
      // HP7_SEND_ALIGN - Send ALIGN
      HP7_SEND_ALIGN: begin
  	    // Look for K28.3
        if (gt_rx_data_i[7:0] == 8'hbc) begin
        		non_align_cnt <= non_align_cnt + 1;
        end else begin
  		      non_align_cnt <= 0;	  
        end    
      end	    
      
      default: begin
        non_align_cnt <= 0;	 
      end
	  endcase	  
	end
end

endmodule
////////////////////////////////////////////////////////////
//
// This confidential and proprietary software may be used
// only as authorized by a licensing agreement from
// Bean Digital Ltd
// In the event of publication, the following notice is
// applicable:
//
// (C)COPYRIGHT 2012 BEAN DIGITAL LTD.
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all
// authorized copies.
//
// File        : sata_phy_top_x6series_tb.v
// Author      : J.Bean
// Date        : Mar 2012
// Description : SATA PHY Layer Top Xilinx 6 Series TB
////////////////////////////////////////////////////////////

`resetall
`timescale 1ns/10ps

`include "sata_constants.v" 

module sata_phy_top_x6series_tb;

reg         gt_clk;
wire        clk_ref;
wire        clk_sata;
wire        clk_phy;
wire        clk_gt;
wire        rst_n;
reg  [5:0]  rst_cnt;

wire [1:0]  host_gt_clk_ref;       
wire        host_gt_plllkdet;
wire        host_gt_rst_done;
wire [15:0] host_gt_rx_data;
wire [1:0]  host_gt_rx_charisk;
wire [1:0]  host_gt_rx_disp_err;
wire [1:0]  host_gt_rx_8b10b_err;
wire        host_gt_rx_elec_idle;
wire [2:0]  host_gt_rx_status;
wire [15:0] host_gt_tx_data;
wire [1:0]  host_gt_tx_charisk;
wire        host_gt_tx_elec_idle;
wire        host_gt_tx_com_strt;
wire        host_gt_tx_com_type;
wire        host_gt_rx_p;
wire        host_gt_rx_n;
wire        host_gt_tx_p;
wire        host_gt_tx_n;

wire [1:0]  dev_gt_clk_ref;       
wire        dev_gt_plllkdet;
wire        dev_gt_rst_done;
wire [15:0] dev_gt_rx_data;
wire [1:0]  dev_gt_rx_charisk;
wire [1:0]  dev_gt_rx_disp_err;
wire [1:0]  dev_gt_rx_8b10b_err;
wire        dev_gt_rx_elec_idle;
wire [2:0]  dev_gt_rx_status;
wire [15:0] dev_gt_tx_data;
wire [1:0]  dev_gt_tx_charisk;
wire        dev_gt_tx_elec_idle;
wire        dev_gt_tx_com_strt;
wire        dev_gt_tx_com_type;
wire        dev_gt_rx_p;
wire        dev_gt_rx_n;
wire        dev_gt_tx_p;
wire        dev_gt_tx_n;

assign host_gt_rx_p = dev_gt_tx_p;
assign host_gt_rx_n = dev_gt_tx_n;
assign dev_gt_rx_p  = host_gt_tx_p;
assign dev_gt_rx_n  = host_gt_tx_n;

initial
begin
  gt_clk = 0;
  
  forever begin
    #(6.66/2.0) gt_clk = ~gt_clk; // 150 MHz
  end
end

////////////////////////////////////////////////////////////
// Instance    : 
// Description : 
////////////////////////////////////////////////////////////

PLL_BASE #(
  .BANDWIDTH             ("OPTIMIZED"),
  .CLKFBOUT_MULT         (5),     
  .CLKFBOUT_PHASE        (0.0),
  .CLKIN_PERIOD          (6.66),
  .CLKOUT0_DIVIDE        (20),       
  .CLKOUT1_DIVIDE        (10),      
  .CLKOUT2_DIVIDE        (5),      
  .CLKOUT3_DIVIDE        (1),  
  .CLKOUT4_DIVIDE        (1),  
  .CLKOUT5_DIVIDE        (1),    
  .CLKOUT0_PHASE         (0.0),
  .CLKOUT1_PHASE         (0.0),
  .CLKOUT2_PHASE         (0.0),  
  .CLKOUT3_PHASE         (0.0),
  .CLKOUT4_PHASE         (0.0),
  .CLKOUT5_PHASE         (0.0),
  .CLKOUT0_DUTY_CYCLE    (0.500),
  .CLKOUT1_DUTY_CYCLE    (0.500),
  .CLKOUT2_DUTY_CYCLE    (0.500),
  .CLKOUT3_DUTY_CYCLE    (0.500),
  .CLKOUT4_DUTY_CYCLE    (0.500),
  .CLKOUT5_DUTY_CYCLE    (0.500),
  .CLK_FEEDBACK          ("CLKFBOUT"),
  .COMPENSATION          ("SYSTEM_SYNCHRONOUS"),
  .DIVCLK_DIVIDE         (1),
  .REF_JITTER            (0.000200),
  .RESET_ON_LOSS_OF_LOCK ("FALSE"))
  U_pll (
  .CLKFBOUT              (pll_clkfb),   
  .CLKOUT0               (pll_clk0),   
  .CLKOUT1               (pll_clk1),   
  .CLKOUT2               (pll_clk2),   
  .CLKOUT3               (pll_clk3), 
  .CLKOUT4               (pll_clk4),  
  .CLKOUT5               (pll_clk5),  
  .LOCKED                (pll_locked),   
  .CLKFBIN               (pll_clkfb), 
  .CLKIN                 (clkin), 
  .RST                   (~host_gt_plllkdet)); 

BUFG U_pll_clk0_bufg(
  .O (clk_sata),
  .I (pll_clk0));

BUFG U_pll_clk1_bufg(
  .O (clk_phy),
  .I (pll_clk1));
  
BUFG U_pll_clk2_bufg(
  .O (clk_gt),
  .I (pll_clk2));  
  
assign pll_locked_n = ~pll_locked;

assign rst_n = (rst_cnt == 16);

always @(posedge clk_sata or posedge pll_locked_n)
begin
  if (pll_locked_n == 1) begin
    rst_cnt <= 0;
  end else begin
    if (rst_cnt != 16) begin
      rst_cnt <= rst_cnt + 1;
    end
  end
end

////////////////////////////////////////////////////////////
// Instance    : 
// Description : 
////////////////////////////////////////////////////////////

BUFIO2 #(
  .DIVIDE        (1),
  .DIVIDE_BYPASS ("TRUE"))
  U_refclk_bufg(
  .I             (host_gt_clk_ref[0]),
  .DIVCLK        (clkin),
  .IOCLK         (),
  .SERDESSTROBE  ());
  
////////////////////////////////////////////////////////////
// Instance    : SATA Host PHY
// Description : 
////////////////////////////////////////////////////////////

sata_phy_top_x6series #(
  .IS_HOST           (1),
  .SATA_REV          (1)) 
  U_sata_host(
  .clk               (clk_sata),
  .clk_phy           (clk_phy),
  .rst_n             (rst_n),
  .lnk_tx_tdata_i    (`SYNC_VAL),
  .lnk_tx_tvalid_i   (1'b1),
  .lnk_tx_tready_o   (),
  .lnk_tx_tuser_i    (4'b0001),
  .lnk_rx_tdata_o    (),
  .lnk_rx_tvalid_o   (),
  .lnk_rx_tready_i   (1'b1),
  .lnk_rx_tuser_o    (),
  .phy_status_o      (),
  .gt_rst_done_i     (host_gt_rst_done),
  .gt_rx_data_i      (host_gt_rx_data),
  .gt_rx_charisk_i   (host_gt_rx_charisk),
  .gt_rx_disp_err_i  (host_gt_rx_disp_err),
  .gt_rx_8b10b_err_i (host_gt_rx_8b10b_err),
  .gt_rx_elec_idle_i (host_gt_rx_elec_idle),
  .gt_rx_status_i    (host_gt_rx_status),
  .gt_tx_data_o      (host_gt_tx_data),
  .gt_tx_charisk_o   (host_gt_tx_charisk),
  .gt_tx_elec_idle_o (host_gt_tx_elec_idle),
  .gt_tx_com_strt_o  (host_gt_tx_com_strt),
  .gt_tx_com_type_o  (host_gt_tx_com_type));

////////////////////////////////////////////////////////////
// Instance    : SATA 1 Host GTP
// Description : 
////////////////////////////////////////////////////////////

sata_s6_sata1_gtp #(
  .WRAPPER_SIM_GTPRESET_SPEEDUP   (0),      // Set this to 1 for simulation
  .WRAPPER_SIMULATION             (0))      // Set this to 1 for simulation
  U_sata_host_gtp(
  //_____________________________________________________________________
  //_____________________________________________________________________
  //TILE0  (X1_Y0)

  //---------------------- Loopback and Powerdown Ports ----------------------
  .TILE0_LOOPBACK0_IN             (3'd0),
  .TILE0_LOOPBACK1_IN             (3'd0), 
  //------------------------------- PLL Ports --------------------------------
  .TILE0_CLK00_IN                 (gt_clk),
  .TILE0_CLK01_IN                 (1'b0),
  .TILE0_GTPRESET0_IN             (1'b0),
  .TILE0_GTPRESET1_IN             (1'b0),
  .TILE0_PLLLKDET0_OUT            (host_gt_plllkdet),
  .TILE0_RESETDONE0_OUT           (host_gt_rst_done),
  .TILE0_RESETDONE1_OUT           (),
  //--------------------- Receive Ports - 8b10b Decoder ----------------------
  .TILE0_RXCHARISCOMMA0_OUT       (),
  .TILE0_RXCHARISCOMMA1_OUT       (),
  .TILE0_RXCHARISK0_OUT           (host_gt_rx_charisk),
  .TILE0_RXCHARISK1_OUT           (),
  .TILE0_RXDISPERR0_OUT           (host_gt_rx_disp_err),
  .TILE0_RXDISPERR1_OUT           (),
  .TILE0_RXNOTINTABLE0_OUT        (host_gt_rx_8b10b_err),
  .TILE0_RXNOTINTABLE1_OUT        (),
  //-------------------- Receive Ports - Clock Correction --------------------
  .TILE0_RXCLKCORCNT0_OUT         (),
  .TILE0_RXCLKCORCNT1_OUT         (),
  //------------- Receive Ports - Comma Detection and Alignment --------------
  .TILE0_RXBYTEISALIGNED0_OUT     (),
  .TILE0_RXBYTEISALIGNED1_OUT     (),  
  .TILE0_RXENMCOMMAALIGN0_IN      (1'b1),
  .TILE0_RXENMCOMMAALIGN1_IN      (1'b1),
  .TILE0_RXENPCOMMAALIGN0_IN      (1'b1),
  .TILE0_RXENPCOMMAALIGN1_IN      (1'b1),
  //----------------- Receive Ports - RX Data Path interface -----------------
  .TILE0_RXDATA0_OUT              (host_gt_rx_data),
  .TILE0_RXDATA1_OUT              (),
  .TILE0_RXRECCLK0_OUT            (),
  .TILE0_RXRECCLK1_OUT            (),
  .TILE0_RXRESET0_IN              (1'b0),
  .TILE0_RXRESET1_IN              (1'b0),  
  .TILE0_RXUSRCLK0_IN             (clk_gt),
  .TILE0_RXUSRCLK1_IN             (clk_gt),
  .TILE0_RXUSRCLK20_IN            (clk_phy),
  .TILE0_RXUSRCLK21_IN            (clk_phy),
  //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
  .TILE0_GATERXELECIDLE0_IN       (1'b0),
  .TILE0_GATERXELECIDLE1_IN       (1'b0),
  .TILE0_IGNORESIGDET0_IN         (1'b0),
  .TILE0_IGNORESIGDET1_IN         (1'b0),
  .TILE0_RXELECIDLE0_OUT          (host_gt_rx_elec_idle),
  .TILE0_RXELECIDLE1_OUT          (),
  .TILE0_RXEQMIX0_IN              (2'd0),
  .TILE0_RXEQMIX1_IN              (2'd0),
  .TILE0_RXN0_IN                  (host_gt_rx_n),
  .TILE0_RXN1_IN                  (1'b0),
  .TILE0_RXP0_IN                  (host_gt_rx_p),
  .TILE0_RXP1_IN                  (1'b0),
  //--------- Receive Ports - RX Elastic Buffer and Phase Alignment ----------
  .TILE0_RXSTATUS0_OUT            (host_gt_rx_status),
  .TILE0_RXSTATUS1_OUT            (),
  //-------------------------- TX/RX Datapath Ports --------------------------
  .TILE0_GTPCLKOUT0_OUT           (host_gt_clk_ref),
  .TILE0_GTPCLKOUT1_OUT           (),
  //----------------- Transmit Ports - 8b10b Encoder Control -----------------
  .TILE0_TXCHARISK0_IN            (host_gt_tx_charisk),
  .TILE0_TXCHARISK1_IN            (2'd0),
  //---------------- Transmit Ports - TX Data Path interface -----------------
  .TILE0_TXDATA0_IN               (host_gt_tx_data),
  .TILE0_TXDATA1_IN               (16'd0),
  .TILE0_TXOUTCLK0_OUT            (),
  .TILE0_TXOUTCLK1_OUT            (),
  .TILE0_TXRESET0_IN              (1'b0),
  .TILE0_TXRESET1_IN              (1'b0),  
  .TILE0_TXUSRCLK0_IN             (clk_gt),
  .TILE0_TXUSRCLK1_IN             (clk_gt),
  .TILE0_TXUSRCLK20_IN            (clk_phy),
  .TILE0_TXUSRCLK21_IN            (clk_phy),
  //------------- Transmit Ports - TX Driver and OOB signalling --------------
  .TILE0_TXDIFFCTRL0_IN           (4'b0111),
  .TILE0_TXDIFFCTRL1_IN           (4'b0111),
  .TILE0_TXN0_OUT                 (host_gt_tx_n),
  .TILE0_TXN1_OUT                 (),
  .TILE0_TXP0_OUT                 (host_gt_tx_p),
  .TILE0_TXP1_OUT                 (),
  .TILE0_TXPREEMPHASIS0_IN        (3'd0),
  .TILE0_TXPREEMPHASIS1_IN        (3'd0),  
  //--------------- Transmit Ports - TX Ports for PCI Express ----------------
  .TILE0_TXELECIDLE0_IN           (host_gt_tx_elec_idle),
  .TILE0_TXELECIDLE1_IN           (1'b0),
  //------------------- Transmit Ports - TX Ports for SATA -------------------
  .TILE0_TXCOMSTART0_IN           (host_gt_tx_com_strt),
  .TILE0_TXCOMSTART1_IN           (1'b0),
  .TILE0_TXCOMTYPE0_IN            (host_gt_tx_com_type),
  .TILE0_TXCOMTYPE1_IN            (1'b0));
  
////////////////////////////////////////////////////////////
// Instance    : SATA Device PHY
// Description : 
////////////////////////////////////////////////////////////

sata_phy_top_x6series #(
  .IS_HOST           (0),
  .SATA_REV          (1)) 
  U_sata_dev(
  .clk               (clk_sata),
  .clk_phy           (clk_phy),
  .rst_n             (rst_n),
  .lnk_tx_tdata_i    (`SYNC_VAL),
  .lnk_tx_tvalid_i   (1'b1),
  .lnk_tx_tready_o   (),
  .lnk_tx_tuser_i    (4'b0001),
  .lnk_rx_tdata_o    (),
  .lnk_rx_tvalid_o   (),
  .lnk_rx_tready_i   (1'b1),
  .lnk_rx_tuser_o    (),
  .phy_status_o      (),
  .gt_rst_done_i     (dev_gt_rst_done),
  .gt_rx_data_i      (dev_gt_rx_data),
  .gt_rx_charisk_i   (dev_gt_rx_charisk),
  .gt_rx_disp_err_i  (dev_gt_rx_disp_err),
  .gt_rx_8b10b_err_i (dev_gt_rx_8b10b_err),
  .gt_rx_elec_idle_i (dev_gt_rx_elec_idle),
  .gt_rx_status_i    (dev_gt_rx_status),
  .gt_tx_data_o      (dev_gt_tx_data),
  .gt_tx_charisk_o   (dev_gt_tx_charisk),
  .gt_tx_elec_idle_o (dev_gt_tx_elec_idle),
  .gt_tx_com_strt_o  (dev_gt_tx_com_strt),
  .gt_tx_com_type_o  (dev_gt_tx_com_type));

////////////////////////////////////////////////////////////
// Instance    : SATA 1 Device GTP
// Description : 
////////////////////////////////////////////////////////////

sata_s6_sata1_gtp #(
  .WRAPPER_SIM_GTPRESET_SPEEDUP   (0),      // Set this to 1 for simulation
  .WRAPPER_SIMULATION             (0))      // Set this to 1 for simulation
  U_sata_dev_gtp(
  //_____________________________________________________________________
  //_____________________________________________________________________
  //TILE0  (X1_Y0)

  //---------------------- Loopback and Powerdown Ports ----------------------
  .TILE0_LOOPBACK0_IN             (3'd0),
  .TILE0_LOOPBACK1_IN             (3'd0), 
  //------------------------------- PLL Ports --------------------------------
  .TILE0_CLK00_IN                 (gt_clk),
  .TILE0_CLK01_IN                 (1'b0),
  .TILE0_GTPRESET0_IN             (1'b0),
  .TILE0_GTPRESET1_IN             (1'b0),
  .TILE0_PLLLKDET0_OUT            (dev_gt_plllkdet),
  .TILE0_RESETDONE0_OUT           (dev_gt_rst_done),
  .TILE0_RESETDONE1_OUT           (),
  //--------------------- Receive Ports - 8b10b Decoder ----------------------
  .TILE0_RXCHARISCOMMA0_OUT       (),
  .TILE0_RXCHARISCOMMA1_OUT       (),
  .TILE0_RXCHARISK0_OUT           (dev_gt_rx_charisk),
  .TILE0_RXCHARISK1_OUT           (),
  .TILE0_RXDISPERR0_OUT           (dev_gt_rx_disp_err),
  .TILE0_RXDISPERR1_OUT           (),
  .TILE0_RXNOTINTABLE0_OUT        (dev_gt_rx_8b10b_err),
  .TILE0_RXNOTINTABLE1_OUT        (),
  //-------------------- Receive Ports - Clock Correction --------------------
  .TILE0_RXCLKCORCNT0_OUT         (),
  .TILE0_RXCLKCORCNT1_OUT         (),
  //------------- Receive Ports - Comma Detection and Alignment --------------
  .TILE0_RXBYTEISALIGNED0_OUT     (),
  .TILE0_RXBYTEISALIGNED1_OUT     (),  
  .TILE0_RXENMCOMMAALIGN0_IN      (1'b1),
  .TILE0_RXENMCOMMAALIGN1_IN      (1'b1),
  .TILE0_RXENPCOMMAALIGN0_IN      (1'b1),
  .TILE0_RXENPCOMMAALIGN1_IN      (1'b1),
  //----------------- Receive Ports - RX Data Path interface -----------------
  .TILE0_RXDATA0_OUT              (dev_gt_rx_data),
  .TILE0_RXDATA1_OUT              (),
  .TILE0_RXRECCLK0_OUT            (),
  .TILE0_RXRECCLK1_OUT            (),
  .TILE0_RXRESET0_IN              (1'b0),
  .TILE0_RXRESET1_IN              (1'b0),  
  .TILE0_RXUSRCLK0_IN             (clk_gt),
  .TILE0_RXUSRCLK1_IN             (clk_gt),
  .TILE0_RXUSRCLK20_IN            (clk_phy),
  .TILE0_RXUSRCLK21_IN            (clk_phy),
  //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
  .TILE0_GATERXELECIDLE0_IN       (1'b0),
  .TILE0_GATERXELECIDLE1_IN       (1'b0),
  .TILE0_IGNORESIGDET0_IN         (1'b0),
  .TILE0_IGNORESIGDET1_IN         (1'b0),
  .TILE0_RXELECIDLE0_OUT          (dev_gt_rx_elec_idle),
  .TILE0_RXELECIDLE1_OUT          (),
  .TILE0_RXEQMIX0_IN              (2'd0),
  .TILE0_RXEQMIX1_IN              (2'd0),
  .TILE0_RXN0_IN                  (dev_gt_rx_n),
  .TILE0_RXN1_IN                  (1'b0),
  .TILE0_RXP0_IN                  (dev_gt_rx_p),
  .TILE0_RXP1_IN                  (1'b0),
  //--------- Receive Ports - RX Elastic Buffer and Phase Alignment ----------
  .TILE0_RXSTATUS0_OUT            (dev_gt_rx_status),
  .TILE0_RXSTATUS1_OUT            (),
  //-------------------------- TX/RX Datapath Ports --------------------------
  .TILE0_GTPCLKOUT0_OUT           (dev_gt_clk_ref),
  .TILE0_GTPCLKOUT1_OUT           (),
  //----------------- Transmit Ports - 8b10b Encoder Control -----------------
  .TILE0_TXCHARISK0_IN            (dev_gt_tx_charisk),
  .TILE0_TXCHARISK1_IN            (2'd0),
  //---------------- Transmit Ports - TX Data Path interface -----------------
  .TILE0_TXDATA0_IN               (dev_gt_tx_data),
  .TILE0_TXDATA1_IN               (16'd0),
  .TILE0_TXOUTCLK0_OUT            (),
  .TILE0_TXOUTCLK1_OUT            (),
  .TILE0_TXRESET0_IN              (1'b0),
  .TILE0_TXRESET1_IN              (1'b0),  
  .TILE0_TXUSRCLK0_IN             (clk_gt),
  .TILE0_TXUSRCLK1_IN             (clk_gt),
  .TILE0_TXUSRCLK20_IN            (clk_phy),
  .TILE0_TXUSRCLK21_IN            (clk_phy),
  //------------- Transmit Ports - TX Driver and OOB signalling --------------
  .TILE0_TXDIFFCTRL0_IN           (4'b0111),
  .TILE0_TXDIFFCTRL1_IN           (4'b0111),
  .TILE0_TXN0_OUT                 (dev_gt_tx_n),
  .TILE0_TXN1_OUT                 (),
  .TILE0_TXP0_OUT                 (dev_gt_tx_p),
  .TILE0_TXP1_OUT                 (),
  .TILE0_TXPREEMPHASIS0_IN        (3'd0),
  .TILE0_TXPREEMPHASIS1_IN        (3'd0),  
  //--------------- Transmit Ports - TX Ports for PCI Express ----------------
  .TILE0_TXELECIDLE0_IN           (dev_gt_tx_elec_idle),
  .TILE0_TXELECIDLE1_IN           (1'b0),
  //------------------- Transmit Ports - TX Ports for SATA -------------------
  .TILE0_TXCOMSTART0_IN           (dev_gt_tx_com_strt),
  .TILE0_TXCOMSTART1_IN           (1'b0),
  .TILE0_TXCOMTYPE0_IN            (dev_gt_tx_com_type),
  .TILE0_TXCOMTYPE1_IN            (1'b0));
    
endmodule 


////////////////////////////////////////////////////////////
//
// This confidential and proprietary software may be used
// only as authorized by a licensing agreement from
// Bean Digital Ltd
// In the event of publication, the following notice is
// applicable:
//
// (C)COPYRIGHT 2012 BEAN DIGITAL LTD.
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all
// authorized copies.
//
// File        : sata_phy_top_x6series.v
// Author      : J.Bean
// Date        : Mar 2012
// Description : SATA PHY Layer Top Xilinx 6 Series
////////////////////////////////////////////////////////////

`resetall
`timescale 1ns/10ps

`include "sata_constants.v"

module sata_phy_top_x6series
  #(parameter DATA_BITS = 32,                         // Data Bits
    parameter IS_HOST   = 1,                          // 1 = Host, 0 = Device  
    parameter SATA_REV  = 1)(                         // SATA Revision (1, 2, 3)
  input  wire                     clk,                // Clock
  input  wire                     clk_phy,            // Clock PHY
  input  wire                     rst_n,              // Reset
  // Link Transmit
  input  wire [DATA_BITS-1:0]     lnk_tx_tdata_i,     // Link Transmit Data 
  input  wire                     lnk_tx_tvalid_i,    // Link Transmit Source Ready 
  output wire                     lnk_tx_tready_o,    // Link Transmit Destination Ready
  input  wire [3:0]               lnk_tx_tuser_i,     // Link Transmit User
  // Link Receive
  output wire [DATA_BITS-1:0]     lnk_rx_tdata_o,     // Link Receive Data 
  output wire                     lnk_rx_tvalid_o,    // Link Receive Source Ready     
  input  wire                     lnk_rx_tready_i,    // Link Receive Destination Ready     
  output wire [7:0]               lnk_rx_tuser_o,     // Link Receive User    
  // Status
  output wire [7:0]               phy_status_o,       // PHY Status      
  // Transceiver
  input  wire                     gt_rst_done_i,      // GT Reset Done
  input  wire [15:0]              gt_rx_data_i,       // GT Receive Data
  input  wire [1:0]               gt_rx_charisk_i,    // GT Receive K/D
  input  wire [1:0]               gt_rx_disp_err_i,   // GT Receive Disparity Error
  input  wire [1:0]               gt_rx_8b10b_err_i,  // GT Receive 8b10b Error
  input  wire                     gt_rx_elec_idle_i,  // GT Receive Electrical Idle
  input  wire [2:0]               gt_rx_status_i,     // GT Receive Status     
  output wire [15:0]              gt_tx_data_o,       // GT Transmit Data
  output wire [1:0]               gt_tx_charisk_o,    // GT Transmit K/D
  output wire                     gt_tx_elec_idle_o,  // GT Transmit Electrical Idle
  output wire                     gt_tx_com_strt_o,   // GT Transmit Com Start 
  output wire                     gt_tx_com_type_o    // GT Transmit Com Type
);

////////////////////////////////////////////////////////////
// Signals
//////////////////////////////////////////////////////////// 

wire                 link_up;         // Link Up
reg                  tx_data_mux_sel; // Transmit Mux Data Select
reg  [7:0]           rx_data_mux_sel; // Receive Mux Data Select
wire [31:0]          gt_rx_data;      // GT Receive Data
reg  [31:0]          gt_rx_data_r;    // GT Receive Data
wire [3:0]           gt_rx_charisk;   // GT Receive K/D
reg  [3:0]           gt_rx_charisk_r; // GT Receive K/D
wire [3:0]           gt_rx_err;       // GT Receive Error
reg  [3:0]           gt_rx_err_r;     // GT Receive Error
reg                  gt_rx_valid;     // GT Receive Valid
reg  [47:0]          gt_rx_data_sr;   // GT Receive Data Shift Reg
reg  [5:0]           gt_rx_k_sr;      // GT Receive K/D Shift Reg
reg  [5:0]           gt_rx_err_sr;    // GT Receive Error Shift Reg
wire [31:0]          gt_tx_data;      // GT Transmit Data
wire [3:0]           gt_tx_charisk;   // GT Transmit K/D
wire [DATA_BITS-1:0] lnk_tx_tdata;    // Link Transmit Data
wire                 lnk_tx_tvalid;   // Link Transmit Source Ready  
reg                  lnk_tx_tready;   // Link Transmit Destination Ready
wire [3:0]           lnk_tx_tuser;    // Link Transmit User 
wire [DATA_BITS-1:0] lnk_rx_tdata;    // Link Receive Data
wire                 lnk_rx_tvalid;   // Link Receive Source Ready  
wire                 lnk_rx_tready;   // Link Receive Destination Ready
wire [7:0]           lnk_rx_tuser;    // Link Receive User

////////////////////////////////////////////////////////////
// Comb Assign : PHY Status
// Description : 
////////////////////////////////////////////////////////////

assign phy_status_o = {7'd0, link_up};

////////////////////////////////////////////////////////////
// Comb Assign : Port Signals
// Description : 
////////////////////////////////////////////////////////////

assign lnk_rx_tdata      = gt_rx_data_r;
assign lnk_rx_tvalid     = gt_rx_valid;
assign lnk_rx_tuser[3:0] = gt_rx_charisk_r;
assign lnk_rx_tuser[7:4] = gt_rx_err_r;

////////////////////////////////////////////////////////////
// Instance    : PHY Transmit FIFO
// Description : 
////////////////////////////////////////////////////////////

axis_fifo_36W_16D U_phy_tx_fifo(
  .m_aclk        (clk_phy), 
  .s_aclk        (clk), 
  .s_aresetn     (rst_n), 
  .s_axis_tdata  (lnk_tx_tdata_i),
  .s_axis_tuser  (lnk_tx_tuser_i),  
  .s_axis_tvalid (lnk_tx_tvalid_i),
  .s_axis_tready (lnk_tx_tready_o),
  .m_axis_tdata  (lnk_tx_tdata),
  .m_axis_tuser  (lnk_tx_tuser),  
  .m_axis_tvalid (lnk_tx_tvalid), 
  .m_axis_tready (lnk_tx_tready));
  
////////////////////////////////////////////////////////////
// Instance    : PHY Receive FIFO
// Description : 
////////////////////////////////////////////////////////////

axis_fifo_40W_16D U_phy_rx_fifo(
  .m_aclk        (clk), 
  .s_aclk        (clk_phy), 
  .s_aresetn     (rst_n), 
  .s_axis_tdata  (lnk_rx_tdata),
  .s_axis_tuser  (lnk_rx_tuser),  
  .s_axis_tvalid (lnk_rx_tvalid),
  .s_axis_tready (lnk_rx_tready),
  .m_axis_tdata  (lnk_rx_tdata_o),
  .m_axis_tuser  (lnk_rx_tuser_o),  
  .m_axis_tvalid (lnk_rx_tvalid_o), 
  .m_axis_tready (lnk_rx_tready_i));

////////////////////////////////////////////////////////////
// Instance    : GT Receive Data
// Description : 
////////////////////////////////////////////////////////////
  
mux #(
  .DATA_BITS  (DATA_BITS),
  .IP_NUM     (2),
  .USE_OP_REG (0))
  U_rx_data_mux(
  .clk        (clk_phy),
  .data_i     ({gt_rx_data_sr[39:8], gt_rx_data_sr[31:0]}),
  .sel_i      (rx_data_mux_sel),
  .data_o     (gt_rx_data));

////////////////////////////////////////////////////////////
// Instance    : GT Receive K/D
// Description : 
////////////////////////////////////////////////////////////
  
mux #(
  .DATA_BITS  (4),
  .IP_NUM     (2),
  .USE_OP_REG (0))
  U_rx_charisk_mux(
  .clk        (clk_phy),
  .data_i     ({gt_rx_k_sr[4:1], gt_rx_k_sr[3:0]}),
  .sel_i      (rx_data_mux_sel),
  .data_o     (gt_rx_charisk));
    
////////////////////////////////////////////////////////////
// Instance    : GT Receive Error
// Description : 
////////////////////////////////////////////////////////////

mux #(
  .DATA_BITS  (4),
  .IP_NUM     (2),
  .USE_OP_REG (0))
  U_rx_err_mux(
  .clk        (clk_phy),
  .data_i     ({gt_rx_err_sr[4:1], gt_rx_err_sr[3:0]}),
  .sel_i      (rx_data_mux_sel),
  .data_o     (gt_rx_err));

////////////////////////////////////////////////////////////
// Instance    : GT Transmit Data
// Description : 
////////////////////////////////////////////////////////////
  
mux #(
  .DATA_BITS  (16),
  .IP_NUM     (4),
  .USE_OP_REG (1))
  U_txdata_mux(
  .clk        (clk_phy),
  .data_i     ({lnk_tx_tdata[31:16], lnk_tx_tdata[15:0], gt_tx_data[31:16], gt_tx_data[15:0]}),
  .sel_i      ({6'd0, link_up, tx_data_mux_sel}),
  .data_o     (gt_tx_data_o));

////////////////////////////////////////////////////////////
// Instance    : GT Transmit K/D
// Description : 
////////////////////////////////////////////////////////////

mux #(
  .DATA_BITS  (2),
  .IP_NUM     (4),
  .USE_OP_REG (1))
  U_txcharisk_mux(
  .clk        (clk_phy),
  .data_i     ({lnk_tx_tuser[3:2], lnk_tx_tuser[1:0], gt_tx_charisk[3:2], gt_tx_charisk[1:0]}),
  .sel_i      ({6'd0, link_up, tx_data_mux_sel}),
  .data_o     (gt_tx_charisk_o));

////////////////////////////////////////////////////////////
// Instance    : SATA Spartan 6 PHY Control
// Description : 
////////////////////////////////////////////////////////////
  
generate 
  if (IS_HOST == 1) begin
    sata_phy_host_ctrl_x6series #(
      .SATA_REV          (SATA_REV))
      U_phy_host_ctrl_x6series(
      .clk_phy           (clk_phy),
      .rst_n		      		   (rst_n),
      .link_up_o         (link_up), 
      .gt_rst_done_i     (gt_rst_done_i),  
      .gt_tx_data_o      (gt_tx_data),		         
      .gt_tx_charisk_o   (gt_tx_charisk),  
      .gt_tx_com_strt_o  (gt_tx_com_strt_o),
      .gt_tx_com_type_o  (gt_tx_com_type_o),
      .gt_tx_elec_idle_o (gt_tx_elec_idle_o),     
      .gt_rx_data_i      (lnk_rx_tdata_o),                                                                  
      .gt_rx_status_i    (gt_rx_status_i),
      .gt_rx_elec_idle_i (gt_rx_elec_idle_i));
  end else begin
    sata_phy_dev_ctrl_x6series #(
      .SATA_REV          (SATA_REV))
      U_phy_dev_ctrl_x6series(
      .clk_phy           (clk_phy),
      .rst_n		      		   (rst_n),
      .link_up_o         (link_up), 
      .gt_rst_done_i     (gt_rst_done_i),  
      .gt_tx_data_o      (gt_tx_data),		         
      .gt_tx_charisk_o   (gt_tx_charisk),   
      .gt_tx_com_strt_o  (gt_tx_com_strt_o),
      .gt_tx_com_type_o  (gt_tx_com_type_o),
      .gt_tx_elec_idle_o (gt_tx_elec_idle_o),     
      .gt_rx_data_i      (lnk_rx_tdata_o),                                                                       
      .gt_rx_status_i    (gt_rx_status_i));
  end
endgenerate  

////////////////////////////////////////////////////////////
// Seq Block   : Receive Data Shift Register
// Description : 
////////////////////////////////////////////////////////////

always@(posedge clk_phy)
begin
  gt_rx_data_sr[47:32] <= gt_rx_data_i;
  gt_rx_data_sr[31:0]  <= gt_rx_data_sr[47:16];
end

////////////////////////////////////////////////////////////
// Seq Block   : Receive K Shift Register
// Description : 
////////////////////////////////////////////////////////////

always@(posedge clk_phy)
begin
  gt_rx_k_sr[5:4] <= gt_rx_charisk_i;
  gt_rx_k_sr[3:0] <= gt_rx_k_sr[5:2];
end

////////////////////////////////////////////////////////////
// Seq Block   : Receive Error Shift Register
// Description : 
////////////////////////////////////////////////////////////

always@(posedge clk_phy)
begin
  gt_rx_err_sr[4]   <= gt_rx_disp_err_i[0] | gt_rx_8b10b_err_i[0];
  gt_rx_err_sr[5]   <= gt_rx_disp_err_i[1] | gt_rx_8b10b_err_i[1];
  gt_rx_err_sr[3:0] <= gt_rx_err_sr[5:2];
end

////////////////////////////////////////////////////////////
// Seq Block   : Link Transmit Desrination Ready
// Description : 
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy)
begin
  if (rst_n == 0) begin
    lnk_tx_tready <= 0;
  end else begin
    if (lnk_tx_tready == 0) begin
      lnk_tx_tready <= 1;    
    end else begin
      lnk_tx_tready <= 0;    
    end      
  end   
end

////////////////////////////////////////////////////////////
// Comb Block  : Transmit Mux Data Select
// Description : Selects 16-bit data to send to the transceiver
//               from the 32-bit data on the mux input.
////////////////////////////////////////////////////////////

always @(*)
begin
  if ((lnk_tx_tvalid == 1) && (lnk_tx_tready == 1)) begin
    tx_data_mux_sel = 0;
  end else begin
    tx_data_mux_sel = 1;  
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : Receive Mux Data Select
// Description : Determines the location of the data in the 
//               GT receive data, and then sets the select.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy)
begin
  if (rst_n == 0) begin
    rx_data_mux_sel <= 0;
  end else begin
    // Test for the ALIGN primitive in bits 31:0
    if ((gt_rx_k_sr[3:0] == 4'b0001) && (gt_rx_data_sr[31:0] == `ALIGN_VAL)) begin
      rx_data_mux_sel <= 0;    
    end else begin  
      // Test for the ALIGN primitive in bits 39:8
      if ((gt_rx_k_sr[4:1] == 4'b0001) && (gt_rx_data_sr[39:8] == `ALIGN_VAL)) begin
        rx_data_mux_sel <= 1;    
      end
    end
  end   
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Receive Valid
// Description : Indicates when the data is valid. It is 
//               synchronised to the ALIGN primitive.
////////////////////////////////////////////////////////////

always @(negedge rst_n or posedge clk_phy)
begin 
  if (rst_n == 0) begin
    gt_rx_valid <= 0;
  end	else begin
    if ((gt_rx_charisk == 4'b0001) && (gt_rx_data == `ALIGN_VAL)) begin
      gt_rx_valid <= 1;
    end else begin
      if (gt_rx_valid == 1) begin
        gt_rx_valid <= 0;
      end else begin
        gt_rx_valid <= 1;
      end
    end      
  end
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Receive Data
// Description :
////////////////////////////////////////////////////////////

always @(posedge clk_phy)
begin    
  gt_rx_data_r <= gt_rx_data;
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Receive K/D
// Description :
////////////////////////////////////////////////////////////

always @(posedge clk_phy)
begin    
  gt_rx_charisk_r <= gt_rx_charisk;
end

////////////////////////////////////////////////////////////
// Seq Block   : GT Receive Error
// Description :
////////////////////////////////////////////////////////////

always @(posedge clk_phy)
begin    
  gt_rx_err_r <= gt_rx_err;
end

endmodule//////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version : 1.11
//  \   \         Application : Spartan-6 FPGA GTP Transceiver Wizard
//  /   /         Filename : sata_s6_sata1_gtp_tile.v
// /___/   /\      
// \   \  /  \ 
//  \___\/\___\ 
//
//
// Module sata_s6_sata1_gtp_tile (a GTPA1_DUAL Tile Wrapper)
// Generated by Xilinx Spartan-6 FPGA GTP Transceiver Wizard
// 
// 
// (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 


`timescale 1ns / 1ps


//***************************** Entity Declaration ****************************

module sata_s6_sata1_gtp_tile #
(
    // Simulation attributes
    parameter   TILE_SIM_GTPRESET_SPEEDUP  =   0,      // Set to 1 to speed up sim reset
    parameter   TILE_CLK25_DIVIDER_0       =   6,
    parameter   TILE_CLK25_DIVIDER_1       =   6,
    parameter   TILE_PLL_DIVSEL_FB_0       =   2,
    parameter   TILE_PLL_DIVSEL_FB_1       =   2,
    parameter   TILE_PLL_DIVSEL_REF_0      =   1,
    parameter   TILE_PLL_DIVSEL_REF_1      =   1,
    
    
    //
    parameter   TILE_PLL_SOURCE_0           = "PLL0",
    parameter   TILE_PLL_SOURCE_1           = "PLL1"
)
(
    //---------------------- Loopback and Powerdown Ports ----------------------
    input   [2:0]   LOOPBACK0_IN,
    input   [2:0]   LOOPBACK1_IN,
    //------------------------------- PLL Ports --------------------------------
    input           CLK00_IN,
    input           CLK01_IN,
    input           GTPRESET0_IN,
    input           GTPRESET1_IN,
    output          PLLLKDET0_OUT,
    output          PLLLKDET1_OUT,
    output          RESETDONE0_OUT,
    output          RESETDONE1_OUT,
    //--------------------- Receive Ports - 8b10b Decoder ----------------------
    output  [1:0]   RXCHARISCOMMA0_OUT,
    output  [1:0]   RXCHARISCOMMA1_OUT,
    output  [1:0]   RXCHARISK0_OUT,
    output  [1:0]   RXCHARISK1_OUT,
    output  [1:0]   RXDISPERR0_OUT,
    output  [1:0]   RXDISPERR1_OUT,
    output  [1:0]   RXNOTINTABLE0_OUT,
    output  [1:0]   RXNOTINTABLE1_OUT,
    //-------------------- Receive Ports - Clock Correction --------------------
    output  [2:0]   RXCLKCORCNT0_OUT,
    output  [2:0]   RXCLKCORCNT1_OUT,
    //------------- Receive Ports - Comma Detection and Alignment --------------
    output          RXBYTEISALIGNED0_OUT,
    output          RXBYTEISALIGNED1_OUT,
    input           RXENMCOMMAALIGN0_IN,
    input           RXENMCOMMAALIGN1_IN,
    input           RXENPCOMMAALIGN0_IN,
    input           RXENPCOMMAALIGN1_IN,
    //----------------- Receive Ports - RX Data Path interface -----------------
    output  [15:0]  RXDATA0_OUT,
    output  [15:0]  RXDATA1_OUT,
    output          RXRECCLK0_OUT,
    output          RXRECCLK1_OUT,
    input           RXRESET0_IN,
    input           RXRESET1_IN,
    input           RXUSRCLK0_IN,
    input           RXUSRCLK1_IN,
    input           RXUSRCLK20_IN,
    input           RXUSRCLK21_IN,
    //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    input           GATERXELECIDLE0_IN,
    input           GATERXELECIDLE1_IN,
    input           IGNORESIGDET0_IN,
    input           IGNORESIGDET1_IN,
    output          RXELECIDLE0_OUT,
    output          RXELECIDLE1_OUT,
    input   [1:0]   RXEQMIX0_IN,
    input   [1:0]   RXEQMIX1_IN,
    input           RXN0_IN,
    input           RXN1_IN,
    input           RXP0_IN,
    input           RXP1_IN,
    //--------- Receive Ports - RX Elastic Buffer and Phase Alignment ----------
    output  [2:0]   RXSTATUS0_OUT,
    output  [2:0]   RXSTATUS1_OUT,
    //-------------------------- TX/RX Datapath Ports --------------------------
    output  [1:0]   GTPCLKOUT0_OUT,
    output  [1:0]   GTPCLKOUT1_OUT,
    //----------------- Transmit Ports - 8b10b Encoder Control -----------------
    input   [1:0]   TXCHARISK0_IN,
    input   [1:0]   TXCHARISK1_IN,
    //---------------- Transmit Ports - TX Data Path interface -----------------
    input   [15:0]  TXDATA0_IN,
    input   [15:0]  TXDATA1_IN,
    output          TXOUTCLK0_OUT,
    output          TXOUTCLK1_OUT,
    input           TXRESET0_IN,
    input           TXRESET1_IN,
    input           TXUSRCLK0_IN,
    input           TXUSRCLK1_IN,
    input           TXUSRCLK20_IN,
    input           TXUSRCLK21_IN,
    //------------- Transmit Ports - TX Driver and OOB signalling --------------
    input   [3:0]   TXDIFFCTRL0_IN,
    input   [3:0]   TXDIFFCTRL1_IN,
    output          TXN0_OUT,
    output          TXN1_OUT,
    output          TXP0_OUT,
    output          TXP1_OUT,
    input   [2:0]   TXPREEMPHASIS0_IN,
    input   [2:0]   TXPREEMPHASIS1_IN,
    //--------------- Transmit Ports - TX Ports for PCI Express ----------------
    input           TXELECIDLE0_IN,
    input           TXELECIDLE1_IN,
    //------------------- Transmit Ports - TX Ports for SATA -------------------
    input           TXCOMSTART0_IN,
    input           TXCOMSTART1_IN,
    input           TXCOMTYPE0_IN,
    input           TXCOMTYPE1_IN


);



//***************************** Wire Declarations *****************************

    // ground and vcc signals
    wire            tied_to_ground_i;
    wire    [63:0]  tied_to_ground_vec_i;
    wire            tied_to_vcc_i;
    wire    [63:0]  tied_to_vcc_vec_i;


   

    //RX Datapath signals
    wire    [31:0]  rxdata0_i;       
    wire    [1:0]   rxchariscomma0_float_i;
    wire    [1:0]   rxcharisk0_float_i;
    wire    [1:0]   rxdisperr0_float_i;
    wire    [1:0]   rxnotintable0_float_i;
    wire    [1:0]   rxrundisp0_float_i;

    //TX Datapath signals
    wire    [31:0]  txdata0_i;           
    wire    [1:0]   txkerr0_float_i;
    wire    [1:0]   txrundisp0_float_i;

   

    //RX Datapath signals
    wire    [31:0]  rxdata1_i;       
    wire    [1:0]   rxchariscomma1_float_i;
    wire    [1:0]   rxcharisk1_float_i;
    wire    [1:0]   rxdisperr1_float_i;
    wire    [1:0]   rxnotintable1_float_i;
    wire    [1:0]   rxrundisp1_float_i;

    //TX Datapath signals
    wire    [31:0]  txdata1_i;           
    wire    [1:0]   txkerr1_float_i;
    wire    [1:0]   txrundisp1_float_i;




// 
//********************************* Main Body of Code**************************
                       
    //-------------------------  Static signal Assigments ---------------------   

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;
                                            

    //-------------------  GTP Datapath byte mapping  -----------------
    
    
    assign  RXDATA0_OUT    =   rxdata0_i[15:0];

    // The GTP transmits little endian data (TXDATA[7:0] transmitted first)     
    assign  txdata0_i    =   {tied_to_ground_vec_i[15:0],TXDATA0_IN};
    
    assign  RXDATA1_OUT    =   rxdata1_i[15:0];

    // The GTP transmits little endian data (TXDATA[7:0] transmitted first)     
    assign  txdata1_i    =   {tied_to_ground_vec_i[15:0],TXDATA1_IN};






    
    //------------------------ GTPA1_DUAL Instantiations  -------------------------   

    GTPA1_DUAL # 
    (
        //_______________________ Simulation-Only Attributes __________________

    
        .SIM_TX_ELEC_IDLE_LEVEL         ("Z"),
        .SIM_RECEIVER_DETECT_PASS       ("TRUE"),
        .SIM_VERSION                    ("2.0"),
 
        .SIM_REFCLK0_SOURCE             (3'b000),
        .SIM_REFCLK1_SOURCE             (3'b000),
 
        .SIM_GTPRESET_SPEEDUP           (TILE_SIM_GTPRESET_SPEEDUP),
        .CLK25_DIVIDER_0                (TILE_CLK25_DIVIDER_0),
        .CLK25_DIVIDER_1                (TILE_CLK25_DIVIDER_1),
        .PLL_DIVSEL_FB_0                (TILE_PLL_DIVSEL_FB_0), 
        .PLL_DIVSEL_FB_1                (TILE_PLL_DIVSEL_FB_1),  
        .PLL_DIVSEL_REF_0               (TILE_PLL_DIVSEL_REF_0), 
        .PLL_DIVSEL_REF_1               (TILE_PLL_DIVSEL_REF_1),
 
         
        

       //PLL Attributes
        .CLKINDC_B_0                            ("TRUE"),
        .CLKRCV_TRST_0                          ("TRUE"),
        .OOB_CLK_DIVIDER_0                      (6),
        .PLL_COM_CFG_0                          (24'h21680a),
        .PLL_CP_CFG_0                           (8'h00),
        .PLL_RXDIVSEL_OUT_0                     (2),
        .PLL_SATA_0                             ("FALSE"),
        .PLL_SOURCE_0                           (TILE_PLL_SOURCE_0),
        .PLL_TXDIVSEL_OUT_0                     (2),
        .PLLLKDET_CFG_0                         (3'b111),

       //
        .CLKINDC_B_1                            ("TRUE"),
        .CLKRCV_TRST_1                          ("TRUE"),
        .OOB_CLK_DIVIDER_1                      (6),
        .PLL_COM_CFG_1                          (24'h21680a),
        .PLL_CP_CFG_1                           (8'h00),
        .PLL_RXDIVSEL_OUT_1                     (2),
        .PLL_SATA_1                             ("FALSE"),
        .PLL_SOURCE_1                           (TILE_PLL_SOURCE_1),
        .PLL_TXDIVSEL_OUT_1                     (2),
        .PLLLKDET_CFG_1                         (3'b111),
        .PMA_COM_CFG_EAST                       (36'h000008000),
        .PMA_COM_CFG_WEST                       (36'h00000a000),
        .TST_ATTR_0                             (32'h00000000),
        .TST_ATTR_1                             (32'h00000000),

       //TX Interface Attributes
        .CLK_OUT_GTP_SEL_0                      ("TXOUTCLK0"),
        .TX_TDCC_CFG_0                          (2'b00),
        .CLK_OUT_GTP_SEL_1                      ("TXOUTCLK1"),
        .TX_TDCC_CFG_1                          (2'b00),

       //TX Buffer and Phase Alignment Attributes
        .PMA_TX_CFG_0                           (20'h00082),
        .TX_BUFFER_USE_0                        ("TRUE"),
        .TX_XCLK_SEL_0                          ("TXOUT"),
        .TXRX_INVERT_0                          (3'b011),
        .PMA_TX_CFG_1                           (20'h00082),
        .TX_BUFFER_USE_1                        ("TRUE"),
        .TX_XCLK_SEL_1                          ("TXOUT"),
        .TXRX_INVERT_1                          (3'b011),

       //TX Driver and OOB signalling Attributes
        .CM_TRIM_0                              (2'b00),
        .TX_IDLE_DELAY_0                        (3'b011),
        .CM_TRIM_1                              (2'b00),
        .TX_IDLE_DELAY_1                        (3'b011),

       //TX PIPE/SATA Attributes
        .COM_BURST_VAL_0                        (4'b1111),
        .COM_BURST_VAL_1                        (4'b1111),

       //RX Driver,OOB signalling,Coupling and Eq,CDR Attributes
        .AC_CAP_DIS_0                           ("TRUE"),
        .OOBDETECT_THRESHOLD_0                  (3'b110),
        .PMA_CDR_SCAN_0                         (27'h6404040),
        .PMA_RX_CFG_0                           (25'h05ce049),
        .PMA_RXSYNC_CFG_0                       (7'h00),
        .RCV_TERM_GND_0                         ("FALSE"),
        .RCV_TERM_VTTRX_0                       ("FALSE"),
        .RXEQ_CFG_0                             (8'b01111011),
        .TERMINATION_CTRL_0                     (5'b10100),
        .TERMINATION_OVRD_0                     ("FALSE"),
        .TX_DETECT_RX_CFG_0                     (14'h1832),
        .AC_CAP_DIS_1                           ("TRUE"),
        .OOBDETECT_THRESHOLD_1                  (3'b110),
        .PMA_CDR_SCAN_1                         (27'h6404040),
        .PMA_RX_CFG_1                           (25'h05ce049),
        .PMA_RXSYNC_CFG_1                       (7'h00),
        .RCV_TERM_GND_1                         ("FALSE"),
        .RCV_TERM_VTTRX_1                       ("FALSE"),
        .RXEQ_CFG_1                             (8'b01111011),
        .TERMINATION_CTRL_1                     (5'b10100),
        .TERMINATION_OVRD_1                     ("FALSE"),
        .TX_DETECT_RX_CFG_1                     (14'h1832),

       //PRBS Detection Attributes
        .RXPRBSERR_LOOPBACK_0                   (1'b0),
        .RXPRBSERR_LOOPBACK_1                   (1'b0),

       //Comma Detection and Alignment Attributes
        .ALIGN_COMMA_WORD_0                     (2),
        .COMMA_10B_ENABLE_0                     (10'b1111111111),
        .DEC_MCOMMA_DETECT_0                    ("TRUE"),
        .DEC_PCOMMA_DETECT_0                    ("TRUE"),
        .DEC_VALID_COMMA_ONLY_0                 ("FALSE"),
        .MCOMMA_10B_VALUE_0                     (10'b1010000011),
        .MCOMMA_DETECT_0                        ("TRUE"),
        .PCOMMA_10B_VALUE_0                     (10'b0101111100),
        .PCOMMA_DETECT_0                        ("TRUE"),
        .RX_SLIDE_MODE_0                        ("PCS"),
        .ALIGN_COMMA_WORD_1                     (2),
        .COMMA_10B_ENABLE_1                     (10'b1111111111),
        .DEC_MCOMMA_DETECT_1                    ("TRUE"),
        .DEC_PCOMMA_DETECT_1                    ("TRUE"),
        .DEC_VALID_COMMA_ONLY_1                 ("FALSE"),
        .MCOMMA_10B_VALUE_1                     (10'b1010000011),
        .MCOMMA_DETECT_1                        ("TRUE"),
        .PCOMMA_10B_VALUE_1                     (10'b0101111100),
        .PCOMMA_DETECT_1                        ("TRUE"),
        .RX_SLIDE_MODE_1                        ("PCS"),

       //RX Loss-of-sync State Machine Attributes
        .RX_LOS_INVALID_INCR_0                  (8),
        .RX_LOS_THRESHOLD_0                     (128),
        .RX_LOSS_OF_SYNC_FSM_0                  ("FALSE"),
        .RX_LOS_INVALID_INCR_1                  (8),
        .RX_LOS_THRESHOLD_1                     (128),
        .RX_LOSS_OF_SYNC_FSM_1                  ("FALSE"),

       //RX Elastic Buffer and Phase alignment Attributes
        .RX_BUFFER_USE_0                        ("TRUE"),
        .RX_EN_IDLE_RESET_BUF_0                 ("TRUE"),
        .RX_IDLE_HI_CNT_0                       (4'b1000),
        .RX_IDLE_LO_CNT_0                       (4'b0000),
        .RX_XCLK_SEL_0                          ("RXREC"),
        .RX_BUFFER_USE_1                        ("TRUE"),
        .RX_EN_IDLE_RESET_BUF_1                 ("TRUE"),
        .RX_IDLE_HI_CNT_1                       (4'b1000),
        .RX_IDLE_LO_CNT_1                       (4'b0000),
        .RX_XCLK_SEL_1                          ("RXREC"),

       //Clock Correction Attributes
        .CLK_COR_ADJ_LEN_0                      (4),
        .CLK_COR_DET_LEN_0                      (4),
        .CLK_COR_INSERT_IDLE_FLAG_0             ("FALSE"),
        .CLK_COR_KEEP_IDLE_0                    ("FALSE"),
        .CLK_COR_MAX_LAT_0                      (18),
        .CLK_COR_MIN_LAT_0                      (16),
        .CLK_COR_PRECEDENCE_0                   ("TRUE"),
        .CLK_COR_REPEAT_WAIT_0                  (0),
        .CLK_COR_SEQ_1_1_0                      (10'b0110111100),
        .CLK_COR_SEQ_1_2_0                      (10'b0001001010),
        .CLK_COR_SEQ_1_3_0                      (10'b0001001010),
        .CLK_COR_SEQ_1_4_0                      (10'b0001111011),
        .CLK_COR_SEQ_1_ENABLE_0                 (4'b1111),
        .CLK_COR_SEQ_2_1_0                      (10'b0100000000),
        .CLK_COR_SEQ_2_2_0                      (10'b0000000000),
        .CLK_COR_SEQ_2_3_0                      (10'b0000000000),
        .CLK_COR_SEQ_2_4_0                      (10'b0000000000),
        .CLK_COR_SEQ_2_ENABLE_0                 (4'b0000),
        .CLK_COR_SEQ_2_USE_0                    ("FALSE"),
        .CLK_CORRECT_USE_0                      ("TRUE"),
        .RX_DECODE_SEQ_MATCH_0                  ("TRUE"),
        .CLK_COR_ADJ_LEN_1                      (4),
        .CLK_COR_DET_LEN_1                      (4),
        .CLK_COR_INSERT_IDLE_FLAG_1             ("FALSE"),
        .CLK_COR_KEEP_IDLE_1                    ("FALSE"),
        .CLK_COR_MAX_LAT_1                      (18),
        .CLK_COR_MIN_LAT_1                      (16),
        .CLK_COR_PRECEDENCE_1                   ("TRUE"),
        .CLK_COR_REPEAT_WAIT_1                  (0),
        .CLK_COR_SEQ_1_1_1                      (10'b0110111100),
        .CLK_COR_SEQ_1_2_1                      (10'b0001001010),
        .CLK_COR_SEQ_1_3_1                      (10'b0001001010),
        .CLK_COR_SEQ_1_4_1                      (10'b0001111011),
        .CLK_COR_SEQ_1_ENABLE_1                 (4'b1111),
        .CLK_COR_SEQ_2_1_1                      (10'b0100000000),
        .CLK_COR_SEQ_2_2_1                      (10'b0000000000),
        .CLK_COR_SEQ_2_3_1                      (10'b0000000000),
        .CLK_COR_SEQ_2_4_1                      (10'b0000000000),
        .CLK_COR_SEQ_2_ENABLE_1                 (4'b0000),
        .CLK_COR_SEQ_2_USE_1                    ("FALSE"),
        .CLK_CORRECT_USE_1                      ("TRUE"),
        .RX_DECODE_SEQ_MATCH_1                  ("TRUE"),

       //Channel Bonding Attributes
        .CHAN_BOND_1_MAX_SKEW_0                 (1),
        .CHAN_BOND_2_MAX_SKEW_0                 (1),
        .CHAN_BOND_KEEP_ALIGN_0                 ("FALSE"),
        .CHAN_BOND_SEQ_1_1_0                    (10'b0000000000),
        .CHAN_BOND_SEQ_1_2_0                    (10'b0000000000),
        .CHAN_BOND_SEQ_1_3_0                    (10'b0000000000),
        .CHAN_BOND_SEQ_1_4_0                    (10'b0000000000),
        .CHAN_BOND_SEQ_1_ENABLE_0               (4'b0000),
        .CHAN_BOND_SEQ_2_1_0                    (10'b0000000000),
        .CHAN_BOND_SEQ_2_2_0                    (10'b0000000000),
        .CHAN_BOND_SEQ_2_3_0                    (10'b0000000000),
        .CHAN_BOND_SEQ_2_4_0                    (10'b0000000000),
        .CHAN_BOND_SEQ_2_ENABLE_0               (4'b0000),
        .CHAN_BOND_SEQ_2_USE_0                  ("FALSE"),
        .CHAN_BOND_SEQ_LEN_0                    (1),
        .RX_EN_MODE_RESET_BUF_0                 ("TRUE"),
        .CHAN_BOND_1_MAX_SKEW_1                 (1),
        .CHAN_BOND_2_MAX_SKEW_1                 (1),
        .CHAN_BOND_KEEP_ALIGN_1                 ("FALSE"),
        .CHAN_BOND_SEQ_1_1_1                    (10'b0000000000),
        .CHAN_BOND_SEQ_1_2_1                    (10'b0000000000),
        .CHAN_BOND_SEQ_1_3_1                    (10'b0000000000),
        .CHAN_BOND_SEQ_1_4_1                    (10'b0000000000),
        .CHAN_BOND_SEQ_1_ENABLE_1               (4'b0000),
        .CHAN_BOND_SEQ_2_1_1                    (10'b0000000000),
        .CHAN_BOND_SEQ_2_2_1                    (10'b0000000000),
        .CHAN_BOND_SEQ_2_3_1                    (10'b0000000000),
        .CHAN_BOND_SEQ_2_4_1                    (10'b0000000000),
        .CHAN_BOND_SEQ_2_ENABLE_1               (4'b0000),
        .CHAN_BOND_SEQ_2_USE_1                  ("FALSE"),
        .CHAN_BOND_SEQ_LEN_1                    (1),
        .RX_EN_MODE_RESET_BUF_1                 ("TRUE"),

       //RX PCI Express Attributes
        .CB2_INH_CC_PERIOD_0                    (8),
        .CDR_PH_ADJ_TIME_0                      (5'b01010),
        .PCI_EXPRESS_MODE_0                     ("FALSE"),
        .RX_EN_IDLE_HOLD_CDR_0                  ("FALSE"),
        .RX_EN_IDLE_RESET_FR_0                  ("TRUE"),
        .RX_EN_IDLE_RESET_PH_0                  ("TRUE"),
        .RX_STATUS_FMT_0                        ("SATA"),
        .TRANS_TIME_FROM_P2_0                   (12'h03c),
        .TRANS_TIME_NON_P2_0                    (8'h19),
        .TRANS_TIME_TO_P2_0                     (10'h064),
        .CB2_INH_CC_PERIOD_1                    (8),
        .CDR_PH_ADJ_TIME_1                      (5'b01010),
        .PCI_EXPRESS_MODE_1                     ("FALSE"),
        .RX_EN_IDLE_HOLD_CDR_1                  ("FALSE"),
        .RX_EN_IDLE_RESET_FR_1                  ("TRUE"),
        .RX_EN_IDLE_RESET_PH_1                  ("TRUE"),
        .RX_STATUS_FMT_1                        ("SATA"),
        .TRANS_TIME_FROM_P2_1                   (12'h03c),
        .TRANS_TIME_NON_P2_1                    (8'h19),
        .TRANS_TIME_TO_P2_1                     (10'h064),

       //RX SATA Attributes
        .SATA_BURST_VAL_0                       (3'b100),
        .SATA_IDLE_VAL_0                        (3'b100),
        .SATA_MAX_BURST_0                       (7),
        .SATA_MAX_INIT_0                        (22),
        .SATA_MAX_WAKE_0                        (7),
        .SATA_MIN_BURST_0                       (4),
        .SATA_MIN_INIT_0                        (12),
        .SATA_MIN_WAKE_0                        (4),
        .SATA_BURST_VAL_1                       (3'b100),
        .SATA_IDLE_VAL_1                        (3'b100),
        .SATA_MAX_BURST_1                       (7),
        .SATA_MAX_INIT_1                        (22),
        .SATA_MAX_WAKE_1                        (7),
        .SATA_MIN_BURST_1                       (4),
        .SATA_MIN_INIT_1                        (12),
        .SATA_MIN_WAKE_1                        (4)


     ) 
     gtpa1_dual_i 
     (



        //---------------------- Loopback and Powerdown Ports ----------------------
        .LOOPBACK0                      (LOOPBACK0_IN),
        .LOOPBACK1                      (LOOPBACK1_IN),
        .RXPOWERDOWN0                   (tied_to_ground_vec_i[1:0]),
        .RXPOWERDOWN1                   (tied_to_ground_vec_i[1:0]),
        .TXPOWERDOWN0                   (tied_to_ground_vec_i[1:0]),
        .TXPOWERDOWN1                   (tied_to_ground_vec_i[1:0]),
        //------------------------------- PLL Ports --------------------------------
        .CLK00                          (CLK00_IN),
        .CLK01                          (CLK01_IN),
        .CLK10                          (tied_to_ground_i),
        .CLK11                          (tied_to_ground_i),
        .CLKINEAST0                     (tied_to_ground_i),
        .CLKINEAST1                     (tied_to_ground_i),
        .CLKINWEST0                     (tied_to_ground_i),
        .CLKINWEST1                     (tied_to_ground_i),
        .GCLK00                         (tied_to_ground_i),
        .GCLK01                         (tied_to_ground_i),
        .GCLK10                         (tied_to_ground_i),
        .GCLK11                         (tied_to_ground_i),
        .GTPRESET0                      (GTPRESET0_IN),
        .GTPRESET1                      (GTPRESET1_IN),
        .GTPTEST0                       (8'b00010000),
        .GTPTEST1                       (8'b00010000),
        .INTDATAWIDTH0                  (tied_to_vcc_i),
        .INTDATAWIDTH1                  (tied_to_vcc_i),
        .PLLCLK00                       (tied_to_ground_i),
        .PLLCLK01                       (tied_to_ground_i),
        .PLLCLK10                       (tied_to_ground_i),
        .PLLCLK11                       (tied_to_ground_i),
        .PLLLKDET0                      (PLLLKDET0_OUT),
        .PLLLKDET1                      (PLLLKDET1_OUT),
        .PLLLKDETEN0                    (tied_to_vcc_i),
        .PLLLKDETEN1                    (tied_to_vcc_i),
        .PLLPOWERDOWN0                  (tied_to_ground_i),
        .PLLPOWERDOWN1                  (tied_to_ground_i),
        .REFCLKOUT0                     (),
        .REFCLKOUT1                     (),
        .REFCLKPLL0                     (),
        .REFCLKPLL1                     (),
        .REFCLKPWRDNB0                  (tied_to_vcc_i),
        .REFCLKPWRDNB1                  (tied_to_vcc_i),
        .REFSELDYPLL0                   (tied_to_ground_vec_i[2:0]),
        .REFSELDYPLL1                   (tied_to_ground_vec_i[2:0]),
        .RESETDONE0                     (RESETDONE0_OUT),
        .RESETDONE1                     (RESETDONE1_OUT),
        .TSTCLK0                        (tied_to_ground_i),
        .TSTCLK1                        (tied_to_ground_i),
        .TSTIN0                         (tied_to_ground_vec_i[11:0]),
        .TSTIN1                         (tied_to_ground_vec_i[11:0]),
        .TSTOUT0                        (),
        .TSTOUT1                        (),
        //--------------------- Receive Ports - 8b10b Decoder ----------------------
        .RXCHARISCOMMA0                 ({rxchariscomma0_float_i,RXCHARISCOMMA0_OUT}),
        .RXCHARISCOMMA1                 ({rxchariscomma1_float_i,RXCHARISCOMMA1_OUT}),
        .RXCHARISK0                     ({rxcharisk0_float_i,RXCHARISK0_OUT}),
        .RXCHARISK1                     ({rxcharisk1_float_i,RXCHARISK1_OUT}),
        .RXDEC8B10BUSE0                 (tied_to_vcc_i),
        .RXDEC8B10BUSE1                 (tied_to_vcc_i),
        .RXDISPERR0                     ({rxdisperr0_float_i,RXDISPERR0_OUT}),
        .RXDISPERR1                     ({rxdisperr1_float_i,RXDISPERR1_OUT}),
        .RXNOTINTABLE0                  ({rxnotintable0_float_i,RXNOTINTABLE0_OUT}),
        .RXNOTINTABLE1                  ({rxnotintable1_float_i,RXNOTINTABLE1_OUT}),
        .RXRUNDISP0                     (),
        .RXRUNDISP1                     (),
        .USRCODEERR0                    (tied_to_ground_i),
        .USRCODEERR1                    (tied_to_ground_i),
        //-------------------- Receive Ports - Channel Bonding ---------------------
        .RXCHANBONDSEQ0                 (),
        .RXCHANBONDSEQ1                 (),
        .RXCHANISALIGNED0               (),
        .RXCHANISALIGNED1               (),
        .RXCHANREALIGN0                 (),
        .RXCHANREALIGN1                 (),
        .RXCHBONDI                      (tied_to_ground_vec_i[2:0]),
        .RXCHBONDMASTER0                (tied_to_ground_i),
        .RXCHBONDMASTER1                (tied_to_ground_i),
        .RXCHBONDO                      (),
        .RXCHBONDSLAVE0                 (tied_to_ground_i),
        .RXCHBONDSLAVE1                 (tied_to_ground_i),
        .RXENCHANSYNC0                  (tied_to_ground_i),
        .RXENCHANSYNC1                  (tied_to_ground_i),
        //-------------------- Receive Ports - Clock Correction --------------------
        .RXCLKCORCNT0                   (RXCLKCORCNT0_OUT),
        .RXCLKCORCNT1                   (RXCLKCORCNT1_OUT),
        //------------- Receive Ports - Comma Detection and Alignment --------------
        .RXBYTEISALIGNED0               (RXBYTEISALIGNED0_OUT),
        .RXBYTEISALIGNED1               (RXBYTEISALIGNED1_OUT),
        .RXBYTEREALIGN0                 (),
        .RXBYTEREALIGN1                 (),
        .RXCOMMADET0                    (),
        .RXCOMMADET1                    (),
        .RXCOMMADETUSE0                 (tied_to_vcc_i),
        .RXCOMMADETUSE1                 (tied_to_vcc_i),
        .RXENMCOMMAALIGN0               (RXENMCOMMAALIGN0_IN),
        .RXENMCOMMAALIGN1               (RXENMCOMMAALIGN1_IN),
        .RXENPCOMMAALIGN0               (RXENPCOMMAALIGN0_IN),
        .RXENPCOMMAALIGN1               (RXENPCOMMAALIGN1_IN),
        .RXSLIDE0                       (tied_to_ground_i),
        .RXSLIDE1                       (tied_to_ground_i),
        //--------------------- Receive Ports - PRBS Detection ---------------------
        .PRBSCNTRESET0                  (tied_to_ground_i),
        .PRBSCNTRESET1                  (tied_to_ground_i),
        .RXENPRBSTST0                   (tied_to_ground_vec_i[2:0]),
        .RXENPRBSTST1                   (tied_to_ground_vec_i[2:0]),
        .RXPRBSERR0                     (),
        .RXPRBSERR1                     (),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .RXDATA0                        (rxdata0_i),
        .RXDATA1                        (rxdata1_i),
        .RXDATAWIDTH0                   (2'b01),
        .RXDATAWIDTH1                   (2'b01),
        .RXRECCLK0                      (RXRECCLK0_OUT),
        .RXRECCLK1                      (RXRECCLK1_OUT),
        .RXRESET0                       (RXRESET0_IN),
        .RXRESET1                       (RXRESET1_IN),
        .RXUSRCLK0                      (RXUSRCLK0_IN),
        .RXUSRCLK1                      (RXUSRCLK1_IN),
        .RXUSRCLK20                     (RXUSRCLK20_IN),
        .RXUSRCLK21                     (RXUSRCLK21_IN),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .GATERXELECIDLE0                (GATERXELECIDLE0_IN),
        .GATERXELECIDLE1                (GATERXELECIDLE1_IN),
        .IGNORESIGDET0                  (IGNORESIGDET0_IN),
        .IGNORESIGDET1                  (IGNORESIGDET1_IN),
        .RCALINEAST                     (tied_to_ground_vec_i[4:0]),
        .RCALINWEST                     (tied_to_ground_vec_i[4:0]),
        .RCALOUTEAST                    (),
        .RCALOUTWEST                    (),
        .RXCDRRESET0                    (tied_to_ground_i),
        .RXCDRRESET1                    (tied_to_ground_i),
        .RXELECIDLE0                    (RXELECIDLE0_OUT),
        .RXELECIDLE1                    (RXELECIDLE1_OUT),
        .RXEQMIX0                       (RXEQMIX0_IN),
        .RXEQMIX1                       (RXEQMIX1_IN),
        .RXN0                           (RXN0_IN),
        .RXN1                           (RXN1_IN),
        .RXP0                           (RXP0_IN),
        .RXP1                           (RXP1_IN),
        //--------- Receive Ports - RX Elastic Buffer and Phase Alignment ----------
        .RXBUFRESET0                    (tied_to_ground_i),
        .RXBUFRESET1                    (tied_to_ground_i),
        .RXBUFSTATUS0                   (),
        .RXBUFSTATUS1                   (),
        .RXENPMAPHASEALIGN0             (tied_to_ground_i),
        .RXENPMAPHASEALIGN1             (tied_to_ground_i),
        .RXPMASETPHASE0                 (tied_to_ground_i),
        .RXPMASETPHASE1                 (tied_to_ground_i),
        .RXSTATUS0                      (RXSTATUS0_OUT),
        .RXSTATUS1                      (RXSTATUS1_OUT),
        //------------- Receive Ports - RX Loss-of-sync State Machine --------------
        .RXLOSSOFSYNC0                  (),
        .RXLOSSOFSYNC1                  (),
        //------------ Receive Ports - RX Pipe Control for PCI Express -------------
        .PHYSTATUS0                     (),
        .PHYSTATUS1                     (),
        .RXVALID0                       (),
        .RXVALID1                       (),
        //------------------ Receive Ports - RX Polarity Control -------------------
        .RXPOLARITY0                    (tied_to_ground_i),
        .RXPOLARITY1                    (tied_to_ground_i),
        //----------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
        .DADDR                          (tied_to_ground_vec_i[7:0]),
        .DCLK                           (tied_to_ground_i),
        .DEN                            (tied_to_ground_i),
        .DI                             (tied_to_ground_vec_i[15:0]),
        .DRDY                           (),
        .DRPDO                          (),
        .DWE                            (tied_to_ground_i),
        //-------------------------- TX/RX Datapath Ports --------------------------
        .GTPCLKFBEAST                   (),
        .GTPCLKFBSEL0EAST               (2'b10),
        .GTPCLKFBSEL0WEST               (2'b00),
        .GTPCLKFBSEL1EAST               (2'b11),
        .GTPCLKFBSEL1WEST               (2'b01),
        .GTPCLKFBWEST                   (),
        .GTPCLKOUT0                     (GTPCLKOUT0_OUT),
        .GTPCLKOUT1                     (GTPCLKOUT1_OUT),
        //----------------- Transmit Ports - 8b10b Encoder Control -----------------
        .TXBYPASS8B10B0                 (tied_to_ground_vec_i[3:0]),
        .TXBYPASS8B10B1                 (tied_to_ground_vec_i[3:0]),
        .TXCHARDISPMODE0                (tied_to_ground_vec_i[3:0]),
        .TXCHARDISPMODE1                (tied_to_ground_vec_i[3:0]),
        .TXCHARDISPVAL0                 (tied_to_ground_vec_i[3:0]),
        .TXCHARDISPVAL1                 (tied_to_ground_vec_i[3:0]),
        .TXCHARISK0                     ({tied_to_ground_vec_i[1:0],TXCHARISK0_IN}),
        .TXCHARISK1                     ({tied_to_ground_vec_i[1:0],TXCHARISK1_IN}),
        .TXENC8B10BUSE0                 (tied_to_vcc_i),
        .TXENC8B10BUSE1                 (tied_to_vcc_i),
        .TXKERR0                        (),
        .TXKERR1                        (),
        .TXRUNDISP0                     (),
        .TXRUNDISP1                     (),
        //------------- Transmit Ports - TX Buffer and Phase Alignment -------------
        .TXBUFSTATUS0                   (),
        .TXBUFSTATUS1                   (),
        .TXENPMAPHASEALIGN0             (tied_to_ground_i),
        .TXENPMAPHASEALIGN1             (tied_to_ground_i),
        .TXPMASETPHASE0                 (tied_to_ground_i),
        .TXPMASETPHASE1                 (tied_to_ground_i),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .TXDATA0                        (txdata0_i),
        .TXDATA1                        (txdata1_i),
        .TXDATAWIDTH0                   (2'b01),
        .TXDATAWIDTH1                   (2'b01),
        .TXOUTCLK0                      (TXOUTCLK0_OUT),
        .TXOUTCLK1                      (TXOUTCLK1_OUT),
        .TXRESET0                       (TXRESET0_IN),
        .TXRESET1                       (TXRESET1_IN),
        .TXUSRCLK0                      (TXUSRCLK0_IN),
        .TXUSRCLK1                      (TXUSRCLK1_IN),
        .TXUSRCLK20                     (TXUSRCLK20_IN),
        .TXUSRCLK21                     (TXUSRCLK21_IN),
        //------------- Transmit Ports - TX Driver and OOB signalling --------------
        .TXBUFDIFFCTRL0                 (3'b101),
        .TXBUFDIFFCTRL1                 (3'b101),
        .TXDIFFCTRL0                    (TXDIFFCTRL0_IN),
        .TXDIFFCTRL1                    (TXDIFFCTRL1_IN),
        .TXINHIBIT0                     (tied_to_ground_i),
        .TXINHIBIT1                     (tied_to_ground_i),
        .TXN0                           (TXN0_OUT),
        .TXN1                           (TXN1_OUT),
        .TXP0                           (TXP0_OUT),
        .TXP1                           (TXP1_OUT),
        .TXPREEMPHASIS0                 (TXPREEMPHASIS0_IN),
        .TXPREEMPHASIS1                 (TXPREEMPHASIS1_IN),
        //------------------- Transmit Ports - TX PRBS Generator -------------------
        .TXENPRBSTST0                   (tied_to_ground_vec_i[2:0]),
        .TXENPRBSTST1                   (tied_to_ground_vec_i[2:0]),
        .TXPRBSFORCEERR0                (tied_to_ground_i),
        .TXPRBSFORCEERR1                (tied_to_ground_i),
        //------------------ Transmit Ports - TX Polarity Control ------------------
        .TXPOLARITY0                    (tied_to_ground_i),
        .TXPOLARITY1                    (tied_to_ground_i),
        //--------------- Transmit Ports - TX Ports for PCI Express ----------------
        .TXDETECTRX0                    (tied_to_ground_i),
        .TXDETECTRX1                    (tied_to_ground_i),
        .TXELECIDLE0                    (TXELECIDLE0_IN),
        .TXELECIDLE1                    (TXELECIDLE1_IN),
        .TXPDOWNASYNCH0                 (tied_to_ground_i),
        .TXPDOWNASYNCH1                 (tied_to_ground_i),
        //------------------- Transmit Ports - TX Ports for SATA -------------------
        .TXCOMSTART0                    (TXCOMSTART0_IN),
        .TXCOMSTART1                    (TXCOMSTART1_IN),
        .TXCOMTYPE0                     (TXCOMTYPE0_IN),
        .TXCOMTYPE1                     (TXCOMTYPE1_IN)

     );
     
endmodule

///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version : 1.11
//  \   \         Application : Spartan-6 FPGA GTP Transceiver Wizard
//  /   /         Filename : sata_s6_sata1_gtp.v
// /___/   /\      
// \   \  /  \ 
//  \___\/\___\
//
//
// Module sata_s6_sata1_gtp (a GTP Wrapper)
// Generated by Xilinx Spartan-6 FPGA GTP Transceiver Wizard
// 
// 
// (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 



`timescale 1ns / 1ps


//***************************** Entity Declaration ****************************
(* CORE_GENERATION_INFO = "sata_s6_sata1_gtp,s6_gtpwizard_v1_11,{gtp0_protocol_file=sata,gtp1_protocol_file=Use_GTP0_settings}" *)
module sata_s6_sata1_gtp #
(
    // Simulation attributes
    parameter   WRAPPER_SIM_GTPRESET_SPEEDUP    = 0,    // Set to 1 to speed up sim reset
    parameter   WRAPPER_CLK25_DIVIDER_0         = 6,
    parameter   WRAPPER_CLK25_DIVIDER_1         = 6,
    parameter   WRAPPER_PLL_DIVSEL_FB_0         = 2,
    parameter   WRAPPER_PLL_DIVSEL_FB_1         = 2,
    parameter   WRAPPER_PLL_DIVSEL_REF_0        = 1,
    parameter   WRAPPER_PLL_DIVSEL_REF_1        = 1,
    
 
    parameter   WRAPPER_SIMULATION              = 0     // Set to 1 for simulation
)
(
    
    //_________________________________________________________________________
    //_________________________________________________________________________
    //TILE0  (X0_Y0)

 
    //---------------------- Loopback and Powerdown Ports ----------------------
    input   [2:0]   TILE0_LOOPBACK0_IN,
    input   [2:0]   TILE0_LOOPBACK1_IN,
    //------------------------------- PLL Ports --------------------------------
    input           TILE0_CLK00_IN,
    input           TILE0_CLK01_IN,
    input           TILE0_GTPRESET0_IN,
    input           TILE0_GTPRESET1_IN,
    output          TILE0_PLLLKDET0_OUT,
    output          TILE0_RESETDONE0_OUT,
    output          TILE0_RESETDONE1_OUT,
    //--------------------- Receive Ports - 8b10b Decoder ----------------------
    output  [1:0]   TILE0_RXCHARISCOMMA0_OUT,
    output  [1:0]   TILE0_RXCHARISCOMMA1_OUT,
    output  [1:0]   TILE0_RXCHARISK0_OUT,
    output  [1:0]   TILE0_RXCHARISK1_OUT,
    output  [1:0]   TILE0_RXDISPERR0_OUT,
    output  [1:0]   TILE0_RXDISPERR1_OUT,
    output  [1:0]   TILE0_RXNOTINTABLE0_OUT,
    output  [1:0]   TILE0_RXNOTINTABLE1_OUT,
    //-------------------- Receive Ports - Clock Correction --------------------
    output  [2:0]   TILE0_RXCLKCORCNT0_OUT,
    output  [2:0]   TILE0_RXCLKCORCNT1_OUT,
    //------------- Receive Ports - Comma Detection and Alignment --------------
    output          TILE0_RXBYTEISALIGNED0_OUT,
    output          TILE0_RXBYTEISALIGNED1_OUT,
    input           TILE0_RXENMCOMMAALIGN0_IN,
    input           TILE0_RXENMCOMMAALIGN1_IN,
    input           TILE0_RXENPCOMMAALIGN0_IN,
    input           TILE0_RXENPCOMMAALIGN1_IN,
    //----------------- Receive Ports - RX Data Path interface -----------------
    output  [15:0]  TILE0_RXDATA0_OUT,
    output  [15:0]  TILE0_RXDATA1_OUT,
    output          TILE0_RXRECCLK0_OUT,
    output          TILE0_RXRECCLK1_OUT,
    input           TILE0_RXRESET0_IN,
    input           TILE0_RXRESET1_IN,
    input           TILE0_RXUSRCLK0_IN,
    input           TILE0_RXUSRCLK1_IN,
    input           TILE0_RXUSRCLK20_IN,
    input           TILE0_RXUSRCLK21_IN,
    //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    input           TILE0_GATERXELECIDLE0_IN,
    input           TILE0_GATERXELECIDLE1_IN,
    input           TILE0_IGNORESIGDET0_IN,
    input           TILE0_IGNORESIGDET1_IN,
    output          TILE0_RXELECIDLE0_OUT,
    output          TILE0_RXELECIDLE1_OUT,
    input   [1:0]   TILE0_RXEQMIX0_IN,
    input   [1:0]   TILE0_RXEQMIX1_IN,
    input           TILE0_RXN0_IN,
    input           TILE0_RXN1_IN,
    input           TILE0_RXP0_IN,
    input           TILE0_RXP1_IN,
    //--------- Receive Ports - RX Elastic Buffer and Phase Alignment ----------
    output  [2:0]   TILE0_RXSTATUS0_OUT,
    output  [2:0]   TILE0_RXSTATUS1_OUT,
    //-------------------------- TX/RX Datapath Ports --------------------------
    output  [1:0]   TILE0_GTPCLKOUT0_OUT,
    output  [1:0]   TILE0_GTPCLKOUT1_OUT,
    //----------------- Transmit Ports - 8b10b Encoder Control -----------------
    input   [1:0]   TILE0_TXCHARISK0_IN,
    input   [1:0]   TILE0_TXCHARISK1_IN,
    //---------------- Transmit Ports - TX Data Path interface -----------------
    input   [15:0]  TILE0_TXDATA0_IN,
    input   [15:0]  TILE0_TXDATA1_IN,
    output          TILE0_TXOUTCLK0_OUT,
    output          TILE0_TXOUTCLK1_OUT,
    input           TILE0_TXRESET0_IN,
    input           TILE0_TXRESET1_IN,
    input           TILE0_TXUSRCLK0_IN,
    input           TILE0_TXUSRCLK1_IN,
    input           TILE0_TXUSRCLK20_IN,
    input           TILE0_TXUSRCLK21_IN,
    //------------- Transmit Ports - TX Driver and OOB signalling --------------
    input   [3:0]   TILE0_TXDIFFCTRL0_IN,
    input   [3:0]   TILE0_TXDIFFCTRL1_IN,
    output          TILE0_TXN0_OUT,
    output          TILE0_TXN1_OUT,
    output          TILE0_TXP0_OUT,
    output          TILE0_TXP1_OUT,
    input   [2:0]   TILE0_TXPREEMPHASIS0_IN,
    input   [2:0]   TILE0_TXPREEMPHASIS1_IN,
    //--------------- Transmit Ports - TX Ports for PCI Express ----------------
    input           TILE0_TXELECIDLE0_IN,
    input           TILE0_TXELECIDLE1_IN,
    //------------------- Transmit Ports - TX Ports for SATA -------------------
    input           TILE0_TXCOMSTART0_IN,
    input           TILE0_TXCOMSTART1_IN,
    input           TILE0_TXCOMTYPE0_IN,
    input           TILE0_TXCOMTYPE1_IN


);


//***************************** Wire Declarations *****************************

    // ground and vcc signals
    wire            tied_to_ground_i;
    wire    [63:0]  tied_to_ground_vec_i;
    wire            tied_to_vcc_i;
    wire    [63:0]  tied_to_vcc_vec_i;
    wire            tile0_plllkdet0_i;
    wire            tile0_plllkdet1_i;

    reg            tile0_plllkdet0_i2;
    reg    [4:0]   count00;
    reg            start00;
 
    
//********************************* Main Body of Code**************************

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;

generate
if (WRAPPER_SIMULATION==1) 
begin : simulation

    assign TILE0_PLLLKDET0_OUT = tile0_plllkdet0_i2;

    always@(posedge TILE0_CLK00_IN or posedge TILE0_GTPRESET0_IN)   
    begin    
      if (TILE0_GTPRESET0_IN == 1'b1) begin
        count00 <= 5'b00000;
      end
      else begin
        if ((count00 == 5'b10100) | (tile0_plllkdet0_i == 1'b0)) begin
          count00 <= 5'b00000;
        end
        else begin
          count00 <= count00 + 5'b00001;
        end
      end
    end

    always@(posedge TILE0_CLK00_IN or negedge tile0_plllkdet0_i)
    begin
      if(tile0_plllkdet0_i == 1'b0) begin
        tile0_plllkdet0_i2 <= 1'b0;
      end
      else begin
        if((count00 == 5'b10100) & (tile0_plllkdet0_i == 1'b1)) begin 
          tile0_plllkdet0_i2 <= 1'b1;
        end
      end
    end
    


end //end WRAPPER_SIMULATION =1 generate section
else
begin: implementation

    assign TILE0_PLLLKDET0_OUT = tile0_plllkdet0_i;
    

end
endgenerate //End generate for WRAPPER_SIMULATION

    //------------------------- Tile Instances  -------------------------------   



    //_________________________________________________________________________
    //_________________________________________________________________________
    //TILE0  (X0_Y0)

    sata_s6_sata1_gtp_tile #
    (
        // Simulation attributes
        .TILE_SIM_GTPRESET_SPEEDUP   (WRAPPER_SIM_GTPRESET_SPEEDUP),
        .TILE_CLK25_DIVIDER_0        (WRAPPER_CLK25_DIVIDER_0),
        .TILE_CLK25_DIVIDER_1        (WRAPPER_CLK25_DIVIDER_1),
        .TILE_PLL_DIVSEL_FB_0        (WRAPPER_PLL_DIVSEL_FB_0),
        .TILE_PLL_DIVSEL_FB_1        (WRAPPER_PLL_DIVSEL_FB_1),
        .TILE_PLL_DIVSEL_REF_0       (WRAPPER_PLL_DIVSEL_REF_0),
        .TILE_PLL_DIVSEL_REF_1       (WRAPPER_PLL_DIVSEL_REF_1),
  
        
        //
        .TILE_PLL_SOURCE_0               ("PLL0"),
        .TILE_PLL_SOURCE_1               ("PLL0")
    )
    tile0_sata_s6_sata1_gtp_i
    (
        //---------------------- Loopback and Powerdown Ports ----------------------
        .LOOPBACK0_IN                   (TILE0_LOOPBACK0_IN),
        .LOOPBACK1_IN                   (TILE0_LOOPBACK1_IN),
        //------------------------------- PLL Ports --------------------------------
        .CLK00_IN                       (TILE0_CLK00_IN),
        .CLK01_IN                       (TILE0_CLK01_IN),
        .GTPRESET0_IN                   (TILE0_GTPRESET0_IN),
        .GTPRESET1_IN                   (TILE0_GTPRESET1_IN),
        .PLLLKDET0_OUT                  (tile0_plllkdet0_i),
        .PLLLKDET1_OUT                  (tile0_plllkdet1_i),
        .RESETDONE0_OUT                 (TILE0_RESETDONE0_OUT),
        .RESETDONE1_OUT                 (TILE0_RESETDONE1_OUT),
        //--------------------- Receive Ports - 8b10b Decoder ----------------------
        .RXCHARISCOMMA0_OUT             (TILE0_RXCHARISCOMMA0_OUT),
        .RXCHARISCOMMA1_OUT             (TILE0_RXCHARISCOMMA1_OUT),
        .RXCHARISK0_OUT                 (TILE0_RXCHARISK0_OUT),
        .RXCHARISK1_OUT                 (TILE0_RXCHARISK1_OUT),
        .RXDISPERR0_OUT                 (TILE0_RXDISPERR0_OUT),
        .RXDISPERR1_OUT                 (TILE0_RXDISPERR1_OUT),
        .RXNOTINTABLE0_OUT              (TILE0_RXNOTINTABLE0_OUT),
        .RXNOTINTABLE1_OUT              (TILE0_RXNOTINTABLE1_OUT),
        //-------------------- Receive Ports - Clock Correction --------------------
        .RXCLKCORCNT0_OUT               (TILE0_RXCLKCORCNT0_OUT),
        .RXCLKCORCNT1_OUT               (TILE0_RXCLKCORCNT1_OUT),
        //------------- Receive Ports - Comma Detection and Alignment --------------
        .RXBYTEISALIGNED0_OUT           (TILE0_RXBYTEISALIGNED0_OUT),
        .RXBYTEISALIGNED1_OUT           (TILE0_RXBYTEISALIGNED1_OUT),
        .RXENMCOMMAALIGN0_IN            (TILE0_RXENMCOMMAALIGN0_IN),
        .RXENMCOMMAALIGN1_IN            (TILE0_RXENMCOMMAALIGN1_IN),
        .RXENPCOMMAALIGN0_IN            (TILE0_RXENPCOMMAALIGN0_IN),
        .RXENPCOMMAALIGN1_IN            (TILE0_RXENPCOMMAALIGN1_IN),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .RXDATA0_OUT                    (TILE0_RXDATA0_OUT),
        .RXDATA1_OUT                    (TILE0_RXDATA1_OUT),
        .RXRECCLK0_OUT                  (TILE0_RXRECCLK0_OUT),
        .RXRECCLK1_OUT                  (TILE0_RXRECCLK1_OUT),
        .RXRESET0_IN                    (TILE0_RXRESET0_IN),
        .RXRESET1_IN                    (TILE0_RXRESET1_IN),
        .RXUSRCLK0_IN                   (TILE0_RXUSRCLK0_IN),
        .RXUSRCLK1_IN                   (TILE0_RXUSRCLK1_IN),
        .RXUSRCLK20_IN                  (TILE0_RXUSRCLK20_IN),
        .RXUSRCLK21_IN                  (TILE0_RXUSRCLK21_IN),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .GATERXELECIDLE0_IN             (TILE0_GATERXELECIDLE0_IN),
        .GATERXELECIDLE1_IN             (TILE0_GATERXELECIDLE1_IN),
        .IGNORESIGDET0_IN               (TILE0_IGNORESIGDET0_IN),
        .IGNORESIGDET1_IN               (TILE0_IGNORESIGDET1_IN),
        .RXELECIDLE0_OUT                (TILE0_RXELECIDLE0_OUT),
        .RXELECIDLE1_OUT                (TILE0_RXELECIDLE1_OUT),
        .RXEQMIX0_IN                    (TILE0_RXEQMIX0_IN),
        .RXEQMIX1_IN                    (TILE0_RXEQMIX1_IN),
        .RXN0_IN                        (TILE0_RXN0_IN),
        .RXN1_IN                        (TILE0_RXN1_IN),
        .RXP0_IN                        (TILE0_RXP0_IN),
        .RXP1_IN                        (TILE0_RXP1_IN),
        //--------- Receive Ports - RX Elastic Buffer and Phase Alignment ----------
        .RXSTATUS0_OUT                  (TILE0_RXSTATUS0_OUT),
        .RXSTATUS1_OUT                  (TILE0_RXSTATUS1_OUT),
        //-------------------------- TX/RX Datapath Ports --------------------------
        .GTPCLKOUT0_OUT                 (TILE0_GTPCLKOUT0_OUT),
        .GTPCLKOUT1_OUT                 (TILE0_GTPCLKOUT1_OUT),
        //----------------- Transmit Ports - 8b10b Encoder Control -----------------
        .TXCHARISK0_IN                  (TILE0_TXCHARISK0_IN),
        .TXCHARISK1_IN                  (TILE0_TXCHARISK1_IN),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .TXDATA0_IN                     (TILE0_TXDATA0_IN),
        .TXDATA1_IN                     (TILE0_TXDATA1_IN),
        .TXOUTCLK0_OUT                  (TILE0_TXOUTCLK0_OUT),
        .TXOUTCLK1_OUT                  (TILE0_TXOUTCLK1_OUT),
        .TXRESET0_IN                    (TILE0_TXRESET0_IN),
        .TXRESET1_IN                    (TILE0_TXRESET1_IN),
        .TXUSRCLK0_IN                   (TILE0_TXUSRCLK0_IN),
        .TXUSRCLK1_IN                   (TILE0_TXUSRCLK1_IN),
        .TXUSRCLK20_IN                  (TILE0_TXUSRCLK20_IN),
        .TXUSRCLK21_IN                  (TILE0_TXUSRCLK21_IN),
        //------------- Transmit Ports - TX Driver and OOB signalling --------------
        .TXDIFFCTRL0_IN                 (TILE0_TXDIFFCTRL0_IN),
        .TXDIFFCTRL1_IN                 (TILE0_TXDIFFCTRL1_IN),
        .TXN0_OUT                       (TILE0_TXN0_OUT),
        .TXN1_OUT                       (TILE0_TXN1_OUT),
        .TXP0_OUT                       (TILE0_TXP0_OUT),
        .TXP1_OUT                       (TILE0_TXP1_OUT),
        .TXPREEMPHASIS0_IN              (TILE0_TXPREEMPHASIS0_IN),
        .TXPREEMPHASIS1_IN              (TILE0_TXPREEMPHASIS1_IN),
        //--------------- Transmit Ports - TX Ports for PCI Express ----------------
        .TXELECIDLE0_IN                 (TILE0_TXELECIDLE0_IN),
        .TXELECIDLE1_IN                 (TILE0_TXELECIDLE1_IN),
        //------------------- Transmit Ports - TX Ports for SATA -------------------
        .TXCOMSTART0_IN                 (TILE0_TXCOMSTART0_IN),
        .TXCOMSTART1_IN                 (TILE0_TXCOMSTART1_IN),
        .TXCOMTYPE0_IN                  (TILE0_TXCOMTYPE0_IN),
        .TXCOMTYPE1_IN                  (TILE0_TXCOMTYPE1_IN)

    );

    
     
endmodule

