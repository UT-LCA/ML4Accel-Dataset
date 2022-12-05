`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:02:15 11/13/2009 
// Design Name: 
// Module Name:    iotools 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module porta(dataout, datain, mode, extinout);
	output [7:0] dataout;
	input [7:0] datain;
	input mode;
	inout [7:0] extinout;
	assign dataout=(mode==1)?extinout:8'bz; //input to i8255
	assign extinout=(mode==0)?datain:8'bz; //output
endmodule
module portb(dataout, datain, mode, extinout);
	output [7:0] dataout;
	input [7:0] datain;
	input mode;
	inout [7:0] extinout;
	assign dataout=(mode==1)?extinout:8'bz;
	assign extinout=(mode==0)?datain:8'bz;
endmodule
module portc(dataout, datain, mode, extinout);
	output [3:0] dataout;
	input [3:0] datain;
	input [3:0] mode;
	inout [3:0] extinout;
	assign dataout[0:0]=(mode[0:0])?extinout[0:0]:1'bz;
	assign dataout[1:1]=(mode[1:1])?extinout[1:1]:1'bz;
	assign dataout[2:2]=(mode[2:2])?extinout[2:2]:1'bz;
	assign dataout[3:3]=(mode[3:3])?extinout[3:3]:1'bz;
	assign extinout[0:0]=(mode[0:0])?1'bz:datain[0:0];
	assign extinout[1:1]=(mode[1:1])?1'bz:datain[1:1];
	assign extinout[2:2]=(mode[2:2])?1'bz:datain[2:2];
	assign extinout[3:3]=(mode[3:3])?1'bz:datain[3:3];
endmodule

module pactl(dataout, datain, portaio, portcio, signals, cw, sel);
	//Group A control
	output [7:0] dataout;
	output reg [3:0] signals;
	input [7:0] datain;
	inout [7:0] portaio; //external port
	inout [3:0] portcio; //-//-
	input [3:0] cw;      //control word
	input [1:0] sel;     //selection
	wire [7:0] portadatain;
	reg [7:0] portadataout;
	wire [3:0] portcdatain;
	reg [3:0] portcdataout;
	reg oflag; //control a input to i8255 core
	reg ocflag; //control c input
	reg [7:0] buffer; //internal latch
	reg [3:0] cbuffer; //internal latch for port c
	reg [3:0] pccw; //control each of 4 wires of port c
	reg pacw;       //0-output, 1 -input
	reg [3:0] pcio;
	reg bitctl;
	reg [1:0] intmode; //mode:0-normal, 1- strob, 2-extra
	reg awflag; //external output enabled
	reg cwflag; //-//-
	porta pa1(.dataout(portadatain), .datain(portadataout), .mode(pacw), .extinout(portaio));
	portc pch(.dataout(portcdatain), .datain(portcdataout), .mode(pccw), .extinout(portcio));
	//read data to internal bus supports latches
	assign dataout=(oflag)?(intmode==0)?portadatain:
		buffer:(ocflag)?(intmode==0)?{portcdatain, 4'bz}:
		{cbuffer, 4'bz}:8'bz;
	//assign portadata=(awflag)?buffer:8'bz; //send data to porta
	//assign portcdata=(cwflag)?cbuffer:4'bz;//send data to hight 4 bits of port c
	always @(negedge sel[0:0]) begin
		oflag<=0;
		ocflag<=0;
	end
	always @(posedge sel[0:0]) begin
		case (cw)
			4'h1: begin //write cw
				oflag=0;
				ocflag=0;
				awflag=0;
				cwflag=0;
				//wait_data();
				if (datain[7:7]==0) begin
					//set bits in port c
					if (datain[0:0]) bitctl=1;
					else bitctl=0;
					case(datain[3:1])
						3'b000: pcio[0:0]=bitctl;
						3'b001: pcio[1:1]=bitctl;
						3'b010: pcio[2:2]=bitctl;
						3'b011: pcio[3:3]=bitctl;
						default: pcio=0;
					endcase
				end
				else begin
					//setup group
					case (datain[6:5])
						2'b00: begin
							//simple io mode
							intmode=0; //no latched input
							pacw=datain[4:4];
							awflag=~pacw;
							if (pacw==0) portadataout=0;
							if (datain[3:3]==0) begin
								pccw=0;
								portcdataout=0;
								end
							else begin
								pccw=4'b1111;
							end
							cwflag=~datain[3:3];
							end
						2'b01: begin
							intmode=1;
							pccw[0:0]=0;//intrb-->
							pccw[1:1]=0;//ibfb-->
							pccw[2:2]=1;//nSTBB<--
							pccw[3:3]=0;//no val
							end
						2'b10: intmode=2;
						default: intmode=2;
					 endcase
					 end
					end
				4'h2: begin //write port a
					portadataout=datain;
					oflag=0;
					ocflag=0;
					awflag=1;
					end
				4'h3: begin //read port a
					if (intmode!=0) buffer=portadatain;
					awflag=0;
					oflag=1;
					end
				4'h4: begin //write port c
					portcdataout=datain[7:4];
					oflag=0;
					ocflag=0;
					cwflag=1;
					end
				4'h5: begin //read port c
					if(intmode!=0) cbuffer=portcdatain;
					cwflag=0;
					oflag=0;
					ocflag=1;
					end
				endcase
			end
endmodule 

module pbctl(dataout, datain, portbio, portcio, signals, cw, sel);
	//Group B control
	output [7:0] dataout;
	output reg [3:0] signals;
	input [7:0] datain;
	inout [7:0] portbio; //external port
	inout [3:0] portcio; //-//-
	input [3:0] cw;      //control word
	input [1:0] sel;     //selection
	wire [7:0] portbdatain;
	reg [7:0] portbdataout;
	wire [3:0] portcdatain;
	reg [3:0] portcdataout;
	reg oflag; //control a input to i8255 core
	reg ocflag; //control c input
	reg [7:0] buffer; //internal latch
	reg [3:0] cbuffer; //internal latch for port c
	reg [3:0] pccw; //control each of 4 wires of port c
	reg pbcw;       //0-output, 1 -input
	reg [3:0] pcio;
	reg bitctl;
	reg [1:0] intmode; //mode:0-normal, 1- strob, 2-extra
	reg bwflag; //external output enabled
	reg cwflag; //-//-
	porta pb1(.dataout(portbdatain), .datain(portbdataout), .mode(pbcw), .extinout(portbio));
	portc pcl(.dataout(portcdatain), .datain(portcdataout), .mode(pccw), .extinout(portcio));
	//read data to internal bus supports latches
	assign dataout=(oflag)?(intmode==0)?portbdatain:
		buffer:(ocflag)?(intmode==0)?{4'bz, portcdatain}:
		{4'bz, cbuffer}:8'bz;
	//assign portbdata=(bwflag)?buffer:8'bz; //send data to porta
	//assign portcdata=(cwflag)?cbuffer:4'bz;//send data to hight 4 bits of port c
	always @(negedge sel[1:1]) begin
		oflag<=0;
		ocflag<=0;
	end
	always @(posedge sel[1:1]) begin
		case (cw)
			4'h1: begin //write cw
				oflag=0;
				ocflag=0;
				bwflag=0;
				cwflag=0;
				if (datain[7:7]==0) begin
					//set bits in port c
					if (datain[0:0]) bitctl=1;
					else bitctl=0;
					case(datain[3:1])
						3'b100: pcio[0:0]=bitctl;
						3'b101: pcio[1:1]=bitctl;
						3'b110: pcio[2:2]=bitctl;
						3'b111: pcio[3:3]=bitctl;
						default: pcio=0;
					endcase
				end
				else begin
					//setup group
					case (datain[2:2])
						1'b0: begin
							//simple io mode
							intmode=0; //no latched input
							pbcw=datain[1:1];
							bwflag=~pbcw;
							if (pbcw==0) portbdataout=0;
							if (datain[0:0]==0) begin
								pccw=0;
								portcdataout=0;
								end
							else begin
								pccw=4'b1111;
							end
							cwflag=~datain[0:0];
							end
						1'b01: begin
							intmode=1;
							pccw[0:0]=0;//intrb-->
							pccw[1:1]=0;//ibfb-->
							pccw[2:2]=1;//nSTBB<--
							pccw[3:3]=0;//no val
							end
						default: intmode=1;
					 endcase
					 end
					end
				4'h2: begin //write port a
					portbdataout=datain;
					oflag=0;
					ocflag=0;
					bwflag=1;
					end
				4'h3: begin //read port a
					if (intmode!=0) buffer=portbdatain;
					bwflag=0;
					oflag=1;
					end
				4'h4: begin //write port c
					portcdataout=datain[3:0];
					oflag=0;
					ocflag=0;
					cwflag=1;
					end
				4'h5: begin //read port c
					if(intmode!=0) cbuffer=portcdatain;
					cwflag=0;
					oflag=0;
					ocflag=1;
					end
				endcase
			end
endmodule

module i8255(data, reset, ncs, nrd, nwr, addr, pa, pb, pch, pcl);
	//main trigger events is nrd and nwr
	//after all operation this ones must be set to 1 both
	//ncs - selects device
	//WARNING:
	//you must setup 'data' bus first before sending nWR
	//because iSIM has issue with inout assignment delay 
	inout [7:0] data; //data to/from chip
	input reset;
	input ncs; //inverted CS
	input nrd; //inverted RD
	input nwr; //inverted WR
	input [1:0] addr; //2 bits addr(A0,A1)
	inout [7:0] pa;   //port a
	inout [7:0] pb;   //port b
	inout [3:0] pch;  //port c hight 4 bits
	inout [3:0] pcl;  //port c low 4 bits
	reg [1:0] firststep;
	reg [2:0] nextstep;
	reg [7:0] mode;
	wire [7:0] bufferin;
	reg [7:0] bufferout;
	reg [7:0] intdata;
	reg iflag; //move to 'data'
	reg oflag; //output to 'buffer'
	reg extrai;
	reg extrao;
	reg [1:0] sel;
	//wire [7:0] odata;
	//group A
	wire [3:0] grasigs;
	reg [3:0] gracw;
	//group B
	wire [3:0] grbsigs;
	reg [3:0] grbcw;
	assign data=(iflag)?bufferin:(extrai)?intdata:8'bz;
	pactl grpa(.dataout(bufferin), .datain(bufferout), .portaio(pa), .portcio(pch),
		.signals(grasigs), .cw(gracw), .sel(sel));
	pbctl grpb(.dataout(bufferin), .datain(bufferout), .portbio(pb), .portcio(pcl),
		.signals(grbsigs), .cw(grbcw), .sel(sel));
	always @(posedge reset) begin
				oflag<=0;
				extrao<=1;
				mode<=8'h9b;
				firststep<=0;
				nextstep<=0;
				iflag<=0;
				extrai<=0;
				intdata<=8'h9b;
				gracw<=1;//init group A
				grbcw<=1;//init group B
				bufferout=8'h9b;
				sel<=3;
				end
	always @(negedge reset) begin
		sel<=0;
		extrai<=0;
		extrao<=0;
		gracw<=0;
		grbcw<=0;
		end
	always @(negedge nwr) begin
		//write event
		if(ncs==0) begin
			case(addr)
				//control register
				2'b11: begin //write - control
					if (data[7:7]==0) begin
						gracw<=1;
					end
					else begin
						//send mode to the all groups
						iflag<=0;
						extrai<=0;
						oflag<=0;
						mode<=data;
						intdata<=data;
						bufferout<=data;
						gracw<=1;
						grbcw<=1;
						sel<=3;
					end
					end
				2'b00: begin//write - porta
					$display("Value: %b", data);
					oflag<=1;
					gracw<=2;
					bufferout<=data;
					sel<=3;
					end
				2'b01: begin //write - portb
					oflag<=1;
					grbcw<=2;
					bufferout<=data;
					sel<=3;
					end
				2'b10: begin//write - portc
					oflag<=1;
					gracw<=4;
					grbcw<=4;
					bufferout<=data;
					sel<=3;
					end
			 endcase
			end
	end
	always @(posedge nwr) begin
		//write completed event
		if(ncs==0) begin
			extrao<=0;
			extrai<=0;
			firststep<=0;
			nextstep<=0;
			iflag<=0;
			oflag<=0;
			gracw<=0;
			grbcw<=0;
			sel<=0;
		end
	end
	always @(negedge nrd) begin
		//read event
		if(ncs==0) begin
			case (addr)
				2'b11: begin//read - control
					intdata<=mode;
					iflag<=0;
					oflag<=0;
					extrai<=1;
					end
				2'b00: begin //read - porta
					iflag<=1;
					gracw<=3;
					sel<=1;
					end
				2'b01: begin//read - portb
					iflag<=1;
					grbcw<=3;
					sel<=1;
					end
				2'b10: begin//read - portc
					iflag<=1;
					gracw<=5;
					grbcw<=5;
					sel<=3;
					end
			 endcase
			end
	end
	always @(posedge nrd) begin
		//read completed event
		if(ncs==0) begin
			extrao<=0;
			extrai<=0;
			firststep<=0;
			nextstep<=0;
			iflag<=0;
			oflag<=0;
			gracw<=0;
			grbcw<=0;
			sel<=0;
		end
	end
endmodule	`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:16:54 11/16/2009
// Design Name:   i8255
// Module Name:   /home/malasar/projects/fpga/i8080/tsti8255.v
// Project Name:  i8080
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: i8255
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

	
module tsti8255;

	// Inputs
	reg reset;
	reg ncs;
	reg nrd;
	reg nwr;
	reg [1:0] addr;
	// Bidirs
	wire [7:0] data;
	wire [7:0] pa;
	reg pae;
	wire [7:0] pb;
	reg pbe;
	wire [3:0] pch;
	reg pche;
	wire [3:0] pcl;
	reg pcle;
	wire clk;
	reg oflag;
	reg pause;
	reg [7:0] newval;
	reg [7:0] step;
	reg [7:0] wrtport;
	reg [7:0] resetret;
	reg [7:0] writeret;
   clck clk1(clk);
	// Instantiate the Unit Under Test (UUT)
	i8255 uut (
		.data(data), 
		.reset(reset), 
		.ncs(ncs), 
		.nrd(nrd), 
		.nwr(nwr), 
		.addr(addr), 
		.pa(pa), 
		.pb(pb), 
		.pch(pch), 
		.pcl(pcl)
	);

	initial begin
		// Initialize Inputs
		reset <= 1;
		pae<=0;
		pche<=0;
		wrtport<=0;
		ncs <= 1;
		nrd <= 1;
		nwr <= 1;
		addr <= 2'b11;
		oflag<=0;
		newval<=0;
		step<=6;
		resetret<=0;
		writeret<=0;
		#10 $finish();
        
		// Add stimulus here

	end
	assign data=(oflag)?newval:8'bz;
	assign pa=(pae)?wrtport:8'bz;
	assign pch=(pche)?wrtport[7:4]:8'bz;
		
	always @(posedge clk) begin
		if (reset==1) begin
			ncs<=0;
			reset<=0; //#2
			end
		else begin
			case (step)
				0: begin
					newval<=8'b10000000; //#4
					oflag<=1;
					step<=33;
					resetret<=2;
					writeret<=32;
					ncs<=0;
					end
				2: begin
				   newval<=8'h35; //#10
					oflag<=1;
					addr<=0;
					step<=33;
					resetret<=3;
					writeret<=32;
					end
				3: begin
				   newval<=8'h0;
					nrd<=1;
					nwr<=1;
					step<=4;
					end
				4: begin
					newval<=8'b10100000;
					addr<=2;
					nrd<=1;
					nwr<=0;
					step<=5;
					end
				6: begin
					newval<=8'b10010000; //a-output, c -input //#4
					addr<=3;
					oflag<=1;
					pae<=0;
					step<=33;
					resetret<=7;
					writeret<=32;
					end
				7: begin
					wrtport<=8'b11010000; //#10
					pae<=1;
					//pche=1;
					oflag<=0;
					addr<=0;
					nrd<=0;
					nwr<=1;
					step<=32;
					resetret<=8;
					end
				8: begin
					newval<=8'b10100000;
					//pae=0;
					pche<=1;
					oflag<=1;
					addr<=0;
					nrd<=1;
					nwr<=0;
					step<=10;
					end
				9: begin
					pae<=0;
					addr<=0;
					nrd<=0;
					nwr<=1;
					step<=10;
					end
				32: begin //reset step
					oflag<=0;
					nrd<=1;
					nwr<=1;
					step<=resetret;
					end
				33: begin //write routine
					nwr<=0;
					nrd<=1;
					step<=writeret;
					end
					
			endcase
			end
		end
		
      
endmodule

