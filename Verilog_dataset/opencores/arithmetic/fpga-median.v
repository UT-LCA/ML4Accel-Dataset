/* --------------------------------------------------------------------------------
 This file is part of FPGA Median Filter.

    FPGA Median Filter is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FPGA Median Filter is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FPGA Median Filter.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------- */

/* +----------------------------------------------------------------------------
   Universidade Federal da Bahia
  ------------------------------------------------------------------------------
   PROJECT: FPGA Median Filter
  ------------------------------------------------------------------------------
   FILE NAME            : pixel_network.v
   AUTHOR               : João Carlos Bittencourt
   AUTHOR'S E-MAIL      : joaocarlos@ieee.org
   -----------------------------------------------------------------------------
   RELEASE HISTORY
   VERSION  DATE        AUTHOR        DESCRIPTION
   1.0      2013-08-13  joao.nunes    initial version
   -----------------------------------------------------------------------------
   KEYWORDS: comparator, low, high, median
   -----------------------------------------------------------------------------
   PURPOSE: Obtain the Median of a 3x3 mask.
   ----------------------------------------------------------------------------- */
module common_network
#(
    parameter DATA_WIDTH = 8
)(
    input [DATA_WIDTH-1:0] x2_y1,
    input [DATA_WIDTH-1:0] x2_y0,
    input [DATA_WIDTH-1:0] x2_ym1,
    input [DATA_WIDTH-1:0] x1_y1,
    input [DATA_WIDTH-1:0] x1_y0,
    input [DATA_WIDTH-1:0] x1_ym1,
    input [DATA_WIDTH-1:0] x0_y1,
    input [DATA_WIDTH-1:0] x0_y0,
    input [DATA_WIDTH-1:0] x0_ym1,
    input [DATA_WIDTH-1:0] xm1_y1,
    input [DATA_WIDTH-1:0] xm1_y0,
    input [DATA_WIDTH-1:0] xm1_ym1,

    output [DATA_WIDTH-1:0] c3l,
    output [DATA_WIDTH-1:0] c3h,
    output [DATA_WIDTH-1:0] c3m,
    output [DATA_WIDTH-1:0] c2l,
    output [DATA_WIDTH-1:0] c2h,
    output [DATA_WIDTH-1:0] c2m,
    output [DATA_WIDTH-1:0] c1l,
    output [DATA_WIDTH-1:0] c1h,
    output [DATA_WIDTH-1:0] c1m,
    output [DATA_WIDTH-1:0] c0h,
    output [DATA_WIDTH-1:0] c0m,
    output [DATA_WIDTH-1:0] c0l
);

    // Connection signals
    wire [DATA_WIDTH-1:0] node_u0_hi;
    wire [DATA_WIDTH-1:0] node_u0_lo;
    wire [DATA_WIDTH-1:0] node_u1_hi;
    wire [DATA_WIDTH-1:0] node_u1_lo;
    wire [DATA_WIDTH-1:0] node_u2_hi;
    wire [DATA_WIDTH-1:0] node_u2_lo;
    wire [DATA_WIDTH-1:0] node_u3_hi;
    wire [DATA_WIDTH-1:0] node_u3_lo;
    wire [DATA_WIDTH-1:0] node_u4_hi;
    wire [DATA_WIDTH-1:0] node_u4_lo;
    wire [DATA_WIDTH-1:0] node_u5_hi;
    wire [DATA_WIDTH-1:0] node_u5_lo;
    wire [DATA_WIDTH-1:0] node_u6_hi;
    wire [DATA_WIDTH-1:0] node_u6_lo;
    wire [DATA_WIDTH-1:0] node_u7_hi;
    wire [DATA_WIDTH-1:0] node_u7_lo;
    wire [DATA_WIDTH-1:0] node_u8_hi;
    wire [DATA_WIDTH-1:0] node_u8_lo;
    wire [DATA_WIDTH-1:0] node_u9_hi;
    wire [DATA_WIDTH-1:0] node_u9_lo;
    wire [DATA_WIDTH-1:0] node_u10_hi;
    wire [DATA_WIDTH-1:0] node_u10_lo;
    wire [DATA_WIDTH-1:0] node_u11_hi;
    wire [DATA_WIDTH-1:0] node_u11_lo;
    wire [DATA_WIDTH-1:0] node_u12_hi;
    wire [DATA_WIDTH-1:0] node_u12_lo;

    // Output assignment
    assign c3l = node_u4_lo;
    assign c3h = node_u8_hi;
    assign c3m = node_u8_lo;
    assign c2l = node_u5_lo;
    assign c2h = node_u9_hi;
    assign c2m = node_u9_lo;
    assign c1l = node_u6_lo;
    assign c1h = node_u10_hi;
    assign c1m = node_u10_lo;
    assign c0h = node_u11_hi;
    assign c0m = node_u11_lo;
    assign c0l = node_u7_lo;

    // Column 3
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u0 (
        .data_a(x2_y1),
        .data_b(x2_y0),

        .data_hi(node_u0_hi),
        .data_lo(node_u0_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u1 (
        .data_a(x1_y1),
        .data_b(x1_y0),

        .data_hi(node_u1_hi),
        .data_lo(node_u1_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u2 (
        .data_a(x0_y1),
        .data_b(x0_y0),

        .data_hi(node_u2_hi),
        .data_lo(node_u2_lo)
    );

    // Column 2
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u3 (
        .data_a(xm1_y1),
        .data_b(xm1_y0),

        .data_hi(node_u3_hi),
        .data_lo(node_u3_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u4 (
        .data_a(node_u0_lo),
        .data_b(x2_ym1),

        .data_hi(node_u4_hi),
        .data_lo(node_u4_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u5 (
        .data_a(node_u1_lo),
        .data_b(x1_ym1),

        .data_hi(node_u5_hi),
        .data_lo(node_u5_lo)
    );

    // Column 1
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u6 (
        .data_a(node_u2_lo),
        .data_b(x0_ym1),

        .data_hi(node_u6_hi),
        .data_lo(node_u6_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u7 (
        .data_a(node_u3_lo),
        .data_b(xm1_ym1),

        .data_hi(node_u7_hi),
        .data_lo(node_u7_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u8 (
        .data_a(node_u0_hi),
        .data_b(node_u4_hi),

        .data_hi(node_u8_hi),
        .data_lo(node_u8_lo)
    );

    // Column 0
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u9 (
        .data_a(node_u1_hi),
        .data_b(node_u5_hi),

        .data_hi(node_u9_hi),
        .data_lo(node_u9_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u10 (
        .data_a(node_u2_hi),
        .data_b(node_u6_hi),

        .data_hi(node_u10_hi),
        .data_lo(node_u10_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u11 (
        .data_a(node_u3_hi),
        .data_b(node_u7_hi),

        .data_hi(node_u11_hi),
        .data_lo(node_u11_lo)
    );

endmodule/* --------------------------------------------------------------------------------
 This file is part of FPGA Median Filter.

    FPGA Median Filter is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FPGA Median Filter is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FPGA Median Filter.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------- */
/* +----------------------------------------------------------------------------
   Universidade Federal da Bahia
  ------------------------------------------------------------------------------
   PROJECT: FPGA Median Filter
  ------------------------------------------------------------------------------
   FILE NAME            : pixel_network.v
   AUTHOR               : João Carlos Bittencourt
   AUTHOR'S E-MAIL      : joaocarlos@ieee.org
   -----------------------------------------------------------------------------
   RELEASE HISTORY
   VERSION  DATE        AUTHOR        DESCRIPTION
   1.0      2013-08-13  joao.nunes    initial version
   -----------------------------------------------------------------------------
   KEYWORDS: dff, flip-flop, register bank
   -----------------------------------------------------------------------------
   PURPOSE: Group median pipeline registers.
   ----------------------------------------------------------------------------- */
module dff_3_pipe
#(
    parameter DATA_WIDTH = 8
)(
    input clk,
    input rst_n,
    input [DATA_WIDTH-1:0] d0,
    input [DATA_WIDTH-1:0] d1,
    input [DATA_WIDTH-1:0] d2,

    output reg [DATA_WIDTH-1:0] q0,
    output reg [DATA_WIDTH-1:0] q1,
    output reg [DATA_WIDTH-1:0] q2
);

always @(posedge clk or negedge rst_n)
begin : register_bank_3u
    if(~rst_n) begin
        q0 <= {DATA_WIDTH{1'b0}};
        q1 <= {DATA_WIDTH{1'b0}};
        q2 <= {DATA_WIDTH{1'b0}};
    end else begin
        q0 <= d0;
        q1 <= d1;
        q2 <= d2;
    end
end

endmodule/* --------------------------------------------------------------------------------
 This file is part of FPGA Median Filter.

    FPGA Median Filter is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FPGA Median Filter is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FPGA Median Filter.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------- */
//*******************************************************************//
//-------------------------------------------------------------------//
// File name            : dual_port_ram.v
// File contents        : Parameterized memory for syncronous fifo     
//
// Design Engineer      : Igor Dantas
// Last Changed         : 10/27/2008 09:00
//-------------------------------------------------------------------//
//*******************************************************************//

`timescale 1ns/10ps

module dual_port_ram 
#(
   parameter MEMFILE = "",
   parameter DATA_WIDTH = 'd32,
   parameter ADDR_WIDTH = 14
)
(
   input clk, 
   input r_ena,
   input w_ena, 
   input [DATA_WIDTH-1:0] w_data, 
   input [ADDR_WIDTH-1:0] w_addr, 
   input [ADDR_WIDTH-1:0] r_addr,
   output reg [DATA_WIDTH-1:0] r_data 
);

//The Register memory
reg [DATA_WIDTH-1:0] mem[0:2**ADDR_WIDTH-1];
// synchronous read and write when enabled
always @ (posedge clk) begin
   if (w_ena)  mem[w_addr] <=  w_data;
   if (r_ena) r_data <= mem[r_addr];
end



endmodule

/* --------------------------------------------------------------------------------
 This file is part of FPGA Median Filter.

    FPGA Median Filter is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FPGA Median Filter is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FPGA Median Filter.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------- */
/* +----------------------------------------------------------------------------
   Universidade Federal da Bahia
  ------------------------------------------------------------------------------
   PROJECT: FPGA Median Filter
  ------------------------------------------------------------------------------
   FILE NAME            : median.v
   AUTHOR               : João Carlos Bittencourt
   AUTHOR'S E-MAIL      : joaocarlos@ieee.org
   -----------------------------------------------------------------------------
   RELEASE HISTORY
   VERSION  DATE        AUTHOR        DESCRIPTION
   1.0      2013-08-13  joao.nunes    initial version
   -----------------------------------------------------------------------------
   KEYWORDS: median, filter, image processing
   -----------------------------------------------------------------------------
   PURPOSE: Top level entity of the Median Filter algorithm datapath.
   ----------------------------------------------------------------------------- */
`define DEBUG

module median
#(
    parameter MEM_DATA_WIDTH = 32,
    parameter LUT_ADDR_WIDTH = 10, // Input LUTs
    parameter MEM_ADDR_WIDTH = 10, // Output Memory
    parameter PIXEL_DATA_WIDTH = 8,
    parameter IMG_WIDTH  = 320,
    parameter IMG_HEIGHT = 320
)(
    input clk, // Clock
    input rst_n, // Asynchronous reset active low
    input [31:0] word0,
    input [31:0] word1,
    input [31:0] word2,

    // Test signals
    `ifdef DEBUG
    output [PIXEL_DATA_WIDTH-1:0] pixel1,
    output [PIXEL_DATA_WIDTH-1:0] pixel2,
    output [PIXEL_DATA_WIDTH-1:0] pixel3,
    output [PIXEL_DATA_WIDTH-1:0] pixel4,
    `else
    output [MEM_DATA_WIDTH-1:0] median_word,
    `endif
    output [LUT_ADDR_WIDTH-1:0] raddr_a,
    output [LUT_ADDR_WIDTH-1:0] raddr_b,
    output [LUT_ADDR_WIDTH-1:0] raddr_c,

    output [MEM_ADDR_WIDTH-1:0] waddr
);

    wire [PIXEL_DATA_WIDTH-1:0] x2_y1;
    wire [PIXEL_DATA_WIDTH-1:0] x2_y0;
    wire [PIXEL_DATA_WIDTH-1:0] x2_ym1;
    wire [PIXEL_DATA_WIDTH-1:0] x1_y1;
    wire [PIXEL_DATA_WIDTH-1:0] x1_y0;
    wire [PIXEL_DATA_WIDTH-1:0] x1_ym1;
    wire [PIXEL_DATA_WIDTH-1:0] x0_y1;
    wire [PIXEL_DATA_WIDTH-1:0] x0_y0;
    wire [PIXEL_DATA_WIDTH-1:0] x0_ym1;
    wire [PIXEL_DATA_WIDTH-1:0] xm1_y1;
    wire [PIXEL_DATA_WIDTH-1:0] xm1_y0;
    wire [PIXEL_DATA_WIDTH-1:0] xm1_ym1;

    assign x2_y1   = word0[PIXEL_DATA_WIDTH-1:0];
    assign x2_y0   = word1[PIXEL_DATA_WIDTH-1:0];
    assign x2_ym1  = word2[PIXEL_DATA_WIDTH-1:0];

    assign x1_y1   = word0[(PIXEL_DATA_WIDTH*2)-1:PIXEL_DATA_WIDTH];
    assign x1_y0   = word1[(PIXEL_DATA_WIDTH*2)-1:PIXEL_DATA_WIDTH];
    assign x1_ym1  = word2[(PIXEL_DATA_WIDTH*2)-1:PIXEL_DATA_WIDTH];

    assign x0_y1   = word0[(PIXEL_DATA_WIDTH*3)-1:(PIXEL_DATA_WIDTH*2)];
    assign x0_y0   = word1[(PIXEL_DATA_WIDTH*3)-1:(PIXEL_DATA_WIDTH*2)];
    assign x0_ym1  = word2[(PIXEL_DATA_WIDTH*3)-1:(PIXEL_DATA_WIDTH*2)];

    assign xm1_y1  = word0[(PIXEL_DATA_WIDTH*4)-1:(PIXEL_DATA_WIDTH*3)];
    assign xm1_y0  = word1[(PIXEL_DATA_WIDTH*4)-1:(PIXEL_DATA_WIDTH*3)];
    assign xm1_ym1 = word2[(PIXEL_DATA_WIDTH*4)-1:(PIXEL_DATA_WIDTH*3)];

    // wire [PIXEL_DATA_WIDTH-1:0] pixel1_sig;
    // wire [PIXEL_DATA_WIDTH-1:0] pixel2_sig;
    // wire [PIXEL_DATA_WIDTH-1:0] pixel3_sig;
    // wire [PIXEL_DATA_WIDTH-1:0] pixel4_sig;

    `ifndef DEBUG
    assign median_word = {pixel1,pixel2,pixel3,pixel4};
    `endif

    // Common network output signals
    wire [PIXEL_DATA_WIDTH-1:0] c3l;
    wire [PIXEL_DATA_WIDTH-1:0] c3h;
    wire [PIXEL_DATA_WIDTH-1:0] c3m;
    wire [PIXEL_DATA_WIDTH-1:0] c3l_reg;
    wire [PIXEL_DATA_WIDTH-1:0] c3h_reg;
    wire [PIXEL_DATA_WIDTH-1:0] c3m_reg;
    wire [PIXEL_DATA_WIDTH-1:0] c2l;
    wire [PIXEL_DATA_WIDTH-1:0] c2h;
    wire [PIXEL_DATA_WIDTH-1:0] c2m;
    wire [PIXEL_DATA_WIDTH-1:0] c2l_reg;
    wire [PIXEL_DATA_WIDTH-1:0] c2h_reg;
    wire [PIXEL_DATA_WIDTH-1:0] c2m_reg;
    wire [PIXEL_DATA_WIDTH-1:0] c1l;
    wire [PIXEL_DATA_WIDTH-1:0] c1h;
    wire [PIXEL_DATA_WIDTH-1:0] c1m;
    wire [PIXEL_DATA_WIDTH-1:0] c0h;
    wire [PIXEL_DATA_WIDTH-1:0] c0m;
    wire [PIXEL_DATA_WIDTH-1:0] c0l;

    // Delay signals to be placed over the output registers
    wire [PIXEL_DATA_WIDTH-1:0] p1_sig;
    wire [PIXEL_DATA_WIDTH-1:0] p2_sig;
    wire [PIXEL_DATA_WIDTH-1:0] p3_sig;

    //------------------------------------------------------------
    // Windowing Memory Address Controller
    //------------------------------------------------------------
    state_machine
    #(
        .LUT_ADDR_WIDTH(LUT_ADDR_WIDTH),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
    ) window_contol (
        .clk(clk), // Clock
        .rst_n(rst_n), // Asynchronous reset active low

        .raddr_a(raddr_a),
        .raddr_b(raddr_b),
        .raddr_c(raddr_c),

        .waddr(waddr)
    );

    //------------------------------------------------------------
    // Pixel registers
    //------------------------------------------------------------
    // always @(posedge clk or negedge rst_n)
    // begin : pixel_reg
    //     if(~rst_n) begin
    //         pixel1 <= {PIXEL_DATA_WIDTH{1'b0}};
    //         pixel2 <= {PIXEL_DATA_WIDTH{1'b0}};
    //         pixel3 <= {PIXEL_DATA_WIDTH{1'b0}};
    //         pixel4 <= {PIXEL_DATA_WIDTH{1'b0}};
    //     end else begin
    //         pixel1 <= pixel1_sig;
    //         pixel2 <= pixel2_sig;
    //         pixel3 <= pixel3_sig;
    //         //pixel4 <= pixel4_sig;
    //    end
    // end

    //------------------------------------------------------------
    // Input datapath common network
    //------------------------------------------------------------
    common_network
    #(
        .DATA_WIDTH(PIXEL_DATA_WIDTH)
    ) common_network_u0 (
        .x2_y1(x2_y1),
        .x2_y0(x2_y0),
        .x2_ym1(x2_ym1),
        .x1_y1(x1_y1),
        .x1_y0(x1_y0),
        .x1_ym1(x1_ym1),
        .x0_y1(x0_y1),
        .x0_y0(x0_y0),
        .x0_ym1(x0_ym1),
        .xm1_y1(xm1_y1),
        .xm1_y0(xm1_y0),
        .xm1_ym1(xm1_ym1),

        .c3l(c3l),
        .c3h(c3h),
        .c3m(c3m),
        .c2l(c2l),
        .c2h(c2h),
        .c2m(c2m),
        .c1l(c1l),
        .c1h(c1h),
        .c1m(c1m),
        .c0h(c0h),
        .c0m(c0m),
        .c0l(c0l)
    );

    //------------------------------------------------------------
    // Pipeline Registers
    //------------------------------------------------------------
    dff_3_pipe
    #(
        .DATA_WIDTH(PIXEL_DATA_WIDTH)
    ) dff_c3_pipe (
        .clk(clk),
        .rst_n(rst_n),
        .d0(c3h),
        .d1(c3m),
        .d2(c3l),

        .q0(c3h_reg),
        .q1(c3m_reg),
        .q2(c3l_reg)
    );

    dff_3_pipe
    #(
        .DATA_WIDTH(PIXEL_DATA_WIDTH)
    ) dff_c2_pipe (
        .clk(clk),
        .rst_n(rst_n),
        .d0(c2h),
        .d1(c2m),
        .d2(c2l),

        .q0(c2h_reg),
        .q1(c2m_reg),
        .q2(c2l_reg)
    );

    // Output pieline registers (P1, P2, P3)
    dff_3_pipe
    #(
        .DATA_WIDTH(PIXEL_DATA_WIDTH)
    ) dff_out_pipe (
        .clk(clk),
        .rst_n(rst_n),
        .d0(p1_sig),
        .d1(p2_sig),
        .d2(p3_sig),

        .q0(pixel1),
        .q1(pixel2),
        .q2(pixel3)
    );

    //------------------------------------------------------------
    // Median Filter Pixel Network
    //------------------------------------------------------------

    // Pixel 1
    pixel_network
    #(
        .DATA_WIDTH(PIXEL_DATA_WIDTH)
    ) pixel_network_u0 (
        .c3h(c1h),
        .c3m(c1m),
        .c3l(c1l),
        .c2h(c0h),
        .c2m(c0m),
        .c2l(c0l),
        .c1h(c3h_reg),
        .c1m(c3m_reg),
        .c1l(c3l_reg),

        .median(p1_sig)
    );

    pixel_network
    #(
        .DATA_WIDTH(PIXEL_DATA_WIDTH)
    ) pixel_network_u1 (
        .c3h(c2h),
        .c3m(c2m),
        .c3l(c2l),
        .c2h(c1h),
        .c2m(c1m),
        .c2l(c1l),
        .c1h(c0h),
        .c1m(c0m),
        .c1l(c0l),

        .median(p2_sig)
    );

    pixel_network
    #(
        .DATA_WIDTH(PIXEL_DATA_WIDTH)
    ) pixel_network_u2 (
        .c3h(c3h),
        .c3m(c3m),
        .c3l(c3l),
        .c2h(c2h),
        .c2m(c2m),
        .c2l(c2l),
        .c1h(c1h),
        .c1m(c1m),
        .c1l(c1l),

        .median(p3_sig)
    );

    pixel_network
    #(
        .DATA_WIDTH(PIXEL_DATA_WIDTH)
    ) pixel_network_u3 (
        .c3h(c0h),
        .c3m(c0m),
        .c3l(c0l),
        .c2h(c3h_reg),
        .c2m(c3m_reg),
        .c2l(c3l_reg),
        .c1h(c2h_reg),
        .c1m(c2m_reg),
        .c1l(c2l_reg),

        .median(pixel4)
    );

endmodule/* --------------------------------------------------------------------------------
 This file is part of FPGA Median Filter.

    FPGA Median Filter is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FPGA Median Filter is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FPGA Median Filter.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------- */
/* +----------------------------------------------------------------------------
   Universidade Federal da Bahia
  ------------------------------------------------------------------------------
   PROJECT: FPGA Median Filter
  ------------------------------------------------------------------------------
   FILE NAME            : node.v
   AUTHOR               : João Carlos Bittencourt
   AUTHOR'S E-MAIL      : joaocarlos@ieee.org
   -----------------------------------------------------------------------------
   RELEASE HISTORY
   VERSION  DATE        AUTHOR        DESCRIPTION
   1.0      2013-08-13  joao.nunes    initial version
   -----------------------------------------------------------------------------
   KEYWORDS: comparator, low, hight, median
   -----------------------------------------------------------------------------
   PURPOSE: Compare two input values and return the low and high values.
   ----------------------------------------------------------------------------- */
module node
#(
    parameter DATA_WIDTH = 8,
    parameter LOW_MUX = 1, // disable low output
    parameter HI_MUX = 1 // disable hight output
)(
    input [DATA_WIDTH-1:0] data_a,
    input [DATA_WIDTH-1:0] data_b,

    output reg [DATA_WIDTH-1:0] data_hi,
    output reg [DATA_WIDTH-1:0] data_lo
);


    reg sel0;

    always @(*)
    begin : comparator
        if(data_a < data_b) begin
            sel0 = 1'b0; // data_a : lo / data_b : hi
        end else begin
            sel0 = 1'b1; // data_b : lo / data_a : hi
        end
    end


    always @(*)
    begin : mux_lo_hi
        case (sel0)
            1'b0 :
            begin
                if(LOW_MUX == 1)
                    data_lo = data_a;
                if(HI_MUX == 1)
                    data_hi = data_b;
            end
            1'b1 :
            begin
                if(LOW_MUX == 1)
                    data_lo = data_b;
                if(HI_MUX == 1)
                    data_hi = data_a;
            end
            default :
            begin
                data_lo = {DATA_WIDTH{1'b0}};
                data_hi = {DATA_WIDTH{1'b0}};
            end
        endcase
    end

endmodule/* --------------------------------------------------------------------------------
 This file is part of FPGA Median Filter.

    FPGA Median Filter is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FPGA Median Filter is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FPGA Median Filter.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------- */
/* +----------------------------------------------------------------------------
   Universidade Federal da Bahia
  ------------------------------------------------------------------------------
   PROJECT: FPGA Median Filter
  ------------------------------------------------------------------------------
   FILE NAME            : pixel_network.v
   AUTHOR               : João Carlos Bittencourt
   AUTHOR'S E-MAIL      : joaocarlos@ieee.org
   -----------------------------------------------------------------------------
   RELEASE HISTORY
   VERSION  DATE        AUTHOR        DESCRIPTION
   1.0      2013-08-13  joao.nunes    initial version
   -----------------------------------------------------------------------------
   KEYWORDS: comparator, low, hight, median
   -----------------------------------------------------------------------------
   PURPOSE: Obtain the Median of a 3x3 mask.
   ----------------------------------------------------------------------------- */
module pixel_network
#(
    parameter DATA_WIDTH = 8
)(
    input [DATA_WIDTH-1:0] c3h,
    input [DATA_WIDTH-1:0] c3m,
    input [DATA_WIDTH-1:0] c3l,
    input [DATA_WIDTH-1:0] c2h,
    input [DATA_WIDTH-1:0] c2m,
    input [DATA_WIDTH-1:0] c2l,
    input [DATA_WIDTH-1:0] c1h,
    input [DATA_WIDTH-1:0] c1m,
    input [DATA_WIDTH-1:0] c1l,

    output [DATA_WIDTH-1:0] median
);

    wire [DATA_WIDTH-1:0] node_u0_lo;
    wire [DATA_WIDTH-1:0] node_u1_hi;
    wire [DATA_WIDTH-1:0] node_u1_lo;
    wire [DATA_WIDTH-1:0] node_u2_hi;
    wire [DATA_WIDTH-1:0] node_u3_lo;
    wire [DATA_WIDTH-1:0] node_u4_hi;
    wire [DATA_WIDTH-1:0] node_u5_hi;
    wire [DATA_WIDTH-1:0] node_u6_lo;
    wire [DATA_WIDTH-1:0] node_u7_hi;
    wire [DATA_WIDTH-1:0] node_u7_lo;
    wire [DATA_WIDTH-1:0] node_u8_hi;

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(0) // disable hight output
    ) node_u0 (
        .data_a(c3h),
        .data_b(c2h),

        // .data_hi(),
        .data_lo(node_u0_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u1 (
        .data_a(c3m),
        .data_b(c2m),

        .data_hi(node_u1_hi),
        .data_lo(node_u1_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(0), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u2 (
        .data_a(c2l),
        .data_b(c1l),

        .data_hi(node_u2_hi)
        // .data_lo()
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(0) // disable hight output
    ) node_u3 (
        .data_a(node_u0_lo),
        .data_b(c1h),

        // .data_hi(),
        .data_lo(node_u3_lo)
    );
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(0), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u4 (
        .data_a(node_u1_lo),
        .data_b(c1m),

        .data_hi(node_u4_hi)
        // .data_lo()
    );
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(0), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u5 (
        .data_a(c3l),
        .data_b(node_u2_hi),

        .data_hi(node_u5_hi)
        // .data_lo()
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(0) // disable hight output
    ) node_u6 (
        .data_a(node_u1_hi),
        .data_b(node_u4_hi),

        // .data_hi(),
        .data_lo(node_u6_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u7 (
        .data_a(node_u3_lo),
        .data_b(node_u6_lo),

        .data_hi(node_u7_hi),
        .data_lo(node_u7_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(0), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u8 (
        .data_a(node_u7_lo),
        .data_b(node_u5_hi),

        .data_hi(node_u8_hi)
        // .data_lo()
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(0) // disable hight output
    ) node_u9 (
        .data_a(node_u7_hi),
        .data_b(node_u8_hi),

        // .data_hi(),
        .data_lo(median)
    );

endmodule/* --------------------------------------------------------------------------------
 This file is part of FPGA Median Filter.

    FPGA Median Filter is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FPGA Median Filter is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FPGA Median Filter.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------- */
/* +----------------------------------------------------------------------------
   Universidade Federal da Bahia
  ------------------------------------------------------------------------------
   PROJECT: FPGA Median Filter
  ------------------------------------------------------------------------------
   FILE NAME            : median.v
   AUTHOR               : Joo Carlos Bittencourt
   AUTHOR'S E-MAIL      : joaocarlos@ieee.org
   -----------------------------------------------------------------------------
   RELEASE HISTORY
   VERSION  DATE        AUTHOR        DESCRIPTION
   1.0      2013-08-13  joao.nunes    initial version
   2.0      2013-09-06  laur.rami     fix minnor issues on memory address
   -----------------------------------------------------------------------------
   KEYWORDS: median, filter, image processing, state machine
   -----------------------------------------------------------------------------
   PURPOSE: Windowing Memory Address Controller.
   ----------------------------------------------------------------------------- */
module state_machine
#(
    parameter LUT_ADDR_WIDTH = 10,
    parameter IMG_WIDTH = 234,
    parameter IMG_HEIGHT = 234
)(
    input clk, // Clock
    input rst_n, // Asynchronous reset active low

    output reg [LUT_ADDR_WIDTH-1:0] raddr_a,
    output reg [LUT_ADDR_WIDTH-1:0] raddr_b,
    output reg [LUT_ADDR_WIDTH-1:0] raddr_c,
    output reg [LUT_ADDR_WIDTH-1:0] waddr,
    output reg [1:0] window_line_counter,
    output reg [9:0] window_column_counter,
    output reg [9:0] memory_shift
);

    reg valid;

    always @(posedge clk or negedge rst_n)
    begin : out_memory_counter
        if(~rst_n) begin
            waddr <= {LUT_ADDR_WIDTH{1'b0}};
        end else if(valid) begin
            waddr <= waddr + 1'b1;
        end
    end

    always @(posedge clk or negedge rst_n)
    begin : addr_counter
        if(~rst_n) begin
            window_column_counter <= 10'd0;
            window_line_counter <= 2'b00;
            raddr_a <= {LUT_ADDR_WIDTH{1'b0}};
            raddr_b <= {LUT_ADDR_WIDTH{1'b0}};
            raddr_c <= {LUT_ADDR_WIDTH{1'b0}};
        end else begin
            if(window_column_counter != ((IMG_WIDTH/4)-1)) begin
                window_column_counter <= window_column_counter + 1'b1;
                valid <= 1'b1;
                raddr_a <= raddr_a + 1'b1;
                raddr_b <= raddr_b + 1'b1;
                raddr_c <= raddr_c + 1'b1;
            end else begin
                window_column_counter <= 10'd0;
                case (window_line_counter)
                    2'b00 :
                    begin
                        raddr_a <= raddr_a + 1'b1;
                        raddr_b <= raddr_b - window_column_counter;
                        raddr_c <= raddr_c - window_column_counter;
                        window_line_counter = window_line_counter + 1'b1;
                    end
                    2'b01 :
                    begin
                        raddr_b <= raddr_b + 1'b1;
                        raddr_a <= raddr_a - window_column_counter;
                        raddr_c <= raddr_c - window_column_counter;
                        window_line_counter = window_line_counter + 1'b1;
                    end
                    2'b10 :
                    begin
                        raddr_b <= raddr_b - window_column_counter;
                        raddr_a <= raddr_a - window_column_counter;
                        raddr_c <= raddr_c + 1'b1;
                        window_line_counter = 2'b00;
                    end
                    default :
                    begin
                        raddr_a <= {LUT_ADDR_WIDTH{1'b0}};
                        raddr_b <= {LUT_ADDR_WIDTH{1'b0}};
                        raddr_c <= {LUT_ADDR_WIDTH{1'b0}};
                    end
                endcase
            end
        end
    end

endmodule
