`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:31 03/10/2009 
// Design Name: 
// Module Name:    CheckDNA 
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
module CheckDNA(
input				clk4,
input				reset,
input [63:0] 	DNA_64,			// The DNA code
input 			dna_valid,

input [15:0]	ROM_Data,		// ROM data
input				IDE_CS,			// chip select killer signal
output reg		DNA_ENA,				// the enable signal to reduce power consumption
output reg		DNA_REG,				// enable output register for faster RAM access
output reg [9:0]	DNA_Addr,			// RAM address

output			dna_pass,		// result of check
output [3:0]	KILL					// Killing signals
);

// Result of check
// DNA_FailR[0] = set to 1 if (XOR check sum is not zero) or (DNA address in [1018-1022] does not match with local DNA)
// DNA_FailR[1] = set to 1 if {DNA address in [1018-1022] not match with local DNA)
// DNA_FailR[2] = set to 1 if (
// DNA_FailR[3] = set to 1 if
// parameter no_of_ran_no = 1021; // for server1104
parameter no_of_ran_no = 1016;	// For Server1108

reg	[15:0]	xor_check;		// overall check key of the XOR 
reg	[63:0]	dna;				// local dna code	
reg	[9:0]		L_Addr;		// the addres of the check code
reg	[15:0]	check;			// the content of the check code
reg	multi_ce;				// enable the multiplier signal
reg [4:0]  dna_gen_st;		// dna state machine
reg	[3:0]		DNA_FailR;		// dna failing reigster

parameter DcIdle	= 5'b00000;
parameter Dc01		= 5'b00001;
parameter Dc02		= 5'b00010;
parameter Dc03		= 5'b00011;
parameter Dc04		= 5'b00100;
parameter Dc10		= 5'b00101;
parameter Dc11		= 5'b00110;
parameter Dc12		= 5'b00111;
parameter Dc13		= 5'b01000;
parameter Dc14		= 5'b01001;
parameter Dc20		= 5'b01010;
parameter Dc21		= 5'b01011;
parameter Dc22		= 5'b01100;
parameter Dc23		= 5'b01101;
parameter Dc24		= 5'b01110;
parameter Dc25		= 5'b01111;
parameter Dc26		= 5'b10000;
parameter Dc27		= 5'b10001;
parameter Dc28		= 5'b10010;
parameter Dc29		= 5'b10011;
parameter Dc30		= 5'b10100;
parameter Dc31		= 5'b10101;
parameter Dc32		= 5'b10110;
parameter Dc33		= 5'b10111;
parameter Dc34		= 5'b11000;
parameter Dc35		= 5'b11001;
parameter Dc90		= 5'b11010;
parameter Dc91		= 5'b11011;
parameter Dc92		= 5'b11100;

reg	[15:0] multi_a;
reg	[15:0] multi_b;
reg	[15:0] Simp_XOR;		// simple XOR register
reg	FinishCheck;			// flip flop to show checking is finished
wire	[15:0] multi_p;		// output of register
wire	[15:0] ma;				// input feed of multi_a
wire	[15:0] mb;				// input feed of multi_b
wire	K_WINDOW;				// wire key window

///////////////////////////////////////////////////////////////

multi_16 inst_multi_16 (
	.ce(multi_ce),
	.clk(clk4),
	.a(multi_a), // Bus [15 : 0] 
	.b(multi_b), // Bus [15 : 0] 
	.p(multi_p)); // Bus [15 : 0] 

// Server1104 = algorithm
//Multi_A = XOR_REG(	DNA_64(18,24) + DNA_64(26,28) + DNA_64(30,32) + DNA_64(33,39)),
//							Multi_P(0,6) + Multi_P(8, 10) + Multi_P(6, 8) + Multi_P(10, 16));
//Multi_B = XOR_REG(ROM_Data(0,16), DNA_64(48,64));
//assign ma[15:10]	= multi_p[15:10]	^ dna[45:40];		// Multi_P(0,6) ^ DNA_64(18,24)
//assign ma[9:8]		= multi_p[7:6]		^ dna[37:36];		// Multi_P(8,10) ^ DNA_64(26,28)
//assign ma[7:6]		= multi_p[9:8]		^ dna[33:32];		// Multi_P(6,8) ^ DNA_64(30,32)
//assign ma[5:0]		= multi_p[5:0]		^ dna[30:25];		// Multi_P(10,16) ^ DNA_64(33,39)
//assign mb[15:0]	= ROM_Data[15:0]	^ dna[15:0];		// ROM_Data(0,16) ^ DNA_64(48,64)

// Server1108 = algorithm
//Multi_A = XOR_REG(	DNA_64(16,22) + DNA_64(26,28) + DNA_64(30,32) + DNA_64(33,39)),
//							Multi_P(0,6) + Multi_P(8, 10) + Multi_P(6, 8) + Multi_P(10, 16));
//Multi_B = XOR_REG(ROM_Data(0,16), DNA_64(44,60));
assign ma[15:10]	= multi_p[15:10]	^ dna[47:42];		// Multi_P(0,6) ^ DNA_64(16,22)
assign ma[9:8]		= multi_p[7:6]		^ dna[37:36];		// Multi_P(8,10) ^ DNA_64(26,28)
assign ma[7:6]		= multi_p[9:8]		^ dna[33:32];		// Multi_P(6,8) ^ DNA_64(30,32)
assign ma[5:0]		= multi_p[5:0]		^ dna[30:25];		// Multi_P(10,16) ^ DNA_64(33,39)
assign mb[15:0]	= ROM_Data[15:0]	^ dna[20:4];		// ROM_Data(0,16) ^ DNA_64(44,60)

/////////////////////// Killing signals ////////////////////
assign	KILL[0]	=  DNA_FailR[0];			// Fail register to output the signal
assign	KILL[1]	= ~DNA_FailR[0] & DNA_FailR[1] & K_WINDOW & Simp_XOR[2];		// If someone modify the Fail 0, then we create new fail for them
assign	KILL[2]	= ~DNA_FailR[0] & ~DNA_FailR[1] & DNA_FailR[2] & K_WINDOW & ~Simp_XOR[2];
assign	KILL[3]	= ~DNA_FailR[0] & ~DNA_FailR[1] & DNA_FailR[3] & K_WINDOW &  Simp_XOR[2];
assign	K_WINDOW	= Simp_XOR[9] & Simp_XOR[8] & ~Simp_XOR[7] & Simp_XOR[6] & ~Simp_XOR[5] & ~Simp_XOR[3];
assign	dna_pass	= FinishCheck & ~DNA_FailR[3] & ~DNA_FailR[2] & ~DNA_FailR[1] & ~DNA_FailR[0];

always @(posedge clk4) begin
	if(reset) begin
		DNA_Addr		<= 10'b00_0000_0000;		// address of ROM_Data
		L_Addr	<= 10'b00_0000_0000;		// address of check_code
		xor_check 	<= 16'b0000_0000_0000_0000;	// the XOR A bus check code
		multi_a	 	<= 16'b0000_0000_0000_0000;	// the two multipliers check code
		multi_b	 	<= 16'b0000_0000_0000_0000;	// the two multipliers bus check code
		Simp_XOR		<= 16'b0000_0000_0000_0000;	// simple XOR register
		DNA_FailR	<= 4'b0000;							// clear the fail register
		FinishCheck	<= 1'b0;								// clear the check phase
		DNA_ENA		<= 1'b0;
		DNA_REG		<= 1'b0;
		multi_ce		<= 1'b0;
		dna_gen_st	<= DcIdle;			// start in the idle state
	end else begin
		case(dna_gen_st)
//// ===== state 0, wait until dna code is valid ============
//// Formulate a dna_check_key to combat zero code attack
		DcIdle	: begin
			if(dna_valid == 1'b1) begin
				dna_gen_st	<= Dc01;
			end
		end
		Dc01	: begin
			DNA_ENA		<= 1'b1;			// enable reading the ROM
			multi_ce	<= 1'b1;			// flush the multiplier with 0s
			dna		<= DNA_64;			// clock in the main register
			dna_gen_st	<= Dc02;
		end
		Dc02	: begin
			DNA_ENA		<= 1'b0;			// disable reading the ROM
			DNA_REG		<= 1'b1;			// fetch first ROM data to bus
			dna_gen_st	<= Dc03;
		end
		Dc03	: begin
			DNA_REG		<= 1'b0;
			dna_gen_st	<= Dc04;
		end
		Dc04	: begin
			multi_ce				<=  1'b0;			// multiplier completely flushed
			multi_a[15:0]		<=  ma[15:0];
			multi_b[15:0]		<=  mb[15:0];
			L_Addr[9]		<= ~mb[10];			// mult address is stable now
			L_Addr[8:0]	<=  mb[10:2];		// check address is between 256-767
			dna_gen_st			<=  Dc10;				// go to the main loop
		end
//// ====== Check on the data block ===========
	Dc10: begin
		DNA_REG		<= 1'b0;
		dna_gen_st	<= Dc11;			// next state
	end	
	Dc11: begin
		multi_ce			<= 1'b1;
		multi_a[15:0]	<= ma[15:0];			// activate the multipliers
		multi_b[15:0]	<= mb[15:0];
		dna_gen_st		<= Dc12;			// next state
	end	
	Dc12:	begin
		dna[63:1]		<= dna[62:0];
		dna[0]			<= dna[63] ^ ROM_Data[1];	// bitwise rotate the data
		DNA_ENA			<= 1'b0;							// save power for the ROM
		if (DNA_Addr == L_Addr)	check <= multi_a;	// store up the value of check instance
		DNA_Addr			<= DNA_Addr + 1;					// proceed to next address
		Simp_XOR[15:0]	<= Simp_XOR[15:0] ^ ROM_Data[15:0];		// mask the registers
		xor_check		<= xor_check ^ multi_b;		// the xor algorithm is base on dna XOR ROM_Data
		dna_gen_st		<= Dc13;
	end
	Dc13:	begin
		DNA_ENA			<= 1'b1;							// enable back the ROM
		dna_gen_st		<= Dc14;
	end
	Dc14:	begin
		DNA_ENA			<= 1'b0;							// disable ROM access
		DNA_REG			<= 1'b1;							// enable back the ROM and reg
		if (DNA_Addr == no_of_ran_no) begin
			DNA_Addr			<= DNA_Addr + 1;					// advance the address
			dna_gen_st 	<= Dc20;							// go to the result phase
		end else begin
			dna_gen_st	<= Dc10;							// loop back for new computation
		end
	end
//// ======================================================
	Dc20	: begin											// DNA_Addr = 1016
		multi_ce			<= 1'b0;							// save some power
		DNA_REG			<= 1'b0;							// lock down the reg
		DNA_ENA			<= 1'b1;							// clock out the data to register side
		dna_gen_st		<= Dc21;
	end
	Dc21	: begin
		Simp_XOR[15:0]	<= Simp_XOR[15:0] ^ ROM_Data[15:0];		// mask the registers
		if (multi_a != ROM_Data) begin
			DNA_FailR[3]	<= 1'b1;						// 3rd level fail
		end
		DNA_REG			<= 1'b1;							// clock out the data to compare
		DNA_ENA			<= 1'b0;							// lock down the RAM area
		DNA_Addr				<= DNA_Addr+1;						// pipe the new address 1017 to RAM
		dna_gen_st		<= Dc22;
	end
	Dc22	: begin											// DNA_Addr = 1017
		DNA_REG			<= 1'b0;							// lock down the reg
		DNA_ENA			<= 1'b1;							// clock out the data to register side
		dna_gen_st		<= Dc23;
	end
	Dc23	: begin
		Simp_XOR[15:0]	<= Simp_XOR[15:0] ^ ROM_Data[15:0];		// mask the registers
		if (xor_check != ROM_Data) begin
			DNA_FailR[2]	<= 1'b1;						// 2nd level fail
		end
		DNA_REG			<= 1'b1;							// clock out the data to compare
		DNA_ENA			<= 1'b0;							// lock down the RAM area
		DNA_Addr				<= DNA_Addr+1;						// pipe the new address to RAM
		dna_gen_st		<= Dc24;
	end
////////
	Dc24	: begin											// DNA_Addr = 1018
		DNA_REG			<= 1'b0;							// lock down the reg
		DNA_ENA			<= 1'b1;
		dna_gen_st		<= Dc25;
	end
	Dc25	: begin											// DNA_Addr = 1018
		Simp_XOR[15:0]	<= Simp_XOR[15:0] ^ ROM_Data[15:0];		// mask the registers
		if (check != ROM_Data) begin
			DNA_FailR[1]	<= 1'b1;						// set the general fail
		end
		DNA_REG			<= 1'b1;							// clock out the data to compare
		DNA_ENA			<= 1'b0;							// lock down the RAM area
		DNA_Addr			<= DNA_Addr+1;						// pipe the new address to RAM
		dna_gen_st		<= Dc26;
	end
//////////
	Dc26	: begin											// DNA_Addr = 1019
		DNA_REG			<= 1'b0;							// lock down the reg
		DNA_ENA			<= 1'b1;
		dna_gen_st		<= Dc27;
	end
	Dc27	: begin											// DNA_Addr = 1019
		Simp_XOR[15:0]	<= Simp_XOR[15:0] ^ ROM_Data[15:0];		// mask the registers
		if (DNA_64[63:48] != ROM_Data[15:0]) begin
			DNA_FailR[0]	<= 1'b1;
		end
		DNA_REG			<= 1'b1;							// clock out the data to compare
		DNA_ENA			<= 1'b0;							// lock down the RAM area
		DNA_Addr				<= DNA_Addr+1;						// pipe the new address to RAM
		dna_gen_st		<= Dc28;
	end
//////////
	Dc28	: begin											// DNA_Addr = 1020
		DNA_REG			<= 1'b0;							// lock down the reg
		DNA_ENA			<= 1'b1;
		dna_gen_st		<= Dc29;
	end
	Dc29	: begin											// DNA_Addr = 1020
		Simp_XOR[15:0]	<= Simp_XOR[15:0] ^ ROM_Data[15:0];		// mask the registers
		if (DNA_64[47:32] != ROM_Data[15:0]) begin
			DNA_FailR[0]		<= 1'b1;
		end
		DNA_REG			<= 1'b1;							// clock out the data to compare
		DNA_ENA			<= 1'b0;							// lock down the RAM area
		DNA_Addr				<= DNA_Addr+1;						// pipe the new address to RAM
		dna_gen_st		<= Dc30;
	end
//////////
	Dc30	: begin											// DNA_Addr = 1021
		DNA_REG			<= 1'b0;							// lock down the reg
		DNA_ENA			<= 1'b1;
		dna_gen_st		<= Dc31;
	end
	Dc31	: begin											// DNA_Addr = 1021
		Simp_XOR[15:0]	<= Simp_XOR[15:0] ^ ROM_Data[15:0];		// mask the registers
		if (DNA_64[31:16] != ROM_Data[15:0]) begin
			DNA_FailR[0]	<= 1'b1;
		end
		DNA_REG			<= 1'b1;							// clock out the data to compare
		DNA_ENA			<= 1'b0;							// lock down the RAM area
		DNA_Addr				<= DNA_Addr+1;						// pipe the new address to RAM
		dna_gen_st		<= Dc32;
	end
//////////
	Dc32	: begin											// DNA_Addr = 1022
		DNA_REG			<= 1'b0;							// lock down the reg
		DNA_ENA			<= 1'b1;							// read from ram
		dna_gen_st		<= Dc33;
	end
	Dc33	: begin											// DNA_Addr = 1022
		Simp_XOR[15:0]	<= Simp_XOR[15:0] ^ ROM_Data[15:0];		// mask the registers
		if (DNA_64[15:0] != ROM_Data[15:0]) begin
			DNA_FailR[0]	<= 1'b1;
		end
		DNA_REG			<= 1'b1;							// clock out the data to compare
		DNA_ENA			<= 1'b0;							// lock down the RAM area
//		DNA_Addr				<= DNA_Addr+1;						// pipe the new address to RAM
		dna_gen_st		<= Dc34;
	end
//////////
	Dc34	: begin											// DNA_Addr = 1023
		DNA_REG			<= 1'b0;							// lock down the reg
//		DNA_ENA			<= 1'b1;
		dna_gen_st		<= Dc35;
	end
	Dc35	: begin											// DNA_Addr = 1023
		if (Simp_XOR[15:0] != ROM_Data[15:0]) begin
			DNA_FailR[0]	<= 1'b1;
		end
//		DNA_REG			<= 1'b1;							// clock out the data to compare
//		DNA_ENA			<= 1'b0;							// lock down the RAM area
//		DNA_Addr				<= DNA_Addr+1;						// pipe the new address to RAM
		FinishCheck		<= 1'b1;							// exit the check phase
		dna_gen_st		<= Dc90;
	end
///// ============= result found loop here forever
	Dc90:	begin
		if	(IDE_CS == 1'b0) begin
			dna_gen_st	<= Dc91;
		end else begin
			dna_gen_st	<= Dc90;					// loop here if CS is 1
		end
	end
//////
	Dc91:	begin
		Simp_XOR			<= Simp_XOR + 1;					// increment the Simp_XOR to generate the internal kill signal
		dna_gen_st		<= Dc92;
	end
//////
	Dc92:	begin
		if	(IDE_CS == 1'b1) begin
			dna_gen_st	<= Dc90;						// if 1 goto next state
		end else begin
			dna_gen_st	<= Dc92;						// loop here if CS is 0
		end
	end

//// ===================================
	default : begin
		dna_gen_st		<= DcIdle;						// loop back to idle
	end
//// =================================
	endcase
	end	/// reset
end //// clock
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:18 09/05/2008 
// Design Name: 
// Module Name:    chip - Behavioral 
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


module chip(
	inout [15:0] iD	,
	// iD15..8	= LQFP(32);LQFP(31);LQFP(30);LQFP(29);LQFP(28);LQFP(27);LQFP(25);LQFP(24);
	// iD7..0	= LQFP(49);LQFP(48);LQFP(47);LQFP(46);LQFP(21);LQFP(20);LQFP(19);LQFP(42);
	output [2:0] iA,
	// iA2 = I50(3)/LQFP(8);		iA1 = I50(5)/LQFP(5);		iA0 = I50(4)/LQFP(7);
	output ibCS0		, 			// LQFP(10)/I50(2)
	output ibCS1		, 			// LQFP(11)/I50(1)
	output ibRST		, 			// LQFP(121)/I50(50)
	input	iIRQ		,   			// LQFP(12)/I50(6) ( needs pull up)
	output ibWr		,				// LQFP(3)/I50(14)
	output ibRd		,				// LQFP(6)/I50(12)
	input iDQ 		,   			// LQFP(18)/I50(16)(1) DMA request - (need pull low) drive inform chip that it wishes to do DMA
	output ibDK		, 				// LQFP(4)/I50(8)(0) DMA acknoledge - chip inform drive that DMA is in progress
	input iRdy		,   			// LQFP(16)/I50(10)(1) high - will means IO channel ready, (needs pull up)
	input ibDASP	,   			// LQFP(13)/I50(7)(0) low - will shows drive is active
//////- the CN110 interface
	input CLKin		,  			// LQFP(129)/J110(81) = 36.6MHz (27.27nS clock pulses)
	input bCSRST	,  			// LQFP(69)/J110(49)power on is high
	input bCRST		,  			// LQFP(70)/J110(52)actual reset signal
	inout [15:0] cDP		,  	// data bus
	// cDP(15..8) = LQFP/J110 = (114/2,113/6,112/8,111/12,110/14,105/18,104/20,103/24)
	// cDP(7 ..0) = LQFP/J100 = (102/26,101/30,99/32,98/36,120/38,117/42,116/44,115/48)
	inout [15:0] cAP		, 	// address bus
	// cAP(15..8) = LQFP/J110 = (96/1,93/3,92/7,91/9,90/13,88/15,87/19,85/21)
	// cAP(7 ..0) = LQFP/J110 = (84/25,83/27,82/31,79/33,78/37,77/39,76/43,75/45)
//
	input bcCS		,  		// LQFP(50)/J110(72)
	input bcWr		,  		// LQFP(60)/J110(73)
	input bcRd		,  		// LQFP(58)/J110(77)
	input bCRT		,  		// LQFP(51)/J110(70)
//
	output	bcWait 	, 		// LQFP(64)/J110(59) ** high a 120ns pulse
	output	bcIRQ		, 		// LQFP(68)/J110(55) ** high at int9 
	output	cDQ		, 		// LQFP(54)/J110(66)
	input		cDK		,  	// LQFP(55)/J110(62)
//
	output	DR245		,		// LQFP(45)
	output	OE245		,		// LQFP(43)
//

////- the following signals are connected but never change
	input ACS_LED  ,  		// LQFP(63)/J110(90) measured high always (pull-high)
	input HDD_ACK  ,  		// LQFP(59)/J110(92) measured high always (pull-high)
////- the following signals are unconnected in the original board
//	input INP1		,			// LQFP(33)
//	input INP2		,			// LQFP(35)
//	input INP3		,			// LQFP(53)
//	input INP4		,			// LQFP(80)
//	input INP5		,			// LQFP(97)
//	input INP6		,			// LQFP(123)
//	input INP7		,			// LQFP(140)
	inout		TFD0	,			// LQFP(124)	TFlash SD D0 (I/OPP) or SPI Data Out (OPP)
	inout		TFD1	,			// LQFP(125)	TFlash SD D1 (I/OPP) or SPI reserve
	inout 	TFD2	,			// LQFP(126)	TFlash SD D2 (I/OPP) or SPI reserve
	inout		TFD3	,			// LQFP(127)	TFlash SD D3 (I/OPP) or SPI Chip Select bCS (I)
	output	TFCLK	,			// LQFP(130)	TFlash CLK
	input		TFSENSE	,		// LQFP(131)	TFlash Sense ( low if TF inserted )
	output	TFCMD		,		// LQFP(132)	TFlash Command		or SPI Data In (I)

// Fixed signals for connecting the SPI external flash
//	FbCS,FMOSI,FDIN,FCCLK {LQFP(41,62,71,72)}
//
// testing signals
//
	output	JT_Result		,		// LQFP(44)
	output	JT_Pin1		,		// LQFP(37)
	input		JT_bTest				// LQFP(38)
);

wire DCM_RST,CLK1,CLK4,DCM_LOCKED ;

reg DWrite;
wire IDERd,IDEWr;
reg iIRQ1;
reg iDQ1,SiIRQ,SiDQ;
wire iDMARd,iDMAWr ;
wire BufEmpty ;
wire PA_HvSpace,PA_OD_Rdy ;
wire PB_HvSpace,PB_OD_Rdy ;
wire WithinBBlock,BBurstEnd;
wire WithinABlock;

wire iCS0,iCS1,cWr,cRd,iWr,iRd,iDK ;
wire [15:0] RegData;
wire [31:0] DMARAMQ;
reg  [31:0] DMARAMD;
reg  [15:0] DIn1,DIn2;
wire cDMA_OE ;
wire cRdt;		// tri-state control signal
wire RegEB;		// the register control signal 


//////
//wire RegSC,RegCMD	_vector(7 downto 0);
//////-=============================================
//// read only registers ( logical wire groups )
wire	[7:0] Reg0038 ;
//// wire	Reg0002,Reg0004,Reg000E _vector(7 downto 0);
wire	[15:0] Reg0028 ;
//// write only registers
//wire Reg002C,Reg0070,Reg0072,Reg0074	_vector(7 downto 0);
////- read write registers //// =====================
reg	[7:0] Reg002A;
wire [7:0] Reg002E;
reg [7:0] Reg0064;
////////- ===========================================
//wire AICtrl,DICtrl ;
wire cDOE,cAOE ;
wire IDE_CS;
reg DMA_ARM,DMARMC,PS2WrIDE ;
wire PA_AlmostFull ;
wire [3:0] BufSize;
reg [2:0] R44;
wire INT9,INT9OE,DMA_IrqCond;
reg DMA_IrqMask, DMA_IrqFF;		// set high if DMA IRQ condition met
wire DMA_IrqCTRL ;
wire bHardReset;
reg ATV1,ATV2,ATV;
wire UDMAC,CmdIsEF,UDMA_SEL,MDMA_SEL,D_UnChg ;
reg R42Is03,R44Is2X,R44Is4X;
wire [2:0] UDMA,MDMA;
reg  [2:0] UDO;
reg [2:1] MDO;

wire Combo_CS,Combo_OE ;
reg cWr1,cRd1,ScWr,ScRd,ScWr1,ScRd1 ;
wire [15:0] cAi,cDi,CRC_Q,iDi,iDO,DOutA;
wire iDOEnb,CRC_MUX ;
wire IDEiOE,iDMA_OE ;
reg [6:0] cRgA;
reg [7:0] cRgD;
wire cRgRd2E,cRgWr;
reg bcRd2E;
reg cRgWrEnb ;
reg [5:0] Rd2ECnt;
reg [3:0] cWaitCnt;
reg cWait;
//// wire BusMatch ;
wire iD_245_In,IDE_Rd_Env ;	// standard logic for envelop
reg SiRdy2,SiRdy1; // a short input buffer
reg IgnoreIRdyPin;		// if IORDY from the drive is always low, then ignore it in normal IDE IO-Read Write cycles
reg Ph0,Ph1,Ph2,Phase3;

wire Reg002E_0, Reg002E_1, Reg002E_2, Reg002E_3, Reg002E_5, Reg002E_6, Reg002E_7;
reg Reg002E_4;
assign Reg002E = {Reg002E_7, Reg002E_6, Reg002E_5, Reg002E_4, Reg002E_3, Reg002E_2, Reg002E_1, Reg002E_0};
//wire ProbeOut ;
//wire ClrDMAPulse,ClrD1,ClrD2 ;
//// =====================
//wire	IDE_INTF_STATE,IDE_DMA_STATE,PS2_DMA_STATE _vector(15 downto 0);
//wire	D_RAM_ReportOut _vector(15 downto 0);
//wire	D_RAM_ReportIn	 _vector(1 downto 0);
//wire	ReportOut		_vector(15 downto 0);
//wire	ReportC			_vector(5 downto 0);
//wire   R380016			_VECTOR(15 DOWNTO 0);
//wire  iRdd1,iRdd2,DOEnb	;
//// ================================================

//wire	[63:0] dna64bits;
//reg	[7:0] dnac;
wire	DNA_Pass,DNA_RST;
wire [3:0] KILL;				// 4 bit killer signals
//reg	DNAS0,DNAS1,DNAS2;		// the DNA output control
//wire	DNA_CS,DNA_OE;				// signal to show the DNA value to IDE bus
//wire  [15:0] DNAO;
//// =========== test stubs ========================
//ReportOut <= X"AAAA"				when (ReportC(5 downto 2) = "0010") else
//				 X"5555"				when (ReportC(5 downto 2) = "0011") else
//				 D_RAM_ReportOut	when (ReportC(5 downto 4) = "01") else
//				 PS2_DMA_STATE		when (ReportC(5 downto 2) = "1000") else
//				 IDE_DMA_STATE		when (ReportC(5 downto 2) = "1001") else
//				 IDE_INTF_STATE	when (ReportC(5 downto 2) = "1010") else
//				 Reg0028				when (ReportC(5 downto 2) = "1011") else
//				 R380016				when (ReportC(5 downto 2) = "1100") else
//				 X"CCCC";
//D_RAM_ReportIn(1 downto 0)	<= ReportC(3 downto 2);
//R380016(15 DOWNTO 8) <= X"00";
//R380016(7 DOWNTO 0) <= Reg0038;

////////////////////////////////////////////////////-
////////////////////////////////////////////////////-

dcm3	Inst_DCM(
	.CLKIN_IN		(CLKin),
	.RST_IN			(DCM_RST),
	.CLKFX_OUT		(CLK4),
	.CLKIN_IBUFG_OUT(),			// same phase as CLKin
	.CLK0_OUT		(CLK1),				// same phase as CLK
	.LOCKED_OUT		(DCM_LOCKED)
);

////- ===== TF machine ======
TF_Stub	Inst_TF_Stub(
	.RESET (DNA_RST),
	.CLK4	(CLK4),
	.TFD0	(TFD0),
	.TFD1	(TFD1),
	.TFD2	(TFD2),
	.TFD3	(TFD3),			// same phase as CLKin
	.TF_CLK		(TFCLK),				// same pahse as CLK
   .TF_CMD		(TFCMD), 
	.TF_SENSE	(TFSENSE)
);


////- ===== DNA 
Top dna1 (
    .reset(DNA_RST), 
    .clk4(CLK4),
	 .IDE_CS(IDE_CS),
    .dna_pass(DNA_Pass),
	 .KILL(KILL)
    );

////- ===============================================
Reg38	R_38(
	.UDMAC		(UDMAC),
	.PS2WrIDE	(PS2WrIDE),
	.iIRQ			(SiIRQ),
	.cDQ			(cDQ),
	.iDQ			(SiDQ),		// synchronize iDQ
	.iDK			(iDK),
	.BufEmpty	(BufEmpty),
	.PB_HvSpace	(PB_HvSpace),
	.BufSize		(BufSize),
	.DOut			(Reg0038)
);
////=========================================================
PS2_DMA	PS2DMA(
//	PS2_DMA_STATE	(PS2_DMA_STATE),
	.CLK4			(CLK4),
	.Phase3		(Phase3),		// the phases
////// external pin interface
	.cDQ			(cDQ),  		// DMA request output
	.cDK			(cDK),  		// DMA acknowledge input
	.cRd			(cRd),		// read signal pulse
	.DWrite		(DWrite),	// write and counter pulse
////// controlling signal
	.DMA_ARM		(DMA_ARM),		// signal from ctrllr to inits DMA
	.PS2WrIDE	(PS2WrIDE),	// level indicating that PS2 is DMA writing IDE bus
//// PS2 DMA connecting to RAM interface
	.PB_HvSpace	(PB_HvSpace),		// there is empty space for Port B
	.PB_OD_Rdy	(PB_OD_Rdy),		// some data availabe for output from Port B
////
	.WithinBBlock	(WithinBBlock),	// high if (AddrB(6) OR AddrB(5)) = 1
	.BBurstEnd	(BBurstEnd),			// high if AddrB = xxxx11111 = 1F
	.IncAddrB	(IncAddrB),
	.RegEB		(RegEB),
	.EnbB			(EnbB),
	.WrB			(WrB )			// write pulse
);
////-======================================================
D_RAM		DMARAM(
	.CLK4			(CLK4),
	.DMA_ARM		(DMA_ARM),
	.PS2WrIDE	(PS2WrIDE), 			// High if PS2 DMA write to IDE bus
//// =====
	.CRC_ARM		(CRC_ARM),
	.CRC_ENB		(CRC_ENB),
	.CRC_Q		(CRC_Q),
//// =====
	.PA_HvSpace	(PA_HvSpace),		// there is empty space for Port A
	.PA_OD_Rdy	(PA_OD_Rdy),		// some data availabe for output from Port A
	.PA_AlmostFull	(PA_AlmostFull),
	.PA_Full		(PA_Full),
	.PA_Empty	(PA_Empty),
	.WithinABlock	(WithinABlock),
//// =====	
	.PB_HvSpace	(PB_HvSpace),		// there is empty space for Port B
	.PB_OD_Rdy	(PB_OD_Rdy),		// some data availabe for output from Port B
//// =====
	.BufSize		(BufSize),
	.BufEmpty	(BufEmpty),			// set when no words in the FIFO buffer
//// =====
	.DInA			(DIn2),
	.DOutA		(DOutA),
	.DInB 		(DMARAMD), 
//// ==== 1st port RAM access
	.A0			(A0),
	.HWOE			(HWOE),
	.IncAddrA	(IncAddrA),
	.EnbA		(EnbA),
	.WrA			(WrA),
	.RegEA	(RegEA),
//// ==== 2nd port RAM access
	.WithinBBlock	(WithinBBlock),		// high if (AddrB(6) OR AddrB(5)) = 1
	.BBurstEnd	(BBurstEnd),				// high if AddrB = xxxx11111 = 1F
	.IncAddrB		(IncAddrB),
	.EnbB			(EnbB),
	.RegEB			(RegEB),
	.WrB 			(WrB),  
	.DOutB 		(DMARAMQ)
);
//// =========================================
IDE_DMA	IDEDMA (
//	IDE_DMA_STATE	(IDE_DMA_STATE),
	.CLK4		(CLK4),
	.Phase3	(Phase3),
////// external pin interface
	.iDK		(iDK),  			// (o) DMA acknowledge output to harddisk
	.iDQ		(SiDQ),  			// (i) DMA request input from harddisk
	.SiRdy1	(SiRdy1),				// (i) IDE bus ready signal
	.SiRdy2	(SiRdy2),
////// system signal
	.DMA_ARM(DMA_ARM),	// do not request transaction if this is not armed
	.PS2WrIDE	(PS2WrIDE), 		// (i) '1' if direction is from PS2 to IDE
	.UDMA 		(UDMA),
	.MDMA		(MDMA),
	.iDMARd	(iDMARd),			// (o) active high signal to indicate DMA read
	.iDMAWr	(iDMAWr), 			// (o) active high signal to indicate DMA write
	.iDMA_OE	(iDMA_OE),			// (o) active high signal showing DMA wishes to drive iD bus
	.iD_245_In	(iD_245_In),	// (o) active high envelop signal to drive output bus
	.CRC_MUX	(CRC_MUX),			// inform system that need to drive the CRC Q to IDE bus
	.CRC_ARM	(CRC_ARM),			// a signal indicate that to clear the CRC state
	.CRC_ENB	(CRC_ENB),
////// interface the RAM buffer), DMA machine will act according to buffer
	.PA_HvSpace	(PA_HvSpace),		// there is empty space for Port A
	.PA_OD_Rdy	(PA_OD_Rdy),		// some data availabe for output from Port A
	.WithinABlock	(WithinABlock),
	.PA_AlmostFull(PA_AlmostFull),
	.PA_Full		(PA_Full),
	.PA_Empty	(PA_Empty),
	.IDE_DSTB	(IDE_DSTB),
	.IncAddrA	(IncAddrA),
	.A0		(A0),
	.HWOE		(HWOE),
	.EnbA		(EnbA),
	.WrA			(WrA),
	.RegEA	(RegEA)
);
//// =========================================

//- Probes
// (I/P) JT_bTest is the tester control port, during config, this is high; this should be DONE signal inverted by a 74LS04
// (I/P) JT_Pin1 is the selection port of ROM
// (O/P) JT_Result is the result port (if DNA_Pass then it is low)
assign JT_Result	= (JT_bTest == 1'b0) ? ( ~DNA_Pass ) : ( HDD_ACK | ACS_LED | ibDASP | bCRT ); // will output low if DNA_Pass
assign JT_Pin1		=  TFCLK;			// pull low for 50A, left high for 50AN

/// ===========================================================================
/// ===========================================================================
//	ClrDMAPulse = ~(bcCS) & ~(bcWr) & ClrD1 & ClrD2;
//	ClrD1	= '1' when (cAi(15 downto 0) = X"0032") else '0';
//	ClrD2 = '1' when (cDi(15 downto 0) = X"0003") else '0';

////- ===  CLOCK & reset signals ===========================================
assign DCM_RST		= ~bCRST | ~bCSRST;		// drive high if any pin is low
assign bHardReset	=  bCRST & DCM_LOCKED;	// the lowest level of reset
assign DNA_RST		= ~DCM_LOCKED;					// active high reset signal
/// ===== Phase generation logic ==================================
always @(negedge CLK1) begin
	if (DCM_LOCKED == 1'b0) begin
		Ph0 <= 1'b0;
	end else begin
		Ph0 <= ~Ph0;				// a toggling signal
	end
end

always @(negedge CLK4) begin
	Ph1	<=	Ph0;
	Ph2	<= Ph1;
end

always @(posedge CLK4) begin
	Phase3	<= Ph1 ^ Ph2;
end
//// ==========================================================================

	
//// ==========================================================================
// output signal
//// Register 64 signals
	assign ibRST	= ~(Reg0064[7]);
	assign ibCS0	= ~(iCS0);		// convert to correct pin polarity
	assign ibCS1	= ~(iCS1);
	assign ibRd		= ~(iRd);
	assign ibWr		= ~(iWr);
	assign ibDK		= ~(iDK);		// DMA acknowledge output, active low
//// IDE Data bus control signal
	assign iRd	= ( IDERd & ~iDK ) | (iDMARd & iDK);
	assign iWr	= ( IDEWr & ~iDK ) | (iDMAWr & iDK);
//////- the CN110 interface
// input signal
	assign cRd	= ~bcRd & ~KILL[0];
	assign cRdt	= ~bCRT & ~KILL[0];		// tristate control circuit
	assign cWr	= ~bcWr & ~KILL[0];
//// ============================================================================================
//// Interrupt signal
// interrupt will be set either by IDE interrupt line | an interrupt signal by DMA F/F
	assign INT9OE	= Reg002A[1] | Reg002A[0];
	assign bcIRQ	= (INT9OE == 1'b1) ? ~(INT9) : 1'bZ;
	assign INT9		= (SiIRQ & Reg002A[0]) | (DMA_IrqFF & DMA_IrqCTRL);
////============= c-Connector data bus  =======================
	assign cDMA_OE	=	cRdt & cDK;					// output the data bus
	assign cDOE	= ATV & (cDMA_OE | Combo_OE);	// DMA/CS PS2 read will drive the bus
	assign cDP 	=	(cDOE		== 1'b0) ?	{16{1'bZ}}		:
						(cDK 		== 1'b1) ?	DMARAMQ[15:0]	:
						(IDE_CS	== 1'b1)	?	iDi[15:0]		:	RegData[15:0];
	assign cDi	= cDP;
//- c-Connector Address bus
	assign cAOE	= ATV &  cDMA_OE;					// DMA PS2 read will drive the bus
	assign cAP 	=	(cAOE == 1'b0) ? {16{1'bZ}}		: DMARAMQ[31:16];
	assign cAi	= cAP;
////
//// ============================================================================================
//// Control signals // must wait until bus matching for IDE signals
//	assign BusMatch = ((cDi[15] ~^ iDi[15]) & (cDi[14] ~^ iDi[14]) & (cDi[13] ~^ iDi[13]) &
//					 (cDi[12] ~^ iDi[12]) & (cDi[11] ~^ iDi[11]) & (cDi[10] ~^ iDi[10]) &
//					 (cDi[9]  ~^ iDi[9])  & (cDi[8]  ~^ iDi[8])  & (cDi[7]  ~^ iDi[7])  &
//					 (cDi[6]  ~^ iDi[6])  & (cDi[5]  ~^ iDi[5])  & (cDi[4]  ~^ iDi[4])  &
//					 (cDi[3]  ~^ iDi[3])  & (cDi[2]  ~^ iDi[2])  & (cDi[1]  ~^ iDi[1])  &
//					 (cDi[0]  ~^ iDi[0]));
//- the combo chip select range = 0x0000-0x007F
	assign Combo_CS = ATV & ~cDK & ~(bcCS | cAi[15] | cAi[14] | cAi[13] | cAi[12] |
												cAi[11] |	cAi[10] | cAi[9] | cAi[8] | cAi[7]);
	assign Combo_OE = cRd & Combo_CS;			// asynchronous active reading signal
	
//// ================== IDE interface section =================================================

//====== iDE data bus ================================
// IDE data bus control
//	ProbeOut				= (cWr | cRd) & ~(IDE_CS) & ~(iDK) & ~(cDK);
//	iDOEnb				= IDEiOE | iDMA_OE | ProbeOut;		// signal we can drive the bus
//
// 090313
//  The ORIGINAL signal
	assign iD[15:0]	= (iDOEnb == 1'b1) ? iDO[15:0] : {16{1'bZ}};
	assign iDOEnb		= IDEiOE | iDMA_OE;		// signal we can drive the bus
	assign iDi[15:0]	= iD[15:0];
	assign iDO[15:0]	=	(IDE_CS  == 1'b1) ?	 cDi[15:0] : 
								(CRC_MUX == 1'b1) ? CRC_Q[15:0] : DOutA[15:0];
//
//// --- iD out also output DNA data
//// ==== The DNA showing session ====
//	assign	iDOEnb		= 1'b1;
//	assign	iD[15:0]		= iDO[15:0];
//	assign	iDO[15:0]	=	(dnac[7] == 1'b0) ? 
//										((dnac[6] == 1'b0) ? dna64bits[63:48] : dna64bits[47:32] ) :
//										((dnac[6] == 1'b0) ?	dna64bits[31:16] : dna64bits[15:0] );
//	assign	iDi[15:0]	= iD[15:0];
//// 
//
// 090313
//
//
//  0000 0000 010* **** = 0x0040-0x005F
assign IDE_CS	= Combo_CS & ~iDK & cAi[6] & ~cAi[5]; //- if address range is correct and we are not doing iDK
assign iCS1		= IDE_CS &  cAi[4] & ~KILL[2];
assign iCS0		= IDE_CS & ~cAi[4] & ~KILL[2];
assign iA[2]	= IDE_CS & cAi[3] & ~KILL[1];
assign iA[1]	= IDE_CS & cAi[2] & ~KILL[2];
assign iA[0]	= IDE_CS & cAi[1] & ~KILL[3];
assign IDERd	= IDE_CS & cRd & ~KILL[1];
assign IDEWr	= IDE_CS & cWr & ~KILL[2];	// narrow down the write pulse
assign IDEiOE	= IDE_CS & cWr;	// writing IDE, we drive the IDE i Bus
//	IDE_Rd_Env	= (IDE_CS & cRd) | IDERd1;		// reading, we drive the 245 inwards
assign IDE_Rd_Env	= IDE_CS & cRd;
//////////////////////////////////////////////////////////////////////
//- Local Register Block
//// ===== Read only registers
//	Reg0002(7 downto 2) = "000100";	// prepare to be 13
//	Reg0002(1) = ~(DNA_Fail);		// should always be 1 ( ~ fail)
//	Reg0002(0) = DNA_Pass;				// should always be 1 (pass)
//	Reg0002[7:0] = "00010011";	// fixed at 13
//	Reg0004	= X"0B";
//	Reg000E	= X"02";
// Reg0028 has many bits being zero ////////////////////////
// Reg0028 is probably the DMA RAM Buffer register
//	assign Reg0028[15]	= Reg2815;			// set when buffer is full
	assign Reg0028[15]	= BufSize[3];		// set when buffer is full
	assign Reg0028[14]	= BufEmpty;
//	Reg0028(14) = (~(PS2WrIDE) & BufEmpty) | (PS2WrIDE & (AlmostEmpty | BufEmpty));			// BufEmpty
//	Reg0028(14) = (~(PS2WrIDE) & (AlmostEmpty | BufEmpty)) | (PS2WrIDE & HaveSpace);			// Performs much better than BufEmpty in xboot writing
//	Reg0028(14) = AlmostEmpty;			// Performs much better than BufEmpty in xboot writing
	assign Reg0028[13:2] = 12'b0000_0000_0000;
	assign Reg0028[1]	= cDQ;
	assign Reg0028[0]	= SiIRQ;				// the interrupt condition of external
//// Reg002A the interrupt control register ///////////////////////////////////////////
//// local registers //////////////////////////
	assign RegData[15:8] =	(cAi[6:0] == 7'h28)	?	Reg0028[15:8]	: 8'h00;
////////////////////////////////////////
	assign RegData[7:0]	=	(cAi[6:0] == 7'h02)	?	8'h13 			:
									(cAi[6:0] == 7'h04)	?	8'h0B 			:
									(cAi[6:0] == 7'h0E)	?	8'h02				:
									(cAi[6:0] == 7'h28)	?	Reg0028[7:0]	:
									(cAi[6:0] == 7'h2A)	?	Reg002A[7:0]	:
						//			(cAi[6:0] == 7'h2C)	?	Reg002C[7:0]	:
									(cAi[6:0] == 7'h2E)	?	Reg002E[7:0]	:
									(cAi[6:0] == 7'h38)	?	Reg0038[7:0]	:
									(cAi[6:0] == 7'h64)	?	Reg0064[7:0]	: 8'h00;
////- Reg0064 has zero bits write 4C then will write IDECmd87 to set direction
//	Probably Reg0064 is the reset & interrupt control
// if reading & PortB have data
//  | Writing & PortA have space
	assign DMA_IrqCond	=	(~(PS2WrIDE) & PB_OD_Rdy) | (PS2WrIDE & PB_HvSpace);
	assign DMA_IrqCTRL	= Reg002A[1];
	
////- ====================================	
	assign UDMAC	= UDO[2] | UDO[1] | UDO[0];
//////////////////////////////////////////////////////////////////


//- ===== selecting the drive mode is by ===
//- ATA command set features (EF,xx,xx,xx,xx,Table20,03)
assign CmdIsEF		= cRgD[7] & cRgD[6] & cRgD[5] & ~(cRgD[4]) &	cRgD[3] & cRgD[2] & cRgD[1] & cRgD[0];
assign UDMA_SEL	= CmdIsEF & R44Is4X & R42Is03;
assign MDMA_SEL 	= CmdIsEF & R44Is2X & R42Is03;
assign D_UnChg		= ~(UDMA_SEL | MDMA_SEL);		// do not change the data if both control are low
assign UDMA[2:0]	= UDO[2:0];
assign MDMA[2] 	= MDO[2];
assign MDMA[1]		= MDO[1];
assign MDMA[0]		= ~(UDO[2] | UDO[1] | UDO[0] | MDO[2] | MDO[1]);
//////- =======================================
assign Reg002E_7 = 1'b1;
assign Reg002E_6 = 1'b1;
assign Reg002E_5 = 1'b0;

assign Reg002E_3 = 1'b1;
assign Reg002E_2 = 1'b1;
assign Reg002E_1 = 1'b1;
assign Reg002E_0 = 1'b0;
// Reg002E is always CE | DE

//////- =======================================
assign cRgWr	= ATV & ScWr1 & ~(ScWr) & cRgWrEnb;		// old time is 1, new is off
assign cRgRd2E	= ATV & ScRd1 & ~(ScRd) & bcRd2E;			// the single read pulse for 2E
//////- =============== control the direction of the buffers ============
assign OE245	= ~(ATV);		// almost always valid
assign DR245	= ~(IDE_Rd_Env | iD_245_In);			// high = 3V3 bus drives disk I/O, = iWR |
																		//- low when ( iRd for MDMA and normal, or iDK AND UDI mode)
////- ===================================================================
always @(posedge bcWr) begin
	cRgWrEnb		<=	Combo_CS & ScWr & ScWr1;		// if selecting the register, then we might have write pulse
	cRgA[6:0]	<= cAi[6:0];
	cRgD[7:0]	<= cDi[7:0];
end

always @(posedge bcRd) begin
	bcRd2E	<= Combo_CS & ScRd & ScRd1 & ~(cAi[6]) & cAi[5] & ~(cAi[4]) & cAi[3] & cAi[2] & cAi[1] & ~(cAi[0]);
end

//// =============================
//always @(negedge CLK1) begin
//	DMARAMD[15:0] 	<= cDi[15:0];		// lower word to RAM
//	DMARAMD[31:16]	<= cAi[15:0];		// upper word to RAM
//end
always @(posedge CLK4) begin
	if ((Ph1 ^ Ph2) == 1'b1) begin
		DMARAMD[15:0] 	<= cDi[15:0];		// lower word to RAM
		DMARAMD[31:16]	<= cAi[15:0];		// upper word to RAM
	end
end
//// =============================
always @(posedge CLK1) begin
	DWrite	<= cWr & cDK;
end

//// ============================================================================================
//// ===== IDE bus interface wait engine ========================================================
//// ============================================================================================
assign bcWait	= (IDE_CS == 1'b1) ? ~cWait : 1'bZ; // will output low if cWait = '1'

always @(posedge CLK4) begin
	if (IDE_CS == 1'b0) begin
		cWaitCnt	<= 4'b0000;		// clear wait counter
		cWait		<= 1'b1;			// must wait
		IgnoreIRdyPin	<= ~SiRdy2;		// if IORDY is always low then ignore it, it will not affect our engine
	end else begin
		if (cWaitCnt == 4'b1010) begin 
//			if ((SiRdy2 == 1'b1) && (BusMatch == 1'b1)) begin
			if ((IgnoreIRdyPin == 1'b1) || (SiRdy2 == 1'b1)) begin
				cWait	<= 1'b0;		// end if
			end
		end else begin
			cWaitCnt <= cWaitCnt + 1;
		end
	end
end
//// ============================================================================================
//// ============================================================================================

always @(posedge CLK4) begin
//// synchronous Reset section
	if (bHardReset == 1'b0) begin
////
		Reg002A		<= 8'h00;
		Reg002E_4	<= 1'b0;		// first data is CE, next data can be CE or DE
		Rd2ECnt		<= 6'b000001;	// clear the Rd2E counter
		Reg0064		<= 8'h80;		// activate the IDE reset signal
		DMA_IrqMask	<= 1'b0;
		DMA_IrqFF 	<= 1'b0;			// clear the DMA request flipflop
		PS2WrIDE	 	<= 1'b0;			// set up the direction
		MDO[2]		<= 1'b0;		// DMA mode is multiword mode 0
		MDO[1]		<= 1'b0;
		UDO			<= 3'b000;		// not UDMA mode
		DMARMC		<= 1'b0;
		DMA_ARM		<= 1'b0;
////--- first filter
		iDQ1			<= 1'b0;
		iIRQ1			<= 1'b0;
		cWr1			<= 1'b0;
		cRd1			<= 1'b0;
		SiRdy1		<= 1'b1;
//// ========  2nd filter ========
		SiDQ			<= 1'b0;
		SiIRQ			<= 1'b0;
		ScWr			<= 1'b0;
		ScRd			<= 1'b0;
		SiRdy2		<= 1'b1;
//// ========= 3rd filter ======
		ScRd1			<= 1'b0;
		ScWr1			<= 1'b0;
//// =============================
		ATV1			<= 1'b0;
		ATV2			<= 1'b0;
		ATV			<= 1'b0;
//// =========
//		DNAS0			<= 1'b0;
//		DNAS1			<= 1'b0;
	end else begin
		ATV1			<= 1'b1;
		ATV2			<= ATV1;
		ATV			<= ATV2;		// 2 filter for ATV signal
//// ======== first filter =====
		iDQ1		<= iDQ;			// try to synchronize the system clock
		iIRQ1		<= iIRQ;			// synchronize again
		cWr1		<= cWr;
		cRd1 		<= cRd;
		SiRdy1	<= iRdy;
		DIn1		<= iDi;							// get the data
//		IDERd1	<= IDERd;		// one delay signal to control output buffer direction
//// ========  2nd filter ========
		SiDQ		<= iDQ1;
		SiIRQ		<= iIRQ1;
		ScWr		<= cWr1;
		ScRd		<= cRd1;
		SiRdy2	<= SiRdy1;
		if (IDE_DSTB == 1'b1) DIn2		<= DIn1;
//// ========= 3rd filter ======
		ScRd1		<= ScRd;
		ScWr1		<= ScWr;
//// =============================
//		The DNA output counter value
//		if (((ScRd1 == 1'b1) && (ScRd == 1'b0)) || ((ScWr1 == 1'b1) && (ScWr == 1'b0))) begin
//			DNAS0		<= ~DNAS0;
//			DNAS1		<= DNAS1 ^ DNAS0;
//		end
//		Reg2815	<= PS2WrIDE & (PA_AlmostFull | (~(PA_HvSpace) & Reg2815));
//// =======================================
		if (cRgRd2E == 1'b1) begin		// read pulse post processing, check which register is read
			if ((Rd2ECnt == 6'b000110) || (Rd2ECnt == 6'b010010) || (Rd2ECnt == 6'b010011) || (Rd2ECnt == 6'b010101) ||
				(Rd2ECnt == 6'b010111) || (Rd2ECnt == 6'b011100) || (Rd2ECnt == 6'b011101) || (Rd2ECnt == 6'b011110) ||
				(Rd2ECnt == 6'b011111) || (Rd2ECnt == 6'b100000) || (Rd2ECnt == 6'b100011) || (Rd2ECnt == 6'b100100) ||
				(Rd2ECnt == 6'b100101) || (Rd2ECnt == 6'b100110) || (Rd2ECnt == 6'b100111) || (Rd2ECnt == 6'b101000) ||
				(Rd2ECnt == 6'b101001) || (Rd2ECnt == 6'b101110) || (Rd2ECnt == 6'b110000) || (Rd2ECnt == 6'b110001) ||
				(Rd2ECnt == 6'b110011) || (Rd2ECnt == 6'b110101) || (Rd2ECnt == 6'b110110) || (Rd2ECnt == 6'b111000) ||
				(Rd2ECnt == 6'b111001) || (Rd2ECnt == 6'b111011) || (Rd2ECnt == 6'b111110))
			begin
				Reg002E_4	<= 1'b1;		// Reg002E <= x"DE";
			end else begin
				Reg002E_4	<= 1'b0;		// Reg002E <= x"CE";
			end
			Rd2ECnt <= Rd2ECnt + 1;
		end
////- ==============================
		if (cRgWr == 1'b0) begin
	//// Always running section the DMA controller reset section ////
			DMARMC	<= ATV;			// DMA_ARM is two clock width
			DMA_ARM	<= DMARMC;		// DMA_ARM is two clock width, put to clear register
	//// The interrupt controller section always running after hard reset////
			if (DMA_IrqMask == 1'b1) begin
				DMA_IrqMask <= DMA_IrqCond;		// only interrupt once until the condition is remove
			end
			if ((DMA_IrqCond == 1'b1) && (DMA_IrqMask == 1'b0)) begin
				DMA_IrqMask	<= DMA_IrqCTRL;	// no more retrigger
				DMA_IrqFF 	<= DMA_IrqCTRL;	// the DMA interrupt request pulse from DMA/IDE unit
			end
		end else begin		// only one write pulse
	//// 002A
		case (cRgA[6:0])
			7'b0101010: begin		// 002A
				Reg002A[7:0] <= cRgD[7:0];
				if (cRgD[7:0] == 8'h00) DMA_IrqFF <= 1'b0;			// clear the DMA_IrqFF
			end
	//// 002C
			7'b0101100: begin		// 002C
				if (cRgD == 8'hE1) begin
					Rd2ECnt <= 6'b00_0001;		// start up the counter
	//				Reg002C[7:0]	<= cRgD[7:0];
				end
			end
	//// 0032
			7'b0110010: begin		// 0032
				DMARMC		<= 1'b0;
				DMA_ARM		<= 1'b0;	//// clear the ARM signal
				DMA_IrqFF	<= 1'b0;	// clear all possible old DMA interrupt
				Reg0064[2]	<= 1'b0;
				PS2WrIDE		<= cRgD[0];		// set the direction
			end
	//// 0038
	//			if (cRgA[6:0]= "0111000") begin		// 0038
	//				if (cRgD = X"03") begin
	//					DMA_ARM	<= 1'b0;
	//				end if;
	//			end if;
	//// 0042
			7'b1000010: begin		// 0042
				R42Is03	<= ~(cRgD[7] | cRgD[6] | cRgD[5] | cRgD[4] | cRgD[3] | cRgD[2]) & cRgD[1] & cRgD[0];
			end
	//// 0044
			7'b1000100: begin		// 0044
				R44Is2X	<= ~(cRgD[7] | cRgD[6] | cRgD[4] | cRgD[3]) & cRgD[5];
				R44Is4X	<= ~(cRgD[7] | cRgD[5] | cRgD[4] | cRgD[3]) & cRgD[6];
				R44[2]	<= cRgD[2];
				R44[1]	<= cRgD[1];
				R44[0]	<= cRgD[0];
			end
	//// 004E
			7'b1001110: begin		// 004E
				UDO[2]	<= (D_UnChg & UDO[2]) | (~(D_UnChg) & UDMA_SEL & R44[2]);
				UDO[1]	<= (D_UnChg & UDO[1]) | (~(D_UnChg) & UDMA_SEL & R44[1]);
				UDO[0]	<= (D_UnChg & UDO[0]) | (~(D_UnChg) & UDMA_SEL & R44[0]);
				MDO[2]	<= (D_UnChg & MDO[2]) | (~(D_UnChg) & MDMA_SEL & R44[2]);
				MDO[1]	<= (D_UnChg & MDO[1]) | (~(D_UnChg) & MDMA_SEL & R44[1]);
			end
	//// 0064
			7'b1100100: begin		// 0064 
				Reg0064[7:0] <= cRgD[7:0];
			end
		endcase
		end	// Write Pulse group
	end // bcRST group
end	// clock
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:11 02/27/2009 
// Design Name: 
// Module Name:    CRC_CAL 
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
module CRC_CAL(CLK4, D, CRC_ARM, CRC_ENB, CRC_Q);
    input CLK4;
    input [15:0] D;
    input CRC_ARM;
    input CRC_ENB;
    output [15:0] CRC_Q;

wire [15:0] R_D;
reg  [15:0] R_Q;


// CRC combination logic block
CRC_CL CF(	.D(D),			// one input is the data block
				.C(R_Q),			//	other input is the register feed back
				.Q(R_D)			// result feed into the data register data port
				);
				
assign CRC_Q =	R_Q;


always @(posedge CLK4) begin //negedge
  if(CRC_ARM == 1'b0) begin
    R_Q <= 16'h4ABA;				
  end else if(CRC_ENB == 1'b1) begin
    R_Q <= R_D;  				// clock the data into the port
  end
end

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:40 03/04/2009 
// Design Name: 
// Module Name:    CRC_CL 
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
module CRC_CL(
	input [15:0] D,
	input [15:0] C,
	output [15:0] Q
);

wire [16:1]	f;		// internal wire
// The polynomial is
// G(X) = X16 + X12 + X5 + 1

assign f[1]		= D[0]  ^ C[15];
assign f[2]		= D[1]  ^ C[14];
assign f[3]		= D[2]  ^ C[13];
assign f[4]		= D[3]  ^ C[12];
assign f[5]		= D[4]  ^ C[11]	^ f[1];
assign f[6]		= D[5]  ^ C[10]	^ f[2];
assign f[7]		= D[6]  ^ C[9] 	^ f[3];
assign f[8]		= D[7]  ^ C[8] 	^ f[4];
assign f[9]		= D[8]  ^ C[7] 	^ f[5];
assign f[10]	= D[9]  ^ C[6] 	^ f[6];
assign f[11]	= D[10] ^ C[5] 	^ f[7];
assign f[12]	= D[11] ^ C[4] 	^ f[8]	^ f[1];
assign f[13]	= D[12] ^ C[3]		^ f[9]	^ f[2];
assign f[14]	= D[13] ^ C[2]		^ f[10]	^ f[3];
assign f[15]	= D[14] ^ C[1]		^ f[11]	^ f[4];
assign f[16]	= D[15] ^ C[0]		^ f[12]	^ f[5];

assign Q[0]		= f[16];
assign Q[1]		= f[15];
assign Q[2]		= f[14];
assign Q[3]		= f[13];
assign Q[4]		= f[12];
assign Q[5]		= f[11] 	^ f[16];
assign Q[6]		= f[10]	^ f[15];
assign Q[7]		= f[9] 	^ f[14];
assign Q[8]		= f[8] 	^ f[13];
assign Q[9]		= f[7] 	^ f[12];
assign Q[10]	= f[6]	^ f[11];
assign Q[11]	= f[5]	^ f[10];
assign Q[12]	= f[4]	^ f[9]	^ f[16];
assign Q[13]	= f[3]	^ f[8]	^ f[15];
assign Q[14]	= f[2]	^ f[7]	^ f[14];
assign Q[15]	= f[1]	^ f[6]	^ f[13];

endmodule
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 11.5
//  \   \         Application : xaw2verilog
//  /   /         Filename : dcm3.v
// /___/   /\     Timestamp : 06/24/2010 00:56:37
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -intstyle D:/usr/kk/PROJECT/PS2NetWorkAdaptor/NADP/NADP05_5/chip/ipcore_dir/dcm3.xaw -st dcm3.v
//Design Name: dcm3
//Device: xc3s50a-4tq144
//
// Module dcm3
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
// Period Jitter (unit interval) for block DCM_SP_INST = 0.10 UI
// Period Jitter (Peak-to-Peak) for block DCM_SP_INST = 0.71 ns
`timescale 1ns / 1ps

