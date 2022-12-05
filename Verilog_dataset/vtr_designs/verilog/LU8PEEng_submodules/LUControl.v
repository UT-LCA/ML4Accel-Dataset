`define NWIDTH 6'b010100
`define BLOCKWIDTH 4'b0101
`define DDRWIDTH 7'b0100000
`define DDRNUMDQS 4'b0100
`define DDRSIZEWIDTH 6'b011000
`define BURSTLEN 3'b010
`define MEMCONWIDTH 8'b01000000
`define MEMCONNUMBYTES 5'b01000
`define RAMWIDTH 10'b0100000000
`define RAMNUMBYTES 7'b0100000
`define RAMSIZEWIDTH 4'b0101
`define TOPWIDTH 7'b0100000
`define rFIFOINPUTWIDTH 8'b01000000
`define wFIFOINPUTWIDTH 10'b0100000000
`define mFIFOWIDTH 6'b011100
`define aFIFOWIDTH 4'b0101
`define SIMULATION_MEMORY
`define BLOCKM 6'b010000
`define BLOCKN 6'b010000
`define BLOCKMDIVK 3'b010
`define MEMBLOCKM 5'b01000
`define MEMBLOCKN 5'b01000
`define NWIDTH 6'b010100
`define BLOCKWIDTH 4'b0101
`define DDRSIZEWIDTH 6'b011000
`define RAMSIZEWIDTH 4'b0101
`define START 1'b0 //0
`define SETUP 2'b01 //1
`define FIRST 3'b010 //2
`define MODE0_SETUP 3'b011 //3
`define MODE0_WAIT 4'b0100 //4
`define MODE0 4'b0101 //5
`define MODE1_SETUP 4'b0110 //6
`define MODE1_WAIT 4'b0111 //7
`define MODE1 5'b01000 //8
`define MODE2_SETUP 5'b01001 //9
`define MODE2_WAIT 5'b01010 //10
`define MODE2 5'b01011 //11
`define MODE3_SETUP 5'b01100 //12
`define MODE3_WAIT 5'b01101 //13
`define MODE3 5'b01110 //14
`define STALL 5'b01111 //15
`define STALL_WAIT 6'b010000 //16
`define WAIT 6'b010001 //17
`define FINAL_WRITE 6'b010010 //18
`define FINAL_WAIT 6'b010011 //19
`define IDLE 6'b010100 //20
`define LAST_SETUP 6'b010101 //21
`define LAST_SETUP_WAIT 6'b010110 //22
`define LAST 6'b010111 //23
`define LAST_WAIT 6'b011000 //24
`define MEM_IDLE 1'b0 //0
`define MEM_WRITE 2'b01 //1
`define MEM_WRITE_WAIT 3'b010 //2
`define MEM_CHECK_DONE 3'b011 //3
`define MEM_READ 4'b0100 //4
`define MEM_READ_WAIT 4'b0101 //5
`define MEM_DONE 4'b0110 //6
`define MEM_WAIT_DONE 4'b0111 //7
`define rRAMSIZEWIDTH 5
`define cSETUP 4'b0000
`define cSTART 4'b0001
`define cFETCH_COL 4'b0010
`define cWAIT_COL 4'b0011
`define cFIND_REC 4'b0100
`define cMULT_COL 4'b0101
`define cUPDATE_J 4'b0110
`define cSTORE_MO 4'b0111
`define cMULT_SUB 4'b1000
`define cINCRE_I 4'b1001
`define cWAIT 4'b1010
`define cDONE 4'b1011
`define cSTORE_DIAG 4'b1100
`define cSTORE_DIAG2 4'b1101
`define cSTART_FETCH_ROW 4'b1110
`define cROW_WAIT 2'b00
`define cFETCH_ROW 2'b01
`define cDONE_FETCH_ROW 2'b10
`define cLOAD_ROW_INC_J 2'b11
`define PRECISION 7'b0100000
`define NUMPE 5'b01000
`define PEWIDTH 3'b011
`define BLOCKWIDTH 4'b0101
`define RAMWIDTH 10'b0100000000
`define RAMNUMBYTES 7'b0100000
`define RAMSIZEWIDTH 4'b0101
`define TOPSIZEWIDTH 5'b01000
`define TOPINPUTDELAY 3'b011
`define TOPOUTPUTDELAY 2'b01
`define MEMINPUTDELAY 3'b010
`define MEMOUTPUTDELAY 2'b01
`define TOPWIDTH 7'b0100000
//`define rFIFOINPUTWIDTH 64
`define rFIFOSIZE 64
`define rFIFOSIZEWIDTH 6
`define rFIFOOUTPUTWIDTH 256
`define rFIFORSIZEWIDTH 4
	`define wFIFOINPUTWIDTH 10'b0100000000
	`define wFIFOSIZE 6'b010000
	`define wFIFOSIZEWIDTH 4'b0100
	`define wFIFOOUTPUTWIDTH 8'b01000000
	`define wFIFORSIZEWIDTH 4'b0110
`define aFIFOSIZE 6'b010000
`define aFIFOSIZEWIDTH 4'b0100
`define aFIFOWIDTH 4'b0101
`define mFIFOSIZE 16
`define mFIFOSIZEWIDTH 4
//`define mFIFOWIDTH 28
`define BURSTLEN 3'b010
`define BURSTWIDTH 3'b010
`define DATAWIDTH 10'b0100000000
`define DATANUMBYTES 7'b0100000
`define MEMCONWIDTH 8'b01000000
`define MEMCONNUMBYTES 5'b01000
`define DDRSIZEWIDTH 6'b011000
`define FIFOSIZE 6'b010000
`define FIFOSIZEWIDTH 4'b0100
`define RAMWIDTH 10'b0100000000
`define RAMNUMBYTES 7'b0100000
`define RAMSIZEWIDTH 4'b0101
`define RATIO 4'b0100
`define RAMLAT 4'b0101
`define dIDLE 0
`define dWRITE 1
`define dREAD 2
`define ZERO        8'b00000000  
`define ONE         8'b00000001  
`define TWO         8'b00000010  
`define THREE 		  8'b00000011  
`define FOUR		  8'b00000100  
`define FIVE		  8'b00000101  
`define SIX         8'b00000110  
`define SEVEN       8'b00000111  
`define EIGHT       8'b00001000  
`define NINE        8'b00001001  
`define TEN         8'b00001010  
`define ELEVEN      8'b00001011  
`define TWELVE      8'b00001100  
`define THIRTEEN    8'b00001101  
`define FOURTEEN    8'b00001110  
`define FIFTEEN     8'b00001111  
`define SIXTEEN     8'b00010000  
`define SEVENTEEN   8'b00010001  
`define EIGHTEEN	  8'b00010010  
`define NINETEEN    8'b00010011  
`define TWENTY		  8'b00010100  
`define TWENTYONE   8'b00010101  
`define TWENTYTWO   8'b00010110  
`define TWENTYTHREE 8'b00010111  
`define TWENTYFOUR  8'b00011000  
`define WEXP	8  
`define WSIG	23  
`define WFLAG	5  
`define WCONTROL 5  
`define DIVZERO 	0  
`define INVALID 	1  
`define INEXACT 	2  
`define OVERFLOW 	3  
`define UNDERFLOW	4  
`define WIDTH 		32 	//(`WEXP + `WSIG + 1)  
`define PRODWIDTH	48 	//(2 * (`WSIG + 1))  
`define SHIFTWIDTH	96 	//(2 * `PRODWIDTH))  
`define WPRENORM	24	// `WSIG + 1  
`define WEXPSUM		10	// `WEXP + 2  
`define BIAS		127	// (2^(`WEXP)) - 1  
`define WSIGMINUS1	22	// `WSIG - 1, used for rounding  
`define WSHIFTAMT	5	// log2(`WSIG + 1) rounded up  
`define UNDERBIAS	192	// 3 * 2 ^ (`WEXP -2)  
`define OVERBIAS	-192	// -`UNDERBIAS  
`define	EXTRASIG	25		// `WSIG+2 this is the amount of precision needed so no  
`define	SHIFT		5		// # bits the max alignment shift will fit in (log2(`WSIG+2)  
`define	MAX_EXP		8'b11111110	// the maximum non-infinite exponent,  
`define	INF_EXP		8'b11111111	// Infinity exponent, `WEXP bits, all 1  
`define	MAX_SIG		23'b11111111111111111111111  
`define	WEXP_0		8'b0		// Exponent equals `WEXP'b0  
`define	WEXP_1		8'b1		// Exponent equals one `WEXP'b1  
`define	WSIG_0		23'b0		// Significand equals zero `WSIG'b0  
`define	WSIG_1		23'b1		// Significand equals one `WSIG'b1  
`define	EXTRASIG_0	25'b0		// All result bits for adder zero `EXTRASIG'b0  
`define	MAXSHIFT	24		// `WSIG + 1  
`define CONSTNAN	{9'b111111111,22'b0}  
`define CONSTZERO	31'b0  
`define CONSTINFINITY	{8'b11111111, 23'b0}  
`define CONSTLARGEST	{`MAX_EXP, `MAX_SIG}  
`define PRESHIFTZEROS  48'b0 // `PRODWIDTH'b0  

