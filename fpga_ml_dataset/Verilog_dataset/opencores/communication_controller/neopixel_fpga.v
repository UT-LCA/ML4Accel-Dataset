/*
 *  FpgaNeoPixel - A spi to ws2812 machine
 *
 *  Copyright (C) 2020  Hirosh Dabui <hirosh@dabui.de>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */
module ram_sync(clk, addr, din, dout, we);
parameter ADDRESS_LINES = 1024;
parameter DATA_WIDTH = 24;

input clk;
input [$clog2(ADDRESS_LINES)-1:0] addr;
input [DATA_WIDTH-1:0] din;
output reg[DATA_WIDTH-1:0] dout;

input we;

reg [DATA_WIDTH-1:0] mem [(ADDRESS_LINES)-1:0];

always @(posedge clk) begin
  if (we)
    mem[addr] <= din;

  dout <= mem[addr];
end

endmodule

/*
 *  FpgaNeoPixel - A spi to ws2812 machine
 *
 *  Copyright (C) 2020  Hirosh Dabui <hirosh@dabui.de>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */
module spi_slave(resetn, clk, sck, mosi, miso, cs, done, rx_data);
input clk;
input resetn;

input cs;
input sck;
input mosi;
output miso;
output reg done = 0;
output reg[31:0]  rx_data = 0;

reg [4:0] bit_counter = 0;
reg [2:0] rx_done_ccd = 0;
reg [31:0] r_rx = 0;
reg rx_done = 0;

assign miso = 0;

always @(posedge clk) rx_done_ccd <= {rx_done_ccd[1:0], rx_done};

