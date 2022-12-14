//author :Renliang Gu
//Email: gurenliang@gmail.com
//note: if there are some errors, please feel free to contact me. Thank you very much!

//Next step, reduce the resource consumed

//version 0.5, defined many parameter to configure the IP core, making it easier to use.
//version 0.3, create this file to be a common included one for future use to config the IP core
//This file used to define some macro-varibles which can be used by all other files

//NOTE!!! Olny one of the following two definitions can be open
`define frameIDfromRx			//frameID comes from Rxmodule
//`define frameIDcount			//frameID counts for itself by adding one every frame

`define Preamble	64'hd555_5555_5555_5555

//The MAC address of this MAC IP core and the other terminal on the Ethernet, can be changed!
`define MAC_ADD		48'h0100_0000_0000	//mac address: 0x00-00-00-00-00-01
`define PC_MAC_ADD	48'hffff_ffff_ffff	//mac address of the other terminal

`define frameidlen 		24		//the id of the MAC frame
`define uframelen 		148 	//148-bit
`define num_uframe 		8		//the number of uframes received once
`define interval		8.25	//the interval between frames without send any data on fifo
											
`define da_offset		(8<<1)					//8 byte before
`define sa_offset		(`da_offset+(6<<1))		//8+6 bytes before
`define typelen_offset	(`sa_offset+(6<<1))
`define frameid_offset	(`typelen_offset+(2<<1))//index of first bit of frameid
`define data_offset		(`frameid_offset+(`frameidlen>>2))	
												//index of first bit of datamodule CRC_Module(Clk, Reset, Data, Enable, Initialize, Crc, CrcError); 

input Clk;
input Reset;
input [3:0] Data;		
input Enable;			//should be valid from the destination address until the data before the CRC checksum
input Initialize;		//need to initialize before data in

output [31:0] Crc;
output CrcError;

reg  [31:0] Crc;

wire [31:0] CrcNext;


assign CrcNext[0] = Enable & (Data[0] ^ Crc[28]); 
assign CrcNext[1] = Enable & (Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29]); 
assign CrcNext[2] = Enable & (Data[2] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[30]); 
assign CrcNext[3] = Enable & (Data[3] ^ Data[2] ^ Data[1] ^ Crc[29] ^ Crc[30] ^ Crc[31]); 
assign CrcNext[4] = (Enable & (Data[3] ^ Data[2] ^ Data[0] ^ Crc[28] ^ Crc[30] ^ Crc[31])) ^ Crc[0]; 
assign CrcNext[5] = (Enable & (Data[3] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[31])) ^ Crc[1]; 
assign CrcNext[6] = (Enable & (Data[2] ^ Data[1] ^ Crc[29] ^ Crc[30])) ^ Crc[ 2]; 
assign CrcNext[7] = (Enable & (Data[3] ^ Data[2] ^ Data[0] ^ Crc[28] ^ Crc[30] ^ Crc[31])) ^ Crc[3]; 
assign CrcNext[8] = (Enable & (Data[3] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[31])) ^ Crc[4]; 
assign CrcNext[9] = (Enable & (Data[2] ^ Data[1] ^ Crc[29] ^ Crc[30])) ^ Crc[5]; 
assign CrcNext[10] = (Enable & (Data[3] ^ Data[2] ^ Data[0] ^ Crc[28] ^ Crc[30] ^ Crc[31])) ^ Crc[6]; 
assign CrcNext[11] = (Enable & (Data[3] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[31])) ^ Crc[7]; 
assign CrcNext[12] = (Enable & (Data[2] ^ Data[1] ^ Data[0] ^ Crc[28] ^ Crc[29] ^ Crc[30])) ^ Crc[8]; 
assign CrcNext[13] = (Enable & (Data[3] ^ Data[2] ^ Data[1] ^ Crc[29] ^ Crc[30] ^ Crc[31])) ^ Crc[9]; 
assign CrcNext[14] = (Enable & (Data[3] ^ Data[2] ^ Crc[30] ^ Crc[31])) ^ Crc[10]; 
assign CrcNext[15] = (Enable & (Data[3] ^ Crc[31])) ^ Crc[11]; 
assign CrcNext[16] = (Enable & (Data[0] ^ Crc[28])) ^ Crc[12]; 
assign CrcNext[17] = (Enable & (Data[1] ^ Crc[29])) ^ Crc[13]; 
assign CrcNext[18] = (Enable & (Data[2] ^ Crc[30])) ^ Crc[14]; 
assign CrcNext[19] = (Enable & (Data[3] ^ Crc[31])) ^ Crc[15]; 
assign CrcNext[20] = Crc[16]; 
assign CrcNext[21] = Crc[17]; 
assign CrcNext[22] = (Enable & (Data[0] ^ Crc[28])) ^ Crc[18]; 
assign CrcNext[23] = (Enable & (Data[1] ^ Data[0] ^ Crc[29] ^ Crc[28])) ^ Crc[19]; 
assign CrcNext[24] = (Enable & (Data[2] ^ Data[1] ^ Crc[30] ^ Crc[29])) ^ Crc[20]; 
assign CrcNext[25] = (Enable & (Data[3] ^ Data[2] ^ Crc[31] ^ Crc[30])) ^ Crc[21]; 
assign CrcNext[26] = (Enable & (Data[3] ^ Data[0] ^ Crc[31] ^ Crc[28])) ^ Crc[22]; 
assign CrcNext[27] = (Enable & (Data[1] ^ Crc[29])) ^ Crc[23]; 
assign CrcNext[28] = (Enable & (Data[2] ^ Crc[30])) ^ Crc[24]; 
assign CrcNext[29] = (Enable & (Data[3] ^ Crc[31])) ^ Crc[25]; 
assign CrcNext[30] = Crc[26]; 
assign CrcNext[31] = Crc[27]; 


always @ (posedge Clk or posedge Reset)
begin
  if (Reset)
    Crc <=  32'hffffffff;
  else
  if(Initialize)
    Crc <=  32'hffffffff;
  else
    Crc <=  CrcNext;
end

assign CrcError = Crc[31:0] != 32'hc704dd7b;  // CRC not equal to magic number

endmodule
//author :gurenliang 
//Email: gurenliang@gmail.com
//note: if there are some errors, you are welcome to contact me. It would be the best appreciation to me.


//version 0.3 correct some minor errors
//version 0.3 add the option of frameID mode, by include common.v and judge the macro-varible frameIDfromRx
//The top layer module provided full functions
`include "common.v"

module EthernetModule(reset, clk_10K, 
					ff_clk, ff_en_source, ff_en_sink, ff_data_source, ff_data_sink,  //ff_clk should be a 270.33KHz clock
					phy_rxd, phy_rxen, phy_rxclk, phy_rxer,
					phy_txd, phy_txen, phy_txclk, phy_txer,
					phy_reset, phy_col, phy_linksts, phy_crs,
					test1, test2, test3, test4
					);
	input reset, clk_10K, ff_clk;
	output phy_reset, test1, test2, test3, test4;
	
	input ff_en_sink, ff_data_sink;		//sink is used to receive data from the demodulate module
	output ff_en_source, ff_data_source;//source is used to provide the modulation module with data get from ethernet
	
	input[3:0] phy_rxd;			//MII interface for the phy chip
	input phy_rxclk, phy_rxer;
	
	output[3:0] phy_txd;
	output phy_txer, phy_txen;
	
	//declare them as inout port because when powerup reset, they act as output pins to config DM9161
	//after reset, phy_txclk and phy_rxen must be input ports
	inout phy_txclk, phy_col, phy_rxen, phy_linksts, phy_crs;
	
	wire out_en;	
	wire rxen_in, txclk_in;
	
	`ifdef frameIDfromRx
		wire[23:0] frameid;		//share the frameid between TxModule and RxModule
	`endif
	
	wire empty, start;
	
	InitModule initModule_inst(.init_clk(clk_10K), .reset(reset), .phy_reset(phy_reset), .out_en(out_en));
	
	tri_state  tri_state_inst1(.d_in(txclk_in	), .d_out(1'b0), .out_en(out_en), .ioport(phy_txclk));
	tri_state  tri_state_inst2(.d_in(			), .d_out(1'b0), .out_en(out_en), .ioport(phy_col));
	tri_state  tri_state_inst3(.d_in(rxen_in	), .d_out(1'b0), .out_en(out_en), .ioport(phy_rxen));
	tri_state  tri_state_inst4(.d_in(			), .d_out(1'b0), .out_en(out_en), .ioport(phy_linksts));
	tri_state  tri_state_inst5(.d_in(			), .d_out(1'b1), .out_en(out_en), .ioport(phy_crs));
		
	TxModule TxModule_inst(.reset(out_en),
				.phy_txd(phy_txd), .phy_txen(phy_txen), .phy_txclk(txclk_in), .phy_txer(phy_txer),
				.ff_clk(ff_clk), .ff_en(ff_en_sink), .ff_data(ff_data_sink), 
				`ifdef frameIDfromRx
				.frameid(frameid), 
				`endif
				.start(start),
				.test1(), .test2(), .test3(), .test4());
				//.test1(test1), .test2(test2), .test3(test3), .test4(test4));

	RxModule RxModule_inst(.phy_rxd(phy_rxd), .phy_rxen(rxen_in), .phy_rxclk(phy_rxclk), .phy_rxer(phy_rxer),
				.ff_clk(ff_clk), .ff_data(ff_data_source), .ff_en(ff_en_source), 
				`ifdef frameIDfromRx
				.frameid(frameid), 
				`endif
				.start(start),
				//.test1(), .test2(), .test3(), .test4());
				.test1(test1), .test2(test2), .test3(test3), .test4(test4));
				
endmodule
//author :gurenliang
//Email: gurenliang@gmail.com 
//note: if there are some errors, you are welcome to contact me. It would be the best appreciation to me.

//This module incharge of the generation of the reset signal for PHY chip
//and hold low for at least 10ms.
module InitModule(init_clk, reset, phy_reset, out_en);
	input init_clk, reset;			//init_clk should be 10KHz
	output phy_reset, out_en;
	
	reg [6:0] init_cnt=7'h0;
	reg phy_reset=1'b1;
	
	assign  out_en = (init_cnt<7'h75) ?  1'b1:1'b0;
	
	always @ (posedge init_clk or posedge reset) begin
		if(reset)
			init_cnt <= 7'h0;
		else if (init_cnt <7'h7f) begin
			init_cnt <= init_cnt+7'h1;
			case (init_cnt)
			7'h02:	phy_reset <= 1'b0;
			7'h66: phy_reset <= 1'b1;
			default:phy_reset <= phy_reset;
			endcase
		end
	end
endmodule
//author :Renliang Gu
//Email: gurenliang@gmail.com
//note: if there are some errors, please feel free to contact me. Thank you very much!

//Next step, reduce the resource consumed

//version 0.5, defined many parameter to configure the IP core, making it easier to use.
//vertion 0.4, add the function for TxModule to get start in a configurable ff_clk time after 
//				RxModule receiving the first frame. To modify the delay time just to 
//				change the value of the macro-variable delay_cnt_config.
//version 0.3, changed the changes made by version 0.2 back
//version 0.2, set empty when ff_data_buf_index's less significant bits is 3'b111 or 3'b000

`include "common.v"

`define IDXlen			3		//2^IDXlen should be the number of cyclic queue
`define queue_len		(1<<3)	//define the length of the cyclic queue

`define rx_crc_offset	(`data_offset+(`uframelen*`num_uframe/4))	//index of first bit of crc
`define rx_total_len	(`rx_crc_offset + (4<<1))
`define rxdata_len		(`uframelen*`num_uframe/4)

`define delay_cnt_config	8	//the initiation value for the delay_cnt

module RxModule(phy_rxd, phy_rxen, phy_rxclk, phy_rxer,
				ff_clk, ff_data, ff_en, 
				
				`ifdef frameIDfromRx
					frameid, 
				`endif
				
				start,
				test1, test2, test3, test4
				);
	input phy_rxen, phy_rxclk, phy_rxer;	//MII interface
	input [3:0] phy_rxd;
	
	input ff_clk;			//270.8333KHz
	output ff_data, ff_en;
	
	`ifdef frameIDfromRx
		output[`frameidlen-1:0] frameid;
		reg[`frameidlen-1:0] frameid;
	`endif
	
	output start;			//to tell TxModule that buf in RxModule needs data
	output test1, test2, test3, test4;
	reg test1, test2;
	
	parameter delay_cnt_len =   (`delay_cnt_config <    2) ? 1 : (`delay_cnt_config <    4) ? 2 :
								(`delay_cnt_config <    8) ? 3 : (`delay_cnt_config <   16) ? 4 :
								(`delay_cnt_config <   32) ? 5 : (`delay_cnt_config <   64) ? 6 :
								(`delay_cnt_config <  128) ? 7 : 8;
	parameter nibble_idx_len = 	(`rx_total_len<=   2)?  1 : (`rx_total_len<=   4)?  2 :
								(`rx_total_len<=   8)?  3 : (`rx_total_len<=  16)?  4 :
								(`rx_total_len<=  32)?  5 : (`rx_total_len<=  64)?  6 :
								(`rx_total_len<= 128)?  7 : (`rx_total_len<= 256)?  8 :
								(`rx_total_len<= 512)?  9 : (`rx_total_len<=1024)? 10 : 
								(`rx_total_len<=2048)? 11 : 12;
	parameter ff_idx_len = 	(`rxdata_len<=   2)? 1 : (`rxdata_len<=   4)? 2 :
							(`rxdata_len<=   8)? 3 : (`rxdata_len<=  16)? 4 :
							(`rxdata_len<=  32)? 5 : (`rxdata_len<=  64)? 6 :
							(`rxdata_len<= 128)? 7 : (`rxdata_len<= 256)? 8 :
							(`rxdata_len<= 512)? 9 : (`rxdata_len<=1024)?10 :
							(`rxdata_len<=2048)?11 : 12;							
	parameter frameid_idx_len = ((`frameidlen>>2)<=  2)? 1 : ((`frameidlen>>2)<=  4)? 2 :
								((`frameidlen>>2)<=  8)? 3 : ((`frameidlen>>2)<= 16)? 4 :
								((`frameidlen>>2)<= 32)? 5 : ((`frameidlen>>2)<= 64)? 6 : 
								((`frameidlen>>2)<= 64)? 7 : 8;
	parameter ff_cnt_len  =	(`uframelen <    2) ? 1 : (`uframelen <    4) ? 2 :
							(`uframelen <    8) ? 3 : (`uframelen <   16) ? 4 :
							(`uframelen <   32) ? 5 : (`uframelen <   64) ? 6 :
							(`uframelen <  128) ? 7 : (`uframelen <  256) ? 8 :
							(`uframelen <  512) ? 9 : (`uframelen < 1024) ? 10:
							(`uframelen < 2048) ? 11: (`uframelen < 4096) ? 12:
							(`uframelen < 8192) ? 13: 14;
	
	reg ff_data;
	reg ff_en;

	reg[ff_cnt_len-1:0] ff_cnt;
	reg[2:0] ff_d;
	
	reg start=1'b0;
	reg start_intra=1'b0;
	reg[delay_cnt_len-1:0] delay_cnt;
	
	reg[3:0] gap_cnt;
	reg[1:0] gap_len_ctl;
	reg[1:0] cycle;
	
	reg[3:0] rxdata_buf [0:(`rxdata_len*`queue_len+1)];	//more ram for special usage
	wire[ff_idx_len+`IDXlen-1:0] rxdata_buf_writer_address;
	reg[ff_idx_len+`IDXlen-1:0] rxdata_buf_reader_address;
	
	reg[`frameidlen-1:0] frameid_buf[0:(`queue_len-1)];
	
	reg[nibble_idx_len-1:0] nibble_idx;
	reg[ff_idx_len-1:0] ff_idx;
	
	reg[`IDXlen-1:0] rxIDX, ffIDX;
	
	reg bad_da;
	reg queue_empty;
	
	reg[2:0] rxState = 0;
	parameter s_preamble = 0, s_address = 1, s_typelen = 2, 
				s_frameid = 3, s_data = 4, s_crc = 5;
	reg[1:0] ff_state = 0;
	parameter ffs_idle = 0, ffs_transfer = 1, ffs_gap = 2;
	
	wire[47:0] mac_add;
	wire[3:0] da[0:11];
	assign mac_add = `MAC_ADD;
	assign da[ 0] = mac_add[ 3: 0];
	assign da[ 1] = mac_add[ 7: 4];
	assign da[ 2] = mac_add[11: 8];
	assign da[ 3] = mac_add[15:12];
	assign da[ 4] = mac_add[19:16];
	assign da[ 5] = mac_add[23:20];
	assign da[ 6] = mac_add[27:24];
	assign da[ 7] = mac_add[31:28];
	assign da[ 8] = mac_add[35:32];
	assign da[ 9] = mac_add[39:36];
	assign da[10] = mac_add[43:40];
	assign da[11] = mac_add[47:44];
	
	assign test4 = start_intra;
	assign test3 = start;

	always@(posedge phy_rxclk)begin			//control the increasing of nibble_idx;
		if(phy_rxen & ~phy_rxer)			//data is valid and no error
			nibble_idx <= nibble_idx + 1;
		else
			nibble_idx <= 0;
	end
	
	always@(posedge phy_rxclk)begin
		if(phy_rxen & ~phy_rxer)
			case (rxState)
				s_preamble:
					if(nibble_idx == `da_offset-1)		rxState <= s_address;
					else 								rxState <= s_preamble;
				
				s_address: 
					if(nibble_idx == `typelen_offset-1)	rxState <= s_typelen;
					else								rxState <= s_address;
				
				s_typelen:
					if(nibble_idx == `frameid_offset-1)	rxState <= s_frameid;
					else								rxState <= s_typelen;
				
				s_frameid:
					if(nibble_idx == `data_offset-1)	rxState <= s_data;
					else								rxState <= s_frameid;
			
				s_data:
					if(nibble_idx == `rx_crc_offset-1)		rxState <= s_crc;
					else								rxState <= s_data;
	
				s_crc:
					if(nibble_idx == `rx_total_len-1)		rxState <= s_preamble;
					else								rxState <= s_crc;
					
				default: 								rxState <= rxState;
			endcase
		else
			rxState <= s_preamble;
	end
	
	assign rxdata_buf_writer_address = rxIDX*`rxdata_len + nibble_idx - `data_offset;
	
	always@(posedge phy_rxclk)begin			//receive data from Ethernet including the preamble, SFD and CRC
		if(phy_rxen & ~phy_rxer) begin		//data is valid and no error
			case (rxState)
				s_preamble: test1 <= ~test1;
				s_address:
					if((phy_rxd!=da[nibble_idx-`da_offset])&(nibble_idx < `sa_offset))
						bad_da <= 1;
	
				s_frameid: begin
					if(nibble_idx==`frameid_offset) begin 
						rxIDX <= phy_rxd[2:0];
						frameid_buf[phy_rxd[2:0]][(`frameidlen-1):(`frameidlen-4)]  <= phy_rxd;
					end else
						frameid_buf[rxIDX] <= {phy_rxd, frameid_buf[rxIDX][(`frameidlen-1):4]};
				end
				
				s_data: begin
					//test2 <= ~test2;
					rxdata_buf[rxdata_buf_writer_address] <= phy_rxd;
				end
			endcase
		end	else if ((nibble_idx == `rx_total_len ) & (!bad_da)) begin
		//one frame has been transfered over, the destinate address is right and then been put into the buffer
			start_intra <= 1;
		end	else
			bad_da <= 0;
	end
	
	always@(negedge ff_clk) begin
		case(ff_state)
			ffs_idle: begin			//wait the first frame to come
				gap_len_ctl <= 0;
				if(start_intra)	ff_state <= ffs_transfer;
				else ff_state <= ffs_idle;
			end
				
			ffs_transfer: begin
				if(ff_cnt == `uframelen-1)begin	//every `uframelen bit need a gap
					ff_state <= ffs_gap;
					gap_len_ctl <= gap_len_ctl + 1;
				end	
				else ff_state <= ffs_transfer;
			end
			ffs_gap: begin
				if(((gap_len_ctl == 0)&(gap_cnt == 8)) | ((gap_len_ctl != 0)&(gap_cnt == 7)))
					ff_state <=ffs_transfer;
				else ff_state <= ffs_gap;
			end
		endcase
	end
	
	always@(negedge ff_clk) begin				//flow the data out of the buffer
		case(ff_state)
			ffs_idle: begin
				ff_cnt <= 0;
				delay_cnt <= 0;
				cycle <= 0;
				ff_en <= 0;
				ff_idx <= 0;
				ffIDX <= rxIDX + 1;
				start <= 0;
				rxdata_buf_reader_address <= ffIDX*`rxdata_len+ff_idx;
			end
						
			ffs_transfer: begin
				`ifdef frameIDfromRx
					frameid <= frameid_buf[ffIDX];
				`endif
				if(delay_cnt == `delay_cnt_config) start <= 1;
				delay_cnt <= delay_cnt + 1;
				gap_cnt <= 0;
				ff_cnt <= ff_cnt + 1;
				cycle <= cycle + 1;
				ff_en <= 1;
				
				if(cycle==0) begin
					{ff_d[2:0],ff_data} <= rxdata_buf[rxdata_buf_reader_address];
					if(ff_idx == `rxdata_len-1)begin
						if(ffIDX!=rxIDX) begin
							queue_empty <= 0;
							if(queue_empty) begin
								ffIDX <= rxIDX + ((`delay_cnt_config==0)? 1:2) ;
								rxdata_buf_reader_address <= (rxIDX + ((`delay_cnt_config==0)? 1:2))*`rxdata_len;
							end
							else begin
								ffIDX <= ffIDX + 1;
								rxdata_buf_reader_address <= (ffIDX+1)*`rxdata_len;
							end
						end else begin
							rxdata_buf_reader_address <= ffIDX*`rxdata_len;
							queue_empty <= 1;
						end
						ff_idx <= 0;
					end
					else begin
						ff_idx <= ff_idx + 1;	
						rxdata_buf_reader_address <= ffIDX*`rxdata_len+ff_idx+1;
					end
				end else
					{ff_d[1:0],ff_data} <= ff_d;
			end
			
			ffs_gap: begin		//the 8.25 bit gap is implement by (3*8+9)/4
				ff_en <= 0;
				ff_data <= 0;
				ff_cnt <= 0;
				gap_cnt <= gap_cnt + 1;
			end
		endcase
	end
endmodule//author :Renliang Gu
//Email: gurenliang@gmail.com
//note: if there are some errors, please feel free to contact me. Thank you very much!

//version 0.4, the test_feedback is created, main task is to test the top module, EthernetModule.v
//				the ff_data_source is feed back to ff_data_sink

module test_feedback(reset, clk_in, 
					phy_rxd, phy_rxen, phy_rxclk, phy_rxer,
					phy_txd, phy_txen, phy_txclk, phy_txer,
					phy_reset, phy_col, phy_linksts, phy_crs,
					test1, test2, test3, test4
					);
	input reset, clk_in;
	output phy_reset, test1, test2, test3, test4;
	
	input[3:0] phy_rxd;			//MII interface for the phy chip
	input phy_rxclk, phy_rxer;
	
	output[3:0] phy_txd;
	output phy_txer, phy_txen;
	
	//declare them as inout port because when powerup reset, they act as output pins to config DM9161
	//after reset, phy_txclk and phy_rxen must be input ports
	inout phy_txclk, phy_col, phy_rxen, phy_linksts, phy_crs;
	
	wire ff_en, ff_data;
	wire clk_10K, ff_clk;
	
	EthernetModule EthernetModule_inst(.reset(reset), .clk_10K(clk_10K), 
					.ff_clk(ff_clk), .ff_en_source(ff_en), .ff_en_sink(1'b1), 
					.ff_data_source(ff_data), .ff_data_sink(ff_data),  //ff_clk should be a 270.33KHz clock
					.phy_rxd(phy_rxd), .phy_rxen(phy_rxen), .phy_rxclk(phy_rxclk), .phy_rxer(phy_rxer),
					.phy_txd(phy_txd), .phy_txen(phy_txen), .phy_txclk(phy_txclk), .phy_txer(phy_txer),
					.phy_reset(phy_reset), .phy_col(phy_col), .phy_linksts(phy_linksts), .phy_crs(phy_crs),
					.test1(test1), .test2(test2), .test3(test3), .test4(test4)
					);
					
	pll	pll_inst (
	.inclk0 ( clk_in ),
	.c0 ( clk_10K ),
	.c1 ( ff_clk )
	);

endmodule
//author :gurenliang 
//Email: gurenliang@gmail.com
//note: if there are some errors, you are welcome to contact me. It would be the best appreciation to me.

module tri_state(d_in, d_out, out_en, ioport);
	input d_out, out_en;			//init_clk should be 10KHz
	output d_in;
	inout ioport;
	
	assign ioport = (out_en) ?  d_out:1'bz;
	assign d_in = ioport;
endmodule
//author :Renliang Gu
//Email: gurenliang@gmail.com
//note: if there are some errors, please feel free to contact me. Thank you very much!


//Next step, add ff_data control to show the IP is busy

//version 0.3, declared a new variable data_av, and use it to start sending frame.
//version 0.3, delete the usage of pre_buf, and rename the pre to preaddlt
//version 0.3, add the option of frameID mode, by include common.v and judge the macro-varible frameIDfromRx
//This module is used to receive data from the demodulate module and send the data to the Ethernet PHY chip

`include "common.v"

`define tx_crc_offset	(`data_offset+((`uframelen+8)*`num_uframe/4)+2)	//index of first bit of crc
`define tx_total_len	(`tx_crc_offset + (4<<1))

`define txdata_len		   (((`uframelen+8)*`num_uframe/4)+2)
`define less_than_a_nibble 1	//0.25*8=2
`define last_cycle_val	2		//0.25*8=2

`define preaddlt_len	(`data_offset<<2)

module TxModule(reset, phy_txd, phy_txen, phy_txclk, phy_txer,
				ff_clk, ff_en, ff_data,

				`ifdef frameIDfromRx
					frameid, 
				`endif
				
				start,
				test1, test2, test3, test4);
	parameter nibble_idx_len = 	(`tx_total_len<=  2)? 1 : (`tx_total_len<=  4)? 2 :
								(`tx_total_len<=  8)? 3 : (`tx_total_len<= 16)? 4 :
								(`tx_total_len<= 32)? 5 : (`tx_total_len<= 64)? 6 :
								(`tx_total_len<=128)? 7 : (`tx_total_len<=256)? 8 :
								(`tx_total_len<=512)? 9 : (`tx_total_len<=1024)? 10 :
								(`tx_total_len<=2048)? 11 : 12;
	parameter ff_idx_len = 	(`txdata_len<=  2)? 1 : (`txdata_len<=  4)? 2 :
							(`txdata_len<=  8)? 3 : (`txdata_len<= 16)? 4 :
							(`txdata_len<= 32)? 5 : (`txdata_len<= 64)? 6 :
							(`txdata_len<=128)? 7 : (`txdata_len<=256)? 8 :
							(`txdata_len<=512)? 9 : (`txdata_len<=1024)? 10 : 11;

	input phy_txclk, reset;
	input ff_clk, ff_en, ff_data;	//ff_clk should be 207.83333KHz
	
	`ifdef frameIDfromRx
		input[`frameidlen-1:0] frameid;			//get the frameid information from RxModule
		reg[`frameidlen-1:0] frameid_buf[0:1];
	`endif
	`ifdef frameIDcount
		reg[`frameidlen-1:0] frameid=0;
	`endif
	reg[`frameidlen-1:0] frameid_reg;
	
	input  start;					//decide whether should give out the "need-data" ethernet package
	output [3:0] phy_txd;			//MII
	output phy_txen, phy_txer;
	
	output test1, test2, test3, test4;
	reg test1;//, test2, test3, test4;
	
	reg[3:0] phy_txd;
	reg phy_txen;
	
	reg[`preaddlt_len-1:0] preaddlt;
	
	reg[3:0] txdata_buf[0:`txdata_len*2-1];	//two buffer helps to step over different frame seamlessly
	reg[ff_idx_len:0] txdata_buf_reader_address;
		
	reg[nibble_idx_len-1:0] nibble_idx;
	wire data_av;
	
	reg Enable_Crc, Initialize_Crc;		//declare the variables for the CRC module
	wire [3:0] Data_Crc;
	wire CrcError;
	wire [31:0] Crc;
	
	wire txIDX;
	reg[1:0] cycle;
	reg ffIDX, ffIDX1, ffIDX2;
	reg[ff_idx_len-1:0] ff_idx;
	reg[2:0] ff_d;
	
	// Declare state register
	reg	[2:0]txState;
	parameter s_idle = 3'h0, s_preamble = 3'h1, s_address = 3'h2, s_data = 3'h3, s_crc =3'h4;
	
	assign test2 = txState[2];
	assign test3 = txState[1];
	assign test4 = txState[0];
	
	always @ (posedge ff_clk) begin		//receive data from demodulate module every bit one by one
		if(ff_en & start) begin
			`ifdef frameIDfromRx
				if((ff_idx==0)&&(cycle==0)) frameid_buf[ffIDX] <= frameid;
			`endif
			
			cycle <= cycle + 1;			 
			if((cycle==3)||
				((cycle == `last_cycle_val-1)&&(ff_idx==(`txdata_len-1-`less_than_a_nibble)))) begin
				
				txdata_buf[ffIDX*`txdata_len+ff_idx] <= ({ff_data,ff_d}>>(3-cycle));
				if (ff_idx == (`txdata_len-1-`less_than_a_nibble)) begin
					ffIDX <= ~ffIDX;
					ff_idx <= 0;
					cycle <= 0;
					//every time a frame being sent, frameID increases one
					`ifdef frameIDcount
						frameid <= frameid + 1;
					`endif
				end
				else begin
					ff_idx <= ff_idx + 1;
				end
				
			end else begin
				ff_d <= {ff_data, ff_d[2:1]};
			end
		end
		else begin
			ff_idx <= 0;
			cycle <= 0;
		end
	end
	
	assign phy_txer = 1'b0;
	assign data_av = ffIDX1 ^ ffIDX2;
	assign txIDX = ~ffIDX;
	
	always @ (negedge phy_txclk) begin 	//state machine run to send out the MAC frame
		ffIDX2 <= ffIDX1;
		ffIDX1 <= ffIDX;
	end
	
	// Determine the next state
	always @ (negedge phy_txclk) begin	//state machine run to send out the MAC frame
		if (reset)
			txState <= s_idle;
		else begin
			case (txState)
				s_idle: begin		//wait to be trigged
					test1 <= ~test1;
					if(data_av) begin	//once be trigged, prepare the data to send
						txState <= s_preamble;
					end
					else txState <= s_idle;
				end
				
				s_preamble:			//send the preambles
					if(nibble_idx == `da_offset-1)
						txState <= s_address;
					else
						txState <= s_preamble;
						
				s_address: begin		//send the destination address, source address and type
					if(nibble_idx== `data_offset-1)
						txState <= s_data;
					else
						txState <= s_address;
				end
				s_data:					//send data to PHY, every time four bits, lower bits go first
					//test2 <= ~test2;
					if (nibble_idx == `tx_crc_offset-1)
						txState <= s_crc;
					else txState <= s_data;
				
				s_crc:
					if (nibble_idx == `tx_total_len-1)
						txState <= s_idle;
					else txState <= s_crc;
				
				default: 
					txState <= s_idle;
			endcase
		end
	end
	
	always @ (negedge phy_txclk) begin 	//state machine run to send out the MAC frame
		if (reset)
			nibble_idx <= 0;
		else if(txState==s_idle)
			nibble_idx <= 0;
		else
			nibble_idx <= nibble_idx + 1;
	end
	
	always @ (negedge phy_txclk) begin 	//state machine run to send out the MAC frame
		if (reset)
			phy_txd <= 4'h0;
		else 
			case (txState)
				s_idle: begin
					//already stored MAC preamble, dest address and source address from right to left. 
					//decide whether should ask PC for new frame
					/*if(empty) preaddlt <= {16'h0008, `MAC_ADD, `PC_MAC_ADD, `Preamble};	
					else*/
					`ifdef frameIDfromRx
						preaddlt <= {frameid_buf[txIDX], 16'h0000, `MAC_ADD, `PC_MAC_ADD, `Preamble};
					`endif
					`ifdef frameIDcount
						preaddlt <= {frameid, 16'h0000, `MAC_ADD, `PC_MAC_ADD, `Preamble};
					`endif
				end
				s_preamble:
					{preaddlt[`preaddlt_len-5:0], phy_txd} <= preaddlt;
				s_address: begin
					{preaddlt[`preaddlt_len-5:0], phy_txd} <= preaddlt;
					txdata_buf_reader_address <= (txIDX*(`txdata_len));
				end
				s_data: begin
					txdata_buf_reader_address <= (txIDX*(`txdata_len))+nibble_idx-`data_offset+1;
					phy_txd <= txdata_buf[txdata_buf_reader_address];
				end
				s_crc: begin
					phy_txd[3] <= ~Crc[28];	//Special, the usage of the CRC_Module
					phy_txd[2] <= ~Crc[29];
					phy_txd[1] <= ~Crc[30];
					phy_txd[0] <= ~Crc[31];
				end
				default:
					phy_txd <= 4'h0;
			endcase
	end
	
	always @ (negedge phy_txclk) begin 	//state machine run to send out the MAC frame
		if (reset)
			phy_txen <= 1'b0;
		else if((txState==s_preamble)||(txState==s_address)||(txState==s_data)||(txState==s_crc))
			phy_txen <= 1'b1;
		else
			phy_txen <= 1'b0;
	end
	
	always @ (negedge phy_txclk) begin 	//state machine run to send out the MAC frame
		if (reset)
			Initialize_Crc <= 1'b0;
		else if(txState==s_preamble)
			Initialize_Crc <= 1'b1;		//prepare the CRC_Module for the following addresses
		else
			Initialize_Crc <= 1'b0;
	end
	
	always @ (negedge phy_txclk) begin 	//state machine run to send out the MAC frame
		if (reset)
			Enable_Crc <= 1'b0;
		else if((txState==s_address)||(txState==s_data))
			Enable_Crc <= 1'b1;		//enable the CRC_Module
		else
			Enable_Crc <= 1'b0;
	end

	assign Data_Crc[0] = phy_txd[3];	//input prepare for CRC_Module
	assign Data_Crc[1] = phy_txd[2];
	assign Data_Crc[2] = phy_txd[1];
	assign Data_Crc[3] = phy_txd[0];
	
	// Connecting module Crc
	CRC_Module txcrc (.Clk(phy_txclk), .Reset(reset), .Data(Data_Crc), .Enable(Enable_Crc), .Initialize(Initialize_Crc), 
               .Crc(Crc), .CrcError(CrcError));
              
endmodule