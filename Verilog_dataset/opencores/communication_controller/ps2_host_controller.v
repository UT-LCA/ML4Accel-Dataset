//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ps2_host_clk_ctrl.v                                         ////
////                                                              ////
////  Description                                                 ////
////  Taking care of all interactions with ps2_clk line           ////
////                                                              ////
////  Author:                                                     ////
////      - Piotr Foltyn, piotr.foltyn@gmail.com                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Author                                    ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "ps2_host_defines.v"

module ps2_host_clk_ctrl(
  input  wire sys_clk,
  input  wire sys_rst,
  input  wire send_req,
  inout  wire ps2_clk,
  output wire ps2_clk_posedge,
  output wire ps2_clk_negedge
);

// Sample ps2_clk and detect rising and falling edge
reg [1:0] ps2_clk_samples;
always @(posedge sys_clk)
begin
  ps2_clk_samples <= (sys_rst) ? 2'b11 : {ps2_clk_samples[0], ps2_clk};
end

assign ps2_clk_posedge = (~ps2_clk_samples[1] &  ps2_clk_samples[0]);
assign ps2_clk_negedge = ( ps2_clk_samples[1] & ~ps2_clk_samples[0]);

// When send_req pulse arrives pull ps2_clk to zero for 100us
reg [`T_100_MICROSECONDS_SIZE - 1:0] inhibit_timer;
wire timer_is_zero = ~|inhibit_timer;
always @(posedge sys_clk)
begin
  if (sys_rst | (~send_req & timer_is_zero)) begin
    inhibit_timer <= 0;
  end
  else begin
    inhibit_timer <= (timer_is_zero) ? `T_100_MICROSECONDS : inhibit_timer - 1;
  end
end

assign ps2_clk = (timer_is_zero) ? 1'bz : 1'b0;

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ps2_host_defines.v                                          ////
////                                                              ////
////  Description                                                 ////
////  Bunch of defines used in this core                          ////
////                                                              ////
////  Author:                                                     ////
////      - Piotr Foltyn, piotr.foltyn@gmail.com                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Author                                    ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`ifndef SYS_CLOCK_HZ
`define SYS_CLOCK_HZ 100_000_000
`endif

`define T_100_MICROSECONDS (`SYS_CLOCK_HZ / 10_000)
`define T_200_MICROSECONDS (`SYS_CLOCK_HZ /  5_000)
// Ideally below define should be $clog2(`T_100_MICROSECONDS + 1)
`define T_100_MICROSECONDS_SIZE 14
// ... and same here $clog2(`T_200_MICROSECONDS + 1)
`define T_200_MICROSECONDS_SIZE 15
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ps2_host_rx.v                                               ////
////                                                              ////
////  Description                                                 ////
////  Receiver part, gathering bits from the ps2_data line        ////
////                                                              ////
////  Author:                                                     ////
////      - Piotr Foltyn, piotr.foltyn@gmail.com                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Author                                    ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on

module ps2_host_rx(
  input  wire sys_clk,
  input  wire sys_rst,
  input  wire ps2_clk_negedge,
  input  wire ps2_data,
  output reg [7:0] rx_data,
  output reg ready,
  output reg error
);

// Read in 11 bit long frame.
reg [11:0] frame;
always @(posedge sys_clk)
begin
  if (sys_rst | ready) begin
    frame <= 1;
  end
  else begin
    frame <= (ps2_clk_negedge) ? {frame[10:0], ps2_data} : frame;
  end
end

// 12th bit marks end of frame.
always @(posedge sys_clk)
begin
  ready <= (sys_rst) ? 0 : frame[11];
end

// Return rx_data in most significant bit first order.
always @(posedge sys_clk)
begin
  if (sys_rst) begin
    rx_data <= 0;
  end
  else begin
    rx_data <= (frame[11]) ? {frame[2], frame[3], frame[4], frame[5],
                              frame[6], frame[7], frame[8], frame[9]} : rx_data;
  end
end

// Check that 1st bit is 0, odd parity bit is correct and last bit is 1.
always @(posedge sys_clk)
begin
  if (sys_rst) begin
    error <= 0;
  end
  else begin
    error <= (frame[11]) ? ~(~frame[10] & (~frame[1] == ^frame[9:2]) & frame[0]) : error;
  end
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ps2_host_testbench.v                                        ////
////                                                              ////
////  Description                                                 ////
////  Testbench to verify core correctness                        ////
////                                                              ////
////  Author:                                                     ////
////      - Piotr Foltyn, piotr.foltyn@gmail.com                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Author                                    ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "ps2_host.v"

`define SYS_PERIOD 1
`define PS2_PERIOD (`SYS_PERIOD*4)