module dcm3(CLKIN_IN, 
            RST_IN, 
            CLKFX_OUT, 
            CLKIN_IBUFG_OUT, 
            CLK0_OUT, 
            LOCKED_OUT);

    input CLKIN_IN;
    input RST_IN;
   output CLKFX_OUT;
   output CLKIN_IBUFG_OUT;
   output CLK0_OUT;
   output LOCKED_OUT;
   
   wire CLKFB_IN;
   wire CLKFX_BUF;
   wire CLKIN_IBUFG;
   wire CLK0_BUF;
   wire GND_BIT;
   
   assign GND_BIT = 0;
   assign CLKIN_IBUFG_OUT = CLKIN_IBUFG;
   assign CLK0_OUT = CLKFB_IN;
   BUFG CLKFX_BUFG_INST (.I(CLKFX_BUF), 
                         .O(CLKFX_OUT));
   IBUFG CLKIN_IBUFG_INST (.I(CLKIN_IN), 
                           .O(CLKIN_IBUFG));
   BUFG CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(CLKFB_IN));
   DCM_SP DCM_SP_INST (.CLKFB(CLKFB_IN), 
                       .CLKIN(CLKIN_IBUFG), 
                       .DSSEN(GND_BIT), 
                       .PSCLK(GND_BIT), 
                       .PSEN(GND_BIT), 
                       .PSINCDEC(GND_BIT), 
                       .RST(RST_IN), 
                       .CLKDV(), 
                       .CLKFX(CLKFX_BUF), 
                       .CLKFX180(), 
                       .CLK0(CLK0_BUF), 
                       .CLK2X(), 
                       .CLK2X180(), 
                       .CLK90(), 
                       .CLK180(), 
                       .CLK270(), 
                       .LOCKED(LOCKED_OUT), 
                       .PSDONE(), 
                       .STATUS());
   defparam DCM_SP_INST.CLK_FEEDBACK = "1X";
   defparam DCM_SP_INST.CLKDV_DIVIDE = 2.0;
   defparam DCM_SP_INST.CLKFX_DIVIDE = 1;
   defparam DCM_SP_INST.CLKFX_MULTIPLY = 4;
   defparam DCM_SP_INST.CLKIN_DIVIDE_BY_2 = "FALSE";
   defparam DCM_SP_INST.CLKIN_PERIOD = 27.800;
   defparam DCM_SP_INST.CLKOUT_PHASE_SHIFT = "NONE";
   defparam DCM_SP_INST.DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS";
   defparam DCM_SP_INST.DFS_FREQUENCY_MODE = "LOW";
   defparam DCM_SP_INST.DLL_FREQUENCY_MODE = "LOW";
   defparam DCM_SP_INST.DUTY_CYCLE_CORRECTION = "TRUE";
   defparam DCM_SP_INST.FACTORY_JF = 16'hC080;
   defparam DCM_SP_INST.PHASE_SHIFT = 0;
   defparam DCM_SP_INST.STARTUP_WAIT = "FALSE";
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:37 03/14/2009 
// Design Name: 
// Module Name:    dna_p1 
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
module dna_p1(
    input ATV,					// Active and arm signal
    input CLK4,				// very fast clock
    output [63:0] DNA_64,		// 64 bit DNA code with check bits
    output reg DNA_Valid	// the code now is valid
);

reg 		dna_read,dna_shift,dna_clk;
wire 		dna_out;
reg	[5:0]	dna_counter;	// a six bit counter for the dna
reg	[3:0]	dna_ST;		// 4 bit state machine
reg	[5:0]	Adder1;		// a six bit result of bit adding
reg	Parity;				// a one bit result of parity
reg	[56:0] DNA_R;

DNA_PORT	#(
//		.SIM_DNA_VALUE(57'b100011100001110000111010011010100000111001001000111110001)