always @(posedge clk)
begin
  if (rx_done_ccd[2:1] == 2'b01) begin
    done <= 1;
    rx_data <= r_rx;
  end else
    done <= 0;
end

always @(posedge sck)
begin
  if (cs) begin
    bit_counter <= 0;
  end else begin
    r_rx <= {r_rx[30:0], mosi};
    bit_counter <= bit_counter + 1;
    rx_done <= (bit_counter == 31);
  end
end
endmodule
/*
 *  FpgaNeoPixel - A spi to ws2812 machine
 *
 *  Copyright (C) 2020  Hirosh Dabui <hirosh@dabui.de>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */
`include "ws2812_sequence.v"
module testbench;
localparam CLK_HZ = 12_000_000;
reg clk;
reg resetn;
wire dout;

reg cs;
reg sck;
reg mosi;
wire miso;
wire ready;


reg [4095:0] vcdfile;
always #5 clk = (clk === 1'b0);

always #40 sck = (sck === 1'b0);

ws2812_ctl uut(      
                .clk(clk),
                .resetn(reset),
                .dout(dout),
                .sck(sck),
                .mosi(mosi),
                .miso(miso),
                .cs(cs),
                .ready(ready),
                   );

	initial begin
		if ($value$plusargs("vcd=%s", vcdfile)) begin
			$dumpfile(vcdfile);
			$dumpvars(0, testbench);
		end
	end

  integer i = 0;
  integer j = 0;
  reg [31:0] data = 0;
  initial begin
    cs = 1;
    sck = 1;
    resetn = 0;
    #200 resetn = 1;
    repeat(5)@(posedge sck);

    for (i = 0; i < 10; i = i + 1)
    begin
/*
      cs = 0;
      data = 32'hdeadbeaf;
      for (j = 0; j < 32; j = j+1)
      begin
        mosi = data[31-j];
        repeat(1)@(posedge sck);
      end
      cs = 1;
      repeat(2)@(posedge sck);
*/
      cs = 0;
      data = 32'h80_000001;
      for (j = 0; j < 32; j = j+1)
      begin
        mosi = data[31-j];
        repeat(1)@(negedge sck);
      end
      cs = 1;

      repeat(2)@(posedge sck);

      /*
      cs = 0;
      data = 32'h00_000002;
      for (j = 0; j < 32; j = j+1)
      begin
        mosi = data[31-j];
        repeat(1)@(posedge sck);
      end
      cs = 1;

      repeat(2)@(posedge sck);

      cs = 0;
      data = 32'h00_000003;
      for (j = 0; j < 32; j = j+1)
      begin
        mosi = data[31-j];
        repeat(1)@(posedge sck);
      end
      cs = 1;
*/

      repeat(2)@(posedge sck);

      cs = 0;
      data = 32'hdeadbeaf;
      for (j = 0; j < 32; j = j+1)
      begin
        mosi = data[31-j];
        repeat(1)@(negedge sck);
      end
      cs = 1;
    repeat(1000)@(posedge sck);
    end


		$finish;
	end
endmodule
/*
 *  FpgaNeoPixel - A spi to ws2812 machine
 *
 *  Copyright (C) 2020  Hirosh Dabui <hirosh@dabui.de>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */
`include "simple_spi_slave.v"
`include "ram_sync.v"
`include "ws2812_sequence.v"

module ws2812_ctl(clk, resetn, dout, sck,
                  mosi, miso, cs, ready);
input clk;
input resetn;
output dout;

input cs;
input sck;
input mosi;
output miso;
output reg ready;

reg [9:0] ram_addr;
reg [9:0] rx_word_counter;
reg [23:0] ram_din;
wire [23:0] ram_dout;
reg  ram_we = 0;

reg [23:0] din;
reg enable = 0;
wire done;

wire spi_done;
reg [23:0] spi_rx_data;
wire [31:0] rx_data;

// fifo write states
localparam SYSTEM_CLOCK_FREQ = 12_000_000;
localparam S_RESET                = 0;
localparam S_WAIT4_SPI_DATA       = 1;
localparam S_STORE_FIFO_DATA      = 2;
localparam S_PREPARE_FIFO         = 3;

// fifo read and burst states
localparam S_CHECK4_FIFO_DATA     = 4;
localparam S_GET_FIFO_DATA        = 5;
localparam S_BURST_WS2812_SEQ     = 6;
localparam S_SEQ_DONE             = 7;

reg [2:0] state = S_RESET;

spi_slave spi_slave_i(.resetn(resetn), .clk(clk), .sck(sck),
                      .mosi(mosi), .miso(miso), .cs(cs),
                      .done(spi_done), .rx_data(rx_data));

ram_sync #(.ADDRESS_LINES(1024), .DATA_WIDTH(24))
                ram_sync_i(.clk(clk), .addr(ram_addr),
                  .din(ram_din), .dout(ram_dout), .we(ram_we));

ws2812_sequence #(.SYSTEM_CLOCK_FREQ(SYSTEM_CLOCK_FREQ))
                ws2812_sequence_i(.clk(clk),
                  .din(din),
                  .resetn(resetn),
                  .enable(enable),
                  .dout(dout),
                  .done(done)
                );

always @(posedge clk)
  ready <= ~( &(~ram_addr) && state == S_WAIT4_SPI_DATA);

always @(posedge clk) begin
  if (~resetn) begin
    state <= S_RESET;
  end else begin
    case (state)

      S_RESET: begin
        enable <= 0;
        rx_word_counter <= 0;
        ram_addr <= 0;
        ram_we <= 0;
        spi_rx_data <= 0;
        state <= S_WAIT4_SPI_DATA;
      end

      S_WAIT4_SPI_DATA: begin
        if (spi_done) begin
          spi_rx_data <= rx_data[23:0];
          if (rx_data == 32'h dead_beaf) begin
            rx_word_counter <= ram_addr;
            ram_addr <= 0;
            state <= S_CHECK4_FIFO_DATA;
          end else begin
            state <= S_STORE_FIFO_DATA;
          end
        end else
          state <= S_WAIT4_SPI_DATA;
      end

      S_STORE_FIFO_DATA: begin
        ram_we <= 1;
        ram_din <= spi_rx_data;
        state <= S_PREPARE_FIFO;
      end

      S_PREPARE_FIFO: begin
        ram_we <= 0;
        ram_addr <= ram_addr + 1;
        state <= S_WAIT4_SPI_DATA;
      end

      S_CHECK4_FIFO_DATA: begin
        ram_we <= 0;
        enable <= 0;
        if (ram_addr == (rx_word_counter)) begin
          spi_rx_data <= 0;
          rx_word_counter <= 0;
          ram_addr <= 0;
          ram_we <= 0;
          state <= S_WAIT4_SPI_DATA;
        end else
          state <= S_GET_FIFO_DATA;
      end

      S_GET_FIFO_DATA: begin
        din <= ram_dout;
        state <= S_BURST_WS2812_SEQ;
      end

      S_BURST_WS2812_SEQ: begin
        enable <= 1;
        state <= S_SEQ_DONE;
      end

      S_SEQ_DONE: begin
          enable <= 0;
        if (done) begin
         ram_addr <= ram_addr + 1;
          state <= S_CHECK4_FIFO_DATA;
        end else
          state <= S_SEQ_DONE;
      end

    default: begin
        state <= S_RESET;
      end
    endcase
  end end

endmodule

/*
 *  FpgaNeoPixel - A spi to ws2812 machine
 *
 *  Copyright (C) 2020  Hirosh Dabui <hirosh@dabui.de>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */
`ifndef WS2812_DATA_SEQUENCE_H
`define WS2812_DATA_SEQUENCE_H
module ws2812_sequence(clk, resetn, enable, din, dout, done);
  /*
   * e.g. 12 MHz = 83,33ns = 0.083us cycles
   *
   * 0,45 us => 450 ns
   *
   * T0H = 0,4 us = 400 ns ~ cycles * 5 = 416.65 ns
   * T0L = 0.85 us = 850 ns ~ cycles * 10 = 833.3 ns
   *
   * T0H + T0L = 1250 ns ~ 1249.95 ns
   *
   * T1H = 0.8us = 800 ns ~ cycles * 10 = 833.3 ns
   * T1L = 0.45us = 450 ns ~ cycles * 5 = 416.65 ns
   *
   * T0H + T0L = 1250 ns ~ 1249.95 ns
   *
   * RES above 50 us = 50000ns ~ cycles * 610 = 50831 ns
   * +/- 150 ns
   *
   * with 12 MHz = 1249.95 = +/- 0.05 ns
   *
   *  ______
   * | T0H  |__T0L___|
   *
   *  ______
   * | T1H  |__T1L___|
   *
   * |____Treset ____|
   *
   */
  localparam GRB_WIDTH = 24;

  parameter SYSTEM_CLOCK_FREQ = 12_000_000;
  parameter T0H_TIME = 0.4e-6; // 400 ns
  parameter T0L_TIME = 0.85e-6; // 850 ns
  localparam  CLK_HZ = $itor(SYSTEM_CLOCK_FREQ);
  localparam CLK_CYCLE = (1/CLK_HZ);

  localparam T0H_CYCLES = $rtoi((T0H_TIME)/CLK_CYCLE+0.5);//5;
  localparam T0L_CYCLES = $rtoi((T0L_TIME)/CLK_CYCLE+0.5);//10;

  localparam T1H_CYCLES = T0L_CYCLES;
  localparam T1L_CYCLES = T0H_CYCLES;

  localparam SEQUENCE_CYCLE = T0H_CYCLES + T0L_CYCLES;

  localparam TRESET_CYCLES = $rtoi((50e-6)/CLK_CYCLE+0.5);//610; // ~ 50us

  localparam CYCLE_BITS = $clog2(SEQUENCE_CYCLE);

  input clk;
  input resetn;
  input enable;

  /* |G7|...|G0|R7|...|R0|B7|..|B0| */
  input wire [GRB_WIDTH -1:0] din;

  output reg dout = 1'b0;
  output reg done = 1'b0;

  reg [GRB_WIDTH - 1:0] data_in = 0;
  reg [CYCLE_BITS-1:0] dout_cycle_cnt = 0;
  reg [$clog2(GRB_WIDTH-1):0] dout_bit_cycle_cnt = 0;
  reg dbit = 0;


  // states
  localparam S_RESET = 0;
  localparam S_IDLE = 1;
  localparam S_SEQUENCE_OUT = 2;

  localparam S_TXH_DATA_SEQUENCE = 3;
  localparam S_TXL_DATA_SEQUENCE = 4;

  reg [2:0] state = S_RESET;

  initial begin
    $display("CLK_HZ: ", CLK_HZ);
    $display("CLK_CYCLE: ", CLK_CYCLE);
    $display("T0H_CYCLES: ", T0H_CYCLES);
    $display("T0L_CYCLES: ", T0L_CYCLES);
    $display("SEQUENCE_CYCLE: ", SEQUENCE_CYCLE);
    $display("CYCLE_BITS: ", CYCLE_BITS);
    $display("$clog2(GRB_WIDTH): ", $clog2(GRB_WIDTH));
    $display("TRESET_CYCLES: ", TRESET_CYCLES);
  end

  always @(posedge clk) begin
    if (~resetn) begin
      done <= 0;
      dout <= 0;
      state <= S_RESET;
    end else begin
      case (state)

        S_RESET: begin
          state <= S_IDLE;
        end

        S_IDLE: begin
          done <= 0;
          dout_bit_cycle_cnt <= 0;
          dout_cycle_cnt <= 0;
          dout <= 0;
          if (enable) begin
            data_in <= din;
            state <= S_SEQUENCE_OUT;
          end else
            state <= S_IDLE;
        end

      S_SEQUENCE_OUT: begin
        dout_bit_cycle_cnt <= dout_bit_cycle_cnt + 1;
        if (dout_bit_cycle_cnt == GRB_WIDTH) begin
          done <= 1;
          state <= S_IDLE;
        end else begin
          dout_cycle_cnt <= 1;
          data_in <= {data_in[GRB_WIDTH -2: 0], 1'b0};
          dbit <= data_in[GRB_WIDTH -1];
          state <= S_TXH_DATA_SEQUENCE;
        end
      end

      S_TXH_DATA_SEQUENCE: begin
        dout_cycle_cnt <= dout_cycle_cnt + 1;
        if (dout_cycle_cnt < (dbit ? T1H_CYCLES[CYCLE_BITS-1:0] : T0H_CYCLES[CYCLE_BITS-1:0])) begin
          dout <= 1;
          state <= S_TXH_DATA_SEQUENCE;
        end
        else begin
          dout_cycle_cnt <= 1;
          state <= S_TXL_DATA_SEQUENCE;
        end
      end

      S_TXL_DATA_SEQUENCE: begin
        dout_cycle_cnt <= dout_cycle_cnt + 1;
        if ((dout_cycle_cnt < (dbit ? T1L_CYCLES[CYCLE_BITS-1:0] -1: T0L_CYCLES[CYCLE_BITS-1:0] -1))) begin
          dout <= 0;
          state <= S_TXL_DATA_SEQUENCE;
        end
        else
          state <= S_SEQUENCE_OUT;
      end

      // fall-through reset
      default: begin
        state <= S_RESET;
      end
    endcase
  end
end

endmodule
`endif