module ps2_host_testbench;

reg sys_clk;
reg sys_rst;

reg ps2_clk_r;
reg ps2_data_r;
tri1 ps2_clk  = (ps2_clk_r)  ? 1'bz : 1'b0;
tri1 ps2_data = (ps2_data_r) ? 1'bz : 1'b0;

reg [7:0] tx_data;
reg send_req;
wire busy;

wire [7:0] rx_data;
wire ready;
wire error;

// System clock
always #`SYS_PERIOD sys_clk = ~sys_clk;

// System reset
initial begin
  sys_clk = 0;
  ps2_clk_r = 1;
  ps2_data_r = 1;
  send_req = 0;
  
  sys_rst = 1;
  sys_rst = #(`SYS_PERIOD*2) 0;
end

// Receiver test
task receiver_test;
  input start_bit;
  input [7:0] bits;
  input parity_bit;
  input stop_bit;
  input expect_error;
  reg [10:0] frame;
  integer bit_cnt;
begin
  frame = {start_bit,bits[0],bits[1],bits[2],bits[3],
                     bits[4],bits[5],bits[6],bits[7],parity_bit,stop_bit};
  for (bit_cnt = 0; bit_cnt < 11; bit_cnt = bit_cnt + 1) begin
    ps2_data_r = frame[10 - bit_cnt];
    ps2_clk_r = #`PS2_PERIOD 0;
    ps2_clk_r = #`PS2_PERIOD 1;
  end
  wait (ready);
  if ((bits != rx_data) | (error != expect_error)) begin
    $display("Failed: Frame:0x%x Rx:0x%x Err:%b", frame, rx_data, error);
  end
  ps2_data_r = 1;
end endtask

// Transmitter test
task transmitter_test;
  input [7:0] bits;
  integer bit_cnt;
  reg [10:0] frame;
begin
  frame = 0;
  tx_data = bits;
  send_req = #(`SYS_PERIOD*2) 1;
  send_req = #(`SYS_PERIOD*2) 0;
  wait (~ps2_data);
  for (bit_cnt = 0; bit_cnt < 11; bit_cnt = bit_cnt + 1) begin
    ps2_clk_r = #`PS2_PERIOD 0;
    frame = {frame[9:0], ps2_data};
    ps2_clk_r = #`PS2_PERIOD 1;
  end
  wait (~busy);
  if (({bits[0],bits[1],bits[2],bits[3],bits[4],bits[5],bits[6],bits[7]} != frame[9:2]) |
      frame[10] | (~^frame[9:2] != frame[1]) | ~frame[0]) begin
    $display("Failed: Frame:0x%x Tx:0x%x", frame, bits);
  end
end endtask

// Test runner
integer byte;
always @(negedge sys_rst) begin
  for (byte = 0; byte < 256; byte = byte + 1) begin
    // Transmitter test
    transmitter_test(byte);
    
    // Correct case - data ok and error low
    receiver_test(0, byte, ~^byte, 1, 0);
    // Invalid start bit case - data ok and error high
    receiver_test(1, byte, ~^byte, 1, 1);
    // Invalid parity bit case - data ok and error high
    receiver_test(0, byte, ^byte, 1, 1);
    // Invalid stop bit case - data ok and error high
    receiver_test(0, byte, ~^byte, 0, 1);
  end
  #`PS2_PERIOD $finish();
end

// Dump data for GTKWave
initial begin
  $dumpfile("ps2_host_testbench.lxt");
  $dumpvars(0, ps2_host_testbench);
end

// Device Under Test
ps2_host ps2_host(
  .sys_clk(sys_clk),
  .sys_rst(sys_rst),
  .ps2_clk(ps2_clk),
  .ps2_data(ps2_data),

  .tx_data(tx_data),
  .send_req(send_req),
  .busy(busy),

  .rx_data(rx_data),
  .ready(ready),
  .error(error)
);

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ps2_host_tx.v                                               ////
////                                                              ////
////  Description                                                 ////
////  Transmitter part, sending bits down the ps2_data line       ////
////                                                              ////
////  Author:                                                     ////
////      - Piotr Foltyn, piotr.foltyn@gmail.com                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Author                                    ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on

module ps2_host_tx(
  input  wire sys_clk,
  input  wire sys_rst,
  input  wire ps2_clk_posedge,
  inout  wire ps2_data,
  input  wire [7:0] tx_data,
  input  wire send_req,
  output wire busy
);