//	board6 dna = 01EB D518 35FC 6A8
// In Hex VALUE(57'b0000_0001_1110_1011_1101_0101_0001_1000_0011_0101_1111_1100_0110_1010_1)
		.SIM_DNA_VALUE(57'b101010110001111111010110000011000101010111101011110000000)
//	board5 dna = 8139 68AB EA9A 7A8
// In Hex  VALUE(57'b1000 0001 0011 1001 0110 1000 1010 1011 1110 1010 1001 1010 0111 1010 1)
//		.SIM_DNA_VALUE(57'b101011110010110010101011111010101000101101001110010000001)
//	board1 dna = 4AA7 56E8 BE70 9A8
// In Hex  VALUE(57'b0100 1010 1010 0111 0101 0110 1110 1000 1011 1110 0111 0000 1001 1010 1)
//   .SIM_DNA_VALUE(57'b101011001000011100111110100010111011010101110010101010010)
//	board2 dna = D891 1863 FA0F 4A8
// In Hex  VALUE(57'b110110001001000100011000011000111111101000001111010010101)
// .SIM_DNA_VALUE(57'b101010010111100000101111111000110000110001000100100011011)
//	board3 dna = A2B6 540A 9221 088
// In Hex  VALUE(57'b1010_0010_1011_0110_0101_0100_0000_1010_1001_0010_0010_0001_0000_1000_1)
//.SIM_DNA_VALUE(57'b1_0001_0000_1000_0100_0100_1001_0101_0000_0010_1010_0110_1101_0100_0101)
//	board4 dna = E070 9EE6 453D CA8
// In Hex  VALUE(57'b111000000111000010011110111001100100010100111101110010101)
//  .SIM_DNA_VALUE(57'b101010011101111001010001001100111011110010000111000000111)
		) dna_code(
		.DIN(1'b0),
		.READ(dna_read),
		.SHIFT(dna_shift),
		.DOUT(dna_out),
		.CLK(dna_clk)		
		);

//
// DNA raw 57  = 1000_1111_1000_1001_0011_1000_0010_1011_0010_1110_0001_1100_0011_1000_1
//					= 8F89382B2E1C38xx
// adder will be 26(1'b1)	= 011010
// Parity is     odd			= 26(1'b1)(raw) + 3(1'b1)adder = odd = 1
//
parameter DnIdle	= 4'b0000;
parameter Dn01		= 4'b0001;
parameter Dn02		= 4'b0011;
parameter Dn03		= 4'b0010;
parameter Dn04		= 4'b0110;
parameter Dn10		= 4'b0111;
parameter Dn11		= 4'b0101;
parameter Dn12		= 4'b0100;
parameter Dn13		= 4'b1100;
parameter Dn20		= 4'b1101;
parameter Dn99		= 4'b1111;


assign	DNA_64[63:7] = DNA_R[56:0];
assign	DNA_64[6:1]	 = Adder1[5:0];
assign	DNA_64[0]	 = Parity;

always @(posedge CLK4) begin
if (ATV == 1'b0) begin
	dna_read		<= 0;
	dna_shift	<= 0;
	dna_clk		<= 0;
	dna_counter	<= 6'b00_0000;
	Adder1		<= 6'b00_0000;
	Parity		<= 1'b0;
	DNA_Valid	<= 1'b0;			// always not valid yet
	dna_ST		<= DnIdle;		// always idle now
end else begin
//// ========= State machine default state ======
	case (dna_ST)
	DnIdle: begin
		dna_read		<= 0;
		dna_shift	<= 0;
		dna_clk		<= 0;
		dna_counter	<= 6'b00_0000;
		Adder1		<= 6'b00_0000;
		Parity		<= 1'b0;
		DNA_Valid	<= 1'b0;			// always not valid yet
		dna_ST		<= Dn01;
	end
	Dn01	: begin
		dna_read		<= 1;			// raise the read port
		dna_ST		<= Dn02;
	end
	Dn02	: begin
		dna_clk		<= 1;			// rising edge of pulse, will clock the DNA port
		dna_ST		<= Dn03;
	end
	Dn03	: begin
		dna_clk		<= 0;			// remove clock pulse
		dna_ST		<= Dn04;
	end
	Dn04	: begin
		dna_read		<= 0;			// remove read signal, bit 57 will be in the output port
		dna_shift	<= 1;			// enable shift signal
		dna_ST		<= Dn10;
	end
//// =========== shift the DNA raw data now =======================
	Dn10	: begin
		DNA_R[55:0]	<= DNA_R[56:1];	// shift the register
		DNA_R[56]	<= dna_out;			// shift the register
		if (dna_out == 1'b1) begin
			Adder1	<= Adder1 + 1;
			Parity	<= ~Parity;
		end
		dna_ST		<= Dn11;
	end
	Dn11	: begin
		dna_counter	<= dna_counter + 1;		// add the counter
		dna_ST		<= Dn12;
	end
	Dn12	: begin
		dna_clk		<= 1'b1;			// rising edge
		dna_ST		<= Dn13;
	end
	Dn13	: begin
		dna_clk		<= 1'b0;			// falling edge
		if (dna_counter == 6'b11_1001) begin		// check 57 for 57 data
			dna_ST	<= Dn20;
		end else begin
			dna_ST	<= Dn10;					// loop back for the data
		end
	end
//// =========== compute final Parity now =======================
	Dn20	: begin
		Parity		<= Parity ^ Adder1[5] ^ Adder1[4] ^ Adder1[3] ^ Adder1[2] ^ Adder1[1] ^ Adder1[0];
		dna_ST		<= Dn99;
	end
//// =========== parity out now =======================
	Dn99	: begin
		DNA_Valid	<= 1'b1;			// say valid
		dna_ST		<= Dn99;			// loop forever
	end
//// ============================================
	default: begin
		dna_ST 		<= DnIdle;		// jump to idle for rouge states
	end
	endcase
end // ATV
end // clock edges
	
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:51 12/08/2008 
// Design Name: 
// Module Name:    DMA_RAM - Behavioral 
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


module D_RAM(
	input CLK4	,	
	input DMA_ARM	, 
	input PS2WrIDE	, 			// High if PS2 DMA write to IDE bus
//// =====
	input CRC_ARM ,  
	input CRC_ENB	, 			// the enable for the CRC circuit
	output [15:0] CRC_Q ,
//// =====
	output [3:0] BufSize ,		// data size in 512 bytes ready
	output BufEmpty , 		// set when no words in the FIFO buffer
//// =====
	input [15:0] DInA	,
	output [15:0] DOutA ,
	input [31:0] DInB ,
	output [31:0] DOutB ,
//// =====
	output PA_HvSpace	, 
	output PA_OD_Rdy	, 		// some data availabe for output from Port A
	output PA_AlmostFull , 	// set when buffer has only 4 words left
	output PA_Empty,			// set when buffer is all drained
	output PA_Full,			// Register is full.
	output WithinABlock ,
	output reg A0,					// A0 to put signal to IDE_DMA
	input	HWOE,					// select high order word to output
	input	RegEA,
	input IncAddrA , 
	input EnbA ,					// enable and the control signal
	input WrA	, 
//// =====
	output PB_HvSpace	, 
	output PB_OD_Rdy	, 	// some data availabe for output from Port B
	output WithinBBlock , 		// high if (AddrB[6] | AddrB[5]) = 1
	output BBurstEnd	, 		// high if AddrB = xxxx11111 = 1F
	input IncAddrB , 
	input RegEB	, 
	input EnbB	,	
	input WrB
);


//////////////////////////////////////////////////////
wire	R0Enb,R1Enb,R0Wr,R1Wr,RegEA0,RegEA1;
wire	[15:0] DOutA0,DOutA1,DInBL,DInBH,DOutBL,DOutBH;
reg	[9:0] AddrA,AddrB;
reg	[3:0] Page;
wire	IncPgA,IncPgB;
wire PageNZ,PageZR;
wire HvSpaceA,HvSpaceB;
wire A_Zero,B_Zero;
////-=========================================================================
RAM1 RAM_Lo (
	.clka		(CLK4),
	.dina		(DInA),		// IDE side data bits
	.addra	(AddrA),
	.ena		(R0Enb),
	.wea		(R0Wr),
	.regcea	(RegEA0),
	.douta	(DOutA0),
//
	.clkb		(CLK4),
	.dinb		(DInBL),		// PS2 side data bus
	.addrb	(AddrB),
	.enb		(EnbB),
	.regceb	(RegEB),
	.web		(WrB),
	.doutb	(DOutBL)
);
//// =========================================
RAM1 RAM_Hi(
	.clka		(CLK4),
	.dina		(DInA),		// IDE side data bits
	.addra	(AddrA),
	.ena		(R1Enb),
	.wea		(R1Wr),
	.regcea	(RegEA1),
	.douta	(DOutA1),
//
	.clkb		(CLK4),
	.dinb		(DInBH),		// PS2 side data bus
	.addrb	(AddrB),
	.enb		(EnbB),
	.regceb	(RegEB),
	.web		(WrB),
	.doutb	(DOutBH)
);
//// =========================================

CRC_CAL CRC(
	.CLK4		(CLK4),			// same as RAM clock
	.D			(DInA),			//- same as the RAM data
	.CRC_ARM	(CRC_ARM),			//- from the controller unit
	.CRC_ENB	(CRC_ENB),
	.CRC_Q	(CRC_Q)
);
//-=============================================================================

//-==== Connect the RAM
assign DOutA[15:0]	= (HWOE == 1'b1) ? DOutA1[15:0] : DOutA0[15:0];
assign DOutB[31:16]	= DOutBH[15:0];
assign DOutB[15:0]	= DOutBL[15:0];
assign DInBH[15:0]	= DInB[31:16];
assign DInBL[15:0]	= DInB[15:0];
assign R0Enb	= EnbA & ~A0;
assign R1Enb	= EnbA &  A0;
assign R0Wr		= WrA  & ~A0;
assign R1Wr		= WrA  &  A0;
assign RegEA0	= RegEA & ~A0;
assign RegEA1	= RegEA &  A0;
////
//// = the page counter ////
assign IncPgA	= IncAddrA & AddrA[6] & AddrA[5] & AddrA[4] & AddrA[3] & AddrA[2] & AddrA[1] & AddrA[0] & A0;
assign IncPgB	= IncAddrB & AddrB[6] & AddrB[5] & AddrB[4] & AddrB[3] & AddrB[2] & AddrB[1] & AddrB[0];
assign BufEmpty	= PageZR & A_Zero & B_Zero;
////////-=======================================================
assign HvSpaceA	= ~Page[3] & ( ~(Page[2] & Page[1] & Page[0]) | A_Zero );
assign HvSpaceB	= ~Page[3] & ( ~(Page[2] & Page[1] & Page[0]) | B_Zero );
assign PageNZ	= Page[3] | Page[2] | Page[1] | Page[0];
assign PageZR	= ~(Page[3] | Page[2] | Page[1] | Page[0]);
assign A_Zero	= ~(AddrA[6] | AddrA[5] | AddrA[4] | AddrA[3] | AddrA[2] | AddrA[1] | AddrA[0]);
assign PA_Empty	= PageZR & A_Zero & ~A0;
assign B_Zero	= ~(AddrB[6] | AddrB[5] | AddrB[4] | AddrB[3] | AddrB[2] | AddrB[1] | AddrB[0]);

assign PA_OD_Rdy		= PageNZ;
assign PA_HvSpace		= HvSpaceA;		// have 512 byte space at least
assign PA_AlmostFull	= Page[3] | (Page[2] & Page[1] & Page[0] & AddrA[6] & AddrA[5] & AddrA[4] & AddrA[3]);
// PA_Full - a signal set high to indicate all buffer area is used up and until clear one page, should
// not start DMA read into Port A
//  This signal will be high if incremented and will keep high until PortB dec it
assign PA_Full			= Page[3];

assign WithinABlock	= AddrA[6] | AddrA[5] | AddrA[4] | AddrA[3] | AddrA[2] | AddrA[1] | AddrA[0] | A0;
////
assign PB_OD_Rdy		= PageNZ;			// if there is more than one page of data
assign PB_HvSpace		= HvSpaceB;		// if there is space in buffer
assign WithinBBlock	= AddrB[6] | AddrB[5] | AddrB[4] | AddrB[3] | AddrB[2] | AddrB[1] | AddrB[0];
assign BBurstEnd		= AddrB[4] & AddrB[3] & AddrB[2] & AddrB[1] & AddrB[0]; // high if AddrB = xxxx11111 = 1F
////////
assign BufSize[3:0]	= Page[3:0];

////- ============================================================================
always @(posedge CLK4) begin
	if (DMA_ARM == 1'b0)
	  AddrB		<=  10'b00_0000_0000;
	else
		if(IncAddrB == 1'b1)
		  AddrB		<= AddrB + 1;
end
	
always @(posedge CLK4) begin
	if (DMA_ARM == 1'b0) begin
	  AddrA	<=	10'b00_0000_0000;
	  A0		<= 1'b0;
	end else begin
		if(IncAddrA == 1'b1) begin
			if (A0 == 1'b1) begin
				AddrA	<= AddrA + 1;
				A0		<= 1'b0;
			end else begin
				A0		<= 1'b1;
			end
		end
	end
end

always @(posedge CLK4) begin
	if (DMA_ARM == 1'b0) begin
	  Page		<=  4'b0000;
	end else begin
		if (PS2WrIDE == 1'b1) begin	// PS2 writes to drive
			if (IncPgB == 1'b1) begin
				if (IncPgA == 1'b0) Page <= Page + 1;	// buffer increase in size
			end else begin
				if (IncPgA == 1'b1) Page <= Page - 1;	// buffer decrease in size
			end
		end else begin
			if (IncPgA == 1'b1) begin
				if (IncPgB == 1'b0) Page <= Page + 1;	// buffer has increase in size
			end else begin
				if (IncPgB == 1'b1) Page <= Page - 1; // buffer decrease in size
			end
		end // PS2WrIDE
	end // DMA_ARM
end // always
	
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:06 03/04/2009 
// Design Name: 
// Module Name:    IDE_DMA 
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

//// Uncomment the following library declaration if instantiating
//// any Xilinx primitives in this code.
//library UNISIM;
//use UNISIM.VComponents.all;

module IDE_DMA(
//	output IDE_DMA_STATE : out std_logic_vector(15 downto 0);
	input CLK4		,
	input Phase3	,
////// external pin interface
	output reg iDK	,			// DMA acknowledge output to harddisk
	input iDQ		,			// DMA request input from harddisk
	input SiRdy1	,			// Sync ready signal
	input SiRdy2	,			// Sync ready signal
////// system signal
	input DMA_ARM  ,		// extra signal to ARM the IDE DMA part
	input PS2WrIDE	 ,			// 1'b1 if direction is from PS2 to IDE
	input [2:0] UDMA ,			// the mode of the current transfer
	input [2:0] MDMA,
	output iDMARd		,			// active high signal to indicate DMA read
	output iDMAWr	 ,			// active high signal to indicate DMA write
	output reg iDMA_OE	 ,			// active high showing unit wishes to write bus
	output reg iD_245_In  ,			// active high 245 read envelope ( 1 clock before OE and 1 clock after)
	output reg CRC_MUX	 ,			// inform system that need to drive the CRC Q to IDE bus
	output reg CRC_ARM	 ,			// a signal indicate that to clear the CRC state
	output reg CRC_ENB	 ,				// the enable for the CRC circuit
////// interface the RAM buffer, DMA machine will act according to buffer
	input A0	,			// address A0
	input PA_Full		,		// high if PA is full, will be low only one block is cleared
	input PA_HvSpace	 ,	// there is empty space for Port A
	input PA_OD_Rdy	 ,	// some data availabe for output from Port A
	input WithinABlock	 ,	// set within A block
	input PA_AlmostFull  ,		// stop if the buffer is almost full
	input PA_Empty		,		// high if PA is empty
	output IDE_DSTB,		// high if we wish to strobe data
	output reg HWOE,		// high to select high page to output
	output reg RegEA,
	output reg IncAddrA , 
	output reg EnbA ,					// enable and the control signal
	output reg WrA 
);

//////

//// ================================
////////////////////////////////////////////////
// signals
// NDMA : iDQ,iDK,iWr,iRd,iRDY
// UDI  : iDQ,iDK,STOP,HDMARDY,DSTROBE
// UHO  : iDQ,iDK,STOP,HSTROBE,DDMARDY
//////////////////////////////////////
reg HDMARDY,HSTROBE,STOP;
reg ND_Rd,ND_Wr;

wire NBrkOut;	// wire to break out when buffer is empty
reg	iWait;
wire UDMAC,MDMAC;
reg	ND_ARM;
reg	UHO_ARM;
reg	UDI_ARM; // the UDI enable wire
reg	ILatch;		// the latch to control the data path for CRC calculation
//// ========
wire	Proceed;	// wire to proceed to output data in buffer
wire XiRdy1;	// signal to indicate there is a transition

parameter iIdle1	= 6'b00_0000;
parameter iIdle2	= 6'b00_0001;
parameter ND_2 	= 6'b00_0010;
parameter ND_3 	= 6'b00_0011;
parameter ND_4 	= 6'b00_0100;
parameter ND_5 	= 6'b00_0101;
parameter ND_6 	= 6'b00_0110;
parameter ND_7 	= 6'b00_0111;
parameter ND_8 	= 6'b00_1000;
parameter ND_9 	= 6'b00_1001;
parameter ND_A 	= 6'b00_1010;
parameter ND_B 	= 6'b00_1011;
parameter ND_C 	= 6'b00_1100;
parameter Udi1 	= 6'b01_0000;
parameter Udi2 	= 6'b01_0001;
parameter Udi3 	= 6'b01_0010;
//parameter Udi4 	= 6'b01_0011;
parameter Udi10	= 6'b01_0100;
parameter Udi11	= 6'b01_0101;
parameter Udix1 	= 6'b10_0001;
parameter Udix2 	= 6'b10_0010;
parameter Udix3 	= 6'b10_0011;
parameter Udix4 	= 6'b10_0100;
parameter Udix5 	= 6'b10_0101;
parameter Udix6 	= 6'b10_0110;
parameter Uho_G 	= 6'b10_0111;
parameter Uhx_0 	= 6'b10_1000;
parameter Uhx_1 	= 6'b10_1001;
parameter Uhx_2 	= 6'b10_1010;
parameter Uhx_3 	= 6'b10_1011;
parameter Uhx_4 	= 6'b10_1100;
parameter Uhx_5 	= 6'b10_1101;
parameter Uhx_6 	= 6'b10_1110;
//
parameter Uho_0	= 6'b11_0000;
parameter Uho_1	= 6'b11_0001;
parameter Uho_2	= 6'b11_0010;
parameter Uho_3	= 6'b11_0011;
parameter Uho_4	= 6'b11_0100;
parameter Uho_5	= 6'b11_0101;
parameter Uho_6	= 6'b11_0110;
parameter Uho_7	= 6'b11_0111;
parameter Uho_8	= 6'b11_1000;
parameter Uho_9	= 6'b11_1001;
parameter Uho_A	= 6'b11_1010;
parameter Uho_B	= 6'b11_1011;
parameter Uho_C	= 6'b11_1100;
parameter Uho_D	= 6'b11_1101;
parameter Uho_E	= 6'b11_1110;
parameter Uho_F	= 6'b11_1111;


reg [5:0] iSTATE;
reg [4:0] iCount;
reg PipeEmpty;
reg IDE_DSTB1;

////- ============== test stubs
//IDE_DMA_STATE(15 downto 7) <= "100000000";  // starts as 80xx
//IDE_DMA_STATE(6 downto 0) <= Count(6 downto 0);
//////////// ================== END OF TEST STUBBS =======================



////==========================================================
//- Normal DMA only signal
assign iDMAWr  =	(ND_ARM & ND_Wr) | ((UDI_ARM | UHO_ARM) & ~(STOP));                // the external DMA signal
assign iDMARd  =	(ND_ARM & ND_Rd) |
						(UDI_ARM & HDMARDY) |
						(UHO_ARM & ~HSTROBE);

// ===============================================================================
/// signal to stop normal DMA machine
//  either	1/ iDQ is negated
//		or		2/ During Host Out and no data in FIFO
//		or		3/ During Drive In and FIFO is full
assign 	NBrkOut	= ~iDQ | (PS2WrIDE & PA_Empty) | (~PS2WrIDE & PA_Full);
//// ============================================================================

//// ===================================
assign	UDMAC	= (UDMA[2] | UDMA[1] | UDMA[0]) & ~(MDMAC);
assign	MDMAC	= MDMA[2] | MDMA[1] | MDMA[0];
assign	Proceed = PA_OD_Rdy | WithinABlock;	// allow to output data when ready or we are in a transaction period
assign	XiRdy1	= SiRdy1 ^ SiRdy2;				// an early edge signal, lock the data to RAM
assign	IDE_DSTB = (XiRdy1 & UDI_ARM) | ((UHO_ARM | ND_ARM) & ILatch );

always @(posedge CLK4) begin
	IDE_DSTB1	<= IDE_DSTB;
	CRC_ENB		<= IDE_DSTB1 & ~IDE_DSTB;			// trigger 1 clock after its deb
end

always @(posedge CLK4)begin
////DelayHSTB	<= HSTROBE;
//HDMARDY	<= ~STOP & (PA_HvSpace | (HDMARDY & (~PA_AlmostFull | ~XiRdy1)));	//if we are almost full and enabled

if (DMA_ARM == 1'b0) begin
// ============================================================
	UDI_ARM	<= 1'b0;
	UHO_ARM	<= 1'b0;
	STOP		<= 1'b1;		// always STOP
	HDMARDY	<= 1'b0;		// Host always not ready
	iWait		<= 1'b0;		// assume no wait
	HSTROBE	<= 1'b1;		// HSTrobe Control by us
// ===================
	ND_ARM	<= 1'b0;
	ND_Rd		<= 1'b0;     // no reading
	ND_Wr		<= 1'b0;     // stop anything
	ILatch	<= 1'b0;
// ===================
	iDK		<= 1'b0;
	iDMA_OE	<= 1'b0;			// no OE
	iD_245_In	<= 1'b0;		// disable 245 driver direction control
	CRC_ARM	<= 1'b0;			// clear the CRC machine
	CRC_MUX	<= 1'b0;			// not selecting the CRC to output
//	CRC_ENB	<= 1'b0;			// do not enable the CRC
// =============== RAM block control signal
	RegEA		<= 1'b0;
	IncAddrA	<= 1'b0;
	EnbA		<= 1'b0;			// enable and the control signal
	WrA		<= 1'b0;
	iCount	<= 5'b0000;
	HWOE		<= 1'b0;
	PipeEmpty	<= 1'b1;		// pipeline is empty for reset
	iSTATE	<= iIdle1;		// keep the first state machine
// ==================
end else begin
// =========================================================
if (UHO_ARM == 1'b1) begin
	if (SiRdy2 == 1'b1) begin
		iWait		<= 1'b1;			// need to wait
		iCount	<= 5'd00;
	end else begin
		iCount	<= iCount + 1;
		if (iCount[4] == 1'b1) begin
			iWait	<= 1'b0;			// clear the wait 16 clocks after SiRdy2 goes low
		end
	end
end //UHO_ARM
//============================================================
case (iSTATE)
iIdle1: begin
// ============================================================
	UDI_ARM	<= 1'b0;		// Device In mode not ARM
	STOP		<= 1'b1;		// always STOP
	HDMARDY	<= 1'b0;		// always not ready
// ============================================================
	UHO_ARM	<= 1'b0;		// Host Out mode not ARM
	HSTROBE	<= 1'b1;		// HSTrobe Control by us
// ============================================================
	ND_ARM	<= 1'b0;		// Normal DMA not ARM
	ND_Rd		<= 1'b0;		// no reading
	ND_Wr		<= 1'b0;		// stop anything
	ILatch	<= 1'b0;
// ===================
	iDK		<= 1'b0;
	iDMA_OE	<= 1'b0;			// no OE
	iD_245_In	<= 1'b0;		// disable control of 245 driver direction
	CRC_ARM	<= 1'b0;			// clear the CRC machine
	CRC_MUX	<= 1'b0;			// not selecting the CRC to output
// ===============
	RegEA		<= 1'b0;
	IncAddrA	<= 1'b0;
	EnbA		<= 1'b0;			// enable and the control signal
	WrA		<= 1'b0;
	iCount	<= 5'b0000;
// ===============
	iSTATE	<= iIdle2;	// next looping state
end
//// =============================================
iIdle2: begin
	iCount	<= 5'd00;					// set counter as 00 in this state
	if (iDQ == 1'b1) begin
		if (UDMAC == 1'b1) begin			//- Ultra DMA mode
			if (PS2WrIDE == 1'b1) begin
				if (Proceed == 1'b1) begin	// try to proceed to output data
					iSTATE <= Uho_0;			// UW1: Write Data from PS2 to IDE
				end
			end else begin
				if (PA_HvSpace == 1'b1) begin
					iSTATE	<= Udi1;	// Read data from drive if we have space
				end
			end	// PS2WrIDE
		end else begin //- normal mode
			if (PS2WrIDE == 1'b1) begin
				if (Proceed == 1'b1) begin		// if one block of data is valid
					iSTATE <= ND_2;
				end
			end else begin
				if (PA_HvSpace == 1'b1) begin
					iSTATE <= ND_2;	// if there is space
				end
			end //- PS2WrIDE
		end //-UDMA
	end else begin
		iSTATE <= iIdle2;		// loop here until iDQ = 1;
	end // iDQ
end
////// =================================================
//-=== Multiword
//==  mode 0 = 480nS cycle = 72 state = ND_3..ND36 = 36/36
//==  mode 1 = 150nS cycle = 22 state = 01,02,03,04,18,19,20,21,22,23,24  = 12/10
//==  mode 2 = 120nS cycle = 18 state = 01,02,03,04,05,   20,21,22,23     = 10/8
//// =====
ND_2: begin
	iSTATE		<= ND_3;				// always
	iDK			<= iDQ;				// directly map the request
	ND_ARM		<= 1'b1;				// enter the normal DMA mode
	iD_245_In	<= ~PS2WrIDE;		// turn 245 inwards if
end
//// ======
ND_3: begin
	iDK		<= iDQ;						// directly map the request
	if (NBrkOut == 1'b0) begin			// if not breaking out
		EnbA		<= PS2WrIDE;			// enable the RAM if writing
		iSTATE	<= ND_4;					// goto next state if iDQ is not zero and we are within A Block
	end else begin
		iD_245_In	<= 1'b0;				// breaking out, always turn the buffer outwards
		ND_ARM		<= 1'b0;				// no more arming of the signal
		iSTATE		<= iIdle1;			// exit to check again
	end
end
//// =====
ND_4: begin
	iSTATE	<= ND_5;
	EnbA		<= 1'b0;				// already enabled, now turn off to conserve power
	RegEA		<= PS2WrIDE;		// enable the registers if RAM access
end
//// =====
ND_5: begin
	iSTATE	<= ND_6;				// goto next state ND_6 state
	RegEA		<=	1'b0;				// latch gated, turn off now
	iCount	<= 5'd00;			// reset the counter
	iDMA_OE	<= PS2WrIDE;		// if write to drive, we will drive the data bus
end
//// =====
ND_6: begin
	iSTATE	<= ND_7;				// goto next state ND_6 state
	ND_Rd		<= ~PS2WrIDE;		// if read from drive then strobe external signal
	ND_Wr		<=  PS2WrIDE;		// if write to drive then strobe external signal
end
//// =============== determine cycle length =====================	
ND_7:	begin
	iCount	<= iCount + 1;			//count less 5 for processing
	if (((iCount == 5'd05) && (MDMA[2] == 1'b1)) ||			// strobe width is 10 clks 
		 ((iCount == 5'd07) && (MDMA[1] == 1'b1)) || 		// strobe width is 12 clks
		  (iCount == 5'd31) ) begin								// strobe width is 36 clks
		iSTATE	<= ND_8;			// set end Phase
	end
end
//// ===============
ND_8: begin
	ILatch	<= ~PS2WrIDE;		// if read from drive then enable input latch
	iSTATE	<= ND_9;				// proceed if I/O ready
end
ND_9: begin
//	if (SiRdy2 == 1'b1) begin
		iSTATE	<= ND_A;			// proceed if I/O ready
//	end
end
//// ===============
ND_A: begin
	WrA		<= ~PS2WrIDE;		// if mode is read from drive then we pulse RAM
	EnbA		<= ~PS2WrIDE;		// if mode is read from drive then we pulse RAM
	iCount	<= 5'd00;			// reset counter
	iSTATE	<= ND_B;
end
ND_B: begin
	WrA		<=	1'b0;				// always disable internal RAM Block write pulse
	EnbA		<= 1'b0;				// always disable the RAM Block control signal
	ND_Rd		<=	1'b0;				// always turn off external strobe
	ND_Wr		<= 1'b0;				// always turn off external strobes now
	ILatch	<= 1'b0;				// switch off data latch
	IncAddrA	<= 1'b1;				// inc internal RAM Block address to next location
	iSTATE	<= ND_C;
end
//// ====================== end Phase
ND_C: begin
	iDMA_OE	<= 1'b0;				// turn off the internal busdrivers
	IncAddrA	<= 1'b0;				// turn off RAM Block address
	HWOE		<= A0;				// select the next output data
	iCount	<= iCount + 1;		//count less 5 for processing
	if (((iCount == 5'd03) && (MDMA[2] == 1'b1)) ||			// recharge is 8 clks 
		 ((iCount == 5'd05) && (MDMA[1] == 1'b1)) || 		// recharge is 10 clks
		  (iCount == 5'd31) ) begin								// recharge is 36 clks
		iSTATE	<= ND_3;			// loop again
	end
end
////-============================================================
//- Ultra DMA Drive In mode - we read from drive and write to FIFO
////-============================================================
Udi1:	begin						// Udi1 state
	UDI_ARM		<= 1'b1;		// now the DMA_machine is UDI controlled
	iDK			<= 1'b0;		// no DMA first
	iDMA_OE		<= 1'b0;		// ensure we are not driving the FPGA output
	STOP			<= 1'b1;		// set to stop first
	HDMARDY		<= 1'b0;		// set to not ready first
	if (Phase3 == 1'b1) begin
		iSTATE	<= Udi2;
	end
end
Udi2:	begin					// Udi2 state -- at least one clock
	if (iDQ == 1'b1) begin
		if ((Phase3 == 1'b1) && (SiRdy2 == 1'b1)) begin  // wait until the drive drives high the IORDY signal
			iSTATE	<= Udi3;
		end
	end else begin
		iSTATE	<= iIdle1;			// exit to idle if iDQ suddenly gone
	end
end
Udi3:	begin					// Udi3 state -- at least one clock
	iDK			<= 1'b1;		// we issue DMA ready for iDQ
	iD_245_In	<= 1'b1;		// turn the driver inwards
	CRC_ARM		<=	1'b1;		// start the CRC machine
	if (Phase3 == 1'b1) begin
		iSTATE	<= Udi10;
	end
end
//// ==================
//HDMARDY	<= ~STOP & (PA_HvSpace | (HDMARDY & ~(PA_AlmostFull & XiRdy1)));	//if we are almost full and enabled

Udi10:	begin
	IncAddrA	<= 1'b0;						// always clear the increment address pulse
	if (XiRdy1 == 1'b1) begin	// delay 2 and 3
		EnbA		<= 1'b1;
		WrA		<= 1'b1;
//		CRC_ENB	<= 1'b1;			// calculate the CRC
		iSTATE	<= Udi11;
	end else begin
		if (iDQ	== 1'b1) begin			// if iDQ still valid
			HDMARDY	<= ~PA_AlmostFull;		//20100623 still have space
			STOP		<= 1'b0;						// 20100623 not stopping
			iSTATE	<= Udi10;					// loop here
		end else begin
			HDMARDY	<= 1'b0;						//20100623
			STOP		<= 1'b1;						//20100623
			iSTATE	<= Udix1;					// no more iDQ then exit
		end
	end
end
Udi11:	begin
	iSTATE	<= Udi10;			// loop back for fast processing
	EnbA		<= 1'b0;				// no more RAM enable
	WrA		<= 1'b0;				// no more Wr enable
//	CRC_ENB	<= 1'b0;				// no more CRC
	IncAddrA	<=	1'b1;				// just increment the address
end
//// ========================= exit routine ====================
Udix1:	begin
	if ((Phase3 == 1'b1) && (SiRdy2 == 1'b1)) begin  // wait until the drive drives high the IORDY signal
		iSTATE 	<= Udix2;
	end
end
Udix2:	begin
	CRC_MUX		<= 1'b1;		//20100622 add one clock earlier to turn the CRC_MUX to data bus
	iD_245_In	<= 1'b0;		//20100622 add one clock earlier to turn the 245 outwarts
	if (Phase3 == 1'b1) begin
		iSTATE 	<= Udix3;		// wait at least one clock
	end
end
Udix3:	begin
	iDMA_OE		<= 1'b1;		// 20100622 add one clock earlier drive high the OE to output the CRC address
	if (Phase3 == 1'b1) begin
		iSTATE <= Udix4;			// wait at least two clock
	end
end
Udix4:	begin
	if (Phase3 == 1'b1) begin
		iSTATE <= Udix5;		// wait at least two clock
	end
end
Udix5:	begin
	iDK		<= 1'b0;		// stop the iDK
	if (Phase3 == 1'b1) begin
		iSTATE <= Udix6;		// wait at least two clock
	end
end
Udix6:	begin
	if (Phase3 == 1'b1) begin
		iSTATE <= iIdle1;		// wait at least two clock
	end
end
////-======================================================
//- Ultra DMA Host Out mode - we read from DMA RAM and write to drive
//- only here we detemine the cycle time
//- UDMA(2) = 60nS cycle time = 8 clock
//- UDMA(1) = 80nS (81.6) = 12 clock
//- UDMA(0) = 120nS cycle time = 16 clock
////-======================================================
Uho_0: begin							// UW1 state
	UHO_ARM		<= 1'b1;
	iDK			<= 1'b1;				// enable the iDKs
	STOP			<= 1'b1;				// STOP the system first
	HSTROBE		<= 1'b1;				// STROBE is high
	EnbA			<=	PipeEmpty;		// enable the RAM if the pipeline is empty
	iSTATE		<= Uho_1;			// UW2 state
end
//// ======= entry from temporary stop with refill data  =================
Uho_1: begin							// UW2 state
	iDK			<= 1'b1;				// DMA ready
	EnbA			<= 1'b0;				// already enable the RAM, turn it off
	RegEA			<= PipeEmpty;		// enable register if the pipeline is empty
	iD_245_In	<= 1'b0;				// turn the driver outwards, data is now put to bus
	iSTATE		<= Uho_2;			// UW3 state
end
//// =======
Uho_2: begin
	RegEA			<= 1'b0;						// register already enabled
	HWOE			<= ~PipeEmpty ^ A0;		// if empty uses A0; if not empty uses ~A0
	iSTATE		<= Uho_3;					// UW4 state
end
//// ========
Uho_3: begin		// UW4 state
	STOP			<= 1'b0;						// remove the STOP signal
	if ((SiRdy2 == 1'b0) && (Phase3 == 1'b1)) begin
		iSTATE	<= Uho_4;					// wait till ready
		iDMA_OE	<= 1'b1;						// drive the OE data
	end
end
//// ======== wait 2 clocks ; restart from old break
Uho_4: begin
	if ((SiRdy2 == 1'b0) && (Phase3 == 1'b1)) begin
		IncAddrA	<=	PipeEmpty;				//Increment the address if the pipe is empty
		iSTATE	<= Uho_5;					//wait 1 clock
	end
end
//// ==== already have valid data in the bus
Uho_5: begin
	IncAddrA	<= 1'b0;			// no more increment the address
	if ((SiRdy2 == 1'b0) && (Phase3 == 1'b1)) begin
		EnbA		<=	1'b1;					// after increment address, enable the RAM
		iSTATE	<= Uho_6;
	end
end
/// === one clock +ve data advance offset data bus
Uho_6:	begin
	iSTATE	<= Uho_7;		// jump into the main loop
	EnbA		<= 1'b0;			// disable the RAM
	iWait		<= 1'b0;			// no need to wait here
	HSTROBE	<= 1'b0;			// first strobe edge is low
	CRC_ARM	<= 1'b1;			// enable the CRC machine
end
//// ====== host output loop is here ==================
Uho_7:	begin
/// data bus and associate control signal
	ILatch	<= 1'b1;			// house keeping enable data bus ilatch for CRC calculation
/// determine buffer content, check if more data to send
	if (PA_Empty == 1'b1) begin
		iSTATE	<= Uho_F;			// last data on bus and no more data, normal exit now
	end else begin
		RegEA		<= UDMA[2];			// enable the register now if UDMA-mode 2
		iSTATE	<= Uho_8;			// more data to send, keep looping
	end
end
////
Uho_8:	begin
/// data bus control signal
	RegEA		<= UDMA[1];				// enable the register now if UDMA-mode 1 / disable if mode 2
	ILatch	<= 1'b0;				// stop the input data latch and pass data to CRC engine
	HWOE		<= (UDMA[2] == 1'b1) ? A0 : HWOE;
///////////
	if (UDMA[2] == 1'b1) begin
		IncAddrA	<=	1'b1;			// increase the address
		iSTATE	<= Uho_D;		// 4 clocks 7,8,D,E
	end else begin
		iSTATE	<= Uho_9;
	end
end
/////// ==================================
Uho_9: begin
/// data bus control signal
	RegEA		<= 1'b0;				// disable the register access always
	HWOE		<= (UDMA[1] == 1'b1) ? A0 : HWOE;
/////////
	if (UDMA[1] == 1'b1) begin
		iSTATE	<= Uho_C;	// 6 clocks	7,8,9,C,D,E
	end else begin
		iSTATE	<= Uho_A;
	end
end
////// ===================================
Uho_A: begin
	RegEA		<= UDMA[0];		// enable the register now if UDMA-mode 0 / disable otherwise
	iSTATE	<= Uho_B;		// 8 cycles 7,8,9,A,B,C,D,E
end
///// middle point of the strobe //////======================
Uho_B: begin
/// data bus control signal
	RegEA		<= 1'b0;			// disable the register access always
	HWOE		<= (UDMA[0] == 1'b1) ? A0 : HWOE;
	iSTATE	<= Uho_C;
end
Uho_C:	begin
	iSTATE	<= Uho_D;
	IncAddrA	<=	1'b1;			// increase the address for one clock
end
Uho_D:	begin
	iSTATE	<= Uho_E;
	IncAddrA	<= 1'b0;			// no more increment the address
	EnbA		<=	1'b1;			// after increment address, enable the RAM
end
Uho_E: begin
	EnbA		<= 1'b0;				// disable the RAM
	if (iDQ	== 1'b0) begin		// check iDQ 
		iSTATE	<= Uhx_0;			// lost iDQ abnormal exit
	end else begin
		if (iWait == 1'b0) begin
//			CRC_ENB	<= 1'b1;			// data stobed, so can calculate CRC
			HSTROBE	<= ~HSTROBE;	// toggle the strobe and keep
			iSTATE	<= Uho_7;		// loop back for another data
		end else begin
			iSTATE	<= Uho_E;		// loop here until no more wait
		end
	end
end
//// =========================== end of host output loop =========
/// === all host data out now, determine exit or re-run refill =====================
Uho_F:	begin
	PipeEmpty	<= 1'b1;			// pipe is empty
	ILatch	<= 1'b0;				// stop the input data latch and pass data to CRC engine
	if (Phase3 == 1'b1) begin
		iSTATE		<= Uho_G;		// exit now
	end
end
Uho_G:	begin
	STOP			<= 1'b1;						// drive high the stop signal
	if (Phase3 == 1'b1) begin
		if ((SiRdy2 == 1'b1) && (iDQ == 1'b0)) begin			// wait here until ready and DMA request is gone
			iSTATE <= Uhx_3;			// wait at least two clock
		end else begin
			if (PA_OD_Rdy == 1'b1) begin	// or wait until there is one block of data to transfer out
				EnbA		<=	PipeEmpty;		// enable the RAM if the pipeline is empty (always 1'b1)
				iSTATE 	<= Uho_1;			// jump back into the main loop if there is data
			end
		end
	end
end
//// ==== lost of iDQ, data still in RAM BLOCK Register exit ============
Uhx_0:	begin
	PipeEmpty	<= 1'b0;		// clear flag as the UHO machine has unread content
	if (Phase3 == 1'b1) begin
		iSTATE		<= Uhx_1;
	end
end
Uhx_1:	begin
	if (Phase3 == 1'b1) begin
		iSTATE 	<= Uhx_2;		// wait at least two clock
	end
end
Uhx_2:	begin
	STOP			<= 1'b1;						// drive high the stop signal
	if ((Phase3 == 1'b1) && (SiRdy2 == 1'b1) && (iDQ == 1'b0)) begin			// wait here until ready and DMA request is gone
		iSTATE <= Uhx_3;			// wait at least two clock
	end
end
Uhx_3:	begin
	HSTROBE		<= 1'b1;					// must set high the HSTROBE signal now
	CRC_MUX		<= 1'b1;					// turn the CRC_MUX to data bus
	if (Phase3 == 1'b1) begin
		iSTATE <= Uhx_4;					// wait at least two clock
	end
end
Uhx_4:	begin
	if (Phase3 == 1'b1) begin			// wait here until ready is gone
		iSTATE <= Uhx_5;					// wait at least two clock
	end
end
Uhx_5:	begin
	iDK		<= 1'b0;					// stop the iDK
	if (Phase3 == 1'b1) begin
		iSTATE <= Uhx_6;				// wait at least two clock
	end
end
Uhx_6:	begin
	if (Phase3 == 1'b1) begin
		iSTATE <= iIdle1;				// wait at least two clock
	end
end
//// ======================== end of UHO loop =================
default: begin
	iSTATE <= iIdle1;		// jump to idle for rouge states
end
endcase
end // DMA_ARM
end // clock edges

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:00 12/08/2008 
// Design Name: 
// Module Name:    PS2_DMA - Behavioral 
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

module PS2_DMA (
//	PS2_DMA_STATE : out std_logic_vector(15 downto 0);
	input CLK4,				// 146.6MHz clock input
	input Phase3,		// the phases
////// external pin interface
	output reg cDQ,		// DMA request output
	input cDK,				// DMA acknowledge input
	input cRd,				// read pulse
	input DWrite,			// write and counter pulse
////// controlling signal
	input DMA_ARM		,		// signal from ctrllr to inits DMA
	input PS2WrIDE		,		// level indicating that PS2 is DMA writing IDE bus
//// PS2 DMA connecting to RAM interface
	input PB_OD_Rdy  ,			// set high if at least 512 bytes in buffer (only check high order bits)
	input PB_HvSpace  ,			// set high if there is at least 512 bytes empty space in buffer (only check high order bits)
	input WithinBBlock  ,		// high if (AddrB(6) | AddrB(5)) = 1
	input BBurstEnd	 ,			// high if AddrB = xxxx11111 = 1F
////
	output  reg IncAddrB  ,
	output  RegEB	 ,				// pipeline register enable
	output  reg EnbB	 ,
	output  reg WrB
);

reg DTook;
reg DWrote;

// reworking the state machines at 100807

parameter PIdle 	= 5'b00000;
/// read phases
parameter PR20 	= 5'b00100;
parameter PR21 	= 5'b00101;
parameter PR22 	= 5'b00110;
parameter PR23 	= 5'b00111;
parameter PR32 	= 5'b01000;
parameter PR37 	= 5'b01001;
parameter PR38 	= 5'b01010;
parameter PR38A 	= 5'b01011;
parameter PR38B 	= 5'b01100;
/// write phases
parameter PW01A	= 5'b10001;
parameter PW01B	= 5'b10010;
parameter PW01C	= 5'b10011;
parameter PW01D	= 5'b10100;
parameter PW32		= 5'b10101;
parameter PW35		= 5'b10110;
parameter PW36		= 5'b10111;
parameter PW37		= 5'b11000;
parameter PW38A	= 5'b11001;
parameter PW38B	= 5'b11010;
parameter PW38C	= 5'b11011;
parameter PW38D	= 5'b11100;
parameter PW40		= 5'b11101;

reg [4:0] PSST;
reg OPOvrRide;

////- ============== test stubs
//PS2_DMA_STATE (15 downto 6) <= "0000000000";
//PS2_DMA_STATE ( 5 downto 0) <= STATE(5 downto 0);
//TYPE GBState_type IS (A, B, C, D);
//SIGNAL GBState : GBState_Type;

//////////// ================== END OF TEST STUBBS =======================

assign RegEB = Phase3 & ( cRd | OPOvrRide );

//// ===================

always @(posedge CLK4) begin
if (DMA_ARM == 1'b0) begin
	cDQ			<= 1'b0;	// always no request
	DTook			<= 1'b0;
	DWrote		<= 1'b0;
	IncAddrB		<= 1'b0;
	OPOvrRide	<= 1'b0;
	EnbB			<= 1'b0;
	WrB			<=	1'b0;
	PSST			<= PIdle;
end else begin
	////===== State machine default state ======
	case (PSST)
	PIdle: begin
		if (PS2WrIDE == 1'b0) begin			// if reading from disk
			cDQ	<= 1'b0;						// always 0 if we don't have enough data
			if ((PB_OD_Rdy == 1'b1) && (Phase3 == 1'b1)) begin		// if there is data in the buffer
				PSST	<= PR38;			// go to PR38
			end
		end else begin
			cDQ	<= PB_HvSpace;				// high if we have space
			if ((cDK == 1'b1) && (Phase3 == 1'b1)) begin
				PSST	<= PW40;			// PSST 	<= PW40A;
			end
		end
	end
//////- ======== PS2 reading DMA states //////////////////////-
	PR38: begin
		cDQ		<= 1'b0;			// data not ready
		DTook		<= 1'b1;				// increment address for the every burst
		if (Phase3 == 1'b1) begin
			PSST <= PR38A;	// clock the state machine into correct phase
		end
	end
//////- ========================================================
	PR38A: begin
		EnbB		<= DTook;			// be generous, 4 cycle enable for RAM data
		if (Phase3 == 1'b1) begin
			PSST	<= PR38B;	// one dummy state
		end
	end
//////- ======== PR2 state, latch the data and wait for ACK going high
	PR38B: begin
		EnbB			<= 1'b0;		// no more force read enable for RAM
		OPOvrRide	<= 1'b1;		// always output the data
		cDQ			<= 1'b1;		// can request transfer now
		if ((Phase3 == 1'b1) && (cDK == 1'b1)) begin
			PSST 		<= PR20;			// acknowledge so proceed
			DTook		<= cRd;		// check if first data taken
		end
	end
//// ======= PS2 Reading the DMA RAM // loop here ===========================
	PR20: begin
		OPOvrRide	<= 1'b0;		// no need to force output data now
		IncAddrB		<= DTook;	// data taken, rush data to output
		if ((DTook == 1'b1) && (BBurstEnd == 1'b1)) begin		// if currently pointing to last address and data taken
			PSST		<= PR32;		// address will be inc past, so just goto last stage, output registers are all set already
		end else begin
			PSST		<= PR21;	// continue
		end
	end
	PR21: begin
		IncAddrB	<=	1'b0;			// no more address increment
		EnbB		<= DTook;				// if data taken then update the Enb pulse correct phase enable pulse
		PSST		<= PR22;
	end
	PR22: begin
		EnbB		<= 1'b0;					// RAM enable turn off after this cycle
		cDQ		<= cDQ & ~DTook;		// keep request until first data taken cDQ will fall at end of Phase 2
		PSST		<= PR23;
	end
	PR23: begin
		DTook		<= cRd;			// if read is asserted at phase 3, data was took
		if (cDK == 1'b1) begin
			PSST <= PR20;
		end else begin
			PSST <= PR37;		// cDK gone unexpectedly
		end
	end
//		if (DTaken == 1'b0) begin
//			PSST	<= PR01A;			// data not taken, keep looping
//		end else begin
//			IncAddrB	<= 1'b1;			// data taken, new address
//			if (BBurstEnd == 1'b1) begin		// if currently pointing to last address and data taken
//				PSST		<= PR32;		// go to last state, register must have been set
//			end else begin
//				PSST		<= PR01A;	// loop back
//			end
//		end
////- ======== PR32 state // last clock, cleaning the pipeline
	PR32: begin						// outputing the last data
		IncAddrB	<=	1'b0;			// no more address increment
		if (cDK == 1'b1) begin
			PSST		<= PR32;
		end else begin
			PSST 		<= PR37;		// idle end
		end
	end
////- ======================= End of DMA loops ==========================
	PR37: begin
		if (WithinBBlock == 1'b1) begin
			if (Phase3 == 1'b1) begin
				PSST	<= PR38;		// loop back and do again
			end else begin
				PSST	<= PR37;
			end
		end else begin
			PSST <= PIdle;			// block transferred go back to idle state
		end
	end
//////================== End of DMA Read loop ===========================
//////======== PS2 writing DMA RAM, PW40A ===================== 
	PW40: begin
		if ((Phase3 == 1'b1) && (cDK == 1'b1)) begin
			PSST	<= PW01A;		// clock the state machine into correct phase
		end
	end
////////- =========== PW01A ====================================
	PW01A: begin
		IncAddrB	<= 1'b0;		// no more increment address
		PSST		<= PW01B;
	end
	PW01B: begin
		DWrote	<= DWrite;		// a cleaner condition for testing
		PSST		<= PW01C;
	end
	PW01C: begin
		EnbB		<= DWrote;	// enable write the RAM in the end of phase 3
		WrB		<= DWrote;	// will write the RAM in phase 3
		PSST		<= PW01D;
	end
	PW01D: begin
		EnbB		<= 1'b0;		// always turn off the RAM to conserve power
		WrB		<= 1'b0;
		IncAddrB	<= DWrote;			// need to increment address if we have wrote anything last cycle
		if (DWrote == 1'b1) begin		// if last time we have written
			if (BBurstEnd == 1'b1) begin	// if address before increment is last for this burst
				PSST	<= PW32;		// then we exit the loop for a while
			end else begin
				PSST	<= PW01A;	// else loop back
			end
		end else begin
			PSST	<= PW01A;		// last time we have not written anything; loop again
		end
	end
////- ======== PW32 state, wait for 8 cycles and raise the CDREQ
	PW32: begin
		IncAddrB		<= 1'b0;			// clear the increment address
		if (cDK == 1'b1) begin
			PSST <= PW32;		// loop back and wait until no more cDK
		end else begin
			PSST <= PW35;
		end
	end
//// ======== finish burst writing and cDK deassert, now check status of buffer
	PW35: begin
		if (Phase3 == 1'b1) begin
			PSST <= PW36;
		end
	end
	PW36: begin
		if (WithinBBlock == 1'b1) begin
			if (Phase3 == 1'b1) begin
				PSST <= PW37;	// skip and continue looping to write sector data
			end else begin
				PSST <= PW36;		// loop here waiting
			end
		end else begin
			PSST <= PIdle;	//- lead out to Idle state
		end
	end
//// ============================================================
	PW37:	begin
		if (Phase3 == 1'b1) begin
				PSST <= PW38A;
		end
	end
//// =================================================================
	PW38A: begin
		PSST	<= PW38B;
	end
	PW38B: begin
		PSST	<= PW38C;
	end
	PW38C: begin
		cDQ <= 1'b1;			// Raise the LREQ again at the falling edge of CLK
		PSST	<= PW38D;
	end
	PW38D: begin
		PSST <= PW40;		// loop again
	end
////================== End of DMA Write loop ===========================
	default: begin 
	   PSST <= PIdle;
	end
	endcase
end // rising_edge(CLK4)
end 

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:03 11/08/2008 
// Design Name: 
// Module Name:    Reg38 - Behavioral 
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

//// Uncomment the following library declaration if instantiating
//// any Xilinx primitives in this code.
//library UNISIM;
//use UNISIM.VComponents.all;
////- Reg0038 has the following bits being mapped
////	bcIRQ	cDQ	cDK	iIRQ	iDQ	ibDK	Mo86	Mo87		
//// 	1		0		0		0		0		1		0060	----	// bus idle
////	1		0		0		0		1		0		0020	----	// IDE side doing transaction buffer not full
////	1		0		0		0		1		0		----	0020	// IDE side doing transaction buffer not full
////	1		1		0		0		1		0		----	00A0	// IDE side doing transaction and buffer full
////	1		1		0		0		1		1		----	0050	// just start DMA and drive not responding
////	1		1		0		0		1		0		0021,23,24	// buffer size
////	1		1		0		1		0		1		0021,22		// fixed ???
////==================================================
////  Design base on above measurements : note the {} value is iDK = NOT(ibDK)
////	cDQ	cDK	iIRQ	iDQ	ibDK	Mo86	Mo87		
////	x		x		1		x		x		21 for NOT(UDMA) 22 for UDMA
////	1		0		0		x		0{1}	buffer size (21,23,24,...27)
////	1		0		0		1		1{0}	-		50
////	0		x		0		0		x		60	bus idle
////	0		x		0		1		x		20 if buffer not full
////	0		x		0		1		x		A0 if buffer full

module Reg38(
	input UDMAC		,
	input PS2WrIDE	,
	input iIRQ		,
	input cDQ		,
	input iDQ		,
	input iDK		,
	input BufEmpty		,
	input PB_HvSpace	,		// Port A have space
	input [3:0] BufSize	,
	output [7:0] DOut		
);

/// Start of Register 38

wire [7:0] R381;
wire [7:0] W381;
wire WCond1;
wire WCond2,WCond2A,WCond2B1,WCond2B2;
wire WCond3;
//wire WCond3A,WCond3B;
//wire RCond1,RCond2;
wire Activity;

assign Activity	= cDQ | iIRQ | iDQ | iDK | BufSize[3] | BufSize[2] | BufSize[1] | BufSize[0];	// if there is no DMA activity
//assign R381[7:2]	= 6'b00_1000; // fix as 2x
//assign R381[1]		= BufSize[2] | BufSize[1];
//assign R381[0]		= BufSize[2] | BufSize[0];
assign R381[7]	= 1'b0;		// always zero
assign R381[6] = ~Activity;	// no activity will be high
assign R381[5:4] = 2'b10;		// set as 2
assign R381[3:0] = BufSize[3:0];

assign W381[7:0] =
	(BufSize[3:0] == 4'b1000) ? 8'h20 :		// no space left, the buffer is full
	(BufSize[3:0] == 4'b0111) ? 8'h21 :		// one page has been taken, so one space left
	(BufSize[3:0] == 4'b0110) ? 8'h22 :		// two page taken
	(BufSize[3:0] == 4'b0000) ? 8'h24 :		// buffer empty
										 8'h23;		// otherwise
//assign W381[1]		= ~(BufSize[2] & BufSize[1]);
//assign W381[0]		= ~(BufSize[2] & BufSize[1] & BufSize[0]);
//assign W381[1]		= BufSize[2];						// take 0304 it representing very little space
//assign W381[0]		= PB_HvSpace;
//assign RCond1	= ~(PS2WrIDE) & ~(Activity);			// DMA reading and bus not active
//assign RCond2	= ~(PS2WrIDE) & Activity;		// DMA reading and bus active
assign WCond1	= PS2WrIDE & ~(PB_HvSpace);			// if there is no space in buffer
assign WCond2	= PS2WrIDE & ~(iDK);			// bus active but drive side no transfer request
assign WCond2A	= WCond2 & BufEmpty;								// we don't have data in output register
assign WCond2B1	= WCond2 & ~(BufEmpty) & UDMAC;			// if there is data and we are UDMA mode, report as "22"
assign WCond2B2	= WCond2 & ~(BufEmpty) & ~(UDMAC);	// if there is data and we are MDMA mode, report as "21"
assign WCond3	= PS2WrIDE & iDK;				// if there is drive side transfer, PS2 writing data to drive
//assign WCond3A	= WCond3 & BufEmpty;
//assign WCond3B	= WCond3 & ~(BufEmpty); // if something in buffer


assign DOut	=
//// 86 mode, PortA input, Port B output data //
//	(RCond1	== 1'b1) ? 8'h60 :
//	(RCond2	== 1'b1) ? R381  :
	(PS2WrIDE == 1'b0) ? R381 :		// PS2WrIDE = 0, reading from drive
//// 87 mode, PortB input, Port A output data //
	(WCond1	== 1'b1) ? 8'hA0 :		// if no space in buffer B, then buffer is full
//// if PortA have no transaction, iDK = 0 then
	(WCond2A	== 1'b1) ? 8'h50 :		// if bufferA is absolutely empty
	(WCond2B1 == 1'b1) ? 8'h22 :	// if bufferA is not empty
	(WCond2B2 == 1'b1) ? 8'h21 :
//// if PortA have transaction, iDK = 1
	(WCond3	== 1'b1) ? W381 :
//	(WCond3A	== 1'b1) ? 8'h24 :		// plenty of buffer space
//	(WCond3B	== 1'b1) ? W381 :
	8'hFF;
///////// end of reg38 ////////////////////////////

endmodule
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:29:17 05/05/2010
// Design Name:   chip
// Module Name:   D:/usr/kk/PROJECT/NADP05/chip/remote_sources/chip.prg/testbench01.v
// Project Name:  chip.prg
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: chip
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench01;

	// Inputs
	reg iIRQ;
	reg iDQ;
	reg iRdy;
	reg ibDASP;
	reg CLKin;
	reg bCSRST;
	reg bCRST;
	reg bcCS;
	reg bcWr;
	reg bcRd;
	reg bCRT;
	reg cDK;
	reg ACS_LED;
	reg HDD_ACK;
	reg TFSENSE;
	reg JT_bTest;

	// Outputs
	wire [2:0] iA;
	wire ibCS0;
	wire ibCS1;
	wire ibRST;
	wire ibWr;
	wire ibRd;
	wire ibDK;
	wire bcWait;
	wire bcIRQ;
	wire cDQ;
	wire DR245;
	wire OE245;
	wire TFCLK;
	wire TFCMD;
	wire JT_Result;
	wire JT_Pin1;

	// Bidirs
	tri [15:0] iD;
	tri [15:0] cDP;
	tri [15:0] cAP;
	wire TFD0;
	wire TFD1;
	wire TFD2;
	wire TFD3;
	reg cAP_Ctrl;			// 0 means bus write into chip
	reg cDP_Ctrl;			// 0 means bus write into chip
	reg iD_Ctrl;			// 0 means bus write into chip
	reg [15:0] cAPi;
	reg [15:0] cDPi;
	reg [15:0] iDi;

	// Instantiate the Unit Under Test (UUT)
	chip uut (
		.iD(iD), 
		.iA(iA), 
		.ibCS0(ibCS0), 
		.ibCS1(ibCS1), 
		.ibRST(ibRST), 
		.iIRQ(iIRQ), 
		.ibWr(ibWr), 
		.ibRd(ibRd), 
		.iDQ(iDQ), 
		.ibDK(ibDK), 
		.iRdy(iRdy), 
		.ibDASP(ibDASP), 
		.CLKin(CLKin), 
		.bCSRST(bCSRST), 
		.bCRST(bCRST), 
		.cDP(cDP), 
		.cAP(cAP), 
		.bcCS(bcCS), 
		.bcWr(bcWr), 
		.bcRd(bcRd), 
		.bCRT(bCRT), 
		.bcWait(bcWait), 
		.bcIRQ(bcIRQ), 
		.cDQ(cDQ), 
		.cDK(cDK), 
		.DR245(DR245), 
		.OE245(OE245), 
		.ACS_LED(ACS_LED), 
		.HDD_ACK(HDD_ACK), 
		.TFD0(TFD0), 
		.TFD1(TFD1), 
		.TFD2(TFD2), 
		.TFD3(TFD3), 
		.TFCLK(TFCLK), 
		.TFSENSE(TFSENSE), 
		.TFCMD(TFCMD), 
		.JT_Result(JT_Result), 
		.JT_Pin1(JT_Pin1), 
		.JT_bTest(JT_bTest)
	);
	
	//wire [15:0] cAPo;
	assign	cAP  =(cAP_Ctrl ==0) ? cAPi : 16'hZZZZ;
	//assign	cAPo =(cAP_Ctrl ==1) ? cAP  : 16'hZZZZ;
	assign	cDP  =(cDP_Ctrl ==0) ? cDPi : 16'hZZZZ;
	assign	iD   =( iD_Ctrl ==0) ? iDi  : 16'hZZZZ;


	// ////////////////
	// Create the clock
	// ////////////////
	initial begin
		CLKin =1'b1;
	// Wait till Global Reset Finished, then cycle clock
		#140 forever #14 CLKin =~CLKin;
	end
	
	initial begin
		// Initialize Inputs
		cAP_Ctrl =0;
		cDP_Ctrl =0;
		iD_Ctrl =0;
		iIRQ =0;
		iDQ =0;
		iRdy =0;
		ibDASP =0;
		CLKin =0;
		bCSRST =0;
		bCRST =0;
		bcCS =0;
		bcWr =0;
		bcRd =0;
		bCRT =0;
		cDK =0;
		ACS_LED =0;
		HDD_ACK =0;
		TFSENSE =0;
		JT_bTest =0;			// set low to show input result

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#33;					// make transaction not on edge
		#180;
		cAPi[15:0]	=16'h0000;
		cDPi[15:0]	=16'hZZZZ;
		iDi[15:0]	=16'hZZZZ;
		iIRQ	=1'b0;
		iDQ	=1'b0;
		iRdy	=1'b1;
		ibDASP	=1'b1;
		bcCS	=1'b1;
		bcWr	=1'b1;
		bcRd	=1'b1;
		bCRT	=1'b1;
		cDK	=1'b0;
		ACS_LED	=1'b1;
		HDD_ACK	=1'b1;
		
		#280;		// #20 clocks
		bCSRST	=1'b1;
		bCRST	=1'b1;
		#8400;		// allow 300 clock for everything to setup
		// Finish reset pattern
		// Read Register 002A(0000)
		#112;	cAPi[15:0] =16'h002A;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =1;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b0;
		#7;	bcRd	=1'b0;		bcWr	=1'b1;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;	
		// Finish Read Register 002A		
		// Write Register 002A(0000)
		#112;	cAPi[15:0] =16'h002A;	cDPi[15:0] =16'h0000;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b1;
		#7;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register 002A(0000)		
		// Read Register 0004(000B)
		#112;	cAPi[15:0] =16'h0004;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =1;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b0;
		#7;	bcRd	=1'b0;		bcWr	=1'b1;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external
		// Finish Read Register 002A		
		// Read Register 000E(0002)
		#112;	cAPi[15:0] =16'h000E;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =1;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b0;
		#7;	bcRd	=1'b0;		bcWr	=1'b1;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external
		// Finish Read Register 000E(0002)		
		// Write Register 0070(0092)
		#112;	cAPi[15:0] =16'h0070;	cDPi[15:0] =16'h0092;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b1;
		#7;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register 0070(0092)		
		// Write Register 0064(0080)
		#112;	cAPi[15:0] =16'h0064;	cDPi[15:0] =16'h0080;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b1;
		#7;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register 0064(0080)		
		// Write Register 0064(0048)
		#112;	cAPi[15:0] =16'h0064;	cDPi[15:0] =16'h0048;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b1;
		#7;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register 0064(0048)		
		// Read Register 005C(1234)
		#112;	cAPi[15:0] =16'h005C;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'h1234;
			cAP_Ctrl =0;		cDP_Ctrl =1;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b0;
		#7;	bcRd	=1'b0;		bcWr	=1'b1;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external
		// Finish Read Register 005C(1234)		
		// Write Register 0042(ABCD)
		#112;	cAPi[15:0] =16'h0042;	cDPi[15:0] =16'hABCD;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register 0042(ABCD)
		
		ibDASP	=1'b1;
		
		// Write Register 0038(0003)
		#112;	cAPi[15:0] =16'h0038;	cDPi[15:0] =16'h0003;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register 0038(0003)
		
		#392;	ibDASP	=1'b0;
		#392;	ibDASP	=1'b1;

		// Write Register 0038(0003)
		#112;	cAPi[15:0] =16'h0038;	cDPi[15:0] =16'h0003;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register 0038(0003)
		// Read Register 0028(????)
		#112;	cAPi[15:0] =16'h0028;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'h1234;
			cAP_Ctrl =0;		cDP_Ctrl =1;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b0;
		#7;	bcRd	=1'b0;		bcWr	=1'b1;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external
		// Finish Read Register 0028(????)		

		#392;	ibDASP	=1'b0;
		#392;	ibDASP	=1'b1;

		// Read Register 0038(????)
		#112;	cAPi[15:0] =16'h0038;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'h1234;
			cAP_Ctrl =0;		cDP_Ctrl =1;		iD_Ctrl	=0;	
		#14;	bcCS	=1'b0;
		#14;	bcCS	=1'b0;
		#7;	bCRT	=1'b0;
		#7;	bcRd	=1'b0;		bcWr	=1'b1;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#7;	bCRT	=1'b1;
		#7;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external
		// Finish Read Register 0038(????)		
		# 280; // #280 ns

	
		// Check for PS2 DMA Write to IDE
		
		// Write Register 0038(0003)
		#112;	cAPi[15:0] =16'h0038;	cDPi[15:0] =16'h0003;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register 0038(0003)
		
		// Write Register 0064(004F)
		#112;	cAPi[15:0] =16'h0064;	cDPi[15:0] =16'h004F;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register
		
		// ////- ====set ultraDMA mode UDMA mode 2
		// Write Register 0042(0003)
		#112;	cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// Write Register 0044(0044)
		#112;	cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0044;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// Write Register 004E(00EF)
		#112;	cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// Write Register 0032(0087)
		#112;	cAPi[15:0] =16'h0032;	cDPi[15:0] =16'h0087;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// Write Register 0044(0001)
		#112;	cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0001;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// Write Register 004E(00CA)
		#112;	cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00CA;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// Write Register 0024(0006)
		#112;	cAPi[15:0] =16'h0024;	cDPi[15:0] =16'h0006;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// Write Register 002E(0001)
		#112;	cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0001;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// Write Register 002E(0000)
		#112;	cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0000;	iDi[15:0] =16'hZZZZ;
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=1;	
		#14;	bcCS	=1'b0;
		#14;	bcRd	=1'b1;		bcWr	=1'b0;
		#196;	bcRd	=1'b1;		bcWr	=1'b1;
		#14;	bcCS	=1'b1;
		#14;	cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ;	// all bus idle
			cAP_Ctrl =0;		cDP_Ctrl =0;		iD_Ctrl	=0;		// all bus driven by external	
		// Finish Write Register

		// //- TEST CHANNEL
// First DMA data burst
		#128;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC001;	cDPi[15:0]	=16'hC000;
		#28;	cAPi[15:0]	=16'hC003;	cDPi[15:0]	=16'hC002;
		#28;	cAPi[15:0]	=16'hC005;	cDPi[15:0]	=16'hC004;
		#28;	cAPi[15:0]	=16'hC007;	cDPi[15:0]	=16'hC006;
		#14;	bcWr	=1'b1;				// stop to test the restart mechanism
		#84;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC009;	cDPi[15:0]	=16'hC008;
		#28;	cAPi[15:0]	=16'hC00B;	cDPi[15:0]	=16'hC00A;
		#28;	cAPi[15:0]	=16'hC00D;	cDPi[15:0]	=16'hC00C;
		#28;	cAPi[15:0]	=16'hC00F;	cDPi[15:0]	=16'hC00E;
		#28;	cAPi[15:0]	=16'hC011;	cDPi[15:0]	=16'hC010;
		#28;	cAPi[15:0]	=16'hC013;	cDPi[15:0]	=16'hC012;
		#28;	cAPi[15:0]	=16'hC015;	cDPi[15:0]	=16'hC014;
		#28;	cAPi[15:0]	=16'hC017;	cDPi[15:0]	=16'hC016;
		#28;	cAPi[15:0]	=16'hC019;	cDPi[15:0]	=16'hC018;
		#28;	cAPi[15:0]	=16'hC01B;	cDPi[15:0]	=16'hC01A;
		#28;	cAPi[15:0]	=16'hC01D;	cDPi[15:0]	=16'hC01C;
		#28;	cAPi[15:0]	=16'hC01F;	cDPi[15:0]	=16'hC01E;
		#28;	cAPi[15:0]	=16'hC021;	cDPi[15:0]	=16'hC020;
		#28;	cAPi[15:0]	=16'hC023;	cDPi[15:0]	=16'hC022;
		#28;	cAPi[15:0]	=16'hC025;	cDPi[15:0]	=16'hC024;
		#28;	cAPi[15:0]	=16'hC027;	cDPi[15:0]	=16'hC026;
		#28;	cAPi[15:0]	=16'hC029;	cDPi[15:0]	=16'hC028;
		#28;	cAPi[15:0]	=16'hC02B;	cDPi[15:0]	=16'hC02A;
		#28;	cAPi[15:0]	=16'hC02D;	cDPi[15:0]	=16'hC02C;
		#28;	cAPi[15:0]	=16'hC02F;	cDPi[15:0]	=16'hC02E;
		#28;	cAPi[15:0]	=16'hC031;	cDPi[15:0]	=16'hC030;
		#28;	cAPi[15:0]	=16'hC033;	cDPi[15:0]	=16'hC032;
		#28;	cAPi[15:0]	=16'hC035;	cDPi[15:0]	=16'hC034;
		#28;	cAPi[15:0]	=16'hC037;	cDPi[15:0]	=16'hC036;
		#28;	cAPi[15:0]	=16'hC039;	cDPi[15:0]	=16'hC038;
		#28;	cAPi[15:0]	=16'hC03B;	cDPi[15:0]	=16'hC03A;
		#28;	cAPi[15:0]	=16'hC03D;	cDPi[15:0]	=16'hC03C;
		#28;	cAPi[15:0]	=16'hC03F;	cDPi[15:0]	=16'hC03E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- End of data burst
////- 2nd data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC041;	cDPi[15:0]	=16'hC040;
		#28;	cAPi[15:0]	=16'hC043;	cDPi[15:0]	=16'hC042;
		#28;	cAPi[15:0]	=16'hC045;	cDPi[15:0]	=16'hC044;
		#28;	cAPi[15:0]	=16'hC047;	cDPi[15:0]	=16'hC046;
		#28;	cAPi[15:0]	=16'hC049;	cDPi[15:0]	=16'hC048;
		#28;	cAPi[15:0]	=16'hC04B;	cDPi[15:0]	=16'hC04A;
		#28;	cAPi[15:0]	=16'hC04D;	cDPi[15:0]	=16'hC04C;
		#28;	cAPi[15:0]	=16'hC04F;	cDPi[15:0]	=16'hC04E;
		#28;	cAPi[15:0]	=16'hC051;	cDPi[15:0]	=16'hC050;
		#28;	cAPi[15:0]	=16'hC053;	cDPi[15:0]	=16'hC052;
		#28;	cAPi[15:0]	=16'hC055;	cDPi[15:0]	=16'hC054;
		#28;	cAPi[15:0]	=16'hC057;	cDPi[15:0]	=16'hC056;
		#28;	cAPi[15:0]	=16'hC059;	cDPi[15:0]	=16'hC058;
		#28;	cAPi[15:0]	=16'hC05B;	cDPi[15:0]	=16'hC05A;
		#28;	cAPi[15:0]	=16'hC05D;	cDPi[15:0]	=16'hC05C;
		#28;	cAPi[15:0]	=16'hC05F;	cDPi[15:0]	=16'hC05E;
		#28;	cAPi[15:0]	=16'hC061;	cDPi[15:0]	=16'hC060;
		#28;	cAPi[15:0]	=16'hC063;	cDPi[15:0]	=16'hC062;
		#28;	cAPi[15:0]	=16'hC065;	cDPi[15:0]	=16'hC064;
		#28;	cAPi[15:0]	=16'hC067;	cDPi[15:0]	=16'hC066;
		#28;	cAPi[15:0]	=16'hC069;	cDPi[15:0]	=16'hC068;
		#28;	cAPi[15:0]	=16'hC06B;	cDPi[15:0]	=16'hC06A;
		#28;	cAPi[15:0]	=16'hC06D;	cDPi[15:0]	=16'hC06C;
		#28;	cAPi[15:0]	=16'hC06F;	cDPi[15:0]	=16'hC06E;
		#28;	cAPi[15:0]	=16'hC071;	cDPi[15:0]	=16'hC070;
		#28;	cAPi[15:0]	=16'hC073;	cDPi[15:0]	=16'hC072;
		#28;	cAPi[15:0]	=16'hC075;	cDPi[15:0]	=16'hC074;
		#28;	cAPi[15:0]	=16'hC077;	cDPi[15:0]	=16'hC076;
		#28;	cAPi[15:0]	=16'hC079;	cDPi[15:0]	=16'hC078;
		#28;	cAPi[15:0]	=16'hC07B;	cDPi[15:0]	=16'hC07A;
		#28;	cAPi[15:0]	=16'hC07D;	cDPi[15:0]	=16'hC07C;
		#28;	cAPi[15:0]	=16'hC07F;	cDPi[15:0]	=16'hC07E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 2nd data burst
////- 3RD data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC081;	cDPi[15:0]	=16'hC080;
		#28;	cAPi[15:0]	=16'hC083;	cDPi[15:0]	=16'hC082;
		#28;	cAPi[15:0]	=16'hC085;	cDPi[15:0]	=16'hC084;
		#28;	cAPi[15:0]	=16'hC087;	cDPi[15:0]	=16'hC086;
		#28;	cAPi[15:0]	=16'hC089;	cDPi[15:0]	=16'hC088;
		#28;	cAPi[15:0]	=16'hC08B;	cDPi[15:0]	=16'hC08A;
		#28;	cAPi[15:0]	=16'hC08D;	cDPi[15:0]	=16'hC08C;
		#28;	cAPi[15:0]	=16'hC08F;	cDPi[15:0]	=16'hC08E;
		#28;	cAPi[15:0]	=16'hC091;	cDPi[15:0]	=16'hC090;
		#28;	cAPi[15:0]	=16'hC093;	cDPi[15:0]	=16'hC092;
		#28;	cAPi[15:0]	=16'hC095;	cDPi[15:0]	=16'hC094;
		#28;	cAPi[15:0]	=16'hC097;	cDPi[15:0]	=16'hC096;
		#28;	cAPi[15:0]	=16'hC099;	cDPi[15:0]	=16'hC098;
		#28;	cAPi[15:0]	=16'hC09B;	cDPi[15:0]	=16'hC09A;
		#28;	cAPi[15:0]	=16'hC09D;	cDPi[15:0]	=16'hC09C;
		#28;	cAPi[15:0]	=16'hC09F;	cDPi[15:0]	=16'hC09E;
		#28;	cAPi[15:0]	=16'hC0A1;	cDPi[15:0]	=16'hC0A0;
		#28;	cAPi[15:0]	=16'hC0A3;	cDPi[15:0]	=16'hC0A2;
		#28;	cAPi[15:0]	=16'hC0A5;	cDPi[15:0]	=16'hC0A4;
		#28;	cAPi[15:0]	=16'hC0A7;	cDPi[15:0]	=16'hC0A6;
		#28;	cAPi[15:0]	=16'hC0A9;	cDPi[15:0]	=16'hC0A8;
		#28;	cAPi[15:0]	=16'hC0AB;	cDPi[15:0]	=16'hC0AA;
		#28;	cAPi[15:0]	=16'hC0AD;	cDPi[15:0]	=16'hC0AC;
		#28;	cAPi[15:0]	=16'hC0AF;	cDPi[15:0]	=16'hC0AE;
		#28;	cAPi[15:0]	=16'hC0B1;	cDPi[15:0]	=16'hC0B0;
		#28;	cAPi[15:0]	=16'hC0B3;	cDPi[15:0]	=16'hC0B2;
		#28;	cAPi[15:0]	=16'hC0B5;	cDPi[15:0]	=16'hC0B4;
		#28;	cAPi[15:0]	=16'hC0B7;	cDPi[15:0]	=16'hC0B6;
		#28;	cAPi[15:0]	=16'hC0B9;	cDPi[15:0]	=16'hC0B8;
		#28;	cAPi[15:0]	=16'hC0BB;	cDPi[15:0]	=16'hC0BA;
		#28;	cAPi[15:0]	=16'hC0BD;	cDPi[15:0]	=16'hC0BC;
		#28;	cAPi[15:0]	=16'hC0BF;	cDPi[15:0]	=16'hC0BE;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 3RD data burst
////- 4TH data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC0C1;	cDPi[15:0]	=16'hC0C0;
		#28;	cAPi[15:0]	=16'hC0C3;	cDPi[15:0]	=16'hC0C2;
		#28;	cAPi[15:0]	=16'hC0C5;	cDPi[15:0]	=16'hC0C4;
		#28;	cAPi[15:0]	=16'hC0C7;	cDPi[15:0]	=16'hC0C6;
		#28;	cAPi[15:0]	=16'hC0C9;	cDPi[15:0]	=16'hC0C8;
		#28;	cAPi[15:0]	=16'hC0CB;	cDPi[15:0]	=16'hC0CA;
		#28;	cAPi[15:0]	=16'hC0CD;	cDPi[15:0]	=16'hC0CC;
		#28;	cAPi[15:0]	=16'hC0CF;	cDPi[15:0]	=16'hC0CE;
		#28;	cAPi[15:0]	=16'hC0D1;	cDPi[15:0]	=16'hC0D0;
		#28;	cAPi[15:0]	=16'hC0D3;	cDPi[15:0]	=16'hC0D2;
		#28;	cAPi[15:0]	=16'hC0D5;	cDPi[15:0]	=16'hC0D4;
		#28;	cAPi[15:0]	=16'hC0D7;	cDPi[15:0]	=16'hC0D6;
		#28;	cAPi[15:0]	=16'hC0D9;	cDPi[15:0]	=16'hC0D8;
		#28;	cAPi[15:0]	=16'hC0DB;	cDPi[15:0]	=16'hC0DA;
		#28;	cAPi[15:0]	=16'hC0DD;	cDPi[15:0]	=16'hC0DC;
		#28;	cAPi[15:0]	=16'hC0DF;	cDPi[15:0]	=16'hC0DE;
		#28;	cAPi[15:0]	=16'hC0E1;	cDPi[15:0]	=16'hC0E0;
		#28;	cAPi[15:0]	=16'hC0E3;	cDPi[15:0]	=16'hC0E2;
		#28;	cAPi[15:0]	=16'hC0E5;	cDPi[15:0]	=16'hC0E4;
		#28;	cAPi[15:0]	=16'hC0E7;	cDPi[15:0]	=16'hC0E6;
		#28;	cAPi[15:0]	=16'hC0E9;	cDPi[15:0]	=16'hC0E8;
		#28;	cAPi[15:0]	=16'hC0EB;	cDPi[15:0]	=16'hC0EA;
		#28;	cAPi[15:0]	=16'hC0ED;	cDPi[15:0]	=16'hC0EC;
		#28;	cAPi[15:0]	=16'hC0EF;	cDPi[15:0]	=16'hC0EE;
		#28;	cAPi[15:0]	=16'hC0F1;	cDPi[15:0]	=16'hC0F0;
		#28;	cAPi[15:0]	=16'hC0F3;	cDPi[15:0]	=16'hC0F2;
		#28;	cAPi[15:0]	=16'hC0F5;	cDPi[15:0]	=16'hC0F4;
		#28;	cAPi[15:0]	=16'hC0F7;	cDPi[15:0]	=16'hC0F6;
		#28;	cAPi[15:0]	=16'hC0F9;	cDPi[15:0]	=16'hC0F8;
		#28;	cAPi[15:0]	=16'hC0FB;	cDPi[15:0]	=16'hC0FA;
		#28;	cAPi[15:0]	=16'hC0FD;	cDPi[15:0]	=16'hC0FC;
		#28;	cAPi[15:0]	=16'hC0FF;	cDPi[15:0]	=16'hC0FE;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 4TH data burst
		
// //////////////////// start UDMA IDE	
		#280;	iDQ	=1'b1;
		#168;	iRdy	=1'b0;		// this will start UDMA transfer
		#672;				// transfer some data first
//
		#84;	iRdy	=1'b1;
		#84;	iRdy	=1'b0;		// try stopping UDMA transfer
		#192;	iRdy	=1'b1;
		#140;	iRdy	=1'b0;
		#620;
//
		#364;	iRdy	=1'b1;		// stop the UDMA
		#112;	iDQ	=1'b0;		// stop the request too
		#196;	iDQ	=1'b1;		// restart the engine
		#168;	iRdy	=1'b0;
		#280;
//
		#266;	iRdy	=1'b1;
		#70;	iDQ	=1'b0;
		#196;	iDQ	=1'b1;
		#140;	iRdy	=1'b0;
		#448;
		
		// //- TEST CHANNEL
// First DMA data burst
		#140;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- End of data burst
////- 2nd data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 2nd data burst
////- 3RD data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 3RD data burst
////- 4TH data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 4TH data burst

		#7168;
		#280;	iRdy	=1'b1;		// set high the ready signal
		#280;	iDQ	=1'b0;		// move out of the IDQ
		#280;
		
		
// //- TEST CHANNEL --- this checks the UDMA CRC output engine
// First DMA data burst
		#140;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h4150;	cDPi[15:0]	=16'h414C;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- End of data burst
////- 2nd data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 2nd data burst
////- 3RD data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 3RD data burst
////- 4TH data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
		
// 4th data burst


		#280;
		#280;	iDQ	=1'b1;
		#168;	iRdy	=1'b0;		// this will start UDMA transfer
		#2800;
		#3584;
		#560;
		#280;	iRdy	=1'b1;		// set high the ready signal
		#280;	iDQ	=1'b0;		// move out of the IDQ
		#560;
		#280;

		
		
// //- TEST CHANNEL --- this checks the UDMA CRC output engine
// First DMA data burst
		#140;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- End of data burst
////- 2nd data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 2nd data burst
////- 3RD data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
////- end of 3RD data burst
////- 4TH data burst
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#28;	cAPi[15:0]	=16'h0000;	cDPi[15:0]	=16'h0000;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
		
// 4th data burst

		#280;
		#280;	iDQ	=1'b1;
		#168;	iRdy	=1'b0;		// this will start UDMA transfer
		#2800;
		#3584;
		#560;
		#280;	iRdy	=1'b1;		// set high the ready signal
		#280;	iDQ	=1'b0;		// move out of the IDQ
		#560;


		#280;	iDQ	=1'b1;
		#168;	iRdy	=1'b0;		// this will start UDMA transfer



// #7168ns, we pulse 2 blocks of data inside

		#84;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC101;	cDPi[15:0]	=16'hC100;
		#28;	cAPi[15:0]	=16'hC103;	cDPi[15:0]	=16'hC102;
		#28;	cAPi[15:0]	=16'hC105;	cDPi[15:0]	=16'hC104;
		#28;	cAPi[15:0]	=16'hC107;	cDPi[15:0]	=16'hC106;
		#28;	cAPi[15:0]	=16'hC109;	cDPi[15:0]	=16'hC108;
		#28;	cAPi[15:0]	=16'hC10B;	cDPi[15:0]	=16'hC10A;
		#28;	cAPi[15:0]	=16'hC10D;	cDPi[15:0]	=16'hC10C;
		#28;	cAPi[15:0]	=16'hC10F;	cDPi[15:0]	=16'hC10E;
		#28;	cAPi[15:0]	=16'hC111;	cDPi[15:0]	=16'hC110;
		#28;	cAPi[15:0]	=16'hC113;	cDPi[15:0]	=16'hC112;
		#28;	cAPi[15:0]	=16'hC115;	cDPi[15:0]	=16'hC114;
		#28;	cAPi[15:0]	=16'hC117;	cDPi[15:0]	=16'hC116;
		#28;	cAPi[15:0]	=16'hC119;	cDPi[15:0]	=16'hC118;
		#28;	cAPi[15:0]	=16'hC11B;	cDPi[15:0]	=16'hC11A;
		#28;	cAPi[15:0]	=16'hC11D;	cDPi[15:0]	=16'hC11C;
		#28;	cAPi[15:0]	=16'hC11F;	cDPi[15:0]	=16'hC11E;
		#28;	cAPi[15:0]	=16'hC121;	cDPi[15:0]	=16'hC120;
		#28;	cAPi[15:0]	=16'hC123;	cDPi[15:0]	=16'hC122;
		#28;	cAPi[15:0]	=16'hC125;	cDPi[15:0]	=16'hC124;
		#28;	cAPi[15:0]	=16'hC127;	cDPi[15:0]	=16'hC126;
		#28;	cAPi[15:0]	=16'hC129;	cDPi[15:0]	=16'hC128;
		#28;	cAPi[15:0]	=16'hC12B;	cDPi[15:0]	=16'hC12A;
		#28;	cAPi[15:0]	=16'hC12D;	cDPi[15:0]	=16'hC12C;
		#28;	cAPi[15:0]	=16'hC12F;	cDPi[15:0]	=16'hC12E;
		#28;	cAPi[15:0]	=16'hC131;	cDPi[15:0]	=16'hC130;
		#28;	cAPi[15:0]	=16'hC133;	cDPi[15:0]	=16'hC132;
		#28;	cAPi[15:0]	=16'hC135;	cDPi[15:0]	=16'hC134;
		#28;	cAPi[15:0]	=16'hC137;	cDPi[15:0]	=16'hC136;
		#28;	cAPi[15:0]	=16'hC139;	cDPi[15:0]	=16'hC138;
		#28;	cAPi[15:0]	=16'hC13B;	cDPi[15:0]	=16'hC13A;
		#28;	cAPi[15:0]	=16'hC13D;	cDPi[15:0]	=16'hC13C;
		#28;	cAPi[15:0]	=16'hC13F;	cDPi[15:0]	=16'hC13E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
		#168;
		
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC201;	cDPi[15:0]	=16'hC200;
		#28;	cAPi[15:0]	=16'hC203;	cDPi[15:0]	=16'hC202;
		#28;	cAPi[15:0]	=16'hC205;	cDPi[15:0]	=16'hC204;
		#28;	cAPi[15:0]	=16'hC207;	cDPi[15:0]	=16'hC206;
		#28;	cAPi[15:0]	=16'hC209;	cDPi[15:0]	=16'hC208;
		#28;	cAPi[15:0]	=16'hC20B;	cDPi[15:0]	=16'hC20A;
		#28;	cAPi[15:0]	=16'hC20D;	cDPi[15:0]	=16'hC20C;
		#28;	cAPi[15:0]	=16'hC20F;	cDPi[15:0]	=16'hC20E;
		#28;	cAPi[15:0]	=16'hC211;	cDPi[15:0]	=16'hC210;
		#28;	cAPi[15:0]	=16'hC213;	cDPi[15:0]	=16'hC212;
		#28;	cAPi[15:0]	=16'hC215;	cDPi[15:0]	=16'hC214;
		#28;	cAPi[15:0]	=16'hC217;	cDPi[15:0]	=16'hC216;
		#28;	cAPi[15:0]	=16'hC219;	cDPi[15:0]	=16'hC218;
		#28;	cAPi[15:0]	=16'hC21B;	cDPi[15:0]	=16'hC21A;
		#28;	cAPi[15:0]	=16'hC21D;	cDPi[15:0]	=16'hC21C;
		#28;	cAPi[15:0]	=16'hC21F;	cDPi[15:0]	=16'hC21E;
		#28;	cAPi[15:0]	=16'hC221;	cDPi[15:0]	=16'hC220;
		#28;	cAPi[15:0]	=16'hC223;	cDPi[15:0]	=16'hC222;
		#28;	cAPi[15:0]	=16'hC225;	cDPi[15:0]	=16'hC224;
		#28;	cAPi[15:0]	=16'hC227;	cDPi[15:0]	=16'hC226;
		#28;	cAPi[15:0]	=16'hC229;	cDPi[15:0]	=16'hC228;
		#28;	cAPi[15:0]	=16'hC22B;	cDPi[15:0]	=16'hC22A;
		#28;	cAPi[15:0]	=16'hC22D;	cDPi[15:0]	=16'hC22C;
		#28;	cAPi[15:0]	=16'hC22F;	cDPi[15:0]	=16'hC22E;
		#28;	cAPi[15:0]	=16'hC231;	cDPi[15:0]	=16'hC230;
		#28;	cAPi[15:0]	=16'hC233;	cDPi[15:0]	=16'hC232;
		#28;	cAPi[15:0]	=16'hC235;	cDPi[15:0]	=16'hC234;
		#28;	cAPi[15:0]	=16'hC237;	cDPi[15:0]	=16'hC236;
		#28;	cAPi[15:0]	=16'hC239;	cDPi[15:0]	=16'hC238;
		#28;	cAPi[15:0]	=16'hC23B;	cDPi[15:0]	=16'hC23A;
		#28;	cAPi[15:0]	=16'hC23D;	cDPi[15:0]	=16'hC23C;
		#28;	cAPi[15:0]	=16'hC23F;	cDPi[15:0]	=16'hC23E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
/// //////////////////////////		
		
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC401;	cDPi[15:0]	=16'hC400;
		#28;	cAPi[15:0]	=16'hC403;	cDPi[15:0]	=16'hC402;
		#28;	cAPi[15:0]	=16'hC405;	cDPi[15:0]	=16'hC404;
		#28;	cAPi[15:0]	=16'hC407;	cDPi[15:0]	=16'hC406;
		#28;	cAPi[15:0]	=16'hC409;	cDPi[15:0]	=16'hC408;
		#28;	cAPi[15:0]	=16'hC40B;	cDPi[15:0]	=16'hC40A;
		#28;	cAPi[15:0]	=16'hC40D;	cDPi[15:0]	=16'hC40C;
		#28;	cAPi[15:0]	=16'hC40F;	cDPi[15:0]	=16'hC40E;
		#28;	cAPi[15:0]	=16'hC411;	cDPi[15:0]	=16'hC410;
		#28;	cAPi[15:0]	=16'hC413;	cDPi[15:0]	=16'hC412;
		#28;	cAPi[15:0]	=16'hC415;	cDPi[15:0]	=16'hC414;
		#28;	cAPi[15:0]	=16'hC417;	cDPi[15:0]	=16'hC416;
		#28;	cAPi[15:0]	=16'hC419;	cDPi[15:0]	=16'hC418;
		#28;	cAPi[15:0]	=16'hC41B;	cDPi[15:0]	=16'hC41A;
		#28;	cAPi[15:0]	=16'hC41D;	cDPi[15:0]	=16'hC41C;
		#28;	cAPi[15:0]	=16'hC41F;	cDPi[15:0]	=16'hC41E;
		#28;	cAPi[15:0]	=16'hC421;	cDPi[15:0]	=16'hC420;
		#28;	cAPi[15:0]	=16'hC423;	cDPi[15:0]	=16'hC422;
		#28;	cAPi[15:0]	=16'hC425;	cDPi[15:0]	=16'hC424;
		#28;	cAPi[15:0]	=16'hC427;	cDPi[15:0]	=16'hC426;
		#28;	cAPi[15:0]	=16'hC429;	cDPi[15:0]	=16'hC428;
		#28;	cAPi[15:0]	=16'hC42B;	cDPi[15:0]	=16'hC42A;
		#28;	cAPi[15:0]	=16'hC42D;	cDPi[15:0]	=16'hC42C;
		#28;	cAPi[15:0]	=16'hC42F;	cDPi[15:0]	=16'hC42E;
		#28;	cAPi[15:0]	=16'hC431;	cDPi[15:0]	=16'hC430;
		#28;	cAPi[15:0]	=16'hC433;	cDPi[15:0]	=16'hC432;
		#28;	cAPi[15:0]	=16'hC435;	cDPi[15:0]	=16'hC434;
		#28;	cAPi[15:0]	=16'hC437;	cDPi[15:0]	=16'hC436;
		#28;	cAPi[15:0]	=16'hC439;	cDPi[15:0]	=16'hC438;
		#28;	cAPi[15:0]	=16'hC43B;	cDPi[15:0]	=16'hC43A;
		#28;	cAPi[15:0]	=16'hC43D;	cDPi[15:0]	=16'hC43C;
		#28;	cAPi[15:0]	=16'hC43F;	cDPi[15:0]	=16'hC43E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle

		
		#168;
		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC501;	cDPi[15:0]	=16'hC500;
		#28;	cAPi[15:0]	=16'hC503;	cDPi[15:0]	=16'hC502;
		#28;	cAPi[15:0]	=16'hC505;	cDPi[15:0]	=16'hC504;
		#28;	cAPi[15:0]	=16'hC507;	cDPi[15:0]	=16'hC506;
		#28;	cAPi[15:0]	=16'hC509;	cDPi[15:0]	=16'hC508;
		#28;	cAPi[15:0]	=16'hC50B;	cDPi[15:0]	=16'hC50A;
		#28;	cAPi[15:0]	=16'hC50D;	cDPi[15:0]	=16'hC50C;
		#28;	cAPi[15:0]	=16'hC50F;	cDPi[15:0]	=16'hC50E;
		#28;	cAPi[15:0]	=16'hC511;	cDPi[15:0]	=16'hC510;
		#28;	cAPi[15:0]	=16'hC513;	cDPi[15:0]	=16'hC512;
		#28;	cAPi[15:0]	=16'hC515;	cDPi[15:0]	=16'hC514;
		#28;	cAPi[15:0]	=16'hC517;	cDPi[15:0]	=16'hC516;
		#28;	cAPi[15:0]	=16'hC519;	cDPi[15:0]	=16'hC518;
		#28;	cAPi[15:0]	=16'hC51B;	cDPi[15:0]	=16'hC51A;
		#28;	cAPi[15:0]	=16'hC51D;	cDPi[15:0]	=16'hC51C;
		#28;	cAPi[15:0]	=16'hC51F;	cDPi[15:0]	=16'hC51E;
		#28;	cAPi[15:0]	=16'hC521;	cDPi[15:0]	=16'hC520;
		#28;	cAPi[15:0]	=16'hC523;	cDPi[15:0]	=16'hC522;
		#28;	cAPi[15:0]	=16'hC525;	cDPi[15:0]	=16'hC524;
		#28;	cAPi[15:0]	=16'hC527;	cDPi[15:0]	=16'hC526;
		#28;	cAPi[15:0]	=16'hC529;	cDPi[15:0]	=16'hC528;
		#28;	cAPi[15:0]	=16'hC52B;	cDPi[15:0]	=16'hC52A;
		#28;	cAPi[15:0]	=16'hC52D;	cDPi[15:0]	=16'hC52C;
		#28;	cAPi[15:0]	=16'hC52F;	cDPi[15:0]	=16'hC52E;
		#28;	cAPi[15:0]	=16'hC531;	cDPi[15:0]	=16'hC530;
		#28;	cAPi[15:0]	=16'hC533;	cDPi[15:0]	=16'hC532;
		#28;	cAPi[15:0]	=16'hC535;	cDPi[15:0]	=16'hC534;
		#28;	cAPi[15:0]	=16'hC537;	cDPi[15:0]	=16'hC536;
		#28;	cAPi[15:0]	=16'hC539;	cDPi[15:0]	=16'hC538;
		#28;	cAPi[15:0]	=16'hC53B;	cDPi[15:0]	=16'hC53A;
		#28;	cAPi[15:0]	=16'hC53D;	cDPi[15:0]	=16'hC53C;
		#28;	cAPi[15:0]	=16'hC53F;	cDPi[15:0]	=16'hC53E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
		#168;

		#140;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC601;	cDPi[15:0]	=16'hC600;
		#28;	cAPi[15:0]	=16'hC603;	cDPi[15:0]	=16'hC602;
		#28;	cAPi[15:0]	=16'hC605;	cDPi[15:0]	=16'hC604;
		#28;	cAPi[15:0]	=16'hC607;	cDPi[15:0]	=16'hC606;
		#28;	cAPi[15:0]	=16'hC609;	cDPi[15:0]	=16'hC608;
		#28;	cAPi[15:0]	=16'hC60B;	cDPi[15:0]	=16'hC60A;
		#28;	cAPi[15:0]	=16'hC60D;	cDPi[15:0]	=16'hC60C;
		#28;	cAPi[15:0]	=16'hC60F;	cDPi[15:0]	=16'hC60E;
		#28;	cAPi[15:0]	=16'hC611;	cDPi[15:0]	=16'hC610;
		#28;	cAPi[15:0]	=16'hC613;	cDPi[15:0]	=16'hC612;
		#28;	cAPi[15:0]	=16'hC615;	cDPi[15:0]	=16'hC614;
		#28;	cAPi[15:0]	=16'hC617;	cDPi[15:0]	=16'hC616;
		#28;	cAPi[15:0]	=16'hC619;	cDPi[15:0]	=16'hC618;
		#28;	cAPi[15:0]	=16'hC61B;	cDPi[15:0]	=16'hC61A;
		#28;	cAPi[15:0]	=16'hC61D;	cDPi[15:0]	=16'hC61C;
		#28;	cAPi[15:0]	=16'hC61F;	cDPi[15:0]	=16'hC61E;
		#28;	cAPi[15:0]	=16'hC621;	cDPi[15:0]	=16'hC620;
		#28;	cAPi[15:0]	=16'hC623;	cDPi[15:0]	=16'hC622;
		#28;	cAPi[15:0]	=16'hC625;	cDPi[15:0]	=16'hC624;
		#28;	cAPi[15:0]	=16'hC627;	cDPi[15:0]	=16'hC626;
		#28;	cAPi[15:0]	=16'hC629;	cDPi[15:0]	=16'hC628;
		#28;	cAPi[15:0]	=16'hC62B;	cDPi[15:0]	=16'hC62A;
		#28;	cAPi[15:0]	=16'hC62D;	cDPi[15:0]	=16'hC62C;
		#28;	cAPi[15:0]	=16'hC62F;	cDPi[15:0]	=16'hC62E;
		#28;	cAPi[15:0]	=16'hC631;	cDPi[15:0]	=16'hC630;
		#28;	cAPi[15:0]	=16'hC633;	cDPi[15:0]	=16'hC632;
		#28;	cAPi[15:0]	=16'hC635;	cDPi[15:0]	=16'hC634;
		#28;	cAPi[15:0]	=16'hC637;	cDPi[15:0]	=16'hC636;
		#28;	cAPi[15:0]	=16'hC639;	cDPi[15:0]	=16'hC638;
		#28;	cAPi[15:0]	=16'hC63B;	cDPi[15:0]	=16'hC63A;
		#28;	cAPi[15:0]	=16'hC63D;	cDPi[15:0]	=16'hC63C;
		#28;	cAPi[15:0]	=16'hC63F;	cDPi[15:0]	=16'hC63E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
		#168;

		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC701;	cDPi[15:0]	=16'hC700;
		#28;	cAPi[15:0]	=16'hC703;	cDPi[15:0]	=16'hC702;
		#28;	cAPi[15:0]	=16'hC705;	cDPi[15:0]	=16'hC704;
		#28;	cAPi[15:0]	=16'hC707;	cDPi[15:0]	=16'hC706;
		#28;	cAPi[15:0]	=16'hC709;	cDPi[15:0]	=16'hC708;
		#28;	cAPi[15:0]	=16'hC70B;	cDPi[15:0]	=16'hC70A;
		#28;	cAPi[15:0]	=16'hC70D;	cDPi[15:0]	=16'hC70C;
		#28;	cAPi[15:0]	=16'hC70F;	cDPi[15:0]	=16'hC70E;
		#28;	cAPi[15:0]	=16'hC711;	cDPi[15:0]	=16'hC710;
		#28;	cAPi[15:0]	=16'hC713;	cDPi[15:0]	=16'hC712;
		#28;	cAPi[15:0]	=16'hC715;	cDPi[15:0]	=16'hC714;
		#28;	cAPi[15:0]	=16'hC717;	cDPi[15:0]	=16'hC716;
		#28;	cAPi[15:0]	=16'hC719;	cDPi[15:0]	=16'hC718;
		#28;	cAPi[15:0]	=16'hC71B;	cDPi[15:0]	=16'hC71A;
		#28;	cAPi[15:0]	=16'hC71D;	cDPi[15:0]	=16'hC71C;
		#28;	cAPi[15:0]	=16'hC71F;	cDPi[15:0]	=16'hC71E;
		#28;	cAPi[15:0]	=16'hC721;	cDPi[15:0]	=16'hC720;
		#28;	cAPi[15:0]	=16'hC723;	cDPi[15:0]	=16'hC722;
		#28;	cAPi[15:0]	=16'hC725;	cDPi[15:0]	=16'hC724;
		#28;	cAPi[15:0]	=16'hC727;	cDPi[15:0]	=16'hC726;
		#28;	cAPi[15:0]	=16'hC729;	cDPi[15:0]	=16'hC728;
		#28;	cAPi[15:0]	=16'hC72B;	cDPi[15:0]	=16'hC72A;
		#28;	cAPi[15:0]	=16'hC72D;	cDPi[15:0]	=16'hC72C;
		#28;	cAPi[15:0]	=16'hC72F;	cDPi[15:0]	=16'hC72E;
		#28;	cAPi[15:0]	=16'hC731;	cDPi[15:0]	=16'hC730;
		#28;	cAPi[15:0]	=16'hC733;	cDPi[15:0]	=16'hC732;
		#28;	cAPi[15:0]	=16'hC735;	cDPi[15:0]	=16'hC734;
		#28;	cAPi[15:0]	=16'hC737;	cDPi[15:0]	=16'hC736;
		#28;	cAPi[15:0]	=16'hC739;	cDPi[15:0]	=16'hC738;
		#28;	cAPi[15:0]	=16'hC73B;	cDPi[15:0]	=16'hC73A;
		#28;	cAPi[15:0]	=16'hC73D;	cDPi[15:0]	=16'hC73C;
		#28;	cAPi[15:0]	=16'hC73F;	cDPi[15:0]	=16'hC73E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;
		#84;	cDK	=1'b0;		// now a complete cycle
		#168;

		#28;	cDK	=1'b1;
		#70;	bcWr	=1'b0;
		#14;	cAPi[15:0]	=16'hC801;	cDPi[15:0]	=16'hC800;
		#28;	cAPi[15:0]	=16'hC803;	cDPi[15:0]	=16'hC802;
		#28;	cAPi[15:0]	=16'hC805;	cDPi[15:0]	=16'hC804;
		#28;	cAPi[15:0]	=16'hC807;	cDPi[15:0]	=16'hC806;
		#28;	cAPi[15:0]	=16'hC809;	cDPi[15:0]	=16'hC808;
		#28;	cAPi[15:0]	=16'hC80B;	cDPi[15:0]	=16'hC80A;
		#28;	cAPi[15:0]	=16'hC80D;	cDPi[15:0]	=16'hC80C;
		#28;	cAPi[15:0]	=16'hC80F;	cDPi[15:0]	=16'hC80E;
		#28;	cAPi[15:0]	=16'hC811;	cDPi[15:0]	=16'hC810;
		#28;	cAPi[15:0]	=16'hC813;	cDPi[15:0]	=16'hC812;
		#28;	cAPi[15:0]	=16'hC815;	cDPi[15:0]	=16'hC814;
		#28;	cAPi[15:0]	=16'hC817;	cDPi[15:0]	=16'hC816;
		#28;	cAPi[15:0]	=16'hC819;	cDPi[15:0]	=16'hC818;
		#28;	cAPi[15:0]	=16'hC81B;	cDPi[15:0]	=16'hC81A;
		#28;	cAPi[15:0]	=16'hC81D;	cDPi[15:0]	=16'hC81C;
		#28;	cAPi[15:0]	=16'hC81F;	cDPi[15:0]	=16'hC81E;
		#28;	cAPi[15:0]	=16'hC821;	cDPi[15:0]	=16'hC820;
		#28;	cAPi[15:0]	=16'hC823;	cDPi[15:0]	=16'hC822;
		#28;	cAPi[15:0]	=16'hC825;	cDPi[15:0]	=16'hC824;
		#28;	cAPi[15:0]	=16'hC827;	cDPi[15:0]	=16'hC826;
		#28;	cAPi[15:0]	=16'hC829;	cDPi[15:0]	=16'hC828;
		#28;	cAPi[15:0]	=16'hC82B;	cDPi[15:0]	=16'hC82A;
		#28;	cAPi[15:0]	=16'hC82D;	cDPi[15:0]	=16'hC82C;
		#28;	cAPi[15:0]	=16'hC82F;	cDPi[15:0]	=16'hC82E;
		#28;	cAPi[15:0]	=16'hC831;	cDPi[15:0]	=16'hC830;
		#28;	cAPi[15:0]	=16'hC833;	cDPi[15:0]	=16'hC832;
		#28;	cAPi[15:0]	=16'hC835;	cDPi[15:0]	=16'hC834;
		#28;	cAPi[15:0]	=16'hC837;	cDPi[15:0]	=16'hC836;
		#28;	cAPi[15:0]	=16'hC839;	cDPi[15:0]	=16'hC838;
		#28;	cAPi[15:0]	=16'hC83B;	cDPi[15:0]	=16'hC83A;
		#28;	cAPi[15:0]	=16'hC83D;	cDPi[15:0]	=16'hC83C;	iRdy =1'b1;
		#28;	cAPi[15:0]	=16'hC83F;	cDPi[15:0]	=16'hC83E;
		#14;	bcWr	=1'b1;
		#14	cAPi[15:0]	=16'hZZZZ;	cDPi[15:0]	=16'hZZZZ;	iDQ =1'b0;
		#84;	cDK	=1'b0;		// now a complete cycle
		#168;


///////////////  End of stub



////- ====set ultraDMA mode UDMA mode 0
	#112; cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003; // write 0042(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0041; // write 0044(0041) U-Mode1
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF; // write 004E(00EF)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////- ==================
#84;
#28; cDK =1'b1;
#70; bcWr =1'b0;
	iDQ =1'b1;
#14; cAPi[15:0] =16'hC2C1; cDPi[15:0] =16'hC2C0;
#28; cAPi[15:0] =16'hC2C3; cDPi[15:0] =16'hC2C2;
#28; cAPi[15:0] =16'hC2C5; cDPi[15:0] =16'hC2C4;
   iRdy =1'b0;
#28; cAPi[15:0] =16'hC2C7; cDPi[15:0] =16'hC2C6;
#28; cAPi[15:0] =16'hC2C9; cDPi[15:0] =16'hC2C8;
#28; cAPi[15:0] =16'hC2CB; cDPi[15:0] =16'hC2CA;
#28; cAPi[15:0] =16'hC2CD; cDPi[15:0] =16'hC2CC;
#28; cAPi[15:0] =16'hC2CF; cDPi[15:0] =16'hC2CE;
#28; cAPi[15:0] =16'hC2D1; cDPi[15:0] =16'hC2D0;
#28; cAPi[15:0] =16'hC2D3; cDPi[15:0] =16'hC2D2;
#28; cAPi[15:0] =16'hC2D5; cDPi[15:0] =16'hC2D4;
#28; cAPi[15:0] =16'hC2D7; cDPi[15:0] =16'hC2D6;
#28; cAPi[15:0] =16'hC2D9; cDPi[15:0] =16'hC2D8;
#28; cAPi[15:0] =16'hC2DB; cDPi[15:0] =16'hC2DA;
#28; cAPi[15:0] =16'hC2DD; cDPi[15:0] =16'hC2DC;
#28; cAPi[15:0] =16'hC2DF; cDPi[15:0] =16'hC2DE;
#28; cAPi[15:0] =16'hC2E1; cDPi[15:0] =16'hC2E0;
#28; cAPi[15:0] =16'hC2E3; cDPi[15:0] =16'hC2E2;
#28; cAPi[15:0] =16'hC2E5; cDPi[15:0] =16'hC2E4;
#28; cAPi[15:0] =16'hC2E7; cDPi[15:0] =16'hC2E6;
#28; cAPi[15:0] =16'hC2E9; cDPi[15:0] =16'hC2E8;
#28; cAPi[15:0] =16'hC2EB; cDPi[15:0] =16'hC2EA;
#28; cAPi[15:0] =16'hC2ED; cDPi[15:0] =16'hC2EC;
#28; cAPi[15:0] =16'hC2EF; cDPi[15:0] =16'hC2EE;
#28; cAPi[15:0] =16'hC2F1; cDPi[15:0] =16'hC2F0;
#28; cAPi[15:0] =16'hC2F3; cDPi[15:0] =16'hC2F2;
#28; cAPi[15:0] =16'hC2F5; cDPi[15:0] =16'hC2F4;
#28; cAPi[15:0] =16'hC2F7; cDPi[15:0] =16'hC2F6;
#28; cAPi[15:0] =16'hC2F9; cDPi[15:0] =16'hC2F8;
#28; cAPi[15:0] =16'hC2FB; cDPi[15:0] =16'hC2FA;
#28; cAPi[15:0] =16'hC2FD; cDPi[15:0] =16'hC2FC;
#28; cAPi[15:0] =16'hC2FF; cDPi[15:0] =16'hC2FE;
#14; bcWr =1'b1;
#14; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;	////// now a complete cycle
#84; cDK =1'b0;	////// now a complete cycle
#168;	
////////////////////////////////////////////////////////////
#13153;
#168;
#56;
iRdy =1'b1;
#56;
iDQ =1'b0;
#280;
////////////////////////////////////////////////////////////
////- ====set ultraDMA mode UDMA mode 1
	#112; cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003; // write 0042(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0042; // write 0044(0042) UDMA-MODE1
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF; // write 004E(00EF)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////// ===========================	
#280;
iDQ =1'b1;
#140;
iRdy =1'b0;
#11004;
iRdy =1'b1;
#56;
iDQ =1'b0;
#280;

//- start DMA REQ process  18 clock for each DMA read (504 ns per pulse )
	#112; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'h0003; // write 0038(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0064;	cDPi[15:0] =16'h004E; // write 0064(004E)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////- ====set Multi-DMA mode 0
	#112; cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003; // write 0042(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0020; // write 0044(0020) MDMA-0
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF; // write 004E(00EF)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////// ====================================
	#112; cAPi[15:0] =16'h0032;	cDPi[15:0] =16'h0086; // write 0032(0086)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0001; // write 0044(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00CA; // write 004E(00CA)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0024;	cDPi[15:0] =16'h0006; // write 0024(0006)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0001; // write 002E(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0000; // write 002E(0000)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle

////
	#476; iDQ =1'b1;
	#77 ;
		iDi[15:0] =16'h0000; #266; iDi[15:0] =16'hZZZZ; #238;
		iDi[15:0] =16'h0001; #266; iDi[15:0] =16'hZZZZ; #238;
		iDi[15:0] =16'h0002; #266; iDi[15:0] =16'hZZZZ; #238;
		iDi[15:0] =16'h0003; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0004; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0005; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0006; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0007; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0008; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0009; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h000A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h000B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h000C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h000D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h000E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h000F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0010; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0011; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0012; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0013; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0014; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0015; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0016; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0017; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0018; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0019; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h001A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h001B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h001C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h001D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h001E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h001F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0020; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0021; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0022; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0023; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0024; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0025; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0026; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0027; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0028; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0029; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h002A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h002B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h002C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h002D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h002E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h002F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0030; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0031; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0032; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0033; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0034; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0035; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0036; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0037; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0038; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0039; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h003A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h003B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h003C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h003D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h003E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h003F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0040; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0041; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0042; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0043; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0044; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0045; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0046; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0047; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0048; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0049; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h004A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h004B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h004C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h004D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h004E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h004F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0050; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0051; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0052; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0053; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0054; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0055; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0056; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0057; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0058; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0059; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h005A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h005B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h005C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h005D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h005E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h005F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0060; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0061; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0062; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0063; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0064; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0065; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0066; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0067; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0068; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0069; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h006A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h006B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h006C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h006D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h006E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h006F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0070; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0071; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0072; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0073; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0074; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0075; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0076; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0077; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0078; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0079; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h007A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h007B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h007C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h007D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h007E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h007F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0080; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0081; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0082; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0083; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0084; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0085; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0086; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0087; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0088; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0089; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h008A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h008B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h008C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h008D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h008E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h008F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0090; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0091; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0092; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0093; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0094; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0095; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0096; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0097; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0098; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h0099; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h009A; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h009B; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h009C; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h009D; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h009E; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h009F; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A0; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A1; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A2; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A3; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A4; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A5; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A6; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A7; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A8; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00A9; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00AA; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00AB; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00AC; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00AD; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00AE; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00AF; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B0; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B1; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B2; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B3; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B4; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B5; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B6; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B7; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B8; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00B9; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00BA; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00BB; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00BC; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00BD; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00BE; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00BF; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C0; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C1; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C2; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C3; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C4; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C5; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C6; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C7; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C8; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00C9; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00CA; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00CB; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00CC; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00CD; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00CE; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00CF; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D0; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D1; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D2; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D3; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D4; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D5; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D6; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D7; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D8; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00D9; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00DA; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00DB; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00DC; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00DD; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00DE; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00DF; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E0; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E1; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E2; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E3; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E4; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E5; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E6; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E7; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E8; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00E9; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00EA; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00EB; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00EC; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00ED; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00EE; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00EF; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F0; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F1; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F2; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F3; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F4; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F5; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F6; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F7; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F8; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00F9; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00FA; #266; iDi[15:0] =16'hZZZZ; #238;
////VVVVVV one cycle
	  iDi[15:0] =16'h00FB;
	# 98; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'hZZZZ; // read 0038[]
	# 14; bcCS =1'b0;
	# 7; bCRT = 1'b0;
	# 7; bcRd =1'b0; bcWr =1'b1;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 7; bCRT = 1'b1;
	# 7; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#238;
////^^^^^^^
////VVVVVV one cycle
	  iDi[15:0] =16'h00FC;
	# 98; cAPi[15:0] =16'h002A;	cDPi[15:0] =16'h0002; // write 002A[0002]
	# 7; bcCS =1'b0;
	# 7; bCRT = 1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 7; bCRT =1'b1;
	# 7; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#238;
//// =================
	  iDi[15:0] =16'h00FD; #266; iDi[15:0] =16'hZZZZ; #238;
	  iDi[15:0] =16'h00FE; #266; iDi[15:0] =16'hZZZZ; #238;
//-======
	  iDi[15:0] =16'h00FF;
	# 42; iDQ =1'b0;
	# 56; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'hZZZZ; // read 0038[]
	# 7; bcCS =1'b0;
	# 7; bCRT =1'b0;
	# 14; bcRd =1'b0; bcWr =1'b1;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 7; bCRT =1'b1;
	# 7; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#238;
//-======one cycle ======================////////////////////////////////////
	#280 ;
	# 56; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'hZZZZ; // read 0038[0000]
	# 7; bcCS =1'b0;
	# 7; bCRT = 1'b0;
	# 14; bcRd =1'b0; bcWr =1'b1;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 7; bCRT = 1'b1;
	# 7; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#280;
	# 56; cAPi[15:0] =16'h002A;	cDPi[15:0] =16'hZZZZ; // read 002A[0002]
	# 7; bcCS =1'b0;
	# 7; bCRT = 1'b0;
	# 14; bcRd =1'b0; bcWr =1'b1;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 7; bCRT = 1'b1;
	# 7; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#140;
	# 56; cAPi[15:0] =16'h002A;	cDPi[15:0] =16'h0000; // write 002A[0000]
	# 7; bcCS =1'b0;
	# 7; bCRT = 1'b1;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 7; bCRT = 1'b1;
	# 7; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#280;
	# 56; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'hZZZZ; // read 0038[0000]
	# 7; bcCS =1'b0;
	# 7; bCRT = 1'b0;
	# 14; bcRd =1'b0; bcWr =1'b1;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 7; bCRT = 1'b1;
	# 7; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#140;
	# 56; cAPi[15:0] =16'h002A;	cDPi[15:0] =16'h0001; // write 002A[0001]
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#140;	iIRQ =1'b1;		// set high the interrupt request
	#560;	iIRQ =1'b0;
	# 56; cAPi[15:0] =16'h002A;	cDPi[15:0] =16'h0000; // write 002A[0000]
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#112; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
//// ====================
	#420;
//// ============================put back to the edge
	#20;
//// ============================	
	#504; iDQ =1'b1; iDi[15:0] =16'h0100;	
	#504; iDQ =1'b1; iDi[15:0] =16'h0101;
	#504; iDQ =1'b1; iDi[15:0] =16'h0102;
	#504; iDQ =1'b1; iDi[15:0] =16'h0103;
	#504; iDQ =1'b1; iDi[15:0] =16'h0104;
	#504; iDQ =1'b1; iDi[15:0] =16'h0105;
	#504; iDQ =1'b1; iDi[15:0] =16'h0106;
	#504; iDQ =1'b1; iDi[15:0] =16'h0107;
	#504; iDQ =1'b1; iDi[15:0] =16'h0108;
	#504; iDQ =1'b1; iDi[15:0] =16'h0109;
	#504; iDQ =1'b1; iDi[15:0] =16'h010A;
	#504; iDQ =1'b1; iDi[15:0] =16'h010B;
	#504; iDQ =1'b1; iDi[15:0] =16'h010C;
	#504; iDQ =1'b1; iDi[15:0] =16'h010D;
//--- time adjustment
	#14;
//- start of data burst ======================================
	#414; cDK =1'b1;	// start reading another DMA here
		bCRT = 1'b0;
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	# 76; iDQ =1'b1; iDi[15:0] =16'h010E;
//- #504 ns
	#504; iDQ =1'b1; iDi[15:0] =16'h010F;
//- #504 ns
	#316; bcRd =1'b1;
	# 84; bCRT = 1'b1; cDK =1'b0;
	#104; iDQ =1'b1; iDi[15:0] =16'h0110;
//////// =========one burst of PS2 DMA data ==================
//- start of data burst ======================================
	#414; cDK =1'b1;	// start reading another DMA here
		 bCRT = 1'b0;
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	# 76; iDQ =1'b1; iDi[15:0] =16'h0111;
//- #504 ns
	#504; iDQ =1'b1; iDi[15:0] =16'h0112;
//- #504 ns
	#316; bcRd =1'b1;
	# 84; bCRT = 1'b1; cDK =1'b0;
	#104; iDQ =1'b1; iDi[15:0] =16'h0113;
//////// =========one burst of PS2 DMA data ==================
//- start of data burst ======================================
	#414; cDK =1'b1;	// start reading another DMA here
		 bCRT = 1'b0;
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	# 76; iDQ =1'b1; iDi[15:0] =16'h0114;
//- #504 ns
	#504; iDQ =1'b1; iDi[15:0] =16'h0115;
//- #504 ns
	#316; bcRd =1'b1;
	# 84; bCRT = 1'b1; cDK =1'b0;
	#104; iDQ =1'b1; iDi[15:0] =16'h0116;
//////// =========one burst of PS2 DMA data ==================
//- start of data burst ======================================
	#414; cDK =1'b1;	// start reading another DMA here
		 bCRT = 1'b0;
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	# 76; iDQ =1'b1; iDi[15:0] =16'h0117;
//- #504 ns
	#504; iDQ =1'b1; iDi[15:0] =16'h0118;
//- #504 ns
	#316; bcRd =1'b1;
	# 84; bCRT = 1'b1; cDK =1'b0;
	#104; iDQ =1'b1; iDi[15:0] =16'h0119;
//////// =========one burst of PS2 DMA data ==================
	#504; iDQ =1'b1; iDi[15:0] =16'h011A;
	#504; iDQ =1'b1; iDi[15:0] =16'h011B;
	#504; iDQ =1'b1; iDi[15:0] =16'h011C;
	#504; iDQ =1'b1; iDi[15:0] =16'h011D;
	#504; iDQ =1'b1; iDi[15:0] =16'h011E;
	#504; iDQ =1'b1; iDi[15:0] =16'h011F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0120;
	#504; iDQ =1'b1; iDi[15:0] =16'h0121;
	#504; iDQ =1'b1; iDi[15:0] =16'h0122;
	#504; iDQ =1'b1; iDi[15:0] =16'h0123;
	#504; iDQ =1'b1; iDi[15:0] =16'h0124;
	#504; iDQ =1'b1; iDi[15:0] =16'h0125;
	#504; iDQ =1'b1; iDi[15:0] =16'h0126;
	#504; iDQ =1'b1; iDi[15:0] =16'h0127;
	#504; iDQ =1'b1; iDi[15:0] =16'h0128;
	#504; iDQ =1'b1; iDi[15:0] =16'h0129;
	#504; iDQ =1'b1; iDi[15:0] =16'h012A;
	#504; iDQ =1'b1; iDi[15:0] =16'h012B;
	#504; iDQ =1'b1; iDi[15:0] =16'h012C;
	#504; iDQ =1'b1; iDi[15:0] =16'h012D;
	#504; iDQ =1'b1; iDi[15:0] =16'h012E;
	#504; iDQ =1'b1; iDi[15:0] =16'h012F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0130;
	#504; iDQ =1'b1; iDi[15:0] =16'h0131;
	#504; iDQ =1'b1; iDi[15:0] =16'h0132;
	#504; iDQ =1'b1; iDi[15:0] =16'h0133;
	#504; iDQ =1'b1; iDi[15:0] =16'h0134;
	#504; iDQ =1'b1; iDi[15:0] =16'h0135;
	#504; iDQ =1'b1; iDi[15:0] =16'h0136;
	#504; iDQ =1'b1; iDi[15:0] =16'h0137;
	#504; iDQ =1'b1; iDi[15:0] =16'h0138;
	#504; iDQ =1'b1; iDi[15:0] =16'h0139;
	#504; iDQ =1'b1; iDi[15:0] =16'h013A;
	#504; iDQ =1'b1; iDi[15:0] =16'h013B;
	#504; iDQ =1'b1; iDi[15:0] =16'h013C;
	#504; iDQ =1'b1; iDi[15:0] =16'h013D;
	#504; iDQ =1'b1; iDi[15:0] =16'h013E;
	#504; iDQ =1'b1; iDi[15:0] =16'h013F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0140;
	#504; iDQ =1'b1; iDi[15:0] =16'h0141;
	#504; iDQ =1'b1; iDi[15:0] =16'h0142;
	#504; iDQ =1'b1; iDi[15:0] =16'h0143;
	#504; iDQ =1'b1; iDi[15:0] =16'h0144;
	#504; iDQ =1'b1; iDi[15:0] =16'h0145;
	#504; iDQ =1'b1; iDi[15:0] =16'h0146;
	#504; iDQ =1'b1; iDi[15:0] =16'h0147;
	#504; iDQ =1'b1; iDi[15:0] =16'h0148;
	#504; iDQ =1'b1; iDi[15:0] =16'h0149;
	#504; iDQ =1'b1; iDi[15:0] =16'h014A;
	#504; iDQ =1'b1; iDi[15:0] =16'h014B;
	#504; iDQ =1'b1; iDi[15:0] =16'h014C;
	#504; iDQ =1'b1; iDi[15:0] =16'h014D;
	#504; iDQ =1'b1; iDi[15:0] =16'h014E;
	#504; iDQ =1'b1; iDi[15:0] =16'h014F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0150;
	#504; iDQ =1'b1; iDi[15:0] =16'h0151;
	#504; iDQ =1'b1; iDi[15:0] =16'h0152;
	#504; iDQ =1'b1; iDi[15:0] =16'h0153;
	#504; iDQ =1'b1; iDi[15:0] =16'h0154;
	#504; iDQ =1'b1; iDi[15:0] =16'h0155;
	#504; iDQ =1'b1; iDi[15:0] =16'h0156;
	#504; iDQ =1'b1; iDi[15:0] =16'h0157;
	#504; iDQ =1'b1; iDi[15:0] =16'h0158;
	#504; iDQ =1'b1; iDi[15:0] =16'h0159;
	#504; iDQ =1'b1; iDi[15:0] =16'h015A;
	#504; iDQ =1'b1; iDi[15:0] =16'h015B;
	#504; iDQ =1'b1; iDi[15:0] =16'h015C;
	#504; iDQ =1'b1; iDi[15:0] =16'h015D;
	#504; iDQ =1'b1; iDi[15:0] =16'h015E;
	#504; iDQ =1'b1; iDi[15:0] =16'h015F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0160;
	#504; iDQ =1'b1; iDi[15:0] =16'h0161;
	#504; iDQ =1'b1; iDi[15:0] =16'h0162;
	#504; iDQ =1'b1; iDi[15:0] =16'h0163;
	#504; iDQ =1'b1; iDi[15:0] =16'h0164;
	#504; iDQ =1'b1; iDi[15:0] =16'h0165;
	#504; iDQ =1'b1; iDi[15:0] =16'h0166;
	#504; iDQ =1'b1; iDi[15:0] =16'h0167;
	#504; iDQ =1'b1; iDi[15:0] =16'h0168;
	#504; iDQ =1'b1; iDi[15:0] =16'h0169;
	#504; iDQ =1'b1; iDi[15:0] =16'h016A;
	#504; iDQ =1'b1; iDi[15:0] =16'h016B;
	#504; iDQ =1'b1; iDi[15:0] =16'h016C;
	#504; iDQ =1'b1; iDi[15:0] =16'h016D;
	#504; iDQ =1'b1; iDi[15:0] =16'h016E;
	#504; iDQ =1'b1; iDi[15:0] =16'h016F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0170;
	#504; iDQ =1'b1; iDi[15:0] =16'h0171;
	#504; iDQ =1'b1; iDi[15:0] =16'h0172;
	#504; iDQ =1'b1; iDi[15:0] =16'h0173;
	#504; iDQ =1'b1; iDi[15:0] =16'h0174;
	#504; iDQ =1'b1; iDi[15:0] =16'h0175;
	#504; iDQ =1'b1; iDi[15:0] =16'h0176;
	#504; iDQ =1'b1; iDi[15:0] =16'h0177;
	#504; iDQ =1'b1; iDi[15:0] =16'h0178;
	#504; iDQ =1'b1; iDi[15:0] =16'h0179;
	#504; iDQ =1'b1; iDi[15:0] =16'h017A;
	#504; iDQ =1'b1; iDi[15:0] =16'h017B;
	#504; iDQ =1'b1; iDi[15:0] =16'h017C;
	#504; iDQ =1'b1; iDi[15:0] =16'h017D;
	#504; iDQ =1'b1; iDi[15:0] =16'h017E;
	#504; iDQ =1'b1; iDi[15:0] =16'h017F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0180;
	#504; iDQ =1'b1; iDi[15:0] =16'h0181;
	#504; iDQ =1'b1; iDi[15:0] =16'h0182;
	#504; iDQ =1'b1; iDi[15:0] =16'h0183;
	#504; iDQ =1'b1; iDi[15:0] =16'h0184;
	#504; iDQ =1'b1; iDi[15:0] =16'h0185;
	#504; iDQ =1'b1; iDi[15:0] =16'h0186;
	#504; iDQ =1'b1; iDi[15:0] =16'h0187;
	#504; iDQ =1'b1; iDi[15:0] =16'h0188;
	#504; iDQ =1'b1; iDi[15:0] =16'h0189;
	#504; iDQ =1'b1; iDi[15:0] =16'h018A;
	#504; iDQ =1'b1; iDi[15:0] =16'h018B;
	#504; iDQ =1'b1; iDi[15:0] =16'h018C;
	#504; iDQ =1'b1; iDi[15:0] =16'h018D;
	#504; iDQ =1'b1; iDi[15:0] =16'h018E;
	#504; iDQ =1'b1; iDi[15:0] =16'h018F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0190;
	#504; iDQ =1'b1; iDi[15:0] =16'h0191;
	#504; iDQ =1'b1; iDi[15:0] =16'h0192;
	#504; iDQ =1'b1; iDi[15:0] =16'h0193;
	#504; iDQ =1'b1; iDi[15:0] =16'h0194;
	#504; iDQ =1'b1; iDi[15:0] =16'h0195;
	#504; iDQ =1'b1; iDi[15:0] =16'h0196;
	#504; iDQ =1'b1; iDi[15:0] =16'h0197;
	#504; iDQ =1'b1; iDi[15:0] =16'h0198;
	#504; iDQ =1'b1; iDi[15:0] =16'h0199;
	#504; iDQ =1'b1; iDi[15:0] =16'h019A;
	#504; iDQ =1'b1; iDi[15:0] =16'h019B;
	#504; iDQ =1'b1; iDi[15:0] =16'h019C;
	#504; iDQ =1'b1; iDi[15:0] =16'h019D;
	#504; iDQ =1'b1; iDi[15:0] =16'h019E;
	#504; iDQ =1'b1; iDi[15:0] =16'h019F;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A0;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A1;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A2;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A3;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A4;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A5;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A6;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A7;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A8;
	#504; iDQ =1'b1; iDi[15:0] =16'h01A9;
	#504; iDQ =1'b1; iDi[15:0] =16'h01AA;
	#504; iDQ =1'b1; iDi[15:0] =16'h01AB;
	#504; iDQ =1'b1; iDi[15:0] =16'h01AC;
	#504; iDQ =1'b1; iDi[15:0] =16'h01AD;
	#504; iDQ =1'b1; iDi[15:0] =16'h01AE;
	#504; iDQ =1'b1; iDi[15:0] =16'h01AF;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B0;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B1;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B2;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B3;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B4;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B5;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B6;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B7;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B8;
	#504; iDQ =1'b1; iDi[15:0] =16'h01B9;
	#504; iDQ =1'b1; iDi[15:0] =16'h01BA;
	#504; iDQ =1'b1; iDi[15:0] =16'h01BB;
	#504; iDQ =1'b1; iDi[15:0] =16'h01BC;
	#504; iDQ =1'b1; iDi[15:0] =16'h01BD;
	#504; iDQ =1'b1; iDi[15:0] =16'h01BE;
	#504; iDQ =1'b1; iDi[15:0] =16'h01BF;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C0;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C1;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C2;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C3;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C4;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C5;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C6;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C7;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C8;
	#504; iDQ =1'b1; iDi[15:0] =16'h01C9;
	#504; iDQ =1'b1; iDi[15:0] =16'h01CA;
	#504; iDQ =1'b1; iDi[15:0] =16'h01CB;
	#504; iDQ =1'b1; iDi[15:0] =16'h01CC;
	#504; iDQ =1'b1; iDi[15:0] =16'h01CD;
	#504; iDQ =1'b1; iDi[15:0] =16'h01CE;
	#504; iDQ =1'b1; iDi[15:0] =16'h01CF;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D0;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D1;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D2;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D3;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D4;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D5;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D6;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D7;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D8;
	#504; iDQ =1'b1; iDi[15:0] =16'h01D9;
	#504; iDQ =1'b1; iDi[15:0] =16'h01DA;
	#504; iDQ =1'b1; iDi[15:0] =16'h01DB;
	#504; iDQ =1'b1; iDi[15:0] =16'h01DC;
	#504; iDQ =1'b1; iDi[15:0] =16'h01DD;
	#504; iDQ =1'b1; iDi[15:0] =16'h01DE;
	#504; iDQ =1'b1; iDi[15:0] =16'h01DF;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E0;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E1;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E2;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E3;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E4;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E5;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E6;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E7;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E8;
	#504; iDQ =1'b1; iDi[15:0] =16'h01E9;
	#504; iDQ =1'b1; iDi[15:0] =16'h01EA;
	#504; iDQ =1'b1; iDi[15:0] =16'h01EB;
	#504; iDQ =1'b1; iDi[15:0] =16'h01EC;
	#504; iDQ =1'b1; iDi[15:0] =16'h01ED;
	#504; iDQ =1'b1; iDi[15:0] =16'h01EE;
	#504; iDQ =1'b1; iDi[15:0] =16'h01EF;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F0;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F1;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F2;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F3;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F4;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F5;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F6;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F7;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F8;
	#504; iDQ =1'b1; iDi[15:0] =16'h01F9;
	#504; iDQ =1'b1; iDi[15:0] =16'h01FA;
	#504; iDQ =1'b1; iDi[15:0] =16'h01FB;
	#504; iDQ =1'b1; iDi[15:0] =16'h01FC;
	#504; iDQ =1'b1; iDi[15:0] =16'h01FD;
	#504; iDQ =1'b1; iDi[15:0] =16'h01FE;
	#504; iDQ =1'b1; iDi[15:0] =16'h01FF;

	#504; iDQ =1'b1; iDi[15:0] =16'h0200;
	#504; iDQ =1'b1; iDi[15:0] =16'h0201;
	#504; iDQ =1'b1; iDi[15:0] =16'h0202;
	#504; iDQ =1'b1; iDi[15:0] =16'h0203;
	#504; iDQ =1'b1; iDi[15:0] =16'h0204;
	#504; iDQ =1'b1; iDi[15:0] =16'h0205;
	#504; iDQ =1'b1; iDi[15:0] =16'h0206;
	#504; iDQ =1'b1; iDi[15:0] =16'h0207;
	#504; iDQ =1'b1; iDi[15:0] =16'h0208;
	#504; iDQ =1'b1; iDi[15:0] =16'h0209;
	#504; iDQ =1'b1; iDi[15:0] =16'h020A;
	#504; iDQ =1'b1; iDi[15:0] =16'h020B;
	#504; iDQ =1'b1; iDi[15:0] =16'h020C;
	#504; iDQ =1'b1; iDi[15:0] =16'h020D;
	#504; iDQ =1'b1; iDi[15:0] =16'h020E;
	#504; iDQ =1'b1; iDi[15:0] =16'h020F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0210;
	#504; iDQ =1'b1; iDi[15:0] =16'h0211;
	#504; iDQ =1'b1; iDi[15:0] =16'h0212;
	#504; iDQ =1'b1; iDi[15:0] =16'h0213;
	#504; iDQ =1'b1; iDi[15:0] =16'h0214;
	#504; iDQ =1'b1; iDi[15:0] =16'h0215;
	#504; iDQ =1'b1; iDi[15:0] =16'h0216;
	#504; iDQ =1'b1; iDi[15:0] =16'h0217;
	#504; iDQ =1'b1; iDi[15:0] =16'h0218;
	#504; iDQ =1'b1; iDi[15:0] =16'h0219;
	#504; iDQ =1'b1; iDi[15:0] =16'h021A;
	#504; iDQ =1'b1; iDi[15:0] =16'h021B;
	#504; iDQ =1'b1; iDi[15:0] =16'h021C;
	#504; iDQ =1'b1; iDi[15:0] =16'h021D;
	#504; iDQ =1'b1; iDi[15:0] =16'h021E;
	#504; iDQ =1'b1; iDi[15:0] =16'h021F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0220;
	#504; iDQ =1'b1; iDi[15:0] =16'h0221;
	#504; iDQ =1'b1; iDi[15:0] =16'h0222;
	#504; iDQ =1'b1; iDi[15:0] =16'h0223;
	#504; iDQ =1'b1; iDi[15:0] =16'h0224;
	#504; iDQ =1'b1; iDi[15:0] =16'h0225;
	#504; iDQ =1'b1; iDi[15:0] =16'h0226;
	#504; iDQ =1'b1; iDi[15:0] =16'h0227;
	#504; iDQ =1'b1; iDi[15:0] =16'h0228;
	#504; iDQ =1'b1; iDi[15:0] =16'h0229;
	#504; iDQ =1'b1; iDi[15:0] =16'h022A;
	#504; iDQ =1'b1; iDi[15:0] =16'h022B;
	#504; iDQ =1'b1; iDi[15:0] =16'h022C;
	#504; iDQ =1'b1; iDi[15:0] =16'h022D;
	#504; iDQ =1'b1; iDi[15:0] =16'h022E;
	#504; iDQ =1'b1; iDi[15:0] =16'h022F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0230;
	#504; iDQ =1'b1; iDi[15:0] =16'h0231;
	#504; iDQ =1'b1; iDi[15:0] =16'h0232;
	#504; iDQ =1'b1; iDi[15:0] =16'h0233;
	#504; iDQ =1'b1; iDi[15:0] =16'h0234;
	#504; iDQ =1'b1; iDi[15:0] =16'h0235;
	#504; iDQ =1'b1; iDi[15:0] =16'h0236;
	#504; iDQ =1'b1; iDi[15:0] =16'h0237;
	#504; iDQ =1'b1; iDi[15:0] =16'h0238;
	#504; iDQ =1'b1; iDi[15:0] =16'h0239;
	#504; iDQ =1'b1; iDi[15:0] =16'h023A;
	#504; iDQ =1'b1; iDi[15:0] =16'h023B;
	#504; iDQ =1'b1; iDi[15:0] =16'h023C;
	#504; iDQ =1'b1; iDi[15:0] =16'h023D;
	#504; iDQ =1'b1; iDi[15:0] =16'h023E;
	#504; iDQ =1'b1; iDi[15:0] =16'h023F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0240;
	#504; iDQ =1'b1; iDi[15:0] =16'h0241;
	#504; iDQ =1'b1; iDi[15:0] =16'h0242;
	#504; iDQ =1'b1; iDi[15:0] =16'h0243;
	#504; iDQ =1'b1; iDi[15:0] =16'h0244;
	#504; iDQ =1'b1; iDi[15:0] =16'h0245;
	#504; iDQ =1'b1; iDi[15:0] =16'h0246;
	#504; iDQ =1'b1; iDi[15:0] =16'h0247;
	#504; iDQ =1'b1; iDi[15:0] =16'h0248;
	#504; iDQ =1'b1; iDi[15:0] =16'h0249;
	#504; iDQ =1'b1; iDi[15:0] =16'h024A;
	#504; iDQ =1'b1; iDi[15:0] =16'h024B;
	#504; iDQ =1'b1; iDi[15:0] =16'h024C;
	#504; iDQ =1'b1; iDi[15:0] =16'h024D;
	#504; iDQ =1'b1; iDi[15:0] =16'h024E;
	#504; iDQ =1'b1; iDi[15:0] =16'h024F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0250;
	#504; iDQ =1'b1; iDi[15:0] =16'h0251;
	#504; iDQ =1'b1; iDi[15:0] =16'h0252;
	#504; iDQ =1'b1; iDi[15:0] =16'h0253;
	#504; iDQ =1'b1; iDi[15:0] =16'h0254;
	#504; iDQ =1'b1; iDi[15:0] =16'h0255;
	#504; iDQ =1'b1; iDi[15:0] =16'h0256;
	#504; iDQ =1'b1; iDi[15:0] =16'h0257;
	#504; iDQ =1'b1; iDi[15:0] =16'h0258;
	#504; iDQ =1'b1; iDi[15:0] =16'h0259;
	#504; iDQ =1'b1; iDi[15:0] =16'h025A;
	#504; iDQ =1'b1; iDi[15:0] =16'h025B;
	#504; iDQ =1'b1; iDi[15:0] =16'h025C;
	#504; iDQ =1'b1; iDi[15:0] =16'h025D;
	#504; iDQ =1'b1; iDi[15:0] =16'h025E;
	#504; iDQ =1'b1; iDi[15:0] =16'h025F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0260;
	#504; iDQ =1'b1; iDi[15:0] =16'h0261;
	#504; iDQ =1'b1; iDi[15:0] =16'h0262;
	#504; iDQ =1'b1; iDi[15:0] =16'h0263;
	#504; iDQ =1'b1; iDi[15:0] =16'h0264;
	#504; iDQ =1'b1; iDi[15:0] =16'h0265;
	#504; iDQ =1'b1; iDi[15:0] =16'h0266;
	#504; iDQ =1'b1; iDi[15:0] =16'h0267;
	#504; iDQ =1'b1; iDi[15:0] =16'h0268;
	#504; iDQ =1'b1; iDi[15:0] =16'h0269;
	#504; iDQ =1'b1; iDi[15:0] =16'h026A;
	#504; iDQ =1'b1; iDi[15:0] =16'h026B;
	#504; iDQ =1'b1; iDi[15:0] =16'h026C;
	#504; iDQ =1'b1; iDi[15:0] =16'h026D;
	#504; iDQ =1'b1; iDi[15:0] =16'h026E;
	#504; iDQ =1'b1; iDi[15:0] =16'h026F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0270;
	#504; iDQ =1'b1; iDi[15:0] =16'h0271;
	#504; iDQ =1'b1; iDi[15:0] =16'h0272;
	#504; iDQ =1'b1; iDi[15:0] =16'h0273;
	#504; iDQ =1'b1; iDi[15:0] =16'h0274;
	#504; iDQ =1'b1; iDi[15:0] =16'h0275;
	#504; iDQ =1'b1; iDi[15:0] =16'h0276;
	#504; iDQ =1'b1; iDi[15:0] =16'h0277;
	#504; iDQ =1'b1; iDi[15:0] =16'h0278;
	#504; iDQ =1'b1; iDi[15:0] =16'h0279;
	#504; iDQ =1'b1; iDi[15:0] =16'h027A;
	#504; iDQ =1'b1; iDi[15:0] =16'h027B;
	#504; iDQ =1'b1; iDi[15:0] =16'h027C;
	#504; iDQ =1'b1; iDi[15:0] =16'h027D;
	#504; iDQ =1'b1; iDi[15:0] =16'h027E;
	#504; iDQ =1'b1; iDi[15:0] =16'h027F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0280;
	#504; iDQ =1'b1; iDi[15:0] =16'h0281;
	#504; iDQ =1'b1; iDi[15:0] =16'h0282;
	#504; iDQ =1'b1; iDi[15:0] =16'h0283;
	#504; iDQ =1'b1; iDi[15:0] =16'h0284;
	#504; iDQ =1'b1; iDi[15:0] =16'h0285;
	#504; iDQ =1'b1; iDi[15:0] =16'h0286;
	#504; iDQ =1'b1; iDi[15:0] =16'h0287;
	#504; iDQ =1'b1; iDi[15:0] =16'h0288;
	#504; iDQ =1'b1; iDi[15:0] =16'h0289;
	#504; iDQ =1'b1; iDi[15:0] =16'h028A;
	#504; iDQ =1'b1; iDi[15:0] =16'h028B;
	#504; iDQ =1'b1; iDi[15:0] =16'h028C;
	#504; iDQ =1'b1; iDi[15:0] =16'h028D;
	#504; iDQ =1'b1; iDi[15:0] =16'h028E;
	#504; iDQ =1'b1; iDi[15:0] =16'h028F;
	#504; iDQ =1'b1; iDi[15:0] =16'h0290;
	#504; iDQ =1'b1; iDi[15:0] =16'h0291;
	#504; iDQ =1'b1; iDi[15:0] =16'h0292;
	#504; iDQ =1'b1; iDi[15:0] =16'h0293;
	#504; iDQ =1'b1; iDi[15:0] =16'h0294;
	#504; iDQ =1'b1; iDi[15:0] =16'h0295;
	#504; iDQ =1'b1; iDi[15:0] =16'h0296;
	#504; iDQ =1'b1; iDi[15:0] =16'h0297;
	#504; iDQ =1'b1; iDi[15:0] =16'h0298;
	#504; iDQ =1'b1; iDi[15:0] =16'h0299;
	#504; iDQ =1'b1; iDi[15:0] =16'h029A;
	#504; iDQ =1'b1; iDi[15:0] =16'h029B;
	#504; iDQ =1'b1; iDi[15:0] =16'h029C;
	#504; iDQ =1'b1; iDi[15:0] =16'h029D;
	#504; iDQ =1'b1; iDi[15:0] =16'h029E;
	#504; iDQ =1'b1; iDi[15:0] =16'h029F;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A0;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A1;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A2;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A3;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A4;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A5;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A6;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A7;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A8;
	#504; iDQ =1'b1; iDi[15:0] =16'h02A9;
	#504; iDQ =1'b1; iDi[15:0] =16'h02AA;
	#504; iDQ =1'b1; iDi[15:0] =16'h02AB;
	#504; iDQ =1'b1; iDi[15:0] =16'h02AC;
	#504; iDQ =1'b1; iDi[15:0] =16'h02AD;
	#504; iDQ =1'b1; iDi[15:0] =16'h02AE;
	#504; iDQ =1'b1; iDi[15:0] =16'h02AF;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B0;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B1;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B2;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B3;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B4;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B5;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B6;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B7;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B8;
	#504; iDQ =1'b1; iDi[15:0] =16'h02B9;
	#504; iDQ =1'b1; iDi[15:0] =16'h02BA;
	#504; iDQ =1'b1; iDi[15:0] =16'h02BB;
	#504; iDQ =1'b1; iDi[15:0] =16'h02BC;
	#504; iDQ =1'b1; iDi[15:0] =16'h02BD;
	#504; iDQ =1'b1; iDi[15:0] =16'h02BE;
	#504; iDQ =1'b1; iDi[15:0] =16'h02BF;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C0;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C1;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C2;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C3;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C4;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C5;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C6;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C7;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C8;
	#504; iDQ =1'b1; iDi[15:0] =16'h02C9;
	#504; iDQ =1'b1; iDi[15:0] =16'h02CA;
	#504; iDQ =1'b1; iDi[15:0] =16'h02CB;
	#504; iDQ =1'b1; iDi[15:0] =16'h02CC;
	#504; iDQ =1'b1; iDi[15:0] =16'h02CD;
	#504; iDQ =1'b1; iDi[15:0] =16'h02CE;
	#504; iDQ =1'b1; iDi[15:0] =16'h02CF;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D0;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D1;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D2;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D3;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D4;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D5;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D6;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D7;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D8;
	#504; iDQ =1'b1; iDi[15:0] =16'h02D9;
	#504; iDQ =1'b1; iDi[15:0] =16'h02DA;
	#504; iDQ =1'b1; iDi[15:0] =16'h02DB;
	#504; iDQ =1'b1; iDi[15:0] =16'h02DC;
	#504; iDQ =1'b1; iDi[15:0] =16'h02DD;
	#504; iDQ =1'b1; iDi[15:0] =16'h02DE;
	#504; iDQ =1'b1; iDi[15:0] =16'h02DF;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E0;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E1;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E2;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E3;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E4;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E5;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E6;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E7;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E8;
	#504; iDQ =1'b1; iDi[15:0] =16'h02E9;
	#504; iDQ =1'b1; iDi[15:0] =16'h02EA;
	#504; iDQ =1'b1; iDi[15:0] =16'h02EB;
	#504; iDQ =1'b1; iDi[15:0] =16'h02EC;
	#504; iDQ =1'b1; iDi[15:0] =16'h02ED;
	#504; iDQ =1'b1; iDi[15:0] =16'h02EE;
	#504; iDQ =1'b1; iDi[15:0] =16'h02EF;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F0;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F1;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F2;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F3;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F4;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F5;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F6;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F7;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F8;
	#504; iDQ =1'b1; iDi[15:0] =16'h02F9;
	#504; iDQ =1'b1; iDi[15:0] =16'h02FA;
	#504; iDQ =1'b1; iDi[15:0] =16'h02FB;
	#504; iDQ =1'b1; iDi[15:0] =16'h02FC;
	#504; iDQ =1'b1; iDi[15:0] =16'h02FD;
	#504; iDQ =1'b1; iDi[15:0] =16'h02FE;
	#504; iDQ =1'b1; iDi[15:0] =16'h02FF;
	#170; iDQ =1'b0;
	#174;	iDi[15:0] =16'hZZZZ;
	#160;
//- start of data burst ======================================
	#414; cDK =1'b1; bCRT =1'b0;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0; bCRT =1'b1;
	#280; cDK =1'b1; bCRT =1'b0;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0; bCRT =1'b1;
	#280; cDK =1'b1; bCRT =1'b0;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0; bCRT =1'b1;
	#280; cDK =1'b1; bCRT =1'b0;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0; bCRT =1'b1;
	#280; cDK =1'b1; bCRT =1'b0;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	# 56; bcRd =1'b1;
	# 56; bcRd =1'b0;
	#840; bcRd =1'b1;
	# 70; cDK =1'b0; bCRT =1'b1;
	#280; cDK =1'b1; bCRT =1'b0;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0; bCRT =1'b1;
	#280; cDK =1'b1; bCRT =1'b0;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0; bCRT =1'b1;
	#280; cDK =1'b1; bCRT =1'b0;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#868;
	# 28; bcRd =1'b1;
	# 70; cDK =1'b0; bCRT =1'b1;
	# 21;
//// =====================================================
	#280;
//// =====================================================
//////vvvvvvvvvvvvvvvvvvvvvvv
	#112; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'h0003; // write 0038(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0064;	cDPi[15:0] =16'h004E; // write 0064(004E)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////- ====set Multi-DMA mode 1
	#112; cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003; // write 0042(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0022; // write 0044(0022) MDMA-MODE1
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF; // write 004E(00EF)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////// ====================================
	#112; cAPi[15:0] =16'h0032;	cDPi[15:0] =16'h0086; // write 0032(0086)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0001; // write 0044(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00CA; // write 004E(00CA)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0024;	cDPi[15:0] =16'h0006; // write 0024(0006)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0001; // write 002E(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0000; // write 002E(0000)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
//////////// =========================
	#154; iDQ =1'b1; iDi[15:0] =16'h0800; cAPi[15:0] =16'hZZZZ;
	#154; iDQ =1'b1; iDi[15:0] =16'h0801;
	#154; iDQ =1'b1; iDi[15:0] =16'h0802;
	#154; iDQ =1'b1; iDi[15:0] =16'h0803;
	#154; iDQ =1'b1; iDi[15:0] =16'h0804;
	#154; iDQ =1'b1; iDi[15:0] =16'h0805;
	#154; iDQ =1'b1; iDi[15:0] =16'h0806;
	#154; iDQ =1'b1; iDi[15:0] =16'h0807;
	#154; iDQ =1'b1; iDi[15:0] =16'h0808;
	#154; iDQ =1'b1; iDi[15:0] =16'h0809;
	#154; iDQ =1'b1; iDi[15:0] =16'h080A;
	#154; iDQ =1'b1; iDi[15:0] =16'h080B;
	#154; iDQ =1'b1; iDi[15:0] =16'h080C;
	#154; iDQ =1'b1; iDi[15:0] =16'h080D;
	#154; iDQ =1'b1; iDi[15:0] =16'h080E;
	#154; iDQ =1'b1; iDi[15:0] =16'h080F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0810;
	#154; iDQ =1'b1; iDi[15:0] =16'h0811;
	#154; iDQ =1'b1; iDi[15:0] =16'h0812;
	#154; iDQ =1'b1; iDi[15:0] =16'h0813;
	#154; iDQ =1'b1; iDi[15:0] =16'h0814;
	#154; iDQ =1'b1; iDi[15:0] =16'h0815;
	#154; iDQ =1'b1; iDi[15:0] =16'h0816;
	#154; iDQ =1'b1; iDi[15:0] =16'h0817;
	#154; iDQ =1'b1; iDi[15:0] =16'h0818;
	#154; iDQ =1'b1; iDi[15:0] =16'h0819;
	#154; iDQ =1'b1; iDi[15:0] =16'h081A;
	#154; iDQ =1'b1; iDi[15:0] =16'h081B;
	#154; iDQ =1'b1; iDi[15:0] =16'h081C;
	#154; iDQ =1'b1; iDi[15:0] =16'h081D;
	#154; iDQ =1'b1; iDi[15:0] =16'h081E;
	#154; iDQ =1'b1; iDi[15:0] =16'h081F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0820;
	#154; iDQ =1'b1; iDi[15:0] =16'h0821;
	#154; iDQ =1'b1; iDi[15:0] =16'h0822;
	#154; iDQ =1'b1; iDi[15:0] =16'h0823;
	#154; iDQ =1'b1; iDi[15:0] =16'h0824;
	#154; iDQ =1'b1; iDi[15:0] =16'h0825;
	#154; iDQ =1'b1; iDi[15:0] =16'h0826;
	#154; iDQ =1'b1; iDi[15:0] =16'h0827;
	#154; iDQ =1'b1; iDi[15:0] =16'h0828;
	#154; iDQ =1'b1; iDi[15:0] =16'h0829;
	#154; iDQ =1'b1; iDi[15:0] =16'h082A;
	#154; iDQ =1'b1; iDi[15:0] =16'h082B;
	#154; iDQ =1'b1; iDi[15:0] =16'h082C;
	#154; iDQ =1'b1; iDi[15:0] =16'h082D;
	#154; iDQ =1'b1; iDi[15:0] =16'h082E;
	#154; iDQ =1'b1; iDi[15:0] =16'h082F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0830;
	#154; iDQ =1'b1; iDi[15:0] =16'h0831;
	#154; iDQ =1'b1; iDi[15:0] =16'h0832;
	#154; iDQ =1'b1; iDi[15:0] =16'h0833;
	#154; iDQ =1'b1; iDi[15:0] =16'h0834;
	#154; iDQ =1'b1; iDi[15:0] =16'h0835;
	#154; iDQ =1'b1; iDi[15:0] =16'h0836;
	#154; iDQ =1'b1; iDi[15:0] =16'h0837;
	#154; iDQ =1'b1; iDi[15:0] =16'h0838;
	#154; iDQ =1'b1; iDi[15:0] =16'h0839;
	#154; iDQ =1'b1; iDi[15:0] =16'h083A;
	#154; iDQ =1'b1; iDi[15:0] =16'h083B;
	#154; iDQ =1'b1; iDi[15:0] =16'h083C;
	#154; iDQ =1'b1; iDi[15:0] =16'h083D;
	#154; iDQ =1'b1; iDi[15:0] =16'h083E;
	#154; iDQ =1'b1; iDi[15:0] =16'h083F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0840;
	#154; iDQ =1'b1; iDi[15:0] =16'h0841;
	#154; iDQ =1'b1; iDi[15:0] =16'h0842;
	#154; iDQ =1'b1; iDi[15:0] =16'h0843;
	#154; iDQ =1'b1; iDi[15:0] =16'h0844;
	#154; iDQ =1'b1; iDi[15:0] =16'h0845;
	#154; iDQ =1'b1; iDi[15:0] =16'h0846;
	#154; iDQ =1'b1; iDi[15:0] =16'h0847;
	#154; iDQ =1'b1; iDi[15:0] =16'h0848;
	#154; iDQ =1'b1; iDi[15:0] =16'h0849;
	#154; iDQ =1'b1; iDi[15:0] =16'h084A;
	#154; iDQ =1'b1; iDi[15:0] =16'h084B;
	#154; iDQ =1'b1; iDi[15:0] =16'h084C;
	#154; iDQ =1'b1; iDi[15:0] =16'h084D;
	#154; iDQ =1'b1; iDi[15:0] =16'h084E;
	#154; iDQ =1'b1; iDi[15:0] =16'h084F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0850;
	#154; iDQ =1'b1; iDi[15:0] =16'h0851;
	#154; iDQ =1'b1; iDi[15:0] =16'h0852;
	#154; iDQ =1'b1; iDi[15:0] =16'h0853;
	#154; iDQ =1'b1; iDi[15:0] =16'h0854;
	#154; iDQ =1'b1; iDi[15:0] =16'h0855;
	#154; iDQ =1'b1; iDi[15:0] =16'h0856;
	#154; iDQ =1'b1; iDi[15:0] =16'h0857;
	#154; iDQ =1'b1; iDi[15:0] =16'h0858;
	#154; iDQ =1'b1; iDi[15:0] =16'h0859;
	#154; iDQ =1'b1; iDi[15:0] =16'h085A;
	#154; iDQ =1'b1; iDi[15:0] =16'h085B;
	#154; iDQ =1'b1; iDi[15:0] =16'h085C;
	#154; iDQ =1'b1; iDi[15:0] =16'h085D;
	#154; iDQ =1'b1; iDi[15:0] =16'h085E;
	#154; iDQ =1'b1; iDi[15:0] =16'h085F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0860;
	#154; iDQ =1'b1; iDi[15:0] =16'h0861;
	#154; iDQ =1'b1; iDi[15:0] =16'h0862;
	#154; iDQ =1'b1; iDi[15:0] =16'h0863;
	#154; iDQ =1'b1; iDi[15:0] =16'h0864;
	#154; iDQ =1'b1; iDi[15:0] =16'h0865;
	#154; iDQ =1'b1; iDi[15:0] =16'h0866;
	#154; iDQ =1'b1; iDi[15:0] =16'h0867;
	#154; iDQ =1'b1; iDi[15:0] =16'h0868;
	#154; iDQ =1'b1; iDi[15:0] =16'h0869;
	#154; iDQ =1'b1; iDi[15:0] =16'h086A;
	#154; iDQ =1'b1; iDi[15:0] =16'h086B;
	#154; iDQ =1'b1; iDi[15:0] =16'h086C;
	#154; iDQ =1'b1; iDi[15:0] =16'h086D;
	#154; iDQ =1'b1; iDi[15:0] =16'h086E;
	#154; iDQ =1'b1; iDi[15:0] =16'h086F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0870;
	#154; iDQ =1'b1; iDi[15:0] =16'h0871;
	#154; iDQ =1'b1; iDi[15:0] =16'h0872;
	#154; iDQ =1'b1; iDi[15:0] =16'h0873;
	#154; iDQ =1'b1; iDi[15:0] =16'h0874;
	#154; iDQ =1'b1; iDi[15:0] =16'h0875;
	#154; iDQ =1'b1; iDi[15:0] =16'h0876;
	#154; iDQ =1'b1; iDi[15:0] =16'h0877;
	#154; iDQ =1'b1; iDi[15:0] =16'h0878;
	#154; iDQ =1'b1; iDi[15:0] =16'h0879;
	#154; iDQ =1'b1; iDi[15:0] =16'h087A;
	#154; iDQ =1'b1; iDi[15:0] =16'h087B;
	#154; iDQ =1'b1; iDi[15:0] =16'h087C;
	#154; iDQ =1'b1; iDi[15:0] =16'h087D;
	#154; iDQ =1'b1; iDi[15:0] =16'h087E;
	#154; iDQ =1'b1; iDi[15:0] =16'h087F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0880;
	#154; iDQ =1'b1; iDi[15:0] =16'h0881;
	#154; iDQ =1'b1; iDi[15:0] =16'h0882;
	#154; iDQ =1'b1; iDi[15:0] =16'h0883;
	#154; iDQ =1'b1; iDi[15:0] =16'h0884;
	#154; iDQ =1'b1; iDi[15:0] =16'h0885;
	#154; iDQ =1'b1; iDi[15:0] =16'h0886;
	#154; iDQ =1'b1; iDi[15:0] =16'h0887;
	#154; iDQ =1'b1; iDi[15:0] =16'h0888;
	#154; iDQ =1'b1; iDi[15:0] =16'h0889;
	#154; iDQ =1'b1; iDi[15:0] =16'h088A;
	#154; iDQ =1'b1; iDi[15:0] =16'h088B;
	#154; iDQ =1'b1; iDi[15:0] =16'h088C;
	#154; iDQ =1'b1; iDi[15:0] =16'h088D;
	#154; iDQ =1'b1; iDi[15:0] =16'h088E;
	#154; iDQ =1'b1; iDi[15:0] =16'h088F;
	#154; iDQ =1'b1; iDi[15:0] =16'h0890;
	#154; iDQ =1'b1; iDi[15:0] =16'h0891;
	#154; iDQ =1'b1; iDi[15:0] =16'h0892;
	#154; iDQ =1'b1; iDi[15:0] =16'h0893;
	#154; iDQ =1'b1; iDi[15:0] =16'h0894;
	#154; iDQ =1'b1; iDi[15:0] =16'h0895;
	#154; iDQ =1'b1; iDi[15:0] =16'h0896;
	#154; iDQ =1'b1; iDi[15:0] =16'h0897;
	#154; iDQ =1'b1; iDi[15:0] =16'h0898;
	#154; iDQ =1'b1; iDi[15:0] =16'h0899;
	#154; iDQ =1'b1; iDi[15:0] =16'h089A;
	#154; iDQ =1'b1; iDi[15:0] =16'h089B;
	#154; iDQ =1'b1; iDi[15:0] =16'h089C;
	#154; iDQ =1'b1; iDi[15:0] =16'h089D;
	#154; iDQ =1'b1; iDi[15:0] =16'h089E;
	#154; iDQ =1'b1; iDi[15:0] =16'h089F;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A0;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A1;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A2;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A3;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A4;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A5;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A6;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A7;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A8;
	#154; iDQ =1'b1; iDi[15:0] =16'h08A9;
	#154; iDQ =1'b1; iDi[15:0] =16'h08AA;
	#154; iDQ =1'b1; iDi[15:0] =16'h08AB;
	#154; iDQ =1'b1; iDi[15:0] =16'h08AC;
	#154; iDQ =1'b1; iDi[15:0] =16'h08AD;
	#154; iDQ =1'b1; iDi[15:0] =16'h08AE;
	#154; iDQ =1'b1; iDi[15:0] =16'h08AF;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B0;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B1;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B2;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B3;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B4;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B5;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B6;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B7;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B8;
	#154; iDQ =1'b1; iDi[15:0] =16'h08B9;
	#154; iDQ =1'b1; iDi[15:0] =16'h08BA;
	#154; iDQ =1'b1; iDi[15:0] =16'h08BB;
	#154; iDQ =1'b1; iDi[15:0] =16'h08BC;
	#154; iDQ =1'b1; iDi[15:0] =16'h08BD;
	#154; iDQ =1'b1; iDi[15:0] =16'h08BE;
	#154; iDQ =1'b1; iDi[15:0] =16'h08BF;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C0;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C1;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C2;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C3;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C4;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C5;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C6;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C7;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C8;
	#154; iDQ =1'b1; iDi[15:0] =16'h08C9;
	#154; iDQ =1'b1; iDi[15:0] =16'h08CA;
	#154; iDQ =1'b1; iDi[15:0] =16'h08CB;
	#154; iDQ =1'b1; iDi[15:0] =16'h08CC;
	#154; iDQ =1'b1; iDi[15:0] =16'h08CD;
	#154; iDQ =1'b1; iDi[15:0] =16'h08CE;
	#154; iDQ =1'b1; iDi[15:0] =16'h08CF;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D0;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D1;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D2;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D3;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D4;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D5;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D6;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D7;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D8;
	#154; iDQ =1'b1; iDi[15:0] =16'h08D9;
	#154; iDQ =1'b1; iDi[15:0] =16'h08DA;
	#154; iDQ =1'b1; iDi[15:0] =16'h08DB;
	#154; iDQ =1'b1; iDi[15:0] =16'h08DC;
	#154; iDQ =1'b1; iDi[15:0] =16'h08DD;
	#154; iDQ =1'b1; iDi[15:0] =16'h08DE;
	#154; iDQ =1'b1; iDi[15:0] =16'h08DF;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E0;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E1;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E2;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E3;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E4;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E5;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E6;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E7;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E8;
	#154; iDQ =1'b1; iDi[15:0] =16'h08E9;
	#154; iDQ =1'b1; iDi[15:0] =16'h08EA;
	#154; iDQ =1'b1; iDi[15:0] =16'h08EB;
	#154; iDQ =1'b1; iDi[15:0] =16'h08EC;
	#154; iDQ =1'b1; iDi[15:0] =16'h08ED;
	#154; iDQ =1'b1; iDi[15:0] =16'h08EE;
	#154; iDQ =1'b1; iDi[15:0] =16'h08EF;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F0;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F1;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F2;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F3;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F4;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F5;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F6;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F7;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F8;
	#154; iDQ =1'b1; iDi[15:0] =16'h08F9;
	#154; iDQ =1'b1; iDi[15:0] =16'h08FA;
	#154; iDQ =1'b1; iDi[15:0] =16'h08FB;
	#154; iDQ =1'b1; iDi[15:0] =16'h08FC;
	#154; iDQ =1'b1; iDi[15:0] =16'h08FD;
	#154; iDQ =1'b1; iDi[15:0] =16'h08FE;
	#154; iDQ =1'b1; iDi[15:0] =16'h08FF;
	#84; iDQ =1'b0;			// stop for the time being
	#84; iDi[15:0] =16'hZZZZ;			// disable bus drive
	
////- ====set multi DMA mode 2
	#112; cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003; // write 0042(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0024; // write 0044(0024) MDMA - MODE2
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF; // write 004E(00EF)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////////- =============

	#126; iDQ =1'b1;
	#40;				iDi[15:0] =16'h0900;	
	#126; iDQ =1'b1; iDi[15:0] =16'h0901;
	#126; iDQ =1'b1; iDi[15:0] =16'h0902;
	#126; iDQ =1'b1; iDi[15:0] =16'h0903;
	#126; iDQ =1'b1; iDi[15:0] =16'h0904;
	#126; iDQ =1'b1; iDi[15:0] =16'h0905;
	#126; iDQ =1'b1; iDi[15:0] =16'h0906;
	#126; iDQ =1'b1; iDi[15:0] =16'h0907;
	#126; iDQ =1'b1; iDi[15:0] =16'h0908;
	#126; iDQ =1'b1; iDi[15:0] =16'h0909;
	#126; iDQ =1'b1; iDi[15:0] =16'h090A;
	#126; iDQ =1'b1; iDi[15:0] =16'h090B;
	#126; iDQ =1'b1; iDi[15:0] =16'h090C;
	#126; iDQ =1'b1; iDi[15:0] =16'h090D;
	#126; iDQ =1'b1; iDi[15:0] =16'h090E;
	#126; iDQ =1'b1; iDi[15:0] =16'h090F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0910;
	#126; iDQ =1'b1; iDi[15:0] =16'h0911;
	#126; iDQ =1'b1; iDi[15:0] =16'h0912;
	#126; iDQ =1'b1; iDi[15:0] =16'h0913;
	#126; iDQ =1'b1; iDi[15:0] =16'h0914;
	#126; iDQ =1'b1; iDi[15:0] =16'h0915;
	#126; iDQ =1'b1; iDi[15:0] =16'h0916;
	#126; iDQ =1'b1; iDi[15:0] =16'h0917;
	#126; iDQ =1'b1; iDi[15:0] =16'h0918;
	#126; iDQ =1'b1; iDi[15:0] =16'h0919;
	#126; iDQ =1'b1; iDi[15:0] =16'h091A;
	#126; iDQ =1'b1; iDi[15:0] =16'h091B;
	#126; iDQ =1'b1; iDi[15:0] =16'h091C;
	#126; iDQ =1'b1; iDi[15:0] =16'h091D;
	#126; iDQ =1'b1; iDi[15:0] =16'h091E;
	#126; iDQ =1'b1; iDi[15:0] =16'h091F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0920;
	#126; iDQ =1'b1; iDi[15:0] =16'h0921;
	#126; iDQ =1'b1; iDi[15:0] =16'h0922;
	#126; iDQ =1'b1; iDi[15:0] =16'h0923;
	#126; iDQ =1'b1; iDi[15:0] =16'h0924;
	#126; iDQ =1'b1; iDi[15:0] =16'h0925;
	#126; iDQ =1'b1; iDi[15:0] =16'h0926;
	#126; iDQ =1'b1; iDi[15:0] =16'h0927;
	#126; iDQ =1'b1; iDi[15:0] =16'h0928;
	#126; iDQ =1'b1; iDi[15:0] =16'h0929;
	#126; iDQ =1'b1; iDi[15:0] =16'h092A;
	#126; iDQ =1'b1; iDi[15:0] =16'h092B;
	#126; iDQ =1'b1; iDi[15:0] =16'h092C;
	#126; iDQ =1'b1; iDi[15:0] =16'h092D;
	#126; iDQ =1'b1; iDi[15:0] =16'h092E;
	#126; iDQ =1'b1; iDi[15:0] =16'h092F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0930;
	#126; iDQ =1'b1; iDi[15:0] =16'h0931;
	#126; iDQ =1'b1; iDi[15:0] =16'h0932;
	#126; iDQ =1'b1; iDi[15:0] =16'h0933;
	#126; iDQ =1'b1; iDi[15:0] =16'h0934;
	#126; iDQ =1'b1; iDi[15:0] =16'h0935;
	#126; iDQ =1'b1; iDi[15:0] =16'h0936;
	#126; iDQ =1'b1; iDi[15:0] =16'h0937;
	#126; iDQ =1'b1; iDi[15:0] =16'h0938;
	#126; iDQ =1'b1; iDi[15:0] =16'h0939;
	#126; iDQ =1'b1; iDi[15:0] =16'h093A;
	#126; iDQ =1'b1; iDi[15:0] =16'h093B;
	#126; iDQ =1'b1; iDi[15:0] =16'h093C;
	#126; iDQ =1'b1; iDi[15:0] =16'h093D;
	#126; iDQ =1'b1; iDi[15:0] =16'h093E;
	#126; iDQ =1'b1; iDi[15:0] =16'h093F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0940;
	#126; iDQ =1'b1; iDi[15:0] =16'h0941;
	#126; iDQ =1'b1; iDi[15:0] =16'h0942;
	#126; iDQ =1'b1; iDi[15:0] =16'h0943;
	#126; iDQ =1'b1; iDi[15:0] =16'h0944;
	#126; iDQ =1'b1; iDi[15:0] =16'h0945;
	#126; iDQ =1'b1; iDi[15:0] =16'h0946;
	#126; iDQ =1'b1; iDi[15:0] =16'h0947;
	#126; iDQ =1'b1; iDi[15:0] =16'h0948;
	#126; iDQ =1'b1; iDi[15:0] =16'h0949;
	#126; iDQ =1'b1; iDi[15:0] =16'h094A;
	#126; iDQ =1'b1; iDi[15:0] =16'h094B;
	#126; iDQ =1'b1; iDi[15:0] =16'h094C;
	#126; iDQ =1'b1; iDi[15:0] =16'h094D;
	#126; iDQ =1'b1; iDi[15:0] =16'h094E;
	#126; iDQ =1'b1; iDi[15:0] =16'h094F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0950;
	#126; iDQ =1'b1; iDi[15:0] =16'h0951;
	#126; iDQ =1'b1; iDi[15:0] =16'h0952;
	#126; iDQ =1'b1; iDi[15:0] =16'h0953;
	#126; iDQ =1'b1; iDi[15:0] =16'h0954;
	#126; iDQ =1'b1; iDi[15:0] =16'h0955;
	#126; iDQ =1'b1; iDi[15:0] =16'h0956;
	#126; iDQ =1'b1; iDi[15:0] =16'h0957;
	#126; iDQ =1'b1; iDi[15:0] =16'h0958;
	#126; iDQ =1'b1; iDi[15:0] =16'h0959;
	#126; iDQ =1'b1; iDi[15:0] =16'h095A;
	#126; iDQ =1'b1; iDi[15:0] =16'h095B;
	#126; iDQ =1'b1; iDi[15:0] =16'h095C;
	#126; iDQ =1'b1; iDi[15:0] =16'h095D;
	#126; iDQ =1'b1; iDi[15:0] =16'h095E;
	#126; iDQ =1'b1; iDi[15:0] =16'h095F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0960;
	#126; iDQ =1'b1; iDi[15:0] =16'h0961;
	#126; iDQ =1'b1; iDi[15:0] =16'h0962;
	#126; iDQ =1'b1; iDi[15:0] =16'h0963;
	#126; iDQ =1'b1; iDi[15:0] =16'h0964;
	#126; iDQ =1'b1; iDi[15:0] =16'h0965;
	#126; iDQ =1'b1; iDi[15:0] =16'h0966;
	#126; iDQ =1'b1; iDi[15:0] =16'h0967;
	#126; iDQ =1'b1; iDi[15:0] =16'h0968;
	#126; iDQ =1'b1; iDi[15:0] =16'h0969;
	#126; iDQ =1'b1; iDi[15:0] =16'h096A;
	#126; iDQ =1'b1; iDi[15:0] =16'h096B;
	#126; iDQ =1'b1; iDi[15:0] =16'h096C;
	#126; iDQ =1'b1; iDi[15:0] =16'h096D;
	#126; iDQ =1'b1; iDi[15:0] =16'h096E;
	#126; iDQ =1'b1; iDi[15:0] =16'h096F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0970;
	#126; iDQ =1'b1; iDi[15:0] =16'h0971;
	#126; iDQ =1'b1; iDi[15:0] =16'h0972;
	#126; iDQ =1'b1; iDi[15:0] =16'h0973;
	#126; iDQ =1'b1; iDi[15:0] =16'h0974;
	#126; iDQ =1'b1; iDi[15:0] =16'h0975;
	#126; iDQ =1'b1; iDi[15:0] =16'h0976;
	#126; iDQ =1'b1; iDi[15:0] =16'h0977;
	#126; iDQ =1'b1; iDi[15:0] =16'h0978;
	#126; iDQ =1'b1; iDi[15:0] =16'h0979;
	#126; iDQ =1'b1; iDi[15:0] =16'h097A;
	#126; iDQ =1'b1; iDi[15:0] =16'h097B;
	#126; iDQ =1'b1; iDi[15:0] =16'h097C;
	#126; iDQ =1'b1; iDi[15:0] =16'h097D;
	#126; iDQ =1'b1; iDi[15:0] =16'h097E;
	#126; iDQ =1'b1; iDi[15:0] =16'h097F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0980;
	#126; iDQ =1'b1; iDi[15:0] =16'h0981;
	#126; iDQ =1'b1; iDi[15:0] =16'h0982;
	#126; iDQ =1'b1; iDi[15:0] =16'h0983;
	#126; iDQ =1'b1; iDi[15:0] =16'h0984;
	#126; iDQ =1'b1; iDi[15:0] =16'h0985;
	#126; iDQ =1'b1; iDi[15:0] =16'h0986;
	#126; iDQ =1'b1; iDi[15:0] =16'h0987;
	#126; iDQ =1'b1; iDi[15:0] =16'h0988;
	#126; iDQ =1'b1; iDi[15:0] =16'h0989;
	#126; iDQ =1'b1; iDi[15:0] =16'h098A;
	#126; iDQ =1'b1; iDi[15:0] =16'h098B;
	#126; iDQ =1'b1; iDi[15:0] =16'h098C;
	#126; iDQ =1'b1; iDi[15:0] =16'h098D;
	#126; iDQ =1'b1; iDi[15:0] =16'h098E;
	#126; iDQ =1'b1; iDi[15:0] =16'h098F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0990;
	#126; iDQ =1'b1; iDi[15:0] =16'h0991;
	#126; iDQ =1'b1; iDi[15:0] =16'h0992;
	#126; iDQ =1'b1; iDi[15:0] =16'h0993;
	#126; iDQ =1'b1; iDi[15:0] =16'h0994;
	#126; iDQ =1'b1; iDi[15:0] =16'h0995;
	#126; iDQ =1'b1; iDi[15:0] =16'h0996;
	#126; iDQ =1'b1; iDi[15:0] =16'h0997;
	#126; iDQ =1'b1; iDi[15:0] =16'h0998;
	#126; iDQ =1'b1; iDi[15:0] =16'h0999;
	#126; iDQ =1'b1; iDi[15:0] =16'h099A;
	#126; iDQ =1'b1; iDi[15:0] =16'h099B;
	#126; iDQ =1'b1; iDi[15:0] =16'h099C;
	#126; iDQ =1'b1; iDi[15:0] =16'h099D;
	#126; iDQ =1'b1; iDi[15:0] =16'h099E;
	#126; iDQ =1'b1; iDi[15:0] =16'h099F;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A0;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A1;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A2;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A3;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A4;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A5;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A6;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A7;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A8;
	#126; iDQ =1'b1; iDi[15:0] =16'h09A9;
	#126; iDQ =1'b1; iDi[15:0] =16'h09AA;
	#126; iDQ =1'b1; iDi[15:0] =16'h09AB;
	#126; iDQ =1'b1; iDi[15:0] =16'h09AC;
	#126; iDQ =1'b1; iDi[15:0] =16'h09AD;
	#126; iDQ =1'b1; iDi[15:0] =16'h09AE;
	#126; iDQ =1'b1; iDi[15:0] =16'h09AF;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B0;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B1;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B2;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B3;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B4;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B5;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B6;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B7;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B8;
	#126; iDQ =1'b1; iDi[15:0] =16'h09B9;
	#126; iDQ =1'b1; iDi[15:0] =16'h09BA;
	#126; iDQ =1'b1; iDi[15:0] =16'h09BB;
	#126; iDQ =1'b1; iDi[15:0] =16'h09BC;
	#126; iDQ =1'b1; iDi[15:0] =16'h09BD;
	#126; iDQ =1'b1; iDi[15:0] =16'h09BE;
	#126; iDQ =1'b1; iDi[15:0] =16'h09BF;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C0;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C1;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C2;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C3;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C4;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C5;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C6;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C7;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C8;
	#126; iDQ =1'b1; iDi[15:0] =16'h09C9;
	#126; iDQ =1'b1; iDi[15:0] =16'h09CA;
	#126; iDQ =1'b1; iDi[15:0] =16'h09CB;
	#126; iDQ =1'b1; iDi[15:0] =16'h09CC;
	#126; iDQ =1'b1; iDi[15:0] =16'h09CD;
	#126; iDQ =1'b1; iDi[15:0] =16'h09CE;
	#126; iDQ =1'b1; iDi[15:0] =16'h09CF;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D0;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D1;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D2;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D3;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D4;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D5;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D6;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D7;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D8;
	#126; iDQ =1'b1; iDi[15:0] =16'h09D9;
	#126; iDQ =1'b1; iDi[15:0] =16'h09DA;
	#126; iDQ =1'b1; iDi[15:0] =16'h09DB;
	#126; iDQ =1'b1; iDi[15:0] =16'h09DC;
	#126; iDQ =1'b1; iDi[15:0] =16'h09DD;
	#126; iDQ =1'b1; iDi[15:0] =16'h09DE;
	#126; iDQ =1'b1; iDi[15:0] =16'h09DF;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E0;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E1;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E2;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E3;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E4;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E5;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E6;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E7;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E8;
	#126; iDQ =1'b1; iDi[15:0] =16'h09E9;
	#126; iDQ =1'b1; iDi[15:0] =16'h09EA;
	#126; iDQ =1'b1; iDi[15:0] =16'h09EB;
	#126; iDQ =1'b1; iDi[15:0] =16'h09EC;
	#126; iDQ =1'b1; iDi[15:0] =16'h09ED;
	#126; iDQ =1'b1; iDi[15:0] =16'h09EE;
	#126; iDQ =1'b1; iDi[15:0] =16'h09EF;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F0;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F1;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F2;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F3;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F4;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F5;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F6;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F7;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F8;
	#126; iDQ =1'b1; iDi[15:0] =16'h09F9;
	#126; iDQ =1'b1; iDi[15:0] =16'h09FA;
	#126; iDQ =1'b1; iDi[15:0] =16'h09FB;
	#126; iDQ =1'b1; iDi[15:0] =16'h09FC;
	#126; iDQ =1'b1; iDi[15:0] =16'h09FD;
	#126; iDQ =1'b1; iDi[15:0] =16'h09FE;
	#126; iDQ =1'b1; iDi[15:0] =16'h09FF;

	#126; iDQ =1'b1; iDi[15:0] =16'h0A00;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A01;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A02;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A03;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A04;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A05;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A06;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A07;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A08;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A09;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A0A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A0B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A0C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A0D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A0E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A0F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A10;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A11;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A12;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A13;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A14;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A15;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A16;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A17;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A18;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A19;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A1A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A1B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A1C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A1D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A1E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A1F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A20;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A21;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A22;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A23;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A24;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A25;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A26;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A27;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A28;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A29;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A2A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A2B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A2C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A2D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A2E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A2F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A30;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A31;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A32;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A33;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A34;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A35;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A36;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A37;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A38;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A39;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A3A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A3B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A3C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A3D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A3E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A3F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A40;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A41;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A42;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A43;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A44;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A45;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A46;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A47;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A48;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A49;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A4A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A4B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A4C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A4D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A4E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A4F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A50;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A51;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A52;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A53;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A54;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A55;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A56;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A57;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A58;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A59;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A5A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A5B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A5C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A5D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A5E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A5F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A60;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A61;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A62;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A63;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A64;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A65;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A66;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A67;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A68;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A69;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A6A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A6B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A6C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A6D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A6E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A6F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A70;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A71;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A72;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A73;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A74;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A75;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A76;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A77;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A78;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A79;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A7A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A7B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A7C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A7D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A7E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A7F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A80;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A81;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A82;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A83;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A84;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A85;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A86;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A87;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A88;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A89;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A8A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A8B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A8C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A8D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A8E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A8F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A90;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A91;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A92;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A93;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A94;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A95;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A96;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A97;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A98;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A99;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A9A;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A9B;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A9C;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A9D;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A9E;
	#126; iDQ =1'b1; iDi[15:0] =16'h0A9F;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA0;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA1;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA2;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA3;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA4;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA5;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA6;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA7;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA8;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AA9;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AAA;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AAB;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AAC;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AAD;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AAE;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AAF;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB0;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB1;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB2;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB3;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB4;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB5;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB6;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB7;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB8;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AB9;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ABA;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ABB;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ABC;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ABD;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ABE;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ABF;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC0;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC1;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC2;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC3;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC4;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC5;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC6;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC7;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC8;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AC9;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ACA;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ACB;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ACC;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ACD;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ACE;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ACF;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD0;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD1;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD2;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD3;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD4;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD5;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD6;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD7;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD8;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AD9;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ADA;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ADB;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ADC;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ADD;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ADE;
	#126; iDQ =1'b1; iDi[15:0] =16'h0ADF;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE0;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE1;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE2;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE3;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE4;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE5;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE6;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE7;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE8;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AE9;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AEA;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AEB;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AEC;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AED;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AEE;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AEF;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF0;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF1;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF2;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF3;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF4;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF5;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF6;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF7;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF8;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AF9;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AFA;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AFB;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AFC;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AFD;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AFE;
	#126; iDQ =1'b1; iDi[15:0] =16'h0AFF;
	#44; iDQ =1'b0;
	#98; iDi[15:0] =16'hZZZZ;
//- start of data burst ======================================
	#56;
	#414; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#868;
	# 28; bcRd =1'b1;
	# 84; cDK =1'b0;
//// =====================================================
	#280;


////-^^^^^^^^^^^^^^^^^^^^^^^^^
	#280;
//// ===================check for PS2 DMA Write to IDE
	#112; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'h0003; // write 0038(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0064;	cDPi[15:0] =16'h004E; // write 0064(004E)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////- ====set Multi-DMA mode 2
	#112; cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003; // write 0042(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0024; // write 0044(0024) MDMA - MODE 2
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF; // write 004E(00EF)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////// ====================================
	#112; cAPi[15:0] =16'h0032;	cDPi[15:0] =16'h0087; // write 0032(0087)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0001; // write 0044(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00CA; // write 004E(00CA)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0024;	cDPi[15:0] =16'h0006; // write 0024(0006)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0001; // write 002E(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0000; // write 002E(0000)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////-
#149;	iDQ =1'b1;		// say we starts to request now
//// At clock edge
#7; cDK =1'b1;
#70; bcWr =1'b0;
#7; cAPi[15:0] =16'h8001; cDPi[15:0] =16'h8000;
#28; cAPi[15:0] =16'h8003; cDPi[15:0] =16'h8002;
#28; cAPi[15:0] =16'h8005; cDPi[15:0] =16'h8004;
#28; cAPi[15:0] =16'h8007; cDPi[15:0] =16'h8006;
#28; cAPi[15:0] =16'h8009; cDPi[15:0] =16'h8008;
#28; cAPi[15:0] =16'h800B; cDPi[15:0] =16'h800A;
#28; cAPi[15:0] =16'h800D; cDPi[15:0] =16'h800C;
#28; cAPi[15:0] =16'h800F; cDPi[15:0] =16'h800E;
#28; cAPi[15:0] =16'h8011; cDPi[15:0] =16'h8010;
#28; cAPi[15:0] =16'h8013; cDPi[15:0] =16'h8012;
#28; cAPi[15:0] =16'h8015; cDPi[15:0] =16'h8014;
#28; cAPi[15:0] =16'h8017; cDPi[15:0] =16'h8016;
#28; cAPi[15:0] =16'h8019; cDPi[15:0] =16'h8018;
#28; cAPi[15:0] =16'h801B; cDPi[15:0] =16'h801A;
#28; cAPi[15:0] =16'h801D; cDPi[15:0] =16'h801C;
#28; cAPi[15:0] =16'h801F; cDPi[15:0] =16'h801E;
#28; cAPi[15:0] =16'h8021; cDPi[15:0] =16'h8020;
#28; cAPi[15:0] =16'h8023; cDPi[15:0] =16'h8022;
#28; cAPi[15:0] =16'h8025; cDPi[15:0] =16'h8024;
#28; cAPi[15:0] =16'h8027; cDPi[15:0] =16'h8026;
#28; cAPi[15:0] =16'h8029; cDPi[15:0] =16'h8028;
#28; cAPi[15:0] =16'h802B; cDPi[15:0] =16'h802A;
#28; cAPi[15:0] =16'h802D; cDPi[15:0] =16'h802C;
#28; cAPi[15:0] =16'h802F; cDPi[15:0] =16'h802E;
#28; cAPi[15:0] =16'h8031; cDPi[15:0] =16'h8030;
#28; cAPi[15:0] =16'h8033; cDPi[15:0] =16'h8032;
#28; cAPi[15:0] =16'h8035; cDPi[15:0] =16'h8034;
#28; cAPi[15:0] =16'h8037; cDPi[15:0] =16'h8036;
#28; cAPi[15:0] =16'h8039; cDPi[15:0] =16'h8038;
#28; cAPi[15:0] =16'h803B; cDPi[15:0] =16'h803A;
#28; cAPi[15:0] =16'h803D; cDPi[15:0] =16'h803C;
#28; cAPi[15:0] =16'h803F; cDPi[15:0] =16'h803E;
#21; bcWr =1'b1;
#7 ; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////- =================
#28;
#7; cDK =1'b1;
#70; bcWr =1'b0;
#7;  cAPi[15:0] =16'h8041; cDPi[15:0] =16'h8040;
#28; cAPi[15:0] =16'h8043; cDPi[15:0] =16'h8042;
#28; cAPi[15:0] =16'h8045; cDPi[15:0] =16'h8044;
#28; cAPi[15:0] =16'h8047; cDPi[15:0] =16'h8046;
#28; cAPi[15:0] =16'h8049; cDPi[15:0] =16'h8048;
#28; cAPi[15:0] =16'h804B; cDPi[15:0] =16'h804A;
#28; cAPi[15:0] =16'h804D; cDPi[15:0] =16'h804C;
#28; cAPi[15:0] =16'h804F; cDPi[15:0] =16'h804E;
#28; cAPi[15:0] =16'h8051; cDPi[15:0] =16'h8050;
#28; cAPi[15:0] =16'h8053; cDPi[15:0] =16'h8052;
#28; cAPi[15:0] =16'h8055; cDPi[15:0] =16'h8054;
#28; cAPi[15:0] =16'h8057; cDPi[15:0] =16'h8056;
#28; cAPi[15:0] =16'h8059; cDPi[15:0] =16'h8058;
#28; cAPi[15:0] =16'h805B; cDPi[15:0] =16'h805A;
#28; cAPi[15:0] =16'h805D; cDPi[15:0] =16'h805C;
#28; cAPi[15:0] =16'h805F; cDPi[15:0] =16'h805E;
#28; cAPi[15:0] =16'h8061; cDPi[15:0] =16'h8060;
#28; cAPi[15:0] =16'h8063; cDPi[15:0] =16'h8062;
#28; cAPi[15:0] =16'h8065; cDPi[15:0] =16'h8064;
#28; cAPi[15:0] =16'h8067; cDPi[15:0] =16'h8066;
#28; cAPi[15:0] =16'h8069; cDPi[15:0] =16'h8068;
#28; cAPi[15:0] =16'h806B; cDPi[15:0] =16'h806A;
#28; cAPi[15:0] =16'h806D; cDPi[15:0] =16'h806C;
#28; cAPi[15:0] =16'h806F; cDPi[15:0] =16'h806E;
#28; cAPi[15:0] =16'h8071; cDPi[15:0] =16'h8070;
#28; cAPi[15:0] =16'h8073; cDPi[15:0] =16'h8072;
#28; cAPi[15:0] =16'h8075; cDPi[15:0] =16'h8074;
#28; cAPi[15:0] =16'h8077; cDPi[15:0] =16'h8076;
#28; cAPi[15:0] =16'h8079; cDPi[15:0] =16'h8078;
#28; cAPi[15:0] =16'h807B; cDPi[15:0] =16'h807A;
#28; cAPi[15:0] =16'h807D; cDPi[15:0] =16'h807C;
#28; cAPi[15:0] =16'h807F; cDPi[15:0] =16'h807E;
#21; bcWr =1'b1;
#7 ; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////- =================
#28;
#7; cDK =1'b1;
#70; bcWr =1'b0;
#7; cAPi[15:0] =16'h8081; cDPi[15:0] =16'h8080;
#28; cAPi[15:0] =16'h8083; cDPi[15:0] =16'h8082;
#28; cAPi[15:0] =16'h8085; cDPi[15:0] =16'h8084;
#28; cAPi[15:0] =16'h8087; cDPi[15:0] =16'h8086;
#28; cAPi[15:0] =16'h8089; cDPi[15:0] =16'h8088;
#28; cAPi[15:0] =16'h808B; cDPi[15:0] =16'h808A;
#28; cAPi[15:0] =16'h808D; cDPi[15:0] =16'h808C;
#28; cAPi[15:0] =16'h808F; cDPi[15:0] =16'h808E;
#28; cAPi[15:0] =16'h8091; cDPi[15:0] =16'h8090;
#28; cAPi[15:0] =16'h8093; cDPi[15:0] =16'h8092;
#28; cAPi[15:0] =16'h8095; cDPi[15:0] =16'h8094;
#28; cAPi[15:0] =16'h8097; cDPi[15:0] =16'h8096;
#28; cAPi[15:0] =16'h8099; cDPi[15:0] =16'h8098;
#28; cAPi[15:0] =16'h809B; cDPi[15:0] =16'h809A;
#28; cAPi[15:0] =16'h809D; cDPi[15:0] =16'h809C;
#28; cAPi[15:0] =16'h809F; cDPi[15:0] =16'h809E;
#28; cAPi[15:0] =16'h80A1; cDPi[15:0] =16'h80A0;
#28; cAPi[15:0] =16'h80A3; cDPi[15:0] =16'h80A2;
#28; cAPi[15:0] =16'h80A5; cDPi[15:0] =16'h80A4;
#28; cAPi[15:0] =16'h80A7; cDPi[15:0] =16'h80A6;
#28; cAPi[15:0] =16'h80A9; cDPi[15:0] =16'h80A8;
#28; cAPi[15:0] =16'h80AB; cDPi[15:0] =16'h80AA;
#28; cAPi[15:0] =16'h80AD; cDPi[15:0] =16'h80AC;
#28; cAPi[15:0] =16'h80AF; cDPi[15:0] =16'h80AE;
#28; cAPi[15:0] =16'h80B1; cDPi[15:0] =16'h80B0;
#28; cAPi[15:0] =16'h80B3; cDPi[15:0] =16'h80B2;
#28; cAPi[15:0] =16'h80B5; cDPi[15:0] =16'h80B4;
#28; cAPi[15:0] =16'h80B7; cDPi[15:0] =16'h80B6;
#28; cAPi[15:0] =16'h80B9; cDPi[15:0] =16'h80B8;
#28; cAPi[15:0] =16'h80BB; cDPi[15:0] =16'h80BA;
#28; cAPi[15:0] =16'h80BD; cDPi[15:0] =16'h80BC;
#28; cAPi[15:0] =16'h80BF; cDPi[15:0] =16'h80BE;
#21; bcWr =1'b1;
#7 ; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////- =================
#28;
#7; cDK =1'b1;
#70; bcWr =1'b0;
#7; cAPi[15:0] =16'h80C1; cDPi[15:0] =16'h80C0;
#28; cAPi[15:0] =16'h80C3; cDPi[15:0] =16'h80C2;
#28; cAPi[15:0] =16'h80C5; cDPi[15:0] =16'h80C4;
#28; cAPi[15:0] =16'h80C7; cDPi[15:0] =16'h80C6;
#28; cAPi[15:0] =16'h80C9; cDPi[15:0] =16'h80C8;
#28; cAPi[15:0] =16'h80CB; cDPi[15:0] =16'h80CA;
#28; cAPi[15:0] =16'h80CD; cDPi[15:0] =16'h80CC;
#28; cAPi[15:0] =16'h80CF; cDPi[15:0] =16'h80CE;
#28; cAPi[15:0] =16'h80D1; cDPi[15:0] =16'h80D0;
#28; cAPi[15:0] =16'h80D3; cDPi[15:0] =16'h80D2;
#28; cAPi[15:0] =16'h80D5; cDPi[15:0] =16'h80D4;
#28; cAPi[15:0] =16'h80D7; cDPi[15:0] =16'h80D6;
#28; cAPi[15:0] =16'h80D9; cDPi[15:0] =16'h80D8;
#28; cAPi[15:0] =16'h80DB; cDPi[15:0] =16'h80DA;
#28; cAPi[15:0] =16'h80DD; cDPi[15:0] =16'h80DC;
#28; cAPi[15:0] =16'h80DF; cDPi[15:0] =16'h80DE;
#28; cAPi[15:0] =16'h80E1; cDPi[15:0] =16'h80E0;
#28; cAPi[15:0] =16'h80E3; cDPi[15:0] =16'h80E2;
#28; cAPi[15:0] =16'h80E5; cDPi[15:0] =16'h80E4;
#28; cAPi[15:0] =16'h80E7; cDPi[15:0] =16'h80E6;
#28; cAPi[15:0] =16'h80E9; cDPi[15:0] =16'h80E8;
#28; cAPi[15:0] =16'h80EB; cDPi[15:0] =16'h80EA;
#28; cAPi[15:0] =16'h80ED; cDPi[15:0] =16'h80EC;
#28; cAPi[15:0] =16'h80EF; cDPi[15:0] =16'h80EE;
#28; cAPi[15:0] =16'h80F1; cDPi[15:0] =16'h80F0;
#28; cAPi[15:0] =16'h80F3; cDPi[15:0] =16'h80F2;
#28; cAPi[15:0] =16'h80F5; cDPi[15:0] =16'h80F4;
#28; cAPi[15:0] =16'h80F7; cDPi[15:0] =16'h80F6;
#28; cAPi[15:0] =16'h80F9; cDPi[15:0] =16'h80F8;
#28; cAPi[15:0] =16'h80FB; cDPi[15:0] =16'h80FA;
#28; cAPi[15:0] =16'h80FD; cDPi[15:0] =16'h80FC;
#28; cAPi[15:0] =16'h80FF; cDPi[15:0] =16'h80FE;
#21; bcWr =1'b1;
#7 ; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////- =================
//- Second data burst
////- =================

#280;
#7; cDK =1'b1;
#70; bcWr =1'b0;
#7; cAPi[15:0] =16'h8101; cDPi[15:0] =16'h8100;
#28; cAPi[15:0] =16'h8103; cDPi[15:0] =16'h8102;
#28; cAPi[15:0] =16'h8105; cDPi[15:0] =16'h8104;
#28; cAPi[15:0] =16'h8107; cDPi[15:0] =16'h8106;
#28; cAPi[15:0] =16'h8109; cDPi[15:0] =16'h8108;
#28; cAPi[15:0] =16'h810B; cDPi[15:0] =16'h810A;
#28; cAPi[15:0] =16'h810D; cDPi[15:0] =16'h810C;
#28; cAPi[15:0] =16'h810F; cDPi[15:0] =16'h810E;
#28; cAPi[15:0] =16'h8111; cDPi[15:0] =16'h8110;
#28; cAPi[15:0] =16'h8113; cDPi[15:0] =16'h8112;
#28; cAPi[15:0] =16'h8115; cDPi[15:0] =16'h8114;
#28; cAPi[15:0] =16'h8117; cDPi[15:0] =16'h8116;
#28; cAPi[15:0] =16'h8119; cDPi[15:0] =16'h8118;
#28; cAPi[15:0] =16'h811B; cDPi[15:0] =16'h811A;
#28; cAPi[15:0] =16'h811D; cDPi[15:0] =16'h811C;
#28; cAPi[15:0] =16'h811F; cDPi[15:0] =16'h811E;
#28; cAPi[15:0] =16'h8121; cDPi[15:0] =16'h8120;
#28; cAPi[15:0] =16'h8123; cDPi[15:0] =16'h8122;
#28; cAPi[15:0] =16'h8125; cDPi[15:0] =16'h8124;
#28; cAPi[15:0] =16'h8127; cDPi[15:0] =16'h8126;
#28; cAPi[15:0] =16'h8129; cDPi[15:0] =16'h8128;
#28; cAPi[15:0] =16'h812B; cDPi[15:0] =16'h812A;
#28; cAPi[15:0] =16'h812D; cDPi[15:0] =16'h812C;
#28; cAPi[15:0] =16'h812F; cDPi[15:0] =16'h812E;
#28; cAPi[15:0] =16'h8131; cDPi[15:0] =16'h8130;
#28; cAPi[15:0] =16'h8133; cDPi[15:0] =16'h8132;
#28; cAPi[15:0] =16'h8135; cDPi[15:0] =16'h8134;
#28; cAPi[15:0] =16'h8137; cDPi[15:0] =16'h8136;
#28; cAPi[15:0] =16'h8139; cDPi[15:0] =16'h8138;
#28; cAPi[15:0] =16'h813B; cDPi[15:0] =16'h813A;
#28; cAPi[15:0] =16'h813D; cDPi[15:0] =16'h813C;
#28; cAPi[15:0] =16'h813F; cDPi[15:0] =16'h813E;
#21; bcWr =1'b1;
#7 ; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////- =================
#28;
#7; cDK =1'b1;
#70; bcWr =1'b0;
#7; cAPi[15:0] =16'h8141; cDPi[15:0] =16'h8140;
#28; cAPi[15:0] =16'h8143; cDPi[15:0] =16'h8142;
#28; cAPi[15:0] =16'h8145; cDPi[15:0] =16'h8144;
#28; cAPi[15:0] =16'h8147; cDPi[15:0] =16'h8146;
#28; cAPi[15:0] =16'h8149; cDPi[15:0] =16'h8148;
#28; cAPi[15:0] =16'h814B; cDPi[15:0] =16'h814A;
#28; cAPi[15:0] =16'h814D; cDPi[15:0] =16'h814C;
#28; cAPi[15:0] =16'h814F; cDPi[15:0] =16'h814E;
#28; cAPi[15:0] =16'h8151; cDPi[15:0] =16'h8150;
#28; cAPi[15:0] =16'h8153; cDPi[15:0] =16'h8152;
#28; cAPi[15:0] =16'h8155; cDPi[15:0] =16'h8154;
#28; cAPi[15:0] =16'h8157; cDPi[15:0] =16'h8156;
#28; cAPi[15:0] =16'h8159; cDPi[15:0] =16'h8158;
#28; cAPi[15:0] =16'h815B; cDPi[15:0] =16'h815A;
#28; cAPi[15:0] =16'h815D; cDPi[15:0] =16'h815C;
#28; cAPi[15:0] =16'h815F; cDPi[15:0] =16'h815E;
#28; cAPi[15:0] =16'h8161; cDPi[15:0] =16'h8160;
#28; cAPi[15:0] =16'h8163; cDPi[15:0] =16'h8162;
#28; cAPi[15:0] =16'h8165; cDPi[15:0] =16'h8164;
#28; cAPi[15:0] =16'h8167; cDPi[15:0] =16'h8166;
#28; cAPi[15:0] =16'h8169; cDPi[15:0] =16'h8168;
#28; cAPi[15:0] =16'h816B; cDPi[15:0] =16'h816A;
#28; cAPi[15:0] =16'h816D; cDPi[15:0] =16'h816C;
#28; cAPi[15:0] =16'h816F; cDPi[15:0] =16'h816E;
#28; cAPi[15:0] =16'h8171; cDPi[15:0] =16'h8170;
#28; cAPi[15:0] =16'h8173; cDPi[15:0] =16'h8172;
#28; cAPi[15:0] =16'h8175; cDPi[15:0] =16'h8174;
#28; cAPi[15:0] =16'h8177; cDPi[15:0] =16'h8176;
#28; cAPi[15:0] =16'h8179; cDPi[15:0] =16'h8178;
#28; cAPi[15:0] =16'h817B; cDPi[15:0] =16'h817A;
#28; cAPi[15:0] =16'h817D; cDPi[15:0] =16'h817C;
#28; cAPi[15:0] =16'h817F; cDPi[15:0] =16'h817E;
#21; bcWr =1'b1;
#7 ; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////- =================
#28;
#7; cDK =1'b1;
#70; bcWr =1'b0;
#7; cAPi[15:0] =16'h8181; cDPi[15:0] =16'h8180;
#28; cAPi[15:0] =16'h8183; cDPi[15:0] =16'h8182;
#28; cAPi[15:0] =16'h8185; cDPi[15:0] =16'h8184;
#28; cAPi[15:0] =16'h8187; cDPi[15:0] =16'h8186;
#28; cAPi[15:0] =16'h8189; cDPi[15:0] =16'h8188;
#28; cAPi[15:0] =16'h818B; cDPi[15:0] =16'h818A;
#28; cAPi[15:0] =16'h818D; cDPi[15:0] =16'h818C;
#28; cAPi[15:0] =16'h818F; cDPi[15:0] =16'h818E;
#28; cAPi[15:0] =16'h8191; cDPi[15:0] =16'h8190;
#28; cAPi[15:0] =16'h8193; cDPi[15:0] =16'h8192;
#28; cAPi[15:0] =16'h8195; cDPi[15:0] =16'h8194;
#28; cAPi[15:0] =16'h8197; cDPi[15:0] =16'h8196;
#28; cAPi[15:0] =16'h8199; cDPi[15:0] =16'h8198;
#28; cAPi[15:0] =16'h819B; cDPi[15:0] =16'h819A;
#28; cAPi[15:0] =16'h819D; cDPi[15:0] =16'h819C;
#28; cAPi[15:0] =16'h819F; cDPi[15:0] =16'h819E;
#28; cAPi[15:0] =16'h81A1; cDPi[15:0] =16'h81A0;
#28; cAPi[15:0] =16'h81A3; cDPi[15:0] =16'h81A2;
#28; cAPi[15:0] =16'h81A5; cDPi[15:0] =16'h81A4;
#28; cAPi[15:0] =16'h81A7; cDPi[15:0] =16'h81A6;
#28; cAPi[15:0] =16'h81A9; cDPi[15:0] =16'h81A8;
#28; cAPi[15:0] =16'h81AB; cDPi[15:0] =16'h81AA;
#28; cAPi[15:0] =16'h81AD; cDPi[15:0] =16'h81AC;
#28; cAPi[15:0] =16'h81AF; cDPi[15:0] =16'h81AE;
#28; cAPi[15:0] =16'h81B1; cDPi[15:0] =16'h81B0;
#28; cAPi[15:0] =16'h81B3; cDPi[15:0] =16'h81B2;
#28; cAPi[15:0] =16'h81B5; cDPi[15:0] =16'h81B4;
#28; cAPi[15:0] =16'h81B7; cDPi[15:0] =16'h81B6;
#28; cAPi[15:0] =16'h81B9; cDPi[15:0] =16'h81B8;
#28; cAPi[15:0] =16'h81BB; cDPi[15:0] =16'h81BA;
#28; cAPi[15:0] =16'h81BD; cDPi[15:0] =16'h81BC;
#28; cAPi[15:0] =16'h81BF; cDPi[15:0] =16'h81BE;
#21; bcWr =1'b1;
#7 ; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////- =================
#28;
#7; cDK =1'b1;
#70; bcWr =1'b0;
#7; cAPi[15:0] =16'h81C1; cDPi[15:0] =16'h81C0;
#28; cAPi[15:0] =16'h81C3; cDPi[15:0] =16'h81C2;
#28; cAPi[15:0] =16'h81C5; cDPi[15:0] =16'h81C4;
#28; cAPi[15:0] =16'h81C7; cDPi[15:0] =16'h81C6;
#28; cAPi[15:0] =16'h81C9; cDPi[15:0] =16'h81C8;
#28; cAPi[15:0] =16'h81CB; cDPi[15:0] =16'h81CA;
#28; cAPi[15:0] =16'h81CD; cDPi[15:0] =16'h81CC;
#28; cAPi[15:0] =16'h81CF; cDPi[15:0] =16'h81CE;
#28; cAPi[15:0] =16'h81D1; cDPi[15:0] =16'h81D0;
#28; cAPi[15:0] =16'h81D3; cDPi[15:0] =16'h81D2;
#28; cAPi[15:0] =16'h81D5; cDPi[15:0] =16'h81D4;
#28; cAPi[15:0] =16'h81D7; cDPi[15:0] =16'h81D6;
#28; cAPi[15:0] =16'h81D9; cDPi[15:0] =16'h81D8;
#28; cAPi[15:0] =16'h81DB; cDPi[15:0] =16'h81DA;
#28; cAPi[15:0] =16'h81DD; cDPi[15:0] =16'h81DC;
#28; cAPi[15:0] =16'h81DF; cDPi[15:0] =16'h81DE;
#28; cAPi[15:0] =16'h81E1; cDPi[15:0] =16'h81E0;
#28; cAPi[15:0] =16'h81E3; cDPi[15:0] =16'h81E2;
#28; cAPi[15:0] =16'h81E5; cDPi[15:0] =16'h81E4;
#28; cAPi[15:0] =16'h81E7; cDPi[15:0] =16'h81E6;
#28; cAPi[15:0] =16'h81E9; cDPi[15:0] =16'h81E8;
#28; cAPi[15:0] =16'h81EB; cDPi[15:0] =16'h81EA;
#28; cAPi[15:0] =16'h81ED; cDPi[15:0] =16'h81EC;
#28; cAPi[15:0] =16'h81EF; cDPi[15:0] =16'h81EE;
#28; cAPi[15:0] =16'h81F1; cDPi[15:0] =16'h81F0;
#28; cAPi[15:0] =16'h81F3; cDPi[15:0] =16'h81F2;
#28; cAPi[15:0] =16'h81F5; cDPi[15:0] =16'h81F4;
#28; cAPi[15:0] =16'h81F7; cDPi[15:0] =16'h81F6;
#28; cAPi[15:0] =16'h81F9; cDPi[15:0] =16'h81F8;
#28; cAPi[15:0] =16'h81FB; cDPi[15:0] =16'h81FA;
#28; cAPi[15:0] =16'h81FD; cDPi[15:0] =16'h81FC;
#28; cAPi[15:0] =16'h81FF; cDPi[15:0] =16'h81FE;
#21; bcWr =1'b1;
#7 ; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////- =================
#64512;

//- start DMA REQ process  Mode 2 =18 Clock2 for each DMA read (252 ns per pulse )
//////// =========one burst of PS2 DMA data ==================

//////////////-======the third burst
#280;
#7 ; cDK =1'b1;
#63; bcWr =1'b0;
#14; cAPi[15:0] =16'h8201; cDPi[15:0] =16'h8200;
#28; cAPi[15:0] =16'h8203; cDPi[15:0] =16'h8202;
#28; cAPi[15:0] =16'h8205; cDPi[15:0] =16'h8204;
#28; cAPi[15:0] =16'h8207; cDPi[15:0] =16'h8206;
#28; cAPi[15:0] =16'h8209; cDPi[15:0] =16'h8208;
#28; cAPi[15:0] =16'h820B; cDPi[15:0] =16'h820A;
#28; cAPi[15:0] =16'h820D; cDPi[15:0] =16'h820C;
#28; cAPi[15:0] =16'h820F; cDPi[15:0] =16'h820E;
#28; cAPi[15:0] =16'h8211; cDPi[15:0] =16'h8210;
#28; cAPi[15:0] =16'h8213; cDPi[15:0] =16'h8212;
#28; cAPi[15:0] =16'h8215; cDPi[15:0] =16'h8214;
#28; cAPi[15:0] =16'h8217; cDPi[15:0] =16'h8216;
#28; cAPi[15:0] =16'h8219; cDPi[15:0] =16'h8218;
#28; cAPi[15:0] =16'h821B; cDPi[15:0] =16'h821A;
#28; cAPi[15:0] =16'h821D; cDPi[15:0] =16'h821C;
#28; cAPi[15:0] =16'h821F; cDPi[15:0] =16'h821E;
#28; cAPi[15:0] =16'h8221; cDPi[15:0] =16'h8220;
#28; cAPi[15:0] =16'h8223; cDPi[15:0] =16'h8222;
#28; cAPi[15:0] =16'h8225; cDPi[15:0] =16'h8224;
#28; cAPi[15:0] =16'h8227; cDPi[15:0] =16'h8226;
#28; cAPi[15:0] =16'h8229; cDPi[15:0] =16'h8228;
#28; cAPi[15:0] =16'h822B; cDPi[15:0] =16'h822A;
#28; cAPi[15:0] =16'h822D; cDPi[15:0] =16'h822C;
#28; cAPi[15:0] =16'h822F; cDPi[15:0] =16'h822E;
#28; cAPi[15:0] =16'h8231; cDPi[15:0] =16'h8230;
#28; cAPi[15:0] =16'h8233; cDPi[15:0] =16'h8232;
#28; cAPi[15:0] =16'h8235; cDPi[15:0] =16'h8234;
#28; cAPi[15:0] =16'h8237; cDPi[15:0] =16'h8236;
#28; cAPi[15:0] =16'h8239; cDPi[15:0] =16'h8238;
#28; cAPi[15:0] =16'h823B; cDPi[15:0] =16'h823A;
#28; cAPi[15:0] =16'h823D; cDPi[15:0] =16'h823C;
#28; cAPi[15:0] =16'h823F; cDPi[15:0] =16'h823E;
#14; bcWr =1'b1;
#14; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;	////// now a complete cycle
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
//// ====
#28; cDK =1'b1;
#70; bcWr =1'b0;
#14; cAPi[15:0] =16'h8241; cDPi[15:0] =16'h8240;
#28; cAPi[15:0] =16'h8243; cDPi[15:0] =16'h8242;
#28; cAPi[15:0] =16'h8245; cDPi[15:0] =16'h8244;
#28; cAPi[15:0] =16'h8247; cDPi[15:0] =16'h8246;
#28; cAPi[15:0] =16'h8249; cDPi[15:0] =16'h8248;
#28; cAPi[15:0] =16'h824B; cDPi[15:0] =16'h824A;
#28; cAPi[15:0] =16'h824D; cDPi[15:0] =16'h824C;
#28; cAPi[15:0] =16'h824F; cDPi[15:0] =16'h824E;
#28; cAPi[15:0] =16'h8251; cDPi[15:0] =16'h8250;
#28; cAPi[15:0] =16'h8253; cDPi[15:0] =16'h8252;
#28; cAPi[15:0] =16'h8255; cDPi[15:0] =16'h8254;
#28; cAPi[15:0] =16'h8257; cDPi[15:0] =16'h8256;
#28; cAPi[15:0] =16'h8259; cDPi[15:0] =16'h8258;
#28; cAPi[15:0] =16'h825B; cDPi[15:0] =16'h825A;
#28; cAPi[15:0] =16'h825D; cDPi[15:0] =16'h825C;
#28; cAPi[15:0] =16'h825F; cDPi[15:0] =16'h825E;
#28; cAPi[15:0] =16'h8261; cDPi[15:0] =16'h8260;
#28; cAPi[15:0] =16'h8263; cDPi[15:0] =16'h8262;
#28; cAPi[15:0] =16'h8265; cDPi[15:0] =16'h8264;
#28; cAPi[15:0] =16'h8267; cDPi[15:0] =16'h8266;
#28; cAPi[15:0] =16'h8269; cDPi[15:0] =16'h8268;
#28; cAPi[15:0] =16'h826B; cDPi[15:0] =16'h826A;
#28; cAPi[15:0] =16'h826D; cDPi[15:0] =16'h826C;
#28; cAPi[15:0] =16'h826F; cDPi[15:0] =16'h826E;
#28; cAPi[15:0] =16'h8271; cDPi[15:0] =16'h8270;
#28; cAPi[15:0] =16'h8273; cDPi[15:0] =16'h8272;
#28; cAPi[15:0] =16'h8275; cDPi[15:0] =16'h8274;
#28; cAPi[15:0] =16'h8277; cDPi[15:0] =16'h8276;
#28; cAPi[15:0] =16'h8279; cDPi[15:0] =16'h8278;
#28; cAPi[15:0] =16'h827B; cDPi[15:0] =16'h827A;
#28; cAPi[15:0] =16'h827D; cDPi[15:0] =16'h827C;
#28; cAPi[15:0] =16'h827F; cDPi[15:0] =16'h827E;
#14; bcWr =1'b1;
#14; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;	////// now a complete cycle
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
//// =========
#28; cDK =1'b1;
#70; bcWr =1'b0;
#14; cAPi[15:0] =16'h8281; cDPi[15:0] =16'h8280;
#28; cAPi[15:0] =16'h8283; cDPi[15:0] =16'h8282;
#28; cAPi[15:0] =16'h8285; cDPi[15:0] =16'h8284;
#28; cAPi[15:0] =16'h8287; cDPi[15:0] =16'h8286;
#28; cAPi[15:0] =16'h8289; cDPi[15:0] =16'h8288;
#28; cAPi[15:0] =16'h828B; cDPi[15:0] =16'h828A;
#28; cAPi[15:0] =16'h828D; cDPi[15:0] =16'h828C;
#28; cAPi[15:0] =16'h828F; cDPi[15:0] =16'h828E;
#28; cAPi[15:0] =16'h8291; cDPi[15:0] =16'h8290;
#28; cAPi[15:0] =16'h8293; cDPi[15:0] =16'h8292;
#28; cAPi[15:0] =16'h8295; cDPi[15:0] =16'h8294;
#28; cAPi[15:0] =16'h8297; cDPi[15:0] =16'h8296;
#28; cAPi[15:0] =16'h8299; cDPi[15:0] =16'h8298;
#28; cAPi[15:0] =16'h829B; cDPi[15:0] =16'h829A;
#28; cAPi[15:0] =16'h829D; cDPi[15:0] =16'h829C;
#28; cAPi[15:0] =16'h829F; cDPi[15:0] =16'h829E;
#28; cAPi[15:0] =16'h82A1; cDPi[15:0] =16'h82A0;
#28; cAPi[15:0] =16'h82A3; cDPi[15:0] =16'h82A2;
#28; cAPi[15:0] =16'h82A5; cDPi[15:0] =16'h82A4;
#28; cAPi[15:0] =16'h82A7; cDPi[15:0] =16'h82A6;
#28; cAPi[15:0] =16'h82A9; cDPi[15:0] =16'h82A8;
#28; cAPi[15:0] =16'h82AB; cDPi[15:0] =16'h82AA;
#28; cAPi[15:0] =16'h82AD; cDPi[15:0] =16'h82AC;
#28; cAPi[15:0] =16'h82AF; cDPi[15:0] =16'h82AE;
#28; cAPi[15:0] =16'h82B1; cDPi[15:0] =16'h82B0;
#28; cAPi[15:0] =16'h82B3; cDPi[15:0] =16'h82B2;
#28; cAPi[15:0] =16'h82B5; cDPi[15:0] =16'h82B4;
#28; cAPi[15:0] =16'h82B7; cDPi[15:0] =16'h82B6;
#28; cAPi[15:0] =16'h82B9; cDPi[15:0] =16'h82B8;
#28; cAPi[15:0] =16'h82BB; cDPi[15:0] =16'h82BA;
#28; cAPi[15:0] =16'h82BD; cDPi[15:0] =16'h82BC;
#28; cAPi[15:0] =16'h82BF; cDPi[15:0] =16'h82BE;
#14; bcWr =1'b1;
#14; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;	////// now a complete cycle
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
//////=======
#28; cDK =1'b1;
#70; bcWr =1'b0;
#14; cAPi[15:0] =16'h82C1; cDPi[15:0] =16'h82C0;
#28; cAPi[15:0] =16'h82C3; cDPi[15:0] =16'h82C2;
#28; cAPi[15:0] =16'h82C5; cDPi[15:0] =16'h82C4;
#28; cAPi[15:0] =16'h82C7; cDPi[15:0] =16'h82C6;
#28; cAPi[15:0] =16'h82C9; cDPi[15:0] =16'h82C8;
#28; cAPi[15:0] =16'h82CB; cDPi[15:0] =16'h82CA;
#28; cAPi[15:0] =16'h82CD; cDPi[15:0] =16'h82CC;
#28; cAPi[15:0] =16'h82CF; cDPi[15:0] =16'h82CE;
#28; cAPi[15:0] =16'h82D1; cDPi[15:0] =16'h82D0;
#28; cAPi[15:0] =16'h82D3; cDPi[15:0] =16'h82D2;
#28; cAPi[15:0] =16'h82D5; cDPi[15:0] =16'h82D4;
#28; cAPi[15:0] =16'h82D7; cDPi[15:0] =16'h82D6;
#28; cAPi[15:0] =16'h82D9; cDPi[15:0] =16'h82D8;
#28; cAPi[15:0] =16'h82DB; cDPi[15:0] =16'h82DA;
#28; cAPi[15:0] =16'h82DD; cDPi[15:0] =16'h82DC;
#28; cAPi[15:0] =16'h82DF; cDPi[15:0] =16'h82DE;
#28; cAPi[15:0] =16'h82E1; cDPi[15:0] =16'h82E0;
#28; cAPi[15:0] =16'h82E3; cDPi[15:0] =16'h82E2;
#28; cAPi[15:0] =16'h82E5; cDPi[15:0] =16'h82E4;
#28; cAPi[15:0] =16'h82E7; cDPi[15:0] =16'h82E6;
#28; cAPi[15:0] =16'h82E9; cDPi[15:0] =16'h82E8;
#28; cAPi[15:0] =16'h82EB; cDPi[15:0] =16'h82EA;
#28; cAPi[15:0] =16'h82ED; cDPi[15:0] =16'h82EC;
#28; cAPi[15:0] =16'h82EF; cDPi[15:0] =16'h82EE;
#28; cAPi[15:0] =16'h82F1; cDPi[15:0] =16'h82F0;
#28; cAPi[15:0] =16'h82F3; cDPi[15:0] =16'h82F2;
#28; cAPi[15:0] =16'h82F5; cDPi[15:0] =16'h82F4;
#28; cAPi[15:0] =16'h82F7; cDPi[15:0] =16'h82F6;
#28; cAPi[15:0] =16'h82F9; cDPi[15:0] =16'h82F8;
#28; cAPi[15:0] =16'h82FB; cDPi[15:0] =16'h82FA;
#28; cAPi[15:0] =16'h82FD; cDPi[15:0] =16'h82FC;
#28; cAPi[15:0] =16'h82FF; cDPi[15:0] =16'h82FE;
#14; bcWr =1'b1;
#14; cAPi[15:0] =16'hZZZZ; cDPi[15:0] =16'hZZZZ;	////// now a complete cycle
#56;
#7 ; cDK =1'b0; #21;	////// now a complete cycle
#140;
////// =========
#16128; iDQ =1'b0;
#560; iDQ =1'b1;
#16128; iDQ =1'b0;		// 126ns(DMA cycle x 256 pulse)
#924;

////-^^^^^^^^^^^^^^^^^^^^^^^^^
//// ===================check for PS2 DMA Write to IDE
	#112; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'h0003; // write 0038(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0064;	cDPi[15:0] =16'h004F; // write 0064(004F)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////- ====set U-DMA mode 2
	#112; cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003; // write 0042(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0044; // write 0044(0044) UDMA-MODE2
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF; // write 004E(00EF)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////// ====================================
	#112; cAPi[15:0] =16'h0032;	cDPi[15:0] =16'h0086; // write 0032(0086)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0001; // write 0044(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00CA; // write 004E(00CA)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0024;	cDPi[15:0] =16'h0006; // write 0024(0006)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0001; // write 002E(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0000; // write 002E(0000)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
//////
	#504;	iDQ =1'b1; iRdy =1'b1;
	#80;
////// =======================
	#13;	iDi[15:0] =16'h414C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h4150;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h0000;	#13;	iRdy =1'b1;

	#26;	iDQ =1'b0;	iDi[15:0] =16'hZZZZ;
	#280;

	#21;



//- start of data burst ======================================
	#414; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;


	#280;

////-^^^^^^^^^^^^^^^^^^^^^^^^^
//// ===================check for PS2 DMA Write to IDE buffer full
	#112; cAPi[15:0] =16'h0038;	cDPi[15:0] =16'h0003; // write 0038(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0064;	cDPi[15:0] =16'h004E; // write 0064(004F)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////- ====set UDMA mode 2
	#112; cAPi[15:0] =16'h0042;	cDPi[15:0] =16'h0003; // write 0042(0003)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0044; // write 0044(0044) UDMA - MODE 2
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00EF; // write 004E(00EF)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////// ====================================
	#112; cAPi[15:0] =16'h0032;	cDPi[15:0] =16'h0086; // write 0032(0086)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0044;	cDPi[15:0] =16'h0001; // write 0044(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h004E;	cDPi[15:0] =16'h00CA; // write 004E(00CA)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h0024;	cDPi[15:0] =16'h0006; // write 0024(0006)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0001; // write 002E(0001)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
	#112; cAPi[15:0] =16'h002E;	cDPi[15:0] =16'h0000; // write 002E(0000)
	# 14; bcCS =1'b0;
	# 14; bcRd =1'b1; bcWr =1'b0;
	#196; bcRd =1'b1; bcWr =1'b1;
	# 14; bcCS =1'b1;
	# 14; cAPi[15:0] =16'hZZZZ;	cDPi[15:0] =16'hZZZZ;	iDi[15:0] =16'hZZZZ; // idle
////
	#504;	iDQ =1'b1; iRdy =1'b1;
	#80;


	#13;	iDi[15:0] =16'h9000;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9001;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9002;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9003;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9004;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9005;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9006;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9007;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9008;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9009;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h900A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h900B;	#13;	iRdy =1'b1;
	#26;	iDi[15:0] =16'hZZZZ;

	#26;	iDQ	=1'b0;		// terminate this transfer
	#280;
//// resume the transfer
	#56;	iDQ	=1'b1;
	#86;
	#13;	iDi[15:0] =16'h900C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h900D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h900E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h900F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9010;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9011;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9012;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9013;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9014;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9015;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9016;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9017;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9018;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9019;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h901A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h901B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h901C;	#13;	iRdy =1'b0;
	
	
	#26;	iDi[15:0] =16'hZZZZ;

	#26;	iDQ	=1'b0;		// terminate this transfer
	#86;	iRdy	=1'b1;		// raise the strobe
	#140;
//// resume the transfer
	#56;	iDQ	=1'b1;
	#86;
	#13;	iDi[15:0] =16'h901D;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h901E;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h901F;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9020;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9021;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9022;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9023;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9024;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9025;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9026;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9027;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9028;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9029;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h902A;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h902B;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h902C;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h902D;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h902E;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h902F;	#13;	iRdy =1'b0;


	#26;	iDi[15:0] =16'hZZZZ;

	#26;	iDQ	=1'b0;		// terminate this transfer
	#80;	iRdy	=1'b1;		// raise the strobe
	#140;
//// resume the transfer
	#56;	iDQ	=1'b1;
	#78;


	#13;	iDi[15:0] =16'h9030;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9031;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9032;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9033;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9034;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9035;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9036;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9037;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9038;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9039;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h903A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h903B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h903C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h903D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h903E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h903F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9040;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9041;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9042;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9043;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9044;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9045;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9046;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9047;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9048;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9049;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h904A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h904B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h904C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h904D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h904E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h904F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9050;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9051;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9052;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9053;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9054;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9055;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9056;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9057;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9058;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9059;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h905A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h905B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h905C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h905D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h905E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h905F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9060;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9061;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9062;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9063;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9064;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9065;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9066;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9067;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9068;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9069;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h906A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h906B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h906C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h906D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h906E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h906F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9070;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9071;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9072;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9073;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9074;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9075;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9076;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9077;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9078;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9079;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h907A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h907B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h907C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h907D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h907E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h907F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9080;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9081;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9082;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9083;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9084;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9085;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9086;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9087;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9088;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9089;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h908A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h908B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h908C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h908D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h908E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h908F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9090;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9091;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9092;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9093;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9094;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9095;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9096;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9097;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9098;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9099;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h909A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h909B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h909C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h909D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h909E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h909F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90A0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90A1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90A2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90A3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90A4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90A5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90A6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90A7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90A8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90A9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90AA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90AB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90AC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90AD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90AE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90AF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90B0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90B1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90B2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90B3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90B4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90B5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90B6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90B7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90B8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90B9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90BA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90BB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90BC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90BD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90BE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90BF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90C0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90C1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90C2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90C3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90C4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90C5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90C6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90C7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90C8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90C9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90CA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90CB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90CC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90CD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90CE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90CF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90D0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90D1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90D2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90D3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90D4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90D5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90D6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90D7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90D8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90D9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90DA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90DB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90DC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90DD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90DE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90DF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90E0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90E1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90E2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90E3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90E4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90E5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90E6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90E7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90E8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90E9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90EA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90EB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90EC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90ED;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90EE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90EF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90F0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90F1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90F2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90F3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90F4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90F5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90F6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90F7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90F8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90F9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90FA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90FB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90FC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90FD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h90FE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h90FF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9100;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9101;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9102;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9103;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9104;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9105;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9106;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9107;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9108;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9109;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h910A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h910B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h910C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h910D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h910E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h910F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9110;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9111;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9112;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9113;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9114;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9115;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9116;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9117;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9118;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9119;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h911A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h911B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h911C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h911D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h911E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h911F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9120;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9121;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9122;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9123;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9124;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9125;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9126;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9127;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9128;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9129;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h912A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h912B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h912C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h912D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h912E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h912F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9130;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9131;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9132;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9133;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9134;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9135;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9136;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9137;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9138;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9139;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h913A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h913B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h913C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h913D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h913E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h913F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9140;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9141;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9142;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9143;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9144;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9145;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9146;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9147;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9148;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9149;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h914A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h914B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h914C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h914D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h914E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h914F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9150;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9151;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9152;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9153;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9154;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9155;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9156;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9157;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9158;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9159;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h915A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h915B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h915C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h915D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h915E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h915F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9160;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9161;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9162;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9163;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9164;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9165;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9166;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9167;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9168;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9169;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h916A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h916B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h916C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h916D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h916E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h916F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9170;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9171;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9172;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9173;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9174;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9175;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9176;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9177;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9178;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9179;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h917A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h917B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h917C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h917D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h917E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h917F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9180;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9181;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9182;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9183;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9184;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9185;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9186;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9187;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9188;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9189;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h918A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h918B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h918C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h918D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h918E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h918F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9190;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9191;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9192;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9193;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9194;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9195;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9196;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9197;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9198;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9199;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h919A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h919B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h919C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h919D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h919E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h919F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91A0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91A1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91A2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91A3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91A4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91A5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91A6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91A7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91A8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91A9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91AA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91AB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91AC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91AD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91AE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91AF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91B0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91B1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91B2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91B3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91B4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91B5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91B6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91B7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91B8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91B9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91BA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91BB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91BC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91BD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91BE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91BF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91C0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91C1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91C2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91C3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91C4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91C5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91C6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91C7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91C8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91C9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91CA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91CB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91CC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91CD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91CE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91CF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91D0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91D1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91D2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91D3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91D4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91D5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91D6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91D7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91D8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91D9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91DA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91DB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91DC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91DD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91DE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91DF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91E0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91E1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91E2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91E3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91E4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91E5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91E6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91E7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91E8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91E9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91EA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91EB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91EC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91ED;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91EE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91EF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91F0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91F1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91F2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91F3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91F4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91F5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91F6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91F7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91F8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91F9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91FA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91FB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91FC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91FD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h91FE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h91FF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9200;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9201;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9202;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9203;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9204;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9205;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9206;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9207;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9208;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9209;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h920A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h920B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h920C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h920D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h920E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h920F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9210;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9211;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9212;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9213;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9214;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9215;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9216;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9217;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9218;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9219;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h921A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h921B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h921C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h921D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h921E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h921F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9220;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9221;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9222;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9223;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9224;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9225;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9226;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9227;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9228;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9229;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h922A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h922B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h922C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h922D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h922E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h922F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9230;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9231;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9232;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9233;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9234;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9235;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9236;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9237;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9238;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9239;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h923A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h923B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h923C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h923D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h923E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h923F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9240;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9241;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9242;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9243;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9244;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9245;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9246;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9247;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9248;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9249;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h924A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h924B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h924C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h924D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h924E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h924F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9250;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9251;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9252;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9253;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9254;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9255;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9256;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9257;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9258;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9259;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h925A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h925B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h925C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h925D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h925E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h925F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9260;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9261;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9262;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9263;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9264;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9265;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9266;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9267;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9268;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9269;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h926A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h926B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h926C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h926D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h926E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h926F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9270;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9271;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9272;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9273;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9274;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9275;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9276;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9277;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9278;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9279;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h927A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h927B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h927C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h927D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h927E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h927F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9280;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9281;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9282;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9283;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9284;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9285;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9286;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9287;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9288;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9289;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h928A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h928B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h928C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h928D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h928E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h928F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9290;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9291;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9292;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9293;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9294;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9295;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9296;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9297;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9298;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9299;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h929A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h929B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h929C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h929D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h929E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h929F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92A0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92A1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92A2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92A3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92A4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92A5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92A6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92A7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92A8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92A9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92AA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92AB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92AC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92AD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92AE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92AF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92B0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92B1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92B2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92B3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92B4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92B5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92B6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92B7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92B8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92B9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92BA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92BB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92BC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92BD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92BE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92BF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92C0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92C1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92C2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92C3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92C4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92C5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92C6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92C7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92C8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92C9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92CA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92CB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92CC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92CD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92CE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92CF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92D0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92D1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92D2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92D3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92D4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92D5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92D6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92D7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92D8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92D9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92DA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92DB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92DC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92DD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92DE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92DF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92E0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92E1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92E2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92E3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92E4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92E5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92E6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92E7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92E8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92E9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92EA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92EB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92EC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92ED;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92EE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92EF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92F0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92F1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92F2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92F3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92F4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92F5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92F6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92F7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92F8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92F9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92FA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92FB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92FC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92FD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h92FE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h92FF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9300;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9301;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9302;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9303;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9304;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9305;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9306;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9307;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9308;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9309;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h930A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h930B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h930C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h930D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h930E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h930F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9310;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9311;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9312;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9313;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9314;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9315;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9316;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9317;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9318;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9319;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h931A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h931B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h931C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h931D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h931E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h931F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9320;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9321;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9322;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9323;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9324;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9325;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9326;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9327;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9328;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9329;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h932A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h932B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h932C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h932D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h932E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h932F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9330;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9331;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9332;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9333;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9334;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9335;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9336;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9337;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9338;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9339;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h933A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h933B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h933C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h933D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h933E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h933F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9340;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9341;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9342;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9343;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9344;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9345;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9346;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9347;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9348;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9349;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h934A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h934B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h934C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h934D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h934E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h934F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9350;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9351;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9352;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9353;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9354;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9355;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9356;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9357;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9358;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9359;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h935A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h935B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h935C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h935D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h935E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h935F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9360;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9361;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9362;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9363;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9364;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9365;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9366;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9367;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9368;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9369;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h936A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h936B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h936C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h936D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h936E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h936F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9370;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9371;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9372;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9373;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9374;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9375;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9376;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9377;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9378;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9379;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h937A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h937B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h937C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h937D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h937E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h937F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9380;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9381;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9382;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9383;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9384;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9385;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9386;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9387;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9388;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9389;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h938A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h938B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h938C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h938D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h938E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h938F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9390;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9391;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9392;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9393;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9394;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9395;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9396;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9397;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9398;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9399;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h939A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h939B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h939C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h939D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h939E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h939F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93A0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93A1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93A2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93A3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93A4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93A5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93A6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93A7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93A8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93A9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93AA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93AB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93AC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93AD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93AE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93AF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93B0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93B1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93B2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93B3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93B4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93B5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93B6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93B7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93B8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93B9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93BA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93BB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93BC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93BD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93BE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93BF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93C0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93C1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93C2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93C3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93C4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93C5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93C6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93C7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93C8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93C9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93CA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93CB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93CC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93CD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93CE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93CF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93D0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93D1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93D2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93D3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93D4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93D5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93D6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93D7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93D8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93D9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93DA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93DB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93DC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93DD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93DE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93DF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93E0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93E1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93E2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93E3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93E4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93E5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93E6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93E7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93E8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93E9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93EA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93EB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93EC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93ED;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93EE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93EF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93F0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93F1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93F2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93F3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93F4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93F5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93F6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93F7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93F8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93F9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93FA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93FB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93FC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93FD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h93FE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h93FF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9400;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9401;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9402;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9403;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9404;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9405;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9406;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9407;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9408;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9409;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h940A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h940B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h940C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h940D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h940E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h940F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9410;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9411;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9412;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9413;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9414;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9415;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9416;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9417;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9418;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9419;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h941A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h941B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h941C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h941D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h941E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h941F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9420;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9421;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9422;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9423;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9424;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9425;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9426;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9427;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9428;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9429;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h942A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h942B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h942C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h942D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h942E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h942F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9430;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9431;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9432;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9433;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9434;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9435;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9436;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9437;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9438;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9439;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h943A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h943B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h943C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h943D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h943E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h943F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9440;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9441;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9442;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9443;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9444;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9445;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9446;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9447;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9448;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9449;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h944A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h944B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h944C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h944D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h944E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h944F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9450;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9451;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9452;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9453;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9454;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9455;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9456;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9457;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9458;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9459;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h945A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h945B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h945C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h945D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h945E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h945F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9460;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9461;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9462;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9463;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9464;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9465;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9466;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9467;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9468;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9469;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h946A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h946B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h946C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h946D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h946E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h946F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9470;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9471;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9472;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9473;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9474;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9475;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9476;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9477;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9478;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9479;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h947A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h947B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h947C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h947D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h947E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h947F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9480;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9481;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9482;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9483;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9484;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9485;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9486;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9487;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9488;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9489;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h948A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h948B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h948C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h948D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h948E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h948F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9490;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9491;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9492;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9493;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9494;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9495;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9496;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9497;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9498;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9499;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h949A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h949B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h949C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h949D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h949E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h949F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94A0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94A1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94A2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94A3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94A4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94A5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94A6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94A7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94A8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94A9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94AA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94AB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94AC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94AD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94AE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94AF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94B0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94B1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94B2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94B3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94B4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94B5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94B6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94B7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94B8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94B9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94BA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94BB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94BC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94BD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94BE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94BF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94C0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94C1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94C2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94C3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94C4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94C5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94C6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94C7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94C8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94C9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94CA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94CB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94CC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94CD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94CE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94CF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94D0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94D1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94D2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94D3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94D4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94D5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94D6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94D7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94D8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94D9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94DA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94DB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94DC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94DD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94DE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94DF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94E0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94E1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94E2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94E3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94E4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94E5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94E6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94E7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94E8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94E9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94EA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94EB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94EC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94ED;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94EE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94EF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94F0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94F1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94F2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94F3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94F4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94F5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94F6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94F7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94F8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94F9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94FA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94FB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94FC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94FD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h94FE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h94FF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9500;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9501;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9502;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9503;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9504;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9505;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9506;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9507;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9508;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9509;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h950A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h950B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h950C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h950D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h950E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h950F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9510;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9511;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9512;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9513;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9514;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9515;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9516;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9517;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9518;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9519;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h951A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h951B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h951C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h951D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h951E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h951F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9520;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9521;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9522;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9523;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9524;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9525;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9526;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9527;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9528;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9529;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h952A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h952B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h952C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h952D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h952E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h952F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9530;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9531;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9532;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9533;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9534;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9535;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9536;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9537;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9538;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9539;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h953A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h953B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h953C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h953D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h953E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h953F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9540;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9541;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9542;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9543;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9544;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9545;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9546;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9547;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9548;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9549;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h954A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h954B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h954C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h954D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h954E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h954F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9550;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9551;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9552;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9553;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9554;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9555;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9556;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9557;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9558;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9559;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h955A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h955B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h955C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h955D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h955E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h955F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9560;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9561;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9562;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9563;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9564;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9565;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9566;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9567;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9568;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9569;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h956A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h956B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h956C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h956D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h956E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h956F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9570;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9571;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9572;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9573;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9574;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9575;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9576;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9577;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9578;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9579;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h957A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h957B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h957C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h957D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h957E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h957F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9580;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9581;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9582;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9583;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9584;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9585;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9586;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9587;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9588;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9589;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h958A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h958B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h958C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h958D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h958E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h958F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9590;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9591;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9592;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9593;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9594;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9595;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9596;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9597;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9598;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9599;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h959A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h959B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h959C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h959D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h959E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h959F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95A0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95A1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95A2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95A3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95A4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95A5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95A6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95A7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95A8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95A9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95AA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95AB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95AC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95AD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95AE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95AF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95B0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95B1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95B2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95B3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95B4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95B5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95B6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95B7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95B8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95B9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95BA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95BB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95BC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95BD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95BE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95BF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95C0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95C1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95C2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95C3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95C4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95C5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95C6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95C7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95C8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95C9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95CA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95CB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95CC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95CD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95CE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95CF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95D0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95D1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95D2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95D3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95D4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95D5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95D6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95D7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95D8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95D9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95DA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95DB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95DC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95DD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95DE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95DF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95E0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95E1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95E2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95E3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95E4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95E5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95E6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95E7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95E8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95E9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95EA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95EB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95EC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95ED;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95EE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95EF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95F0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95F1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95F2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95F3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95F4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95F5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95F6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95F7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95F8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95F9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95FA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95FB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95FC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95FD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h95FE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h95FF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9600;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9601;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9602;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9603;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9604;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9605;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9606;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9607;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9608;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9609;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h960A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h960B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h960C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h960D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h960E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h960F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9610;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9611;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9612;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9613;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9614;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9615;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9616;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9617;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9618;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9619;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h961A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h961B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h961C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h961D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h961E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h961F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9620;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9621;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9622;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9623;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9624;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9625;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9626;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9627;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9628;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9629;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h962A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h962B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h962C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h962D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h962E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h962F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9630;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9631;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9632;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9633;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9634;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9635;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9636;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9637;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9638;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9639;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h963A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h963B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h963C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h963D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h963E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h963F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9640;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9641;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9642;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9643;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9644;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9645;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9646;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9647;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9648;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9649;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h964A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h964B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h964C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h964D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h964E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h964F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9650;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9651;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9652;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9653;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9654;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9655;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9656;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9657;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9658;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9659;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h965A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h965B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h965C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h965D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h965E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h965F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9660;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9661;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9662;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9663;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9664;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9665;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9666;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9667;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9668;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9669;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h966A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h966B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h966C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h966D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h966E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h966F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9670;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9671;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9672;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9673;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9674;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9675;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9676;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9677;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9678;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9679;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h967A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h967B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h967C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h967D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h967E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h967F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9680;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9681;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9682;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9683;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9684;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9685;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9686;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9687;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9688;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9689;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h968A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h968B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h968C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h968D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h968E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h968F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9690;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9691;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9692;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9693;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9694;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9695;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9696;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9697;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9698;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9699;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h969A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h969B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h969C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h969D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h969E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h969F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96A0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96A1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96A2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96A3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96A4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96A5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96A6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96A7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96A8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96A9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96AA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96AB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96AC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96AD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96AE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96AF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96B0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96B1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96B2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96B3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96B4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96B5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96B6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96B7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96B8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96B9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96BA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96BB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96BC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96BD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96BE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96BF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96C0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96C1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96C2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96C3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96C4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96C5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96C6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96C7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96C8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96C9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96CA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96CB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96CC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96CD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96CE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96CF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96D0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96D1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96D2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96D3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96D4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96D5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96D6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96D7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96D8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96D9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96DA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96DB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96DC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96DD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96DE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96DF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96E0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96E1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96E2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96E3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96E4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96E5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96E6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96E7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96E8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96E9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96EA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96EB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96EC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96ED;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96EE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96EF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96F0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96F1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96F2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96F3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96F4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96F5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96F6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96F7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96F8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96F9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96FA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96FB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96FC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96FD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h96FE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h96FF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9700;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9701;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9702;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9703;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9704;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9705;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9706;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9707;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9708;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9709;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h970A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h970B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h970C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h970D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h970E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h970F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9710;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9711;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9712;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9713;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9714;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9715;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9716;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9717;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9718;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9719;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h971A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h971B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h971C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h971D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h971E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h971F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9720;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9721;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9722;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9723;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9724;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9725;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9726;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9727;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9728;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9729;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h972A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h972B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h972C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h972D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h972E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h972F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9730;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9731;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9732;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9733;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9734;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9735;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9736;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9737;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9738;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9739;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h973A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h973B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h973C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h973D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h973E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h973F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9740;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9741;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9742;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9743;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9744;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9745;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9746;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9747;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9748;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9749;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h974A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h974B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h974C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h974D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h974E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h974F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9750;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9751;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9752;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9753;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9754;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9755;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9756;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9757;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9758;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9759;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h975A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h975B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h975C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h975D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h975E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h975F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9760;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9761;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9762;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9763;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9764;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9765;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9766;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9767;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9768;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9769;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h976A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h976B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h976C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h976D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h976E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h976F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9770;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9771;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9772;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9773;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9774;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9775;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9776;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9777;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9778;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9779;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h977A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h977B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h977C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h977D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h977E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h977F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9780;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9781;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9782;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9783;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9784;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9785;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9786;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9787;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9788;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9789;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h978A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h978B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h978C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h978D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h978E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h978F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9790;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9791;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9792;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9793;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9794;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9795;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9796;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9797;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h9798;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h9799;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h979A;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h979B;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h979C;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h979D;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h979E;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h979F;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97A0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97A1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97A2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97A3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97A4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97A5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97A6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97A7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97A8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97A9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97AA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97AB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97AC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97AD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97AE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97AF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97B0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97B1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97B2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97B3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97B4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97B5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97B6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97B7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97B8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97B9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97BA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97BB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97BC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97BD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97BE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97BF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97C0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97C1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97C2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97C3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97C4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97C5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97C6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97C7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97C8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97C9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97CA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97CB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97CC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97CD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97CE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97CF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97D0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97D1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97D2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97D3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97D4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97D5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97D6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97D7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97D8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97D9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97DA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97DB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97DC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97DD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97DE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97DF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97E0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97E1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97E2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97E3;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97E4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97E5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97E6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97E7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97E8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97E9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97EA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97EB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97EC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97ED;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97EE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97EF;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97F0;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97F1;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97F2;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97F3;	#13;	iRdy =1'b1;



//- start of data burst ======================================
	#14;
	
	#414; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;






	#13;	iDi[15:0] =16'h97F4;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97F5;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97F6;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97F7;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97F8;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97F9;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97FA;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97FB;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97FC;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97FD;	#13;	iRdy =1'b1;
	#13;	iDi[15:0] =16'h97FE;	#13;	iRdy =1'b0;
	#13;	iDi[15:0] =16'h97FF;	#13;	iRdy =1'b1;
	#28;	iDi[15:0] =16'hZZZZ;
	#56;	iDQ =1'b0;
	
//// ==============read memory blocks

	#414; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;
	#280; cDK =1'b1;	// start reading another DMA here
	# 14; bcRd =1'b0;	// the read pulse is 896 ns =75 + 504 +
	#896; bcRd =1'b1;
	# 70; cDK =1'b0;


	
	
	
//	end process tb;



//END;













	$finish;
	end
      
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:24 04/11/2010 
// Design Name: 
// Module Name:    TF_Stub 
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
module TF_Stub(
		input	RESET,
		input	CLK4,
// external bus
		inout TFD0,
		inout TFD1,
		inout TFD2,
		inout TFD3,
		output TF_CMD,
		output TF_CLK,
		input TF_SENSE
    );

//////

//// ================================
////////////////////////////////////////////////
// signals
// 25MHz output = 36.6 x 4 / 6 = 24 MHz approx
//////////////////////////////////////
reg TF_CLKSO;
reg [7:0] TF_COUNT;
wire TFD0i,TFD1i,TFD2i,TFD3i;
reg [3:0] TFDD;
wire TerminateCount;
wire FAST;		// select 25MHz or 400kHz output

////==========================================================

//  The ORIGINAL signal - if TF not install, then nothing happen
	assign TFD0	= (TF_SENSE == 1'b1) ? TFDD[0] : 1'bZ;
	assign TFD0i	= TFD0;
	assign TFD1	= (TF_SENSE == 1'b1) ? TFDD[1] : 1'bZ;
	assign TFD1i	= TFD1;
	assign TFD2	= (TF_SENSE == 1'b1) ? TFDD[2] : 1'bZ;
	assign TFD2i	= TFD2;
	assign TFD3	= (TF_SENSE == 1'b1) ? TFDD[3] : 1'bZ;
	assign TFD3i	= TFD3;
	assign TF_CLK	= (TF_SENSE == 1'b1) ? TF_CLKSO : 1'b0;		// do not drive the clock if nothing there
	assign TF_CMD	= (TF_SENSE == 1'b1) ? TFD0i ^ TFD1i ^ TFD2i ^ TFD3i : 1'b0;			// just stub output some dummy data

// ***************************************************
// Terminate Count either FAST (02 ) or (182 = 128 + 32 + 16 + 4 + 2)
	assign	FAST = TFD0i;
	assign	TerminateCount =	(FAST & TF_COUNT[1] & ~TF_COUNT[0] ) | 
										(TF_COUNT[7] & TF_COUNT[5] & TF_COUNT[4] & TF_COUNT[2] & TF_COUNT[1]);
always @(posedge CLK4)begin
if (RESET == 1'b1) begin
// ============================================================
	TF_COUNT		<= 2'b00;		// always clear
	TF_CLKSO		<= 1'b0;			// clock low
	TFDD			<= 4'b0000;
// ============================================================
end else begin
	TFDD	<= TFDD + 1;
// =========================================================
// 400kHz or 25MHz
// 25MHz output = 36.6 x 4 / 6 = 24.4 MHz approx == level change every 3 clocks
// 400kHz output = 36.6 x 4 / 366 = 400 kHz ( level changes every 183 clock )

	if (TerminateCount == 1'b1) begin
		TF_COUNT[7:0] 	<= 8'b0000_0000;		// reset the count
		TF_CLKSO			<= ~TF_CLKSO;	// negate the clock pulse
	end else begin
		TF_COUNT			<= TF_COUNT + 1;
	end
end //RESET
end

endmodule
`timescale 1ns / 1ps
module  Top(
	input				reset,
	input				clk4,
	input				IDE_CS,
	output			dna_pass,
	output [3:0]	KILL
);


wire [63:0] dna64bits;
wire dna_valid;

wire	SR_ena;

wire [9:0] addra;
wire [15:0] douta;

// constant holder for RAM implementation
// begin
//wire [15:0] dina;
//wire wea;
// end of constant holder

dna_p1 inst_ReadDNA(
	.ATV(~reset),				// Active and arm signal
   .CLK4(clk4),					// very fast clock
   .DNA_64(dna64bits),		// 64 bit DNA code with check bits
   .DNA_Valid(dna_valid)	// the code now is valid
);
	 
CheckDNA inst_CheckDNA (
	.clk4			(clk4),
	.reset		(reset),
	.DNA_64		(dna64bits),			// The DNA code
	.dna_valid	(dna_valid),

	.ROM_Data	(douta),					// ROM data
	.IDE_CS		(IDE_CS),				// chip select
	.DNA_ENA		(SR_ena),				// the enable signal to reduce power consumption
	.DNA_REG		(SR_reg),				// enable output register for faster RAM access
	.DNA_Addr	(addra),					// RAM address

	.dna_pass	(dna_pass),				// result of check
	.KILL			(KILL)						// Killing signals
);

// Inst as block ROM
// begin
RAM inst_RAM (
	.clka(clk4),
	.addra(addra),
	.ena(SR_ena),					// 1 serial register
	.regcea(SR_reg),
	.douta(douta));
// end of block ROM

// Inst as block RAM
// begin
//RAM inst_RAM (
//	.clka(clk4),
//	.ena(SR_ena),
//	.regcea(SR_reg),
//	.wea(wea), // Bus [0 : 0] 
//	.addra(addra), // Bus [9 : 0] 
//	.dina(douta), // Bus [15 : 0] 
//	.douta(douta)); // Bus [15 : 0] 

//assign dina = 16'b0000_0000_0000_0000;	// no dangling pins
//assign wea = 1'b0;				// no writing
// end of block RAM
endmodule			
			
			
			
			
			
		
		
		
		
	
