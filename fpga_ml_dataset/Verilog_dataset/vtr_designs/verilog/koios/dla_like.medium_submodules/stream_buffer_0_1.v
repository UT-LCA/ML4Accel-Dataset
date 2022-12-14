`define SIMULATION_MEMORY

module stream_buffer_0_1 (
	input clk,
	input i_reset,
	input i_wen0,
	input i_wen1,
	input [15:0] i_ddr,
	input [15:0] i_pool,
	input i_eltwise_sel,
	input [15:0] i_eltwise,
	input [13:0] i_waddr,
	output [15:0] o_feature_0,
	output [15:0] o_feature_1,
	output o_done
);

reg [13:0] base_addr;
reg [13:0] offset;
reg [13:0] base_addr_b1;
reg [13:0] offset_b1;
reg [1:0] L_counter;
reg [1:0] C_counter;
reg [1:0] W_counter;
reg [1:0] L_counter_b1;
reg [1:0] C_counter_b1;
reg [1:0] W_counter_b1;
reg done, done_1, done_2, done_3;
reg valid, valid_1, valid_2;
wire [15:0] feature_out_b0;
wire [15:0] feature_out_b1;

always @ (posedge clk) begin
	if (i_reset) begin
		base_addr <= 0;
		offset <= 0;
		C_counter <= 0;
		L_counter <= 0;
		W_counter <= 0;
	end else if (done == 0) begin
		if((W_counter == 1443) && (C_counter == 0) && (L_counter == 3)) begin
			base_addr <= 0;
			C_counter <= 0;
			L_counter <= 0;
			W_counter <= 0;
			offset <= 0;
		end else if((C_counter == 0) && (L_counter == 3)) begin
			base_addr <= base_addr + 4;
			W_counter <= W_counter + 1'b1;
			C_counter <= 0;
			L_counter <= 0;
			offset <= 0;
		end else if(L_counter == 3) begin
			base_addr <= base_addr + 1'b1;
			C_counter <= C_counter + 1'b1;
			L_counter <= 0;
			offset <= 0;
		end else begin
			offset <= offset + 1;
			L_counter <= L_counter + 1'b1;
		end
	end
end

always @ (posedge clk) begin
	if (i_reset) begin
		base_addr_b1 <= 0;
		offset_b1 <= 0;
		C_counter_b1 <= 0;
		L_counter_b1 <= 0;
		W_counter_b1 <= 0;
	end else if (done == 0) begin
		if((W_counter_b1 == 1443) && (C_counter_b1 == 0) && (L_counter_b1 == 3)) begin
			base_addr_b1 <= 0;
			C_counter_b1 <= 0;
			L_counter_b1 <= 0;
			W_counter_b1 <= 0;
			offset_b1 <= 0;
		end else if((C_counter_b1 == 0) && (L_counter_b1 == 3)) begin
			base_addr_b1 <= base_addr_b1 + 4;
			W_counter_b1 <= W_counter_b1 + 1'b1;
			C_counter_b1 <= 0;
			L_counter_b1 <= 0;
			offset_b1 <= 0;
		end else if(L_counter_b1 == 3) begin
			base_addr_b1 <= base_addr_b1 + 1'b1;
			C_counter_b1 <= C_counter_b1 + 1'b1;
			L_counter_b1 <= 0;
			offset_b1 <= 0;
		end else begin
			offset_b1 <= offset_b1 + 1;
			L_counter_b1 <= L_counter_b1 + 1'b1;
		end
	end
end

always @ (posedge clk) begin
	if(i_reset == 1'b1)begin
		done <= 0;
		done_1 <= 0;
		done_2 <= 0;
		done_3 <= 0;
		valid <= 0;
		valid_1 <= 0;
		valid_2 <= 0;
	end else begin
		valid <= 1;
		if((W_counter == 1443) && (C_counter == 0) && (L_counter == 3)) begin
			done <= 1;
		end
		done_1 <= done;
		done_2 <= done_1;
		done_3 <= done_2;
		valid_1 <= valid;
		valid_2 <= valid_1;
	end
end

reg [13:0] b0_waddr, b0_raddr, b1_raddr;
always @ (*) begin
	b0_waddr <= base_addr+offset;
	b0_raddr <= base_addr+offset;
	b1_raddr <= base_addr_b1+offset_b1;
end
buffer_16_12100_buffer_init_10 buffer_16_12100_buffer_init_10_B0 (
	.clk(clk),
	.wen(i_wen0),
	.waddr(b0_waddr),
	.wdata(i_ddr),
	.raddr(b0_raddr),
	.rdata(feature_out_b0)
);

reg [15:0] B1_wdata;
always @ (*) begin
	if (i_eltwise_sel) begin
		B1_wdata <= i_eltwise;
	end else begin
		B1_wdata <= i_pool;
	end
end

buffer_16_12100_buffer_init_10 buffer_16_12100_buffer_init_10_B1 (
	.clk(clk),
	.wen(i_wen1),
	.waddr(i_waddr),
	.wdata(B1_wdata),
	.raddr(b1_raddr),
	.rdata(feature_out_b1)
);

assign o_done = valid_2 && (~done_3);
assign o_feature_0 = feature_out_b0;
assign o_feature_1 = feature_out_b1;

endmodule
module buffer_16_12100_buffer_init_10 (
	input clk,
	input wen,
	input [13:0] waddr,
	input [15:0] wdata,
	input [13:0] raddr,
	output [15:0] rdata
);

reg [13:0] raddr_reg;
reg [15:0] rdata_reg;
reg [15:0] pipeline_reg_0;
wire [15:0] rd_dummy_signal;
wire [15:0] wr_dummy_signal;
wire [15:0] rdata_wire;
assign rd_dummy_signal = 0;

always @(posedge clk) begin
	rdata_reg <= rdata_wire;
	raddr_reg <= raddr;
	pipeline_reg_0 <= rdata_reg;
end

dual_port_ram u_dual_port_ram(
	.addr1(waddr),
	.we1(wen),
	.data1(wdata),
	.out1(wr_dummy_signal),
	.addr2(raddr_reg),
	.we2(1'b0),
	.data2(rd_dummy_signal),
	.out2(rdata_wire),
	.clk(clk)
);
assign rdata = pipeline_reg_0;

endmodule

module dual_port_ram(
clk,
addr1,
addr2,
data1,
data2,
we1,
we2,
out1,
out2
);

parameter DATA_WIDTH = 16;
parameter ADDR_WIDTH = 14;
input clk;
input [ADDR_WIDTH-1:0] addr1;
input [ADDR_WIDTH-1:0] addr2;
input [DATA_WIDTH-1:0] data1;
input [DATA_WIDTH-1:0] data2;
input we1;
input we2;
output reg [DATA_WIDTH-1:0] out1;
output reg [DATA_WIDTH-1:0] out2;

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

always @(posedge clk) begin
  if (we1) begin
    ram[addr1] <= data1;
  end
  else begin
    out1 <= ram[addr1];
  end
end

always @(posedge clk) begin
  if (we2) begin
    ram [addr2] <= data2;
  end
  else begin
    out2 <= ram[addr2];
  end
end

endmodule