reg [11:0] frame;
wire frame_is_zero = ~|frame;
always @(posedge sys_clk)
begin
  if (sys_rst | (~send_req & frame_is_zero)) begin
    frame <= 0;
  end
  else if (frame_is_zero) begin
    frame <= {2'b00, tx_data[0], tx_data[1], tx_data[2], tx_data[3],
                     tx_data[4], tx_data[5], tx_data[6], tx_data[7], ~^tx_data, 1'b1};
  end
  else begin
    frame <= (ps2_clk_posedge) ? {frame[10:0], 1'b0} : frame;
  end
end

// Send data down the line.
assign ps2_data = ((~|frame[10:0]) | frame[0]) ? 1'bz : frame[11];

// Keep high until all bits transmitted and ACK received
assign busy = ~frame_is_zero;

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ps2_host.v                                                  ////
////                                                              ////
////  Description                                                 ////
////  Top file, gluing all parts together                         ////
////                                                              ////
////  Author:                                                     ////
////      - Piotr Foltyn, piotr.foltyn@gmail.com                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Author                                    ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "ps2_host_clk_ctrl.v"
`include "ps2_host_watchdog.v"
`include "ps2_host_rx.v"
`include "ps2_host_tx.v"

module ps2_host(
  input wire sys_clk,
  input wire sys_rst,
  inout wire ps2_clk,
  inout wire ps2_data,

  input  wire [7:0] tx_data,
  input  wire send_req,
  output wire busy,

  output wire [7:0] rx_data,
  output wire ready,
  output wire error
);

ps2_host_clk_ctrl ps2_host_clk_ctrl (
  .sys_clk(sys_clk),
  .sys_rst(sys_rst),
  .send_req(send_req),
  .ps2_clk(ps2_clk),
  .ps2_clk_posedge(ps2_clk_posedge),
  .ps2_clk_negedge(ps2_clk_negedge)
);

ps2_host_watchdog ps2_host_watchdog(
  .sys_clk(sys_clk),
  .sys_rst(sys_rst),
  .ps2_clk_posedge(ps2_clk_posedge),
  .ps2_clk_negedge(ps2_clk_negedge),
  .watchdog_rst(watchdog_rst)
);

ps2_host_rx ps2_host_rx(
  .sys_clk(sys_clk),
  .sys_rst(sys_rst | busy | watchdog_rst),
  .ps2_clk_negedge(ps2_clk_negedge),
  .ps2_data(ps2_data),
  .rx_data(rx_data),
  .ready(ready),
  .error(error)
);

ps2_host_tx ps2_host_tx(
  .sys_clk(sys_clk),
  .sys_rst(sys_rst | watchdog_rst),
  .ps2_clk_posedge(ps2_clk_posedge),
  .ps2_data(ps2_data),
  .tx_data(tx_data),
  .send_req(send_req),
  .busy(busy)
);

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ps2_host_watchdog.v                                         ////
////                                                              ////
////  Description                                                 ////
////  Generate reset signal if ps2_clk line is too quiet          ////
////                                                              ////
////  Author:                                                     ////
////      - Piotr Foltyn, piotr.foltyn@gmail.com                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Author                                    ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "ps2_host_defines.v"

module ps2_host_watchdog(
  input  wire sys_clk,
  input  wire sys_rst,
  input  wire ps2_clk_posedge,
  input  wire ps2_clk_negedge,
  output wire watchdog_rst
);

wire ps2_clk_edge = ps2_clk_posedge | ps2_clk_negedge;

reg watchdog_active;
always @(posedge sys_clk)
begin
  if (sys_rst | watchdog_rst | ~(watchdog_active | ps2_clk_edge)) begin
    watchdog_active = 0;
  end
  else begin
    watchdog_active = 1;
  end
end

reg [`T_200_MICROSECONDS_SIZE - 1:0] watchdog_timer;
always @(posedge sys_clk)
begin
  if (sys_rst | watchdog_rst | ~watchdog_active | ps2_clk_edge) begin
    watchdog_timer <= `T_200_MICROSECONDS;
  end
  else begin
    watchdog_timer <= watchdog_timer - 1;
  end
end

assign watchdog_rst = (|watchdog_timer) ? 1'b0 : 1'b1;

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  timescale.v                                                 ////
////                                                              ////
////  Description                                                 ////
////  Time scale values for simulation                            ////
////                                                              ////
////  Author:                                                     ////
////      - Piotr Foltyn, piotr.foltyn@gmail.com                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Author                                    ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
