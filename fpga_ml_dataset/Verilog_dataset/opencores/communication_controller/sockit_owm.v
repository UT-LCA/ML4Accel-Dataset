//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  1-wire (owr) slave model                                                //
//                                                                          //
//  Copyright (C) 2010  Iztok Jeras                                         //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  This HDL is free hardware: you can redistribute it and/or modify        //
//  it under the terms of the GNU Lesser General Public License             //
//  as published by the Free Software Foundation, either                    //
//  version 3 of the License, or (at your option) any later version.        //
//                                                                          //
//  This RTL is distributed in the hope that it will be useful,             //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of          //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           //
//  GNU General Public License for more details.                            //
//                                                                          //
//  You should have received a copy of the GNU General Public License       //
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.   //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
 
`timescale 1us / 1ns

module onewire_slave_model #(
  // time slot (min=15.0, typ=30.0, max=60.0)
  parameter TS = 30.0
)(
  // configuration
  input  wire ena,    // response enable
  input  wire ovd,    // overdrive mode select
  input  wire dat_r,  // read data
  output wire dat_w,  // write data
  // 1-wire
  inout wire owr
);

// IO
reg pul;
reg dat;

// events
event sample_dat;
event sample_rst;

//////////////////////////////////////////////////////////////////////////////
// IO
//////////////////////////////////////////////////////////////////////////////

// onewire open collector signal
assign owr = pul & ena ? 1'b0 : 1'bz;

// read data output
assign dat_w = ena ? dat : 1'bz;

//////////////////////////////////////////////////////////////////////////////
// events inside a cycle
//////////////////////////////////////////////////////////////////////////////

// power up state
initial pul  <= 1'b0;

always @ (negedge owr)  if (ena)  transfer (ovd, dat_r, dat);

task automatic transfer (
  input  ovd,
  input  dat_r,
  output dat_w
); begin
  // provide read data response
  pul = ~dat_r;
  // wait 1 time slot
  if (ovd)  #(1*TS/8);
  else      #(1*TS);
  // write data is sampled here
  -> sample_dat;
  dat_w = owr;
  // release the wire
  pul = 1'b0;
  // fork into data or reset cycle
  fork
    // transfer data
    begin : transfer_dat
      // if cycle ends before reset is detected
      if (~owr) @ (posedge owr);
      // disable reset path
      disable transfer_rst;
    end
    // transfer reset
    begin : transfer_rst
      // wait 7 time slots
      if (ovd)  #(7*TS/8);
      else      #(7*TS);
      // reset is sampled here
      -> sample_rst;
      // if reset is detected disable data path
      if (~owr) disable transfer_dat;
      // wait for reset low to end
      @ (posedge owr)
      // wait 1 time slot
      if (ovd)  #(1*TS/8);
      else      #(1*TS);
      // provide presence pulse
      pul = 1'b1;
      // wait 4 time slot
      if (ovd)  #(4*TS/8);
      else      #(4*TS);
      // release the wire
      pul = 1'b0;
    end
  join
end endtask

endmodule
//////////////////////////////////////////////////////////////////////////////                                                                                          
//                                                                          //
//  Minimalistic 1-wire (onewire) master with Avalon MM bus interface       //
//  testbench                                                               //
//                                                                          //
//  Copyright (C) 2010  Iztok Jeras                                         //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  This RTL is free hardware: you can redistribute it and/or modify        //
//  it under the terms of the GNU Lesser General Public License             //
//  as published by the Free Software Foundation, either                    //
//  version 3 of the License, or (at your option) any later version.        //
//                                                                          //
//  This RTL is distributed in the hope that it will be useful,             //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of          //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           //
//  GNU General Public License for more details.                            //
//                                                                          //
//  You should have received a copy of the GNU General Public License       //
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.   //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module onewire_tb;

localparam DEBUG = 1'b0;

// system clock parameters
localparam real FRQ = 6_000_000;      // frequency 6MHz
localparam real TCP = (10.0**9)/FRQ;  // time clock period in ns

`ifdef CDR_E
localparam CDR_E = 1;
`else
localparam CDR_E = 0;
`endif

`ifdef PRESET_50_10
localparam OVD_E = 1'b1;   // overdrive functionality enable
localparam BTP_N = "5.0";  // normal    mode
localparam BTP_O = "1.0";  // overdrive mode
`elsif PRESET_60_05
localparam OVD_E = 1'b1;   // overdrive functionality enable
localparam BTP_N = "6.0";  // normal    mode
localparam BTP_O = "0.5";  // overdrive mode
`elsif PRESET_75
localparam OVD_E = 1'b0;   // overdrive functionality enable
localparam BTP_N = "7.5";  // normal    mode
localparam BTP_O = "1.0";  // overdrive mode
`else // default
localparam OVD_E = 1'b1;   // overdrive functionality enable
localparam BTP_N = "5.0";  // normal    mode
localparam BTP_O = "1.0";  // overdrive mode
`endif

// port width parameters
`ifdef BDW_32
localparam BDW   = 32;     // 32bit bus data width
`elsif BDW_8
localparam BDW   =  8;     //  8bit bus data width
`else // default
localparam BDW   = 32;     //       bus data width
`endif

// number of wires
`ifdef OWN
localparam OWN   = `OWN;  // number of wires
`else
localparam OWN   =  3;    // slaves with different timing (min, typ, max)
`endif

// computed bus address port width
localparam BAW   = (BDW==32) ? 1 : 2;

// clock dividers for normal and overdrive mode
// NOTE! must be round integer values
`ifdef PRESET_60_05
// there is no way to cast a real value into an integer
localparam integer CDR_N = 45 - 1;
localparam integer CDR_O =  4 - 1;
`else
localparam integer CDR_N = ((BTP_N == "5.0") ?  5.0 : 7.5 ) * FRQ / 1_000_000 - 1;
localparam integer CDR_O = ((BTP_O == "1.0") ?  1.0 : 0.67) * FRQ / 1_000_000 - 1;
`endif