module LUControl (clk, start_in, m_in, n_in, loop_in, mode_in, done,
					curReadAddr, curWriteAddr, curWriteByteEn, curWriteEn, curWriteSel, 
					leftReadAddr, leftWriteAddr, leftWriteByteEn, leftWriteEn,  leftWriteSel,
					topReadAddr, topWriteAddr, topWriteEn, topWriteSel, topSourceSel, diagEn, MOSel, MOEn);

input clk, start_in;
input[5-1:0] m_in, n_in, loop_in;
input[1:0] mode_in;
output done;

output[32-1:0] curWriteByteEn;
output[5-1:0] curWriteAddr, curReadAddr;
output curWriteEn;

output[32-1:0] leftWriteByteEn;
output[5-1:0] leftWriteAddr, leftReadAddr;
output leftWriteEn;

output[8-1:0] topWriteAddr, topReadAddr;
output topWriteEn;

output leftWriteSel, curWriteSel, topSourceSel, diagEn;
output[3-1:0] topWriteSel;

output MOSel;
output MOEn;

reg start;
reg[15:0]startDelay;
reg[5-1:0] m, n, stop, stop2, loop;
reg[1:0] mode;
reg[3:0] nextState, currentState;
reg[1:0] nextRowState, currentRowState;
reg startFetchRow, doneFetchRow, loadRow, writeRow;
reg updateCounter;

reg[5-1:0] i1, j;
reg[8-1:0] nextTopIdx, nextTopIdx2, curTopIdx, nextTopIdxCounter;
reg[2-1:0] topIdx, topIdxCounter, mdivk;
reg[5-1:0] diagIdx, leftIdx, msIdx;
reg[3-1:0] imodk, i1modk;
reg[5-1:0] diagIdxCounter, leftIdxCounter, msIdxCounter, readRowCounter, topWriteCounter;
reg[32-1:0] byteEn, i1modkByteEn;

reg done;

reg[32-1:0] curWriteByteEn;
reg[5-1:0] curWriteAddr, curReadAddr;
reg curWriteEn;

reg[32-1:0] leftWriteByteEn;
reg[5-1:0] leftWriteAddr, leftReadAddr;
reg leftWriteEn;

reg[8-1:0] topWriteAddr, topReadAddr;
reg topWriteEn;

reg leftWriteSel, curWriteSel, topSourceSel, diagEn;
reg[3-1:0] topWriteSel;

reg MOSel;
reg MOEn;

reg[5-1:0] counter;
reg[6-1:0] divCounter;

reg[32-1:0]writeByteEnDelay0; 
reg[32-1:0]writeByteEnDelay1; 
reg[32-1:0]writeByteEnDelay2; 
reg[32-1:0]writeByteEnDelay3; 
reg[32-1:0]writeByteEnDelay4; 
reg[32-1:0]writeByteEnDelay5; 
reg[32-1:0]writeByteEnDelay6; 
reg[32-1:0]writeByteEnDelay7; 
reg[32-1:0]writeByteEnDelay8; 
reg[32-1:0]writeByteEnDelay9; 
reg[32-1:0]writeByteEnDelay10; 
reg[32-1:0]writeByteEnDelay11; 
reg[32-1:0]writeByteEnDelay12; 
reg[32-1:0]writeByteEnDelay13; 
reg[32-1:0]writeByteEnDelay14; 
reg[32-1:0]writeByteEnDelay15; 
reg[32-1:0]writeByteEnDelay16; 
reg[32-1:0]writeByteEnDelay17; 
reg[32-1:0]writeByteEnDelay18; 
reg[32-1:0]writeByteEnDelay19; 
reg[32-1:0]writeByteEnDelay20; 
reg[32-1:0]writeByteEnDelay21; 
reg[32-1:0]writeByteEnDelay22; 
reg[32-1:0]writeByteEnDelay23; 
reg[32-1:0]writeByteEnDelay24; 
reg[32-1:0]writeByteEnDelay25; 
reg[32-1:0]writeByteEnDelay26; 
reg[32-1:0]writeByteEnDelay27; 
reg[32-1:0]writeByteEnDelay28; 
reg[32-1:0]writeByteEnDelay29; 
reg[32-1:0]writeByteEnDelay30; 
reg[32-1:0]writeByteEnDelay31; 

reg[5-1:0]curWriteAddrDelay0; 
reg[5-1:0]curWriteAddrDelay1; 
reg[5-1:0]curWriteAddrDelay2; 
reg[5-1:0]curWriteAddrDelay3; 
reg[5-1:0]curWriteAddrDelay4; 
reg[5-1:0]curWriteAddrDelay5; 
reg[5-1:0]curWriteAddrDelay6; 
reg[5-1:0]curWriteAddrDelay7; 
reg[5-1:0]curWriteAddrDelay8; 
reg[5-1:0]curWriteAddrDelay9; 
reg[5-1:0]curWriteAddrDelay10; 
reg[5-1:0]curWriteAddrDelay11; 
reg[5-1:0]curWriteAddrDelay12; 
reg[5-1:0]curWriteAddrDelay13; 
reg[5-1:0]curWriteAddrDelay14; 
reg[5-1:0]curWriteAddrDelay15; 
reg[5-1:0]curWriteAddrDelay16; 
reg[5-1:0]curWriteAddrDelay17; 
reg[5-1:0]curWriteAddrDelay18; 
reg[5-1:0]curWriteAddrDelay19; 
reg[5-1:0]curWriteAddrDelay20; 
reg[5-1:0]curWriteAddrDelay21; 
reg[5-1:0]curWriteAddrDelay22; 
reg[5-1:0]curWriteAddrDelay23; 
reg[5-1:0]curWriteAddrDelay24; 
reg[5-1:0]curWriteAddrDelay25; 
reg[5-1:0]curWriteAddrDelay26; 
reg[5-1:0]curWriteAddrDelay27; 
reg[5-1:0]curWriteAddrDelay28; 
reg[5-1:0]curWriteAddrDelay29; 
reg[5-1:0]curWriteAddrDelay30; 
reg[5-1:0]curWriteAddrDelay31; 

reg[5-1:0]curReadAddrDelay0; 
reg[5-1:0]curReadAddrDelay1; 
reg[5-1:0]curReadAddrDelay2; 
reg[5-1:0]curReadAddrDelay3; 
reg[5-1:0]curReadAddrDelay4; 
reg[5-1:0]curReadAddrDelay5; 
reg[5-1:0]curReadAddrDelay6; 
reg[5-1:0]curReadAddrDelay7; 
reg[5-1:0]curReadAddrDelay8; 
reg[5-1:0]curReadAddrDelay9; 
reg[5-1:0]curReadAddrDelay10; 
reg[5-1:0]curReadAddrDelay11; 

reg[32-1:0]leftWriteEnDelay; 
reg[32-1:0]curWriteEnDelay; 
reg[5-1:0]leftWriteSelDelay; 
reg[16-1:0]curWriteSelDelay; 
reg[5-1:0]leftReadAddrDelay0; 
reg[8-1:0]topWriteAddrDelay0; 
reg[8-1:0]topWriteAddrDelay1; 
reg[8-1:0]topWriteAddrDelay2; 
reg[8-1:0]topWriteAddrDelay3; 
reg[8-1:0]topWriteAddrDelay4; 
reg[8-1:0]topWriteAddrDelay5; 
reg[8-1:0]topWriteAddrDelay6; 
reg[8-1:0]topWriteAddrDelay7; 
reg[8-1:0]topWriteAddrDelay8; 
reg[8-1:0]topWriteAddrDelay9; 
reg[8-1:0]topWriteAddrDelay10; 
reg[8-1:0]topWriteAddrDelay11; 
reg[8-1:0]topWriteAddrDelay12; 
reg[8-1:0]topWriteAddrDelay13; 
reg[8-1:0]topWriteAddrDelay14; 
reg[8-1:0]topWriteAddrDelay15; 
reg[8-1:0]topWriteAddrDelay16; 
reg[8-1:0]topWriteAddrDelay17; 
reg[8-1:0]topWriteAddrDelay18; 
reg[8-1:0]topWriteAddrDelay19; 
reg[8-1:0]topWriteAddrDelay20; 
reg[8-1:0]topWriteAddrDelay21; 
reg[8-1:0]topWriteAddrDelay22; 
reg[8-1:0]topWriteAddrDelay23; 
reg[8-1:0]topWriteAddrDelay24; 
reg[8-1:0]topWriteAddrDelay25; 
reg[8-1:0]topWriteAddrDelay26; 
reg[8-1:0]topWriteAddrDelay27; 
reg[8-1:0]topWriteAddrDelay28; 
reg[8-1:0]topWriteAddrDelay29; 
reg[8-1:0]topWriteAddrDelay30; 
reg[8-1:0]topWriteAddrDelay31; 

reg [32-1:0]topWriteEnDelay;
reg [5-1:0]topSourceSelDelay;
reg[3-1:0]topWriteSelDelay0; 
reg[3-1:0]topWriteSelDelay1; 
reg[3-1:0]topWriteSelDelay2; 
reg[3-1:0]topWriteSelDelay3; 
reg[3-1:0]topWriteSelDelay4; 
reg[3-1:0]topWriteSelDelay5; 
reg[3-1:0]topWriteSelDelay6; 
reg[3-1:0]topWriteSelDelay7; 
reg[3-1:0]topWriteSelDelay8; 
reg[3-1:0]topWriteSelDelay9; 
reg[3-1:0]topWriteSelDelay10; 
reg[3-1:0]topWriteSelDelay11; 
reg[3-1:0]topWriteSelDelay12; 
reg[3-1:0]topWriteSelDelay13; 
reg[3-1:0]topWriteSelDelay14; 
reg[3-1:0]topWriteSelDelay15; 
reg[3-1:0]topWriteSelDelay16; 
reg[3-1:0]topWriteSelDelay17; 
reg[3-1:0]topWriteSelDelay18; 
reg[3-1:0]topWriteSelDelay19; 
reg[3-1:0]topWriteSelDelay20; 
reg[3-1:0]topWriteSelDelay21; 
reg[3-1:0]topWriteSelDelay22; 
reg[3-1:0]topWriteSelDelay23; 
reg[3-1:0]topWriteSelDelay24; 
reg[3-1:0]topWriteSelDelay25; 
reg[3-1:0]topWriteSelDelay26; 
reg[3-1:0]topWriteSelDelay27; 
reg[3-1:0]topWriteSelDelay28; 
reg[3-1:0]topWriteSelDelay29; 
reg[3-1:0]topWriteSelDelay30; 
reg[3-1:0]topWriteSelDelay31; 

reg [6-1:0]diagEnDelay;
reg[6-1:0]MOEnDelay;
reg [5-1:0]waitCycles;