// Avalon MM parameters
localparam AAW = BAW;    // address width
localparam ADW = BDW;    // data width
localparam ABW = ADW/8;  // byte enable width

// system_signals
reg            clk;  // clock
reg            rst;  // reset (asynchronous)
// Avalon MM interface
reg            avalon_read;
reg            avalon_write;
reg  [AAW-1:0] avalon_address;
reg  [ABW-1:0] avalon_byteenable;
reg  [ADW-1:0] avalon_writedata;
wire [ADW-1:0] avalon_readdata;
wire           avalon_waitrequest;
wire           avalon_interrupt;

// Avalon MM local signals
wire           avalon_transfer;
reg  [BDW-1:0] data;

// onewire
wire [OWN-1:0] owr;     // bidirectional
wire [OWN-1:0] owr_p;   // output power enable from master
wire [OWN-1:0] owr_e;   // output pull down enable from master
wire [OWN-1:0] owr_i;   // input into master

// slave conviguration
reg            slave_ena;    // slave enable (connect/disconnect from wire)
reg      [3:0] slave_sel;    // 1-wire slave select
reg            slave_ovd;    // overdrive mode enable
reg            slave_dat_r;  // read  data
wire [OWN-1:0] slave_dat_w;  // write data

// error checking
integer        error;
integer        n;

// overdrive enable loop
integer        i;

//////////////////////////////////////////////////////////////////////////////
// configuration printout and waveforms
//////////////////////////////////////////////////////////////////////////////

// request for a dumpfile
initial begin
  $dumpfile("onewire.vcd");
  $dumpvars(0, onewire_tb);
end

// print configuration
initial begin
  $display ("NOTE: Ports : BDW=%0d, BAW=%0d, OWN=%0d", BDW, BAW, OWN);
  $display ("NOTE: Clock : FRQ=%3.2fMHz, TCP=%3.2fns", FRQ/1_000_000.0, TCP);
  $display ("NOTE: Divide: CDR_E=%0b, CDR_N=%0d, CDR_O=%0d", CDR_E, CDR_N, CDR_O);
  $display ("NOTE: Config: OVD_E=%0b, BTP_N=%1.2fus, BTP_O=%1.2fus",
                           OVD_E, (CDR_N+1)*1_000_000/FRQ, (CDR_O+1)*1_000_000/FRQ);
end

//////////////////////////////////////////////////////////////////////////////
// clock and reset
//////////////////////////////////////////////////////////////////////////////

// clock generation
initial         clk = 1'b1;
always #(TCP/2) clk = ~clk;

// reset generation
initial begin
  rst = 1'b1;
  repeat (2) @(posedge clk);
  rst = 1'b0;
end

//////////////////////////////////////////////////////////////////////////////
// Avalon write and read transfers
//////////////////////////////////////////////////////////////////////////////

initial begin
  // reset error counter
  error = 0;

  // Avalon MM interface is idle
  avalon_read  = 1'b0;
  avalon_write = 1'b0;

  // long delay to skip presence pulse
  slave_ena = 1'b0;
  #1000_000;

  // set clock divider ratios
  if (CDR_E) begin
    if (BDW==32) begin
      avalon_cycle (1, 1, 4'hf, {   16'h0001,    16'h0001}, data);
      avalon_cycle (1, 1, 4'hf, {CDR_O[15:0], CDR_N[15:0]}, data);
    end else if (BDW==8) begin
      avalon_cycle (1, 2, 1'b1,      8'h01, data);
      avalon_cycle (1, 3, 1'b1,      8'h01, data);
      avalon_cycle (1, 2, 1'b1, CDR_N[7:0], data);
      avalon_cycle (1, 3, 1'b1, CDR_O[7:0], data);
    end
  end

  // test with slaves with different timing (each slave one one of the wires)
  for (slave_sel=0; slave_sel<OWN; slave_sel=slave_sel+1) begin

    // select normal/overdrive mode
    //for (slave_ovd=0; slave_ovd<(OVD_E?2:1); slave_ovd=slave_ovd+1) begin
    for (i=0; i<(OVD_E?2:1); i=i+1) begin

      slave_ovd = i[0];

      // testbench status message 
      $display("NOTE: Loop: speed=%s, ovd=%b, BTP=\"%s\")", (slave_sel==0) ? "typ" : (slave_sel==1) ? "min" : "max", slave_ovd, slave_ovd ? BTP_O : BTP_N);

      // generate a reset pulse
      slave_ena   = 1'b0;
      slave_dat_r = 1'b1;
      avalon_request (16'd0, slave_sel, {slave_ovd, 2'b10});
      avalon_polling (8, n);
      // expect no response
      if (data[0] !== 1'b1) begin
        error = error+1;
        $display("ERROR: (t=%0t)  Wrong presence detect responce ('1' expected).", $time);
      end

      // generate a reset pulse
      slave_ena   = 1'b1;
      slave_dat_r = 1'b1;
      avalon_request (16'd0, slave_sel, {slave_ovd, 2'b10});
      avalon_polling (8, n);
      // expect presence response
      if (data[0] !== 1'b0) begin
        error = error+1;
        $display("ERROR: (t=%0t)  Wrong presence detect response ('0' expected).", $time);
      end

      // write '0'
      slave_ena   = 1'b1;
      slave_dat_r = 1'b1;
      avalon_request (16'd0, slave_sel, {slave_ovd, 2'b00});
      avalon_polling (8, n);
      // check if '0' was written into the slave
      if (slave_dat_w[slave_sel] !== 1'b0) begin
        error = error+1;
        $display("ERROR: (t=%0t)  Wrong write data for write '0'.", $time);
      end
      // check if '0' was read from the slave
      if (data[0] !== 1'b0) begin
        error = error+1;
        $display("ERROR: (t=%0t)  Wrong read  data for write '0'.", $time);
      end

      // write '1', read '1'
      slave_ena   = 1'b1;
      slave_dat_r = 1'b1;
      avalon_request (16'd0, slave_sel, {slave_ovd, 2'b01});
      avalon_polling (8, n);
      // check if '0' was written into the slave
      if (slave_dat_w[slave_sel] !== 1'b1) begin
        error = error+1;
        $display("ERROR: (t=%0t)  Wrong write data for write '1', read '1'.", $time);
      end
      // check if '1' was read from the slave
      if (data[0] !== 1'b1) begin
        error = error+1;
        $display("ERROR: (t=%0t)  Wrong read  data for write '1', read '1'.", $time);
      end

      // write '1', read '0'
      slave_ena   = 1'b1;
      slave_dat_r = 1'b0;
      avalon_request (16'd0, slave_sel, {slave_ovd, 2'b01});
      avalon_polling (8, n);
      // check if '0' was written into the slave
      if (slave_dat_w[slave_sel] !== 1'b0) begin
        error = error+1;
        $display("ERROR: (t=%0t)  Wrong write data for write '1', read '0'.", $time);
      end
      // check if '0' was read from the slave
      if (data[0] !== 1'b0) begin
        error = error+1;
        $display("ERROR: (t=%0t)  Wrong read  data for write '1', read '0'.", $time);
      end

    end  // slave_ovd

  end  // slave_sel

  // test power supply on a typical normal mode slave
  slave_sel = 0;

  // generate a delay pulse (1ms) with power supply enabled
  avalon_request (16'd1, slave_sel, 3'b011);
  avalon_polling (1, n);
  // check if '1' was read from the slave
  if ((data[0] !== 1'b1) & ~slave_ovd) begin
    error = error+1;
    $display("ERROR: (t=%0t)  Wrong presence detect response (power expected).", $time);
  end
  // check if power is present
  if (owr_p[slave_sel] !== 1'b1) begin
    error = error+1;
    $display("ERROR: (t=%0t)  Wrong line power state", $time);
  end
  // check the time to run a delay cycle
  if ((n-1)*2 != FRQ/1000) begin
    $display("WARNING: (t=%0t)  Non ideal cycle time (%0dus), should be around 1ms.", $time, 2*(n-1)*1_000_000/FRQ);
  end

  // generate a idle pulse (0ms) with power supply enabled
  avalon_request (16'd1, slave_sel, 3'b111);
  avalon_polling (1, n);
  // check if power is present
  if (owr_p[slave_sel] !== 1'b1) begin
    error = error+1;
    $display("ERROR: (t=%0t)  Wrong line power state", $time);
  end
  // check the time to run an idle cycle
  if (n>1) begin
    $display("ERROR: (t=%0t)  Non ideal idle cycle time, should be around zero.", $time);
  end

  // generate a delay pulse and break it with an idle pulse, before it finishes
  repeat (10) @(posedge clk);
  avalon_request (16'd0, 4'h0, 3'b011);
  repeat (10) @(posedge clk);
  avalon_request (16'd0, 4'h0, 3'b111);

  // wait a few cycles and finish
  repeat (10) @(posedge clk);
  $finish(); 
end

// avalon request cycle
task avalon_request (
  input [15:0] pwr,  // power enable
  input  [3:0] sel,  // onewire slave select
  input  [2:0] cmd   // command {ovd, rst, dat}
);
  reg [BDW-1:0] data;  // read data
begin
  if (BDW==32) begin
    avalon_cycle (1, 0, 4'hf, {pwr<<sel, 4'h0, sel, 3'b000, pwr[0], 1'b1, cmd}, data);  
  end else begin
    avalon_cycle (1, 1, 1'b1, {pwr[3:0]<<sel, 2'h0, sel[1:0]}, data);  
    avalon_cycle (1, 0, 1'b1, {    3'b000, pwr[0], 1'b1, cmd}, data);  
  end
end endtask

// wait for the onewire cycle completion
task avalon_polling (
  input  integer dly,
  output integer n
); begin
  // set cycle counter to zero
  n = 0;
  // poll till owr_cyc ends
  if (BDW==32) begin
    data = 32'h08;
    while (data & 32'h08) begin
      repeat (dly) @ (posedge clk);
      avalon_cycle (0, 0, 4'hf, 32'hxxxx_xxxx, data);
      n = n + 1;
    end
  end else begin
    data = 8'h08;
    while (data & 8'h08) begin
      repeat (dly) @ (posedge clk);
      avalon_cycle (0, 0, 1'b1, 8'hxx, data);
      n = n + 1;
    end
  end
end endtask

//////////////////////////////////////////////////////////////////////////////
// Avalon transfer cycle generation task
//////////////////////////////////////////////////////////////////////////////

task automatic avalon_cycle (
  input            r_w,  // 0-read or 1-write cycle
  input  [AAW-1:0] adr,
  input  [ABW-1:0] ben,
  input  [ADW-1:0] wdt,
  output [ADW-1:0] rdt
);
begin
  if (DEBUG) $display ("Avalon MM cycle start: T=%10tns, %s address=%08x byteenable=%04b writedata=%08x", $time/1000.0, r_w?"write":"read ", adr, ben, wdt);
  // start an Avalon cycle
  avalon_read       <= ~r_w;
  avalon_write      <=  r_w;
  avalon_address    <=  adr;
  avalon_byteenable <=  ben;
  avalon_writedata  <=  wdt;
  // wait for waitrequest to be retracted
  @ (posedge clk); while (~avalon_transfer) @ (posedge clk);
  // end Avalon cycle
  avalon_read       <= 1'b0;
  avalon_write      <= 1'b0;
  // read data
  rdt = avalon_readdata;
  if (DEBUG) $display ("Avalon MM cycle end  : T=%10tns, readdata=%08x", $time/1000.0, rdt);
end
endtask

// avalon cycle transfer cycle end status
assign avalon_transfer = (avalon_read | avalon_write) & ~avalon_waitrequest;

assign avalon_waitrequest = 1'b0;

//////////////////////////////////////////////////////////////////////////////
// RTL instance
//////////////////////////////////////////////////////////////////////////////

sockit_owm #(
  .OVD_E    (OVD_E),
  .CDR_E    (CDR_E),
  .BDW      (BDW  ),
  .BAW      (BAW  ),
  .OWN      (OWN  ),
  .BTP_N    (BTP_N),
  .BTP_O    (BTP_O),
  .CDR_N    (CDR_N),
  .CDR_O    (CDR_O)
) onewire_master (
  // system
  .clk      (clk),
  .rst      (rst),
  // Avalon
  .bus_ren  (avalon_read),
  .bus_wen  (avalon_write),
  .bus_adr  (avalon_address),
  .bus_wdt  (avalon_writedata),
  .bus_rdt  (avalon_readdata),
  .bus_irq  (avalon_interrupt),
  // onewire
  .owr_p    (owr_p),
  .owr_e    (owr_e),
  .owr_i    (owr_i)
);

// pullup
pullup onewire_pullup [OWN-1:0] (owr);

// tristate buffers
bufif1 onewire_buffer [OWN-1:0] (owr, owr_p, owr_e | owr_p);

// read back
assign owr_i = owr;

//////////////////////////////////////////////////////////////////////////////
// Verilog onewire slave models
//////////////////////////////////////////////////////////////////////////////

`ifdef OWN

// fast slave device
onewire_slave_model onewire_slave [OWN-1:0] (
  // configuration
  .ena    (slave_ena),
  .ovd    (slave_ovd),
  .dat_r  (slave_dat_r),
  .dat_w  (slave_dat_w),
  // 1-wire signal
  .owr    (owr)
);

`else

// Verilog onewire slave models for normal mode

// typical slave device
onewire_slave_model #(
  .TS     (30)
) onewire_slave_n_typ (
  // configuration
  .ena    (slave_ena & (slave_ovd==0)),
  .ovd    (slave_ovd     ),
  .dat_r  (slave_dat_r   ),
  .dat_w  (slave_dat_w[0]),
  // 1-wire signal
  .owr    (owr[0])
);

// fast slave device
onewire_slave_model #(
  .TS     (15 + 0.1)
) onewire_slave_n_min (
  // configuration
  .ena    (slave_ena & (slave_ovd==0)),
  .ovd    (slave_ovd     ),
  .dat_r  (slave_dat_r   ),
  .dat_w  (slave_dat_w[1]),
  // 1-wire signal
  .owr    (owr[1])
);

onewire_slave_model #(
  .TS     (60 - 0.1)
) onewire_slave_n_max (
  // configuration
  .ena    (slave_ena & (slave_ovd==0)),
  .ovd    (slave_ovd     ),
  .dat_r  (slave_dat_r   ),
  .dat_w  (slave_dat_w[2]),
  // 1-wire signal
  .owr    (owr[2])
);

// Verilog onewire slave models for overdrive mode

// typical slave device
onewire_slave_model #(
  .TS     (30)
) onewire_slave_o_typ (
  // configuration
  .ena    (slave_ena & (slave_ovd==1)),
  .ovd    (slave_ovd     ),
  .dat_r  (slave_dat_r   ),
  .dat_w  (slave_dat_w[0]),
  // 1-wire signal
  .owr    (owr[0])
);

// fast slave device
onewire_slave_model #(
  .TS     (16)
) onewire_slave_o_min (
  // configuration
  .ena    (slave_ena & (slave_ovd==1)),
  .ovd    (slave_ovd     ),
  .dat_r  (slave_dat_r   ),
  .dat_w  (slave_dat_w[1]),
  // 1-wire signal
  .owr    (owr[1])
);

onewire_slave_model #(
  .TS     (47)
) onewire_slave_o_max (
  // configuration
  .ena    (slave_ena & (slave_ovd==1)),
  .ovd    (slave_ovd     ),
  .dat_r  (slave_dat_r   ),
  .dat_w  (slave_dat_w[2]),
  // 1-wire signal
  .owr    (owr[2])
);

`endif

endmodule
//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  Minimalistic 1-wire (onewire) master with Avalon MM bus interface       //
//                                                                          //
//  Copyright (C) 2010  Iztok Jeras                                         //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  This RTL is free hardware: you can redistribute it and/or modify        //
//  it under the terms of the GNU Lesser General Public License             //
//  as published by the Free Software Foundation, either                    //
//  version 3 of the License, or (at your option) any later version.        //
//                                                                          //
//  This RTL is distributed in the hope that it will be useful,             //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of          //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           //
//  GNU General Public License for more details.                            //
//                                                                          //
//  You should have received a copy of the GNU General Public License       //
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.   //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////
//                                                                          //
// The clock divider parameter is computed with the next formula:           //
//                                                                          //
// CDR_N = f_CLK * BTP_N - 1  (example: CDR_N = 1MHz * 5.0us - 1 = 5-1)     //
// CDR_O = f_CLK * BTP_O - 1  (example: CDR_O = 1MHz * 1.0us - 1 = 1-1)     //
//                                                                          //
// If the dividing factor is not a round integer, than the timing of the    //
// controller will be slightly off, and would support only a subset of      //
// 1-wire devices with timing closer to the typical 30us slot.              //
//                                                                          //
// Base time periods BTP_N = "5.0" and BTP_O = "1.0" are optimized for      //
// onewire timing. The default timing restricts the range of available      //
// frequences to multiples of 1MHz.                                         //
//                                                                          //
// If even this restrictions are too strict use timing BTP_N = "6.0" and    //
// BTP_O = "0.5", where the actual periods can be in the range:             //
// 6.0us <= BTP_N <= 7.5us                                                  //
// 0.5us <= BTP_O <= 0.66us                                                 //
//                                                                          //
// A third timing option is available for normal mode BTP_N = "7.5", this   //
// option is optimized for logic size.                                      //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////

module sockit_owm #(
  // enable implementation of optional functionality
  parameter OVD_E =    1,  // overdrive functionality is implemented by default
  parameter CDR_E =    1,  // clock divider register is implemented by default
  // interface parameters
  parameter BDW   =   32,  // bus data width
  parameter OWN   =    1,  // number of 1-wire ports
  // computed bus address port width
`ifdef __ICARUS__
  parameter BAW   = (BDW==32) ? 1 : 2,
`else
  parameter BAW   = 1,  // TODO, the above is correct, but does not work well with Altera SOPC Builder
`endif
  // base time period
  parameter BTP_N = "5.0", // normal    mode (5.0us, options are "7.5", "5.0" and "6.0")
  parameter BTP_O = "1.0", // overdrive mode (1.0us, options are "1.0",       and "0.5")
  // normal mode timing
  parameter T_RSTH_N = (BTP_N == "7.5") ?  64 : (BTP_N == "5.0") ?  96 :  80,  // reset high
  parameter T_RSTL_N = (BTP_N == "7.5") ?  64 : (BTP_N == "5.0") ?  96 :  80,  // reset low
  parameter T_RSTP_N = (BTP_N == "7.5") ?  10 : (BTP_N == "5.0") ?  15 :  10,  // reset presence pulse
  parameter T_DAT0_N = (BTP_N == "7.5") ?   8 : (BTP_N == "5.0") ?  12 :  10,  // bit 0 low
  parameter T_DAT1_N = (BTP_N == "7.5") ?   1 : (BTP_N == "5.0") ?   1 :   1,  // bit 1 low
  parameter T_BITS_N = (BTP_N == "7.5") ?   2 : (BTP_N == "5.0") ?   3 :   2,  // bit sample
  parameter T_RCVR_N = (BTP_N == "7.5") ?   1 : (BTP_N == "5.0") ?   1 :   1,  // recovery
  parameter T_IDLE_N = (BTP_N == "7.5") ? 128 : (BTP_N == "5.0") ? 200 : 160,  // idle timer
  // overdrive mode timing
  parameter T_RSTH_O = (BTP_O == "1.0") ?  48 :  96,  // reset high
  parameter T_RSTL_O = (BTP_O == "1.0") ?  48 :  96,  // reset low
  parameter T_RSTP_O = (BTP_O == "1.0") ?  10 :  15,  // reset presence pulse
  parameter T_DAT0_O = (BTP_O == "1.0") ?   6 :  12,  // bit 0 low
  parameter T_DAT1_O = (BTP_O == "1.0") ?   1 :   2,  // bit 1 low
  parameter T_BITS_O = (BTP_O == "1.0") ?   2 :   3,  // bit sample
  parameter T_RCVR_O = (BTP_O == "1.0") ?   2 :   4,  // recovery
  parameter T_IDLE_O = (BTP_O == "1.0") ?  96 : 192,  // idle timer
  // clock divider ratios (defaults are for a 2MHz clock)
  parameter CDR_N = 5-1,  // normal    mode
  parameter CDR_O = 1-1   // overdrive mode
)(
  // system signals
  input            clk,
  input            rst,
  // CPU bus interface
  input            bus_ren,  // read  enable
  input            bus_wen,  // write enable
  input  [BAW-1:0] bus_adr,  // address
  input  [BDW-1:0] bus_wdt,  // write data
  output [BDW-1:0] bus_rdt,  // read  data
  output           bus_irq,  // interrupt request
  // 1-wire interface
  output [OWN-1:0] owr_p,    // output power enable
  output [OWN-1:0] owr_e,    // output pull down enable
  input  [OWN-1:0] owr_i     // input from bidirectional wire
);

//////////////////////////////////////////////////////////////////////////////
// local parameters
//////////////////////////////////////////////////////////////////////////////

// size of combined power and select registers
localparam PDW = (BDW==32) ? 24 : 8;

// size of boudrate generator counter (divider for normal mode is largest)
localparam CDW = CDR_E ? ((BDW==32) ? 16 : 8) : $clog2(CDR_N);

// size of port select signal
localparam SDW = $clog2(OWN);

// size of cycle timing counter
localparam TDW =       (T_RSTH_O+T_RSTL_O) >       (T_RSTH_N+T_RSTL_N)
               ? $clog2(T_RSTH_O+T_RSTL_O) : $clog2(T_RSTH_N+T_RSTL_N);

//////////////////////////////////////////////////////////////////////////////
// local signals
//////////////////////////////////////////////////////////////////////////////

// address dependent write enable
wire bus_ren_ctl_sts;
wire bus_wen_ctl_sts;
wire bus_wen_pwr_sel;
wire bus_wen_cdr_n;
wire bus_wen_cdr_o;

// read data bus segments
wire     [7:0] bus_rdt_ctl_sts;
wire [PDW-1:0] bus_rdt_pwr_sel;

// clock divider
reg  [CDW-1:0] div;
reg  [CDW-1:0] cdr_n;
reg  [CDW-1:0] cdr_o;
wire           pls;

// cycle control and status
reg            owr_cyc;  // cycle status
reg  [TDW-1:0] cnt;      // cycle counter

// port select
//generate if (OWN>1) begin : sel_declaration
reg  [SDW-1:0] owr_sel;
//end endgenerate

// modified input data for overdrive
wire           req_ovd;

// onewire signals
reg  [OWN-1:0] owr_pwr;  // power
reg            owr_ovd;  // overdrive
reg            owr_rst;  // reset
reg            owr_dat;  // data bit
reg            owr_smp;  // sample bit

reg            owr_oen;  // output enable
wire           owr_iln;  // input line

// interrupt signals
reg            irq_ena;  // interrupt enable
reg            irq_sts;  // interrupt status

// timing signals
wire [TDW-1:0] t_idl ;   // idle                 cycle    time
wire [TDW-1:0] t_rst ;   // reset                cycle    time
wire [TDW-1:0] t_bit ;   // data bit             cycle    time
wire [TDW-1:0] t_rstp;   // reset presence pulse sampling time
wire [TDW-1:0] t_rsth;   // reset                release  time
wire [TDW-1:0] t_dat0;   // data bit 0           release  time
wire [TDW-1:0] t_dat1;   // data bit 1           release  time
wire [TDW-1:0] t_bits;   // data bit             sampling time
wire [TDW-1:0] t_zero;   // end of               cycle    time

//////////////////////////////////////////////////////////////////////////////
// cycle timing
//////////////////////////////////////////////////////////////////////////////

// idle time
assign t_idl  = req_ovd ? T_IDLE_O                       : T_IDLE_N                      ;
// reset cycle time (reset low + reset hight)
assign t_rst  = req_ovd ? T_RSTL_O + T_RSTH_O            : T_RSTL_N + T_RSTH_N           ;
// data bit cycle time (write 0 + recovery)
assign t_bit  = req_ovd ? T_DAT0_O +          + T_RCVR_O : T_DAT0_N +            T_RCVR_N;

// reset presence pulse sampling time (reset high - reset presence)
assign t_rstp = owr_ovd ? T_RSTH_O - T_RSTP_O            : T_RSTH_N - T_RSTP_N           ;
// reset      release time (reset high)
assign t_rsth = owr_ovd ? T_RSTH_O                       : T_RSTH_N                      ;

// data bit 0 release time (write bit 0 - write bit 0 + recovery)
assign t_dat0 = owr_ovd ? T_DAT0_O - T_DAT0_O + T_RCVR_O : T_DAT0_N - T_DAT0_N + T_RCVR_N;
// data bit 1 release time (write bit 0 - write bit 1 + recovery)
assign t_dat1 = owr_ovd ? T_DAT0_O - T_DAT1_O + T_RCVR_O : T_DAT0_N - T_DAT1_N + T_RCVR_N;
// data bit sampling time (write bit 0 - write bit 1 + recovery)
assign t_bits = owr_ovd ? T_DAT0_O - T_BITS_O + T_RCVR_O : T_DAT0_N - T_BITS_N + T_RCVR_N;

// end of cycle time
assign t_zero = 'd0;

//////////////////////////////////////////////////////////////////////////////
// bus read
//////////////////////////////////////////////////////////////////////////////

// bus segnemt - controll/status register
assign bus_rdt_ctl_sts = {irq_ena, irq_sts, 1'b0, owr_pwr[0], owr_cyc, owr_ovd, owr_rst, owr_dat};

// bus segnemt - power and select register
generate
  if (BDW==32) begin
    if (OWN>1) begin
      assign bus_rdt_pwr_sel = {{16-OWN{1'b0}}, owr_pwr, 4'h0, {4-SDW{1'b0}}, owr_sel};
    end else begin
      assign bus_rdt_pwr_sel = 24'h0000_00;
    end
  end else if (BDW==8) begin
    if (OWN>1) begin
      assign bus_rdt_pwr_sel = {{ 4-OWN{1'b0}}, owr_pwr,       {4-SDW{1'b0}}, owr_sel};
    end else begin
      assign bus_rdt_pwr_sel = 8'hxx;
    end
  end
endgenerate

// bus read data
generate if (BDW==32) begin
  assign bus_rdt = (bus_adr[0]==1'b0) ? {bus_rdt_pwr_sel, bus_rdt_ctl_sts} : (cdr_o << 16 | cdr_n);
end else if (BDW==8) begin
  assign bus_rdt = (bus_adr[1]==1'b0) ? ((bus_adr[0]==1'b0) ? bus_rdt_ctl_sts
                                                            : bus_rdt_pwr_sel)
                                      : ((bus_adr[0]==1'b0) ? cdr_n
                                                            : cdr_o          );
end endgenerate

//////////////////////////////////////////////////////////////////////////////
// bus write
//////////////////////////////////////////////////////////////////////////////

// combined write/read enable and address decoder
generate if (BDW==32) begin
  assign bus_ren_ctl_sts = bus_ren & bus_adr[0] == 1'b0;
  assign bus_wen_ctl_sts = bus_wen & bus_adr[0] == 1'b0;
  assign bus_wen_pwr_sel = bus_wen & bus_adr[0] == 1'b0;
  assign bus_wen_cdr_n   = bus_wen & bus_adr[0] == 1'b1;
  assign bus_wen_cdr_o   = bus_wen & bus_adr[0] == 1'b1;
end else if (BDW==8) begin
  assign bus_ren_ctl_sts = bus_ren & bus_adr[1:0] == 2'b00;
  assign bus_wen_ctl_sts = bus_wen & bus_adr[1:0] == 2'b00;
  assign bus_wen_pwr_sel = bus_wen & bus_adr[1:0] == 2'b01;
  assign bus_wen_cdr_n   = bus_wen & bus_adr[1:0] == 2'b10;
  assign bus_wen_cdr_o   = bus_wen & bus_adr[1:0] == 2'b11;
end endgenerate

//////////////////////////////////////////////////////////////////////////////
// clock divider
//////////////////////////////////////////////////////////////////////////////

// clock divider ratio registers
generate
  if (CDR_E) begin
    if (BDW==32) begin
      always @ (posedge clk, posedge rst)
      if (rst) begin
        cdr_n <= CDR_N;
        cdr_o <= CDR_O;
      end else begin
        if (bus_wen_cdr_n)  cdr_n <= bus_wdt[15: 0];
        if (bus_wen_cdr_o)  cdr_o <= bus_wdt[31:16];
      end
    end else if (BDW==8) begin
      always @ (posedge clk, posedge rst)
      if (rst) begin
        cdr_n <= CDR_N;
        cdr_o <= CDR_O;
      end else begin
        if (bus_wen_cdr_n)  cdr_n <= bus_wdt;
        if (bus_wen_cdr_o)  cdr_o <= bus_wdt;
      end
    end
  end else begin
    initial begin
      cdr_n = CDR_N;
      cdr_o = CDR_O;
    end
  end
endgenerate

// clock divider
always @ (posedge clk, posedge rst)
if (rst)        div <= 'd0;
else begin
  if (bus_wen)  div <= 'd0;
  else          div <= pls ? 'd0 : div + owr_cyc;
end

// divided clock pulse
assign pls = (div == (owr_ovd ? cdr_o : cdr_n));

//////////////////////////////////////////////////////////////////////////////
// power and select register
//////////////////////////////////////////////////////////////////////////////

// select and power register implementation
generate if (OWN>1) begin : sel_implementation
  // port select
  always @ (posedge clk, posedge rst)
  if (rst)                   owr_sel <= {SDW{1'b0}};
  else if (bus_wen_pwr_sel)  owr_sel <= bus_wdt[(BDW==32 ?  8 : 0)+:SDW];
  
  // power delivery
  always @ (posedge clk, posedge rst)
  if (rst)                   owr_pwr <= {OWN{1'b0}};
  else if (bus_wen_pwr_sel)  owr_pwr <= bus_wdt[(BDW==32 ? 16 : 4)+:OWN];
end else begin
  // port select
  initial                    owr_sel <= 'd0; 
  // power delivery
  always @ (posedge clk, posedge rst)
  if (rst)                   owr_pwr <= 1'b0;
  else if (bus_wen_ctl_sts)  owr_pwr <= bus_wdt[4];
end endgenerate

//////////////////////////////////////////////////////////////////////////////
// interrupt logic
//////////////////////////////////////////////////////////////////////////////

// bus interrupt
assign bus_irq = irq_ena & irq_sts;

// interrupt enable
always @ (posedge clk, posedge rst)
if (rst)                   irq_ena <= 1'b0;     
else if (bus_wen_ctl_sts)  irq_ena <= bus_wdt[7]; 

// transmit status (active after onewire cycle ends)
always @ (posedge clk, posedge rst)
if (rst)                           irq_sts <= 1'b0;
else begin
  if (bus_wen_ctl_sts)             irq_sts <= 1'b0;
  else if (pls & (cnt == t_zero))  irq_sts <= 1'b1;
  else if (bus_ren_ctl_sts)        irq_sts <= 1'b0;
end

//////////////////////////////////////////////////////////////////////////////
// onewire state machine
//////////////////////////////////////////////////////////////////////////////

assign req_ovd = OVD_E ? bus_wen_ctl_sts & bus_wdt[2] : 1'b0; 

// overdrive
always @ (posedge clk, posedge rst)
if (rst)                   owr_ovd <= 1'b0;
else if (bus_wen_ctl_sts)  owr_ovd <= req_ovd;

// reset
always @ (posedge clk, posedge rst)
if (rst)                   owr_rst <= 1'b0;
else if (bus_wen_ctl_sts)  owr_rst <= bus_wdt[1];

// transmit data, reset, overdrive
always @ (posedge clk, posedge rst)
if (rst)                           owr_dat <= 1'b0;
else begin
  if (bus_wen_ctl_sts)             owr_dat <= bus_wdt[0];
  else if (pls & (cnt == t_zero))  owr_dat <= owr_smp;
end

// onewire cycle status
always @ (posedge clk, posedge rst)
if (rst)                           owr_cyc <= 1'b0;
else begin
  if (bus_wen_ctl_sts)             owr_cyc <= bus_wdt[3] & ~&bus_wdt[2:0];
  else if (pls & (cnt == t_zero))  owr_cyc <= 1'b0;
end

// state counter (initial value depends whether the cycle is reset or data)
always @ (posedge clk, posedge rst)
if (rst)                 cnt <= 'd0;
else begin
  if (bus_wen_ctl_sts)   cnt <= (&bus_wdt[1:0] ? t_idl : bus_wdt[1] ? t_rst : t_bit) - 'd1;
  else if (pls)          cnt <= cnt - 'd1;
end

// receive data (sampling point depends whether the cycle is reset or data)
always @ (posedge clk)
if (pls) begin
  if      ( owr_rst & (cnt == t_rstp))  owr_smp <= owr_iln;  // presence detect
  else if (~owr_rst & (cnt == t_bits))  owr_smp <= owr_iln;  // read data bit
end

// output register (switch point depends whether the cycle is reset or data)
always @ (posedge clk, posedge rst)
if (rst)                                owr_oen <= 1'b0;
else begin
  if (bus_wen_ctl_sts)                  owr_oen <= ~&bus_wdt[1:0];
  else if (pls) begin
    if      (owr_rst & (cnt == t_rsth)) owr_oen <= 1'b0;  // reset
    else if (owr_dat & (cnt == t_dat1)) owr_oen <= 1'b0;  // write 1, read
    else if (          (cnt == t_dat0)) owr_oen <= 1'b0;  // write 0
  end
end

//////////////////////////////////////////////////////////////////////////////
// IO
//////////////////////////////////////////////////////////////////////////////

// only one 1-wire line cn be accessed at the same time
assign owr_e   = owr_oen << owr_sel;
// all 1-wire lines can be powered independently
assign owr_p   = owr_pwr;

// 1-wire line status read multiplexer
assign owr_iln = owr_i [owr_sel];

endmodule
module wishbone2bus #(
  parameter AW =  2,              // address width
  parameter DW = 32,              // data    width
  parameter SW = DW/8             // select  width
)(
  // Wishbone master port
  input  wire          wb_cyc,    // cycle
  input  wire          wb_stb,    // strobe
  input  wire          wb_we,     // write enable
  input  wire [AW-1:0] wb_adr,    // address
  input  wire [SW-1:0] wb_sel,    // byte select
  input  wire [DW-1:0] wb_dat_w,  // write data
  output wire [DW-1:0] wb_dat_r,  // read  data
  output wire          wb_ack,    // acknowledge
  output wire          wb_err,    // error
  output wire          wb_rty,    // retry
  // Avalon slave port
  output wire          bus_wen,   // write enable
  output wire          bus_ren,   // read  enable
  output wire [AW-1:0] bus_adr,   // address
  output wire [DW-1:0] bus_wdt,   // write data
  input  wire [DW-1:0] bus_rdt    // read  data
);

// bus write and read enable
assign bus_wen = wb_cyc & wb_stb &  wb_we;
assign bus_ren = wb_cyc & wb_stb & ~wb_we;

// address
assign bus_adr = wb_adr;

// write data
assign bus_wdt = wb_dat_w;

// read data
assign wb_dat_r = bus_rdt;

// error if not full width access else acknowledge
assign wb_ack =  &wb_sel;
assign wb_err = ~&wb_sel;
assign wb_rty =     1'b0;

endmodule