// register store m, n and mdivk value
always @ (posedge clk)
begin
	if (start_in == 1'b1)
	begin
		n <= n_in;
		m <= m_in;
		loop <= loop_in;
		mode <= mode_in;
	end
	if (mode[0] == 1'b0 && m == loop)
		stop <= loop;
	else
		stop <= loop+1'b1;
	stop2 <= loop;
	startDelay[0] <= start_in;
	startDelay[1] <= startDelay[0];
	startDelay[2] <= startDelay[1];
	startDelay[3] <= startDelay[2];
	startDelay[4] <= startDelay[3];
	startDelay[5] <= startDelay[4];
	startDelay[6] <= startDelay[5];
	startDelay[7] <= startDelay[6];
	startDelay[8] <= startDelay[7];
	startDelay[9] <= startDelay[8];
	startDelay[10] <= startDelay[9];
	startDelay[11] <= startDelay[10];
	startDelay[12] <= startDelay[11];
	startDelay[13] <= startDelay[12];
	startDelay[14] <= startDelay[13];
	startDelay[15] <= startDelay[14];
	start <= startDelay[15];
	mdivk <= (m+8-1)>>3;
end

// registers that store values that are used in FSM, dependent on i and/or j
always @ (posedge clk)
begin
	if (start == 1'b1)
		topIdx <= 2'b00; //offset1divk;
	else if (currentState == `cINCRE_I && i1modk == 8-1 && mode[0] == 1'b0)
		topIdx <= topIdx + 1'b1;
		
	if (start == 1'b1)
		diagIdx <= 5'b00000;
	else if (currentState == `cSTORE_DIAG && mode == 2'b01)
		diagIdx <= 2;	else if (currentState == `cINCRE_I)
	begin
		if ((imodk == 8-1 && mode == 2'b00) || (i1modk == 8-1 && mode == 2'b01))
			diagIdx <= diagIdx + 2 + 1;
		else
			diagIdx <= diagIdx + 2;
	end
	
	if (start == 1'b1)
		leftIdx <= 5'b00000;
	else if (currentState == `cINCRE_I)
	begin
		if (i1modk == 8-1 && mode[0] == 1'b0)
			leftIdx <= leftIdx + 2 + 1;
		else
			leftIdx <= leftIdx + 2;
	end

	if (start == 1'b1)
		msIdx <= 5'b00000;
	else if (currentState == `cUPDATE_J)
		if (mode[1] == 1'b0)
			msIdx <= leftIdx + 2;
		else
			msIdx <= topIdx;
	else if (nextRowState == `cLOAD_ROW_INC_J)
		msIdx <= msIdx + 2;

	if (start == 1'b1)
		imodk <= 3'b000;
	else if (currentState == `cINCRE_I)
	begin
		if (imodk == 8-1)
		imodk <= 3'b000;
		else
			imodk <= imodk + 1'b1;
	end
	
	if (start == 1'b1)
		i1modk <= 3'b001;
	else if (currentState == `cINCRE_I)
	begin
		if (i1modk == 8-1)
		i1modk <= 3'b000;
		else
			i1modk <= i1modk + 1'b1;
	end
	
	if (start == 1'b1)
		nextTopIdx <= 8'b00000000;
	else if (currentState == `cINCRE_I)
		if (mode[1] == 0)
			nextTopIdx <= nextTopIdx + n + 1;
		else
			nextTopIdx <= nextTopIdx + n;
 nextTopIdx2 <= nextTopIdx + n + 1;

	if (start == 1'b1)
		curTopIdx <= 8'b00000001;
	else if (currentState == `cUPDATE_J)
   if (mode[1] == 1'b0)
		  curTopIdx <= nextTopIdx+1;
   else
		  curTopIdx <= nextTopIdx;
	else if (nextRowState == `cLOAD_ROW_INC_J)
		curTopIdx <= curTopIdx + 1;
	
	if (start == 1'b1)
		i1 <= 5'b00001;
	else if (currentState == `cINCRE_I)
	   i1 <= i1 + 1;

	if (start == 1'b1)
		j <= 5'b00000;
	else if (currentState == `cUPDATE_J)
		if (mode[1] == 1'b0)
			j <= i1;
		else
		j <= 5'b00000;
	else if (currentRowState == `cLOAD_ROW_INC_J)
		j <= j + 1;

// compute cycles of delay in FSM
	if (currentState == `cSTORE_MO)
		waitCycles <= 32-1;
	else if (currentState == `cINCRE_I)
	begin
		if (i1 == stop-1)
			if (mode[1] == 1'b1)
				waitCycles <= 32-1 + 6 - 3;
			else
				waitCycles <= waitCycles + 5 - 2;
		else if (mode == 2'b01 && waitCycles < 32-1 - (16-1) - 4)
			waitCycles <= 32-1 - (16-1) - 4;
		else if (mode == 2'b10 && i1modk == 8-1)
			waitCycles <= 32-1 + 6 - 3;
		else if (mode == 2'b00)
			waitCycles <= waitCycles + 6 ;
	end
else if (waitCycles >5'b00000)
		waitCycles <= waitCycles - 1;

end

// determining next state of main FSM
always @ (currentState or start or mode or m or n or counter or mdivk or topIdxCounter or doneFetchRow or divCounter or j or stop2 or waitCycles or stop or i1)
begin
	case (currentState)
	`cSETUP:
	begin
		if (start == 1'b1)
			nextState = `cSTART;
		else
			nextState = `cSETUP;
		updateCounter = 1'b1;
	end
	`cSTART:
	begin
		if (mode == 2'b00)
		begin
			if (m == 1 && n == 1)
				nextState = `cDONE;
			else
				nextState = `cFETCH_COL;
		end
		else if (mode == 2'b01)
			nextState = `cSTORE_DIAG;
		else if (mode == 2'b10)
			nextState = `cSTART_FETCH_ROW;
		else
			nextState = `cUPDATE_J;
		updateCounter = 1'b1;
	end
	`cSTART_FETCH_ROW:
	begin
		if (counter == 5+6-1)
   begin
		  if (mode == 2'b00)
			  nextState = `cSTORE_DIAG;
		  else
			  nextState = `cUPDATE_J;
	  end
		else
			nextState = `cSTART_FETCH_ROW;
		updateCounter = 1'b0;
	end
	`cFETCH_COL:
		if (counter >= mdivk-1)
		begin
			if (mode == 2'b00 && counter < 5)
			begin
				nextState = `cWAIT_COL;
				updateCounter = 1'b0;
			end
			else
			begin
				if (mode == 2'b00)
					nextState = `cSTART_FETCH_ROW;
				else
					nextState = `cFIND_REC;
				updateCounter = 1'b1;
			end
		end
		else
		begin
			nextState = `cFETCH_COL;
			updateCounter = 1'b0;
		end
	`cWAIT_COL:
		if (counter >= 5)
		begin
			if (mode == 0)
				nextState = `cSTART_FETCH_ROW;
			else
				nextState = `cFIND_REC;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cWAIT_COL;
			updateCounter = 0;
		end
	`cSTORE_DIAG:
	begin
		if (mode == 0)
			nextState =  `cFIND_REC;
		else
			nextState =  `cFETCH_COL;
		updateCounter = 1;
	end
	`cFIND_REC:
		if (divCounter == 56)
		begin
			if (mode == 0)
				nextState = `cMULT_COL;
			else
				nextState = `cSTORE_DIAG2;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cFIND_REC;
			updateCounter = 0;
		end
	`cSTORE_DIAG2:
	begin
		nextState =  `cMULT_COL;
		updateCounter = 1;
	end
	`cMULT_COL:
		if (topIdxCounter == mdivk-1)
		begin
			nextState = `cUPDATE_J;
			updateCounter = 0;
		end
		else
		begin
			nextState = `cMULT_COL;
			updateCounter = 0;
		end
	`cUPDATE_J:
		if ((mode[1] == 1 || counter >= 16-1) && doneFetchRow == 1)
		begin
			nextState = `cSTORE_MO;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cUPDATE_J;
			updateCounter = 0;
		end
	`cSTORE_MO:
	begin
		if (j == stop2)
		begin
			if (counter == mdivk-1+5-2)
				nextState = `cDONE;
			else
				nextState = `cSTORE_MO;
			updateCounter = 0;
		end
		else
		begin
			nextState =  `cMULT_SUB;
			updateCounter = 1;
		end
	end
	`cMULT_SUB:
		if (topIdxCounter == mdivk-1)
		begin
			if (j == n-1)
				nextState = `cINCRE_I;
			else
				nextState = `cMULT_SUB;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cMULT_SUB;
			updateCounter = 0;
		end
	`cINCRE_I:
	begin
		nextState = `cWAIT;
		updateCounter = 1;
	end
	`cWAIT:
		if (waitCycles == 0)
		begin
			if (i1 == stop)
				nextState = `cDONE;
			else if (mode == 0)
				nextState = `cSTORE_DIAG;
			else if (mode == 1)
				nextState = `cFIND_REC;
			else
				nextState = `cUPDATE_J;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cWAIT;
			updateCounter = 0;
		end
	`cDONE:
	begin
		nextState = `cDONE;
		updateCounter = 0;
	end
	default:
	begin
		nextState = `cSETUP;
		updateCounter = 1;
	end
	endcase
end

always @ (currentRowState or currentState or nextState or i1 or topIdxCounter or mdivk or msIdxCounter or readRowCounter or j or n or mode)
begin
	if (currentRowState == `cDONE_FETCH_ROW)
		doneFetchRow = 1;
	else
		doneFetchRow = 0;
		if((nextState == `cSTART_FETCH_ROW && currentState != `cSTART_FETCH_ROW && i1 == 1))
		startFetchRow = 1;
	else
		startFetchRow = 0;
	if (currentState == `cMULT_SUB && topIdxCounter+2 == mdivk)
		loadRow = 1;
	else
		loadRow = 0;
	writeRow = (msIdxCounter == readRowCounter)&&(currentState==`cMULT_SUB)&&(j!=n)&&(mode[0] == 0);
end

// second FSM that controls the control signals to temp_top block
always @ (currentRowState or nextTopIdxCounter or n or startFetchRow or loadRow or topIdx or mdivk or nextState)
begin
	case (currentRowState)
	`cFETCH_ROW:
		if (nextTopIdxCounter == n-1)
			nextRowState = `cDONE_FETCH_ROW;
		else
			nextRowState = `cFETCH_ROW;
	`cDONE_FETCH_ROW:
		if (startFetchRow == 1)
			nextRowState = `cFETCH_ROW;
		else if (loadRow == 1 || (topIdx+1 == mdivk && nextState == `cMULT_SUB))
			nextRowState = `cLOAD_ROW_INC_J;
		else
			nextRowState = `cDONE_FETCH_ROW;
	`cLOAD_ROW_INC_J:
		if (topIdx+1 == mdivk && nextState == `cMULT_SUB)
			nextRowState = `cLOAD_ROW_INC_J;
		else
			nextRowState = `cDONE_FETCH_ROW;
	default:
		nextRowState = `cDONE_FETCH_ROW;
	endcase
end

// address counters
always @ (posedge clk)
begin
	if (updateCounter == 1 || currentRowState == `cLOAD_ROW_INC_J)
		topIdxCounter <= topIdx;
	else
		topIdxCounter <= topIdxCounter + 1;

	if (updateCounter == 1)
		diagIdxCounter <= diagIdx;
	else
		diagIdxCounter <= diagIdxCounter + 1;

	if (updateCounter == 1 || currentRowState == `cLOAD_ROW_INC_J)
		msIdxCounter <= msIdx;
	else
		msIdxCounter <= msIdxCounter + 1;

	if (updateCounter == 1 || currentRowState == `cLOAD_ROW_INC_J)
		leftIdxCounter <= leftIdx;
	else
		leftIdxCounter <= leftIdxCounter + 1;
	
	if (currentState == `cFETCH_COL || currentState == `cSTORE_MO)
		topWriteCounter <= i1;
	else if (writeRow == 1 || currentRowState == `cFETCH_ROW)
		topWriteCounter <= topWriteCounter + 1;

	if (currentState == `cSTART)
		nextTopIdxCounter <= nextTopIdx;
 else if (currentState == `cSTORE_MO)
		if (mode[1] == 0)
			nextTopIdxCounter <= nextTopIdx + n + 1;
		else
			nextTopIdxCounter <= nextTopIdx + n;
	else if (writeRow == 1 || currentRowState == `cFETCH_ROW)
		nextTopIdxCounter <= nextTopIdxCounter + 1;

	if (currentState == `cSTART)
			readRowCounter <= 0; //offsetdivk;
	else if (currentState == `cSTORE_MO)
		if (mode[1] == 0)
			readRowCounter <= leftIdx + 2;
		else
			readRowCounter <= topIdx;
	else if (writeRow == 1 || currentRowState == `cFETCH_ROW)
	   readRowCounter <= readRowCounter + 2;

	if (updateCounter == 1)
		counter <= 0;
	else
		counter <= counter + 1;

	if (currentState == `cSTORE_DIAG || currentState == `cSTORE_DIAG2)
		divCounter <= 0;
	else if (divCounter < 56)
		divCounter <= divCounter + 1;

	case (i1modk) 
		3'b000: begin
			i1modkByteEn <= ~(32'b0) >> (3'b000<<2'b10);
		end
		3'b001: begin
			i1modkByteEn <= ~(32'b0) >> (3'b001<<2'b10);
		end
		3'b010: begin
			i1modkByteEn <= ~(32'b0) >> (3'b010<<2'b10);
		end
		3'b011: begin
			i1modkByteEn <= ~(32'b0) >> (3'b011<<2'b10);
		end
		3'b100: begin
			i1modkByteEn <= ~(32'b0) >> (3'b100<<2'b10);
		end
		3'b101: begin
			i1modkByteEn <= ~(32'b0) >> (3'b101<<2'b10);
		end
		3'b110: begin
			i1modkByteEn <= ~(32'b0) >> (3'b110<<2'b10);
		end
		3'b111: begin
			i1modkByteEn <= ~(32'b0) >> (3'b111<<2'b10);
		end
		default: begin
			i1modkByteEn <= ~(32'b0);
		end
	endcase
end

// compute Byte Enable
always @ (posedge clk)
begin
	if ((nextState == `cMULT_COL && currentState != `cMULT_COL) || (currentState == `cSTORE_MO) || currentRowState == `cLOAD_ROW_INC_J)
		byteEn <= i1modkByteEn;
	else
		byteEn <= 32'b11111111111111111111111111111111;
end

// update FSM state register
always @ (posedge clk)
begin
	if (start_in == 1'b1)
		currentState <= `cSETUP;
	else
		currentState <= nextState;
	if (start == 1'b1)
		currentRowState <= `cDONE_FETCH_ROW;
	else
		currentRowState <= nextRowState;
end

// delay register for control signals
// control signals are delayed to match latency of operations and/or memory access
always @ (posedge clk)
begin
	curReadAddrDelay0 <= curReadAddrDelay1;
	curReadAddrDelay1 <= curReadAddrDelay2;
	curReadAddrDelay2 <= curReadAddrDelay3;
	curReadAddrDelay3 <= curReadAddrDelay4;
	curReadAddrDelay4 <= curReadAddrDelay5;
	curReadAddrDelay5 <= curReadAddrDelay6;
	curReadAddrDelay6 <= curReadAddrDelay7;
	curReadAddrDelay7 <= curReadAddrDelay8;
	curReadAddrDelay8 <= curReadAddrDelay9;
	curReadAddrDelay9 <= curReadAddrDelay10;
	curReadAddrDelay10 <= curReadAddrDelay11;
	curReadAddrDelay11 <= msIdxCounter;
	
	curWriteAddrDelay0 <= curWriteAddrDelay1;
	curWriteAddrDelay1 <= curWriteAddrDelay2;
	curWriteAddrDelay2 <= curWriteAddrDelay3;
	curWriteAddrDelay3 <= curWriteAddrDelay4;
	if (currentState == `cFETCH_COL)
		curWriteAddrDelay4 <= diagIdxCounter;
	else
		curWriteAddrDelay4 <= curWriteAddrDelay5;
	curWriteAddrDelay5 <= curWriteAddrDelay6;
	curWriteAddrDelay6 <= curWriteAddrDelay7;
	curWriteAddrDelay7 <= curWriteAddrDelay8;
	curWriteAddrDelay8 <= curWriteAddrDelay9;
	curWriteAddrDelay9 <= curWriteAddrDelay10;
	curWriteAddrDelay10 <= curWriteAddrDelay11;
	curWriteAddrDelay11 <= curWriteAddrDelay12;
	curWriteAddrDelay12 <= curWriteAddrDelay13;
	curWriteAddrDelay13 <= curWriteAddrDelay14;
	curWriteAddrDelay14 <= curWriteAddrDelay15;
	if (currentState == `cMULT_COL)
		curWriteAddrDelay15 <= leftIdxCounter;
	else
		curWriteAddrDelay15 <= curWriteAddrDelay16;
	curWriteAddrDelay16 <= curWriteAddrDelay17;
	curWriteAddrDelay17 <= curWriteAddrDelay18;
	curWriteAddrDelay18 <= curWriteAddrDelay19;
	curWriteAddrDelay19 <= curWriteAddrDelay20;
	curWriteAddrDelay20 <= curWriteAddrDelay21;
	curWriteAddrDelay21 <= curWriteAddrDelay22;
	curWriteAddrDelay22 <= curWriteAddrDelay23;
	curWriteAddrDelay23 <= curWriteAddrDelay24;
	curWriteAddrDelay24 <= curWriteAddrDelay25;
	curWriteAddrDelay25 <= curWriteAddrDelay26;
	curWriteAddrDelay26 <= curWriteAddrDelay27;
	curWriteAddrDelay27 <= curWriteAddrDelay28;
	curWriteAddrDelay28 <= curWriteAddrDelay29;
	curWriteAddrDelay29 <= curWriteAddrDelay30;
	curWriteAddrDelay30 <= curWriteAddrDelay31;
	curWriteAddrDelay31 <= msIdxCounter;
	
	writeByteEnDelay0 <= writeByteEnDelay1;
	writeByteEnDelay1 <= writeByteEnDelay2;
	writeByteEnDelay2 <= writeByteEnDelay3;
	writeByteEnDelay3 <= writeByteEnDelay4;
	if (mode[0] == 1'b1)
		writeByteEnDelay4 <= ~0;
	else if (currentState == `cFETCH_COL)
		writeByteEnDelay4 <= byteEn;
	else
		writeByteEnDelay4 <= writeByteEnDelay5;
	writeByteEnDelay5 <= writeByteEnDelay6;
	writeByteEnDelay6 <= writeByteEnDelay7;
	writeByteEnDelay7 <= writeByteEnDelay8;
	writeByteEnDelay8 <= writeByteEnDelay9;
	writeByteEnDelay9 <= writeByteEnDelay10;
	writeByteEnDelay10 <= writeByteEnDelay11;
	writeByteEnDelay11 <= writeByteEnDelay12;
	writeByteEnDelay12 <= writeByteEnDelay13;
	writeByteEnDelay13 <= writeByteEnDelay14;
	writeByteEnDelay14 <= writeByteEnDelay15;
	if (currentState == `cMULT_COL)
		writeByteEnDelay15 <= byteEn;
	else
		writeByteEnDelay15 <= writeByteEnDelay16;
	writeByteEnDelay16 <= writeByteEnDelay17;
	writeByteEnDelay17 <= writeByteEnDelay18;
	writeByteEnDelay18 <= writeByteEnDelay19;
	writeByteEnDelay19 <= writeByteEnDelay20;
	writeByteEnDelay20 <= writeByteEnDelay21;
	writeByteEnDelay21 <= writeByteEnDelay22;
	writeByteEnDelay22 <= writeByteEnDelay23;
	writeByteEnDelay23 <= writeByteEnDelay24;
	writeByteEnDelay24 <= writeByteEnDelay25;
	writeByteEnDelay25 <= writeByteEnDelay26;
	writeByteEnDelay26 <= writeByteEnDelay27;
	writeByteEnDelay27 <= writeByteEnDelay28;
	writeByteEnDelay28 <= writeByteEnDelay29;
	writeByteEnDelay29 <= writeByteEnDelay30;
	writeByteEnDelay30 <= writeByteEnDelay31;
	writeByteEnDelay31 <= byteEn;
	
	curWriteSelDelay[0] <= curWriteSelDelay[1];
	curWriteSelDelay[1] <= curWriteSelDelay[2];
	curWriteSelDelay[2] <= curWriteSelDelay[3];
	curWriteSelDelay[3] <= curWriteSelDelay[4];
	curWriteSelDelay[4] <= curWriteSelDelay[5];
	curWriteSelDelay[5] <= curWriteSelDelay[6];
	curWriteSelDelay[6] <= curWriteSelDelay[7];
	curWriteSelDelay[7] <= curWriteSelDelay[8];
	curWriteSelDelay[8] <= curWriteSelDelay[9];
	curWriteSelDelay[9] <= curWriteSelDelay[10];
	curWriteSelDelay[10] <= curWriteSelDelay[11];
	curWriteSelDelay[11] <= curWriteSelDelay[12];
	curWriteSelDelay[12] <= curWriteSelDelay[13];
	curWriteSelDelay[13] <= curWriteSelDelay[14];
	curWriteSelDelay[14] <= curWriteSelDelay[15];
	if (currentState == `cMULT_COL)
		curWriteSelDelay[15] <= 1'b0;
	else
		curWriteSelDelay[15] <= 1'b1;

	curWriteEnDelay[0] <= curWriteEnDelay[1];
	curWriteEnDelay[1] <= curWriteEnDelay[2];
	curWriteEnDelay[2] <= curWriteEnDelay[3];
	curWriteEnDelay[3] <= curWriteEnDelay[4];
	curWriteEnDelay[4] <= curWriteEnDelay[5];
	curWriteEnDelay[5] <= curWriteEnDelay[6];
	curWriteEnDelay[6] <= curWriteEnDelay[7];
	curWriteEnDelay[7] <= curWriteEnDelay[8];
	curWriteEnDelay[8] <= curWriteEnDelay[9];
	curWriteEnDelay[9] <= curWriteEnDelay[10];
	curWriteEnDelay[10] <= curWriteEnDelay[11];
	curWriteEnDelay[11] <= curWriteEnDelay[12];
	curWriteEnDelay[12] <= curWriteEnDelay[13];
	curWriteEnDelay[13] <= curWriteEnDelay[14];
	curWriteEnDelay[14] <= curWriteEnDelay[15];
	if (currentState == `cMULT_COL)
		curWriteEnDelay[15] <= 1'b1;
	else
		curWriteEnDelay[15] <= curWriteEnDelay[16];
	curWriteEnDelay[16] <= curWriteEnDelay[17];
	curWriteEnDelay[17] <= curWriteEnDelay[18];
	curWriteEnDelay[18] <= curWriteEnDelay[19];
	curWriteEnDelay[19] <= curWriteEnDelay[20];
	curWriteEnDelay[20] <= curWriteEnDelay[21];
	curWriteEnDelay[21] <= curWriteEnDelay[22];
	curWriteEnDelay[22] <= curWriteEnDelay[23];
	curWriteEnDelay[23] <= curWriteEnDelay[24];
	curWriteEnDelay[24] <= curWriteEnDelay[25];
	curWriteEnDelay[25] <= curWriteEnDelay[26];
	curWriteEnDelay[26] <= curWriteEnDelay[27];
	curWriteEnDelay[27] <= curWriteEnDelay[28];
	curWriteEnDelay[28] <= curWriteEnDelay[29];
	curWriteEnDelay[29] <= curWriteEnDelay[30];
	curWriteEnDelay[30] <= curWriteEnDelay[31];
	if (currentState == `cMULT_SUB)
		curWriteEnDelay[31] <= 1'b1;
	else
		curWriteEnDelay[31] <= 1'b0;

	leftWriteSelDelay[0] <= leftWriteSelDelay[1];
	leftWriteSelDelay[1] <= leftWriteSelDelay[2];
	leftWriteSelDelay[2] <= leftWriteSelDelay[3];
	leftWriteSelDelay[3] <= leftWriteSelDelay[4];
	if (currentState == `cFETCH_COL)
		leftWriteSelDelay[4] <= 1'b0;
	else
		leftWriteSelDelay[4] <= 1'b1;

	leftWriteEnDelay[0] <= leftWriteEnDelay[1];
	leftWriteEnDelay[1] <= leftWriteEnDelay[2];
	leftWriteEnDelay[2] <= leftWriteEnDelay[3];
	leftWriteEnDelay[3] <= leftWriteEnDelay[4];
	if (currentState == `cFETCH_COL)
		leftWriteEnDelay[4] <= 1'b1;
	else
		leftWriteEnDelay[4] <= leftWriteEnDelay[5];
	leftWriteEnDelay[5] <= leftWriteEnDelay[6];
	leftWriteEnDelay[6] <= leftWriteEnDelay[7];
	leftWriteEnDelay[7] <= leftWriteEnDelay[8];
	leftWriteEnDelay[8] <= leftWriteEnDelay[9];
	leftWriteEnDelay[9] <= leftWriteEnDelay[10];
	leftWriteEnDelay[10] <= leftWriteEnDelay[11];
	leftWriteEnDelay[11] <= leftWriteEnDelay[12];
	leftWriteEnDelay[12] <= leftWriteEnDelay[13];
	leftWriteEnDelay[13] <= leftWriteEnDelay[14];
	leftWriteEnDelay[14] <= leftWriteEnDelay[15];
	if (currentState == `cMULT_COL)
		leftWriteEnDelay[15] <= 1'b1;
	else
		leftWriteEnDelay[15] <= leftWriteEnDelay[16];
	leftWriteEnDelay[16] <= leftWriteEnDelay[17];
	leftWriteEnDelay[17] <= leftWriteEnDelay[18];
	leftWriteEnDelay[18] <= leftWriteEnDelay[19];
	leftWriteEnDelay[19] <= leftWriteEnDelay[20];
	leftWriteEnDelay[20] <= leftWriteEnDelay[21];
	leftWriteEnDelay[21] <= leftWriteEnDelay[22];
	leftWriteEnDelay[22] <= leftWriteEnDelay[23];
	leftWriteEnDelay[23] <= leftWriteEnDelay[24];
	leftWriteEnDelay[24] <= leftWriteEnDelay[25];
	leftWriteEnDelay[25] <= leftWriteEnDelay[26];
	leftWriteEnDelay[26] <= leftWriteEnDelay[27];
	leftWriteEnDelay[27] <= leftWriteEnDelay[28];
	leftWriteEnDelay[28] <= leftWriteEnDelay[29];
	leftWriteEnDelay[29] <= leftWriteEnDelay[30];
	leftWriteEnDelay[30] <= leftWriteEnDelay[31];
	if (currentState == `cMULT_SUB && (mode == 0 || (mode == 1 && j == i1)))
		leftWriteEnDelay[31] <= 1'b1;
	else
		leftWriteEnDelay[31] <= 1'b0;

	topWriteAddrDelay0 <= topWriteAddrDelay1;
	topWriteAddrDelay1 <= topWriteAddrDelay2;
	topWriteAddrDelay2 <= topWriteAddrDelay3;
	topWriteAddrDelay3 <= topWriteAddrDelay4;
	if (currentRowState == `cFETCH_ROW)
		topWriteAddrDelay4 <= nextTopIdxCounter;
	else
		topWriteAddrDelay4 <=  topWriteAddrDelay5;
	topWriteAddrDelay5 <= topWriteAddrDelay6;
	topWriteAddrDelay6 <= topWriteAddrDelay7;
	topWriteAddrDelay7 <= topWriteAddrDelay8;
	topWriteAddrDelay8 <= topWriteAddrDelay9;
	topWriteAddrDelay9 <= topWriteAddrDelay10;
	topWriteAddrDelay10 <= topWriteAddrDelay11;
	topWriteAddrDelay11 <= topWriteAddrDelay12;
	topWriteAddrDelay12 <= topWriteAddrDelay13;
	topWriteAddrDelay13 <= topWriteAddrDelay14;
	topWriteAddrDelay14 <= topWriteAddrDelay15;
	topWriteAddrDelay15 <= topWriteAddrDelay16;
	topWriteAddrDelay16 <= topWriteAddrDelay17;
	topWriteAddrDelay17 <= topWriteAddrDelay18;
	topWriteAddrDelay18 <= topWriteAddrDelay19;
	topWriteAddrDelay19 <= topWriteAddrDelay20;
	topWriteAddrDelay20 <= topWriteAddrDelay21;
	topWriteAddrDelay21 <= topWriteAddrDelay22;
	topWriteAddrDelay22 <= topWriteAddrDelay23;
	topWriteAddrDelay23 <= topWriteAddrDelay24;
	topWriteAddrDelay24 <= topWriteAddrDelay25;
	topWriteAddrDelay25 <= topWriteAddrDelay26;
	topWriteAddrDelay26 <= topWriteAddrDelay27;
	topWriteAddrDelay27 <= topWriteAddrDelay28;
	topWriteAddrDelay28 <= topWriteAddrDelay29;
	topWriteAddrDelay29 <= topWriteAddrDelay30;
	topWriteAddrDelay30 <= topWriteAddrDelay31;
		topWriteAddrDelay31 <= nextTopIdxCounter;

	topWriteEnDelay[0] <= topWriteEnDelay[1];
	topWriteEnDelay[1] <= topWriteEnDelay[2];
	topWriteEnDelay[2] <= topWriteEnDelay[3];
	topWriteEnDelay[3] <= topWriteEnDelay[4];
	if (currentRowState == `cFETCH_ROW)
		topWriteEnDelay[4] <= 1'b1;
	else
		topWriteEnDelay[4] <=  topWriteEnDelay[5];
	topWriteEnDelay[5] <= topWriteEnDelay[6];
	topWriteEnDelay[6] <= topWriteEnDelay[7];
	topWriteEnDelay[7] <= topWriteEnDelay[8];
	topWriteEnDelay[8] <= topWriteEnDelay[9];
	topWriteEnDelay[9] <= topWriteEnDelay[10];
	topWriteEnDelay[10] <= topWriteEnDelay[11];
	topWriteEnDelay[11] <= topWriteEnDelay[12];
	topWriteEnDelay[12] <= topWriteEnDelay[13];
	topWriteEnDelay[13] <= topWriteEnDelay[14];
	topWriteEnDelay[14] <= topWriteEnDelay[15];
	topWriteEnDelay[15] <= topWriteEnDelay[16];
	topWriteEnDelay[16] <= topWriteEnDelay[17];
	topWriteEnDelay[17] <= topWriteEnDelay[18];
	topWriteEnDelay[18] <= topWriteEnDelay[19];
	topWriteEnDelay[19] <= topWriteEnDelay[20];
	topWriteEnDelay[20] <= topWriteEnDelay[21];
	topWriteEnDelay[21] <= topWriteEnDelay[22];
	topWriteEnDelay[22] <= topWriteEnDelay[23];
	topWriteEnDelay[23] <= topWriteEnDelay[24];
	topWriteEnDelay[24] <= topWriteEnDelay[25];
	topWriteEnDelay[25] <= topWriteEnDelay[26];
	topWriteEnDelay[26] <= topWriteEnDelay[27];
	topWriteEnDelay[27] <= topWriteEnDelay[28];
	topWriteEnDelay[28] <= topWriteEnDelay[29];
	topWriteEnDelay[29] <= topWriteEnDelay[30];
	topWriteEnDelay[30] <= topWriteEnDelay[31];
	topWriteEnDelay[31] <= writeRow;

	topWriteSelDelay0 <= topWriteSelDelay1;
	topWriteSelDelay1 <= topWriteSelDelay2;
	topWriteSelDelay2 <= topWriteSelDelay3;
	topWriteSelDelay3 <= topWriteSelDelay4;
	if (currentRowState == `cFETCH_ROW || currentState == `cUPDATE_J && i1 == 1)
		topWriteSelDelay4 <= imodk;
	else
		topWriteSelDelay4 <=  topWriteSelDelay5;
	topWriteSelDelay5 <= topWriteSelDelay6;
	topWriteSelDelay6 <= topWriteSelDelay7;
	topWriteSelDelay7 <= topWriteSelDelay8;
	topWriteSelDelay8 <= topWriteSelDelay9;
	topWriteSelDelay9 <= topWriteSelDelay10;
	topWriteSelDelay10 <= topWriteSelDelay11;
	topWriteSelDelay11 <= topWriteSelDelay12;
	topWriteSelDelay12 <= topWriteSelDelay13;
	topWriteSelDelay13 <= topWriteSelDelay14;
	topWriteSelDelay14 <= topWriteSelDelay15;
	topWriteSelDelay15 <= topWriteSelDelay16;
	topWriteSelDelay16 <= topWriteSelDelay17;
	topWriteSelDelay17 <= topWriteSelDelay18;
	topWriteSelDelay18 <= topWriteSelDelay19;
	topWriteSelDelay19 <= topWriteSelDelay20;
	topWriteSelDelay20 <= topWriteSelDelay21;
	topWriteSelDelay21 <= topWriteSelDelay22;
	topWriteSelDelay22 <= topWriteSelDelay23;
	topWriteSelDelay23 <= topWriteSelDelay24;
	topWriteSelDelay24 <= topWriteSelDelay25;
	topWriteSelDelay25 <= topWriteSelDelay26;
	topWriteSelDelay26 <= topWriteSelDelay27;
	topWriteSelDelay27 <= topWriteSelDelay28;
	topWriteSelDelay28 <= topWriteSelDelay29;
	topWriteSelDelay29 <= topWriteSelDelay30;
	topWriteSelDelay30 <= topWriteSelDelay31;
	topWriteSelDelay31 <= i1modk;

	topSourceSelDelay[0] <= topSourceSelDelay[1];
	topSourceSelDelay[1] <= topSourceSelDelay[2];
	topSourceSelDelay[2] <= topSourceSelDelay[3];
	topSourceSelDelay[3] <= topSourceSelDelay[4];
	if (start == 1'b1)
		topSourceSelDelay[4] <= 1'b0;
	else if (currentState == `cSTORE_MO)
		topSourceSelDelay[4] <= 1'b1;

	leftReadAddrDelay0 <= leftIdxCounter;


	diagEnDelay[0] <= diagEnDelay[1];
	diagEnDelay[1] <= diagEnDelay[2];
	diagEnDelay[2] <= diagEnDelay[3];
	diagEnDelay[3] <= diagEnDelay[4];
	diagEnDelay[4] <= diagEnDelay[5];
	diagEnDelay[5] <= (currentState == `cSTORE_DIAG || currentState == `cSTORE_DIAG2);

	MOEnDelay[0] <= MOEnDelay[1];
	MOEnDelay[1] <= MOEnDelay[2];
	MOEnDelay[2] <= MOEnDelay[3];
	MOEnDelay[3] <= MOEnDelay[4];
	MOEnDelay[4] <= MOEnDelay[5];
	if (currentState == `cSTORE_MO || currentRowState == `cLOAD_ROW_INC_J)
		MOEnDelay[5] <= 1'b1;
	else
		MOEnDelay[5] <= 1'b0;
end

// output contorl signals
always @ (posedge clk)
begin
	if (currentState == `cFETCH_COL)
		curReadAddr <= diagIdxCounter;
	else if (currentRowState == `cFETCH_ROW)
	   curReadAddr <= readRowCounter;
	else
		curReadAddr <= curReadAddrDelay0;
	curWriteAddr <= curWriteAddrDelay0;
	curWriteByteEn <= writeByteEnDelay0;
	curWriteSel <= curWriteSelDelay;
	curWriteEn <= curWriteEnDelay;

	if (currentState == `cMULT_COL)
		leftReadAddr <= leftIdxCounter;
	else
		leftReadAddr <= leftReadAddrDelay0;
	leftWriteAddr <= curWriteAddrDelay0;
	leftWriteByteEn <= writeByteEnDelay0;
	leftWriteSel <= leftWriteSelDelay;
	leftWriteEn <= leftWriteEnDelay;

	if (currentState == `cSTORE_DIAG)
		topReadAddr <= nextTopIdx;
else if (currentState == `cSTORE_DIAG2)
   topReadAddr <= nextTopIdx2;
	else
	topReadAddr <= curTopIdx;
	topWriteAddr <= topWriteAddrDelay0;
	topWriteEn <= topWriteEnDelay;
	topWriteSel <= topWriteSelDelay0;
	topSourceSel <= topSourceSelDelay;

	MOSel <= ~(currentState == `cFIND_REC);
if (currentState == `cFIND_REC)
		MOEn <= 1'b1;
	else
		MOEn <= MOEnDelay;

	diagEn <= diagEnDelay;

	if (currentState == `cDONE)
		done <= 1'b1;
	else
		done <= 1'b0;
end

endmodule
