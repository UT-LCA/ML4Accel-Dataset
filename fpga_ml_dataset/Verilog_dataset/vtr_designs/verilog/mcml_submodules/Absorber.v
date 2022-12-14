`define TRIG_WIDTH 5'b01010 //10;
`define PIPELINE_DEPTH_UPPER_LIMIT 10'b0100000000 //256;
`define ABSORB_ADDR_WIDTH 6'b010000 //16;
`define ABSORB_WORD_WIDTH 7'b01000000 //64;
`define WSCALE 22'b0111010100101111111111 //1919999;
//`define BIT_WIDTH 7'b0100000
//`define LAYER_WIDTH 6'b000011 
`define LEFTSHIFT 6'b000011         // 2^3=8=1/0.125 where 0.125 = CHANCE of roulette
`define INTCHANCE 32'b00100000000000000000000000000000 //Based on 32 bit rand num generator
`define MIN_WEIGHT 9'b011001000 
`define BIT_WIDTH 7'b0100000
`define LAYER_WIDTH 6'b000011
`define INTMAX 32'b01111111111111111111111111111111
`define INTMIN 32'b10000000000000000000000000000000
`define DIVIDER_LATENCY 6'b011110
`define FINAL_LATENCY 6'b011100
`define MULT_LATENCY 1'b1
`define ASPECT_RATIO 6'b000111
`define TOTAL_LATENCY 7'b0111100
//`define BIT_WIDTH 6'b100000
//`define LAYER_WIDTH 6'b000011
`define LOGSCALEFACTOR 6'b000101
`define MAXLOG 32'b10110001011100100001011111110111		//Based on 32 bit unsigned rand num generator
`define CONST_MOVE_AMOUNT 15'b110000110101000  //Used for testing purposes only
`define MUTMAX_BITS 6'b001111
//`define BIT_WIDTH 6'b100000
//`define LAYER_WIDTH 6'b000011
//`define INTMAX 32'b01111111111111111111111111111111
//`define INTMIN 32'b10000000000000000000000000000000
//`define BIT_WIDTH 7'b0100000
`define MANTISSA_PRECISION 6'b001010
`define LOG2_BIT_WIDTH 6'b000110
`define LOG2 28'b0101100010111001000010111111
`define NR 10'b0100000000             
`define NZ 10'b0100000000              
`define NR_EXP 5'b01000              //meaning `NR=2^`NR_exp or 2^8=256
`define RGRID_SCLAE_EXP 6'b010101    //2^21 = RGRID_SCALE
`define ZGRID_SCLAE_EXP 6'b010101    //2^21 = ZGRID_SCALE
//`define BIT_WIDTH 7'b0100000
`define BIT_WIDTH_2 8'b01000000
`define WORD_WIDTH 8'b01000000
`define ADDR_WIDTH 6'b010000          //256x256=2^8*2^8=2^16
`define DIV 6'b010100//20;
`define SQRT 5'b01010 //10;
`define LAT 7'b0100101 //DIV + SQRT + 7;
`define INTMAX_2 {32'h3FFFFFFF,32'h00000001}
//`define INTMAX 32'b01111111111111111111111111111111//2147483647;
//`define INTMIN 32'b10000000000000000000000000000001//-2147483647;
`define INTMAXMinus3 32'b01111111111111111111111111111100//2147483644;
`define negINTMAXPlus3 32'b10000000000000000000000000000100//-2147483644;
`define INTMAX_2_ref {32'h3FFFFFFF,32'hFFFFFFFF}
`define SIMULATION_MEMORY

module Absorber ( 	//INPUTS
                     clock, reset, enable, 
                     
                     //From hopper
                     weight_hop, hit_hop, dead_hop,

                     //From Shared Registers
                     x_pipe, y_pipe, z_pipe, layer_pipe,
                     
                     //From System Register File (5 layers)
                     muaFraction1, muaFraction2, muaFraction3, muaFraction4, muaFraction5,  
                     
                     //I/O to on-chip mem -- check interface
                     data, rdaddress, wraddress, wren, q,
                     
                     //OUTPUT
                     weight_absorber
                     
                     ); 


//////////////////////////////////////////////////////////////////////////////
//PARAMETERS
//////////////////////////////////////////////////////////////////////////////
//parameter `NR=256;              
//parameter `NZ=256;              
//
//parameter `NR_EXP=8;              //meaning `NR=2^`NR_exp or 2^8=256
//parameter `RGRID_SCLAE_EXP=21;    //2^21 = RGRID_SCALE
//parameter `ZGRID_SCLAE_EXP=21;    //2^21 = ZGRID_SCALE
//
//
//parameter `BIT_WIDTH=32;
//parameter `BIT_WIDTH_2=64;
//parameter `WORD_WIDTH=64;
//parameter `ADDR_WIDTH=16;          //256x256=2^8*2^8=2^16
//
//
//parameter `LAYER_WIDTH=3; 
//parameter `PIPE_DEPTH = 37;        


//////////////////////////////////////////////////////////////////////////////
//INPUTS
//////////////////////////////////////////////////////////////////////////////
input clock;        
input reset;
input enable;

//From hopper
input [`BIT_WIDTH-1:0] weight_hop; 
input hit_hop; 
input dead_hop; 

//From Shared Reg
//input signed [`BIT_WIDTH-1:0] x_pipe;
//input signed [`BIT_WIDTH-1:0] y_pipe;
input [`BIT_WIDTH-1:0] x_pipe;
input [`BIT_WIDTH-1:0] y_pipe;
input [`BIT_WIDTH-1:0] z_pipe;
input [`LAYER_WIDTH-1:0] layer_pipe;

//From System Reg File
input [`BIT_WIDTH-1:0] muaFraction1, muaFraction2, muaFraction3, muaFraction4, muaFraction5;  

//////////////////////////////////////////////////////////////////////////////
//OUTPUTS
//////////////////////////////////////////////////////////////////////////////
output [`BIT_WIDTH-1:0] weight_absorber; 

//////////////////////////////////////////////////////////////////////////////
//I/O to on-chip mem -- check interface
//////////////////////////////////////////////////////////////////////////////
output [`WORD_WIDTH-1:0] data; 
output [`ADDR_WIDTH-1:0] rdaddress, wraddress; 
output wren;     
reg wren; 
input [`WORD_WIDTH-1:0] q;

//////////////////////////////////////////////////////////////////////////////
//Local AND Registered Value Variables
//////////////////////////////////////////////////////////////////////////////
//STAGE 1 - Do nothing

//STAGE 2
reg [`BIT_WIDTH_2-1:0] x2_temp, y2_temp;   //From mult
reg [`BIT_WIDTH_2-1:0] x2_P, y2_P;         //Registered Value

//STAGE 3
reg [`BIT_WIDTH_2-1:0] r2_temp, r2_P;   
wire [`BIT_WIDTH_2-1:0] r2_P_wire;  

//STAGE 4
reg [`BIT_WIDTH-1:0]		fractionScaled; 
reg [`BIT_WIDTH-1:0]		weight_P4; 
reg [`BIT_WIDTH-1:0]		r_P; 
wire [`BIT_WIDTH-1:0]		r_P_wire; 

reg [`BIT_WIDTH_2-1:0] product64bit; 
reg [`BIT_WIDTH-1:0] dwa_temp; 

//STAGE 14
reg [`BIT_WIDTH-1:0]		ir_temp; 
reg [`BIT_WIDTH-1:0]		iz_temp; 

//STAGE 15
reg [`BIT_WIDTH-1:0]		ir_P; 
reg [`BIT_WIDTH-1:0]		iz_P; 
reg [`BIT_WIDTH-1:0]		ir_scaled; 
reg [`ADDR_WIDTH-1:0] rADDR_temp; 
reg [`ADDR_WIDTH-1:0] rADDR_16; 

//STAGE 16
reg [`WORD_WIDTH-1:0] oldAbs_MEM;
reg [`WORD_WIDTH-1:0] oldAbs_P; 
reg [`ADDR_WIDTH-1:0] rADDR_17;
 
//STAGE 17
reg [`BIT_WIDTH-1:0] weight_P; 
reg [`BIT_WIDTH-1:0] dwa_P; 
reg [`BIT_WIDTH-1:0] newWeight; 

reg [`WORD_WIDTH-1:0] newAbs_P; 
reg [`WORD_WIDTH-1:0] newAbs_temp; 

//reg [`ADDR_WIDTH-1:0] wADDR; 


//////////////////////////////////////////////////////////////////////////////
//PIPELINE weight, hit, dead
//////////////////////////////////////////////////////////////////////////////
//WIRES FOR CONNECTING REGISTERS

//peter m made this manual
//wire	[32-1:0]			weight	[37:0];

wire	[32-1:0]				weight__0;
wire	[32-1:0]				weight__1;
wire	[32-1:0]				weight__2;
wire	[32-1:0]				weight__3;
wire	[32-1:0]				weight__4;
wire	[32-1:0]				weight__5;
wire	[32-1:0]				weight__6;
wire	[32-1:0]				weight__7;
wire	[32-1:0]				weight__8;
wire	[32-1:0]				weight__9;
wire	[32-1:0]				weight__10;
wire	[32-1:0]				weight__11;
wire	[32-1:0]				weight__12;
wire	[32-1:0]				weight__13;
wire	[32-1:0]				weight__14;
wire	[32-1:0]				weight__15;
wire	[32-1:0]				weight__16;
wire	[32-1:0]				weight__17;
wire	[32-1:0]				weight__18;
wire	[32-1:0]				weight__19;
wire	[32-1:0]				weight__20;
wire	[32-1:0]				weight__21;
wire	[32-1:0]				weight__22;
wire	[32-1:0]				weight__23;
wire	[32-1:0]				weight__24;
wire	[32-1:0]				weight__25;
wire	[32-1:0]				weight__26;
wire	[32-1:0]				weight__27;
wire	[32-1:0]				weight__28;
wire	[32-1:0]				weight__29;
wire	[32-1:0]				weight__30;
wire	[32-1:0]				weight__31;
wire	[32-1:0]				weight__32;
wire	[32-1:0]				weight__33;
wire	[32-1:0]				weight__34;
wire	[32-1:0]				weight__35;
wire	[32-1:0]				weight__36;
wire	[32-1:0]				weight__37;


//wire [37:0]	hit	;
wire					hit__0;
wire					hit__1;
wire					hit__2;
wire					hit__3;
wire					hit__4;
wire					hit__5;
wire					hit__6;
wire					hit__7;
wire					hit__8;
wire					hit__9;
wire					hit__10;
wire					hit__11;
wire					hit__12;
wire					hit__13;
wire					hit__14;
wire					hit__15;
wire					hit__16;
wire					hit__17;
wire					hit__18;
wire					hit__19;
wire					hit__20;
wire					hit__21;
wire					hit__22;
wire					hit__23;
wire					hit__24;
wire					hit__25;
wire					hit__26;
wire					hit__27;
wire					hit__28;
wire					hit__29;
wire					hit__30;
wire					hit__31;
wire					hit__32;
wire					hit__33;
wire					hit__34;
wire					hit__35;
wire					hit__36;
wire					hit__37;



//wire	[37:0]  dead	;
wire					dead__0;
wire					dead__1;
wire					dead__2;
wire					dead__3;
wire					dead__4;
wire					dead__5;
wire					dead__6;
wire					dead__7;
wire					dead__8;
wire					dead__9;
wire					dead__10;
wire					dead__11;
wire					dead__12;
wire					dead__13;
wire					dead__14;
wire					dead__15;
wire					dead__16;
wire					dead__17;
wire					dead__18;
wire					dead__19;
wire					dead__20;
wire					dead__21;
wire					dead__22;
wire					dead__23;
wire					dead__24;
wire					dead__25;
wire					dead__26;
wire					dead__27;
wire					dead__28;
wire					dead__29;
wire					dead__30;
wire					dead__31;
wire					dead__32;
wire					dead__33;
wire					dead__34;
wire					dead__35;
wire					dead__36;
wire					dead__37;


//ASSIGNMENTS FROM INPUTS TO PIPE
assign weight__0 = weight_hop;
assign hit__0 = hit_hop;
assign dead__0 = dead_hop;

//ASSIGNMENTS FROM PIPE TO OUTPUT
assign weight_absorber = weight__37;

//GENERATE PIPELINE
//genvar i;
//generate
//	for(i=`PIPE_DEPTH; i>0; i=i-1) begin: weightHitDeadPipe
//		case(i)  
//		
//		//REGISTER 17 on diagram!!
//		18:   
//		begin
//		   
//		PhotonBlock2 photon(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_x(newWeight),
//			.i_y(hit[17]),
//			.i_z(dead[17]),
//			
//			//Outputs			
//			.o_x(weight[18]),
//			.o_y(hit[18]),
//			.o_z(dead[18])
//		);
//		    
//		end
//		default:
//		begin
//		PhotonBlock2 photon(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_x(weight[i-1]),
//			.i_y(hit[i-1]),
//			.i_z(dead[i-1]),
//			
//			//Outputs			
//			.o_x(weight[i]),
//			.o_y(hit[i]),
//			.o_z(dead[i])
//		);
//		end
//		endcase
//	end
//endgenerate	

//Expand pipeline generation
//special case i = 18 first
PhotonBlock2 photon18(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),
			
			.i_x(newWeight),
			.i_y(hit__17),
			.i_z(dead__17),
			
			//Outputs			
			.o_x(weight__18),
			.o_y(hit__18),
			.o_z(dead__18)
		);
		
PhotonBlock2 photon37(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__36),
.i_y(hit__36),
.i_z(dead__36),
//Outputs		
	.o_x(weight__37),
.o_y(hit__37),
.o_z(dead__37)
);

PhotonBlock2 photon36(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__35),
.i_y(hit__35),
.i_z(dead__35),
//Outputs		
	.o_x(weight__36),
.o_y(hit__36),
.o_z(dead__36)
);

PhotonBlock2 photon35(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__34),
.i_y(hit__34),
.i_z(dead__34),
//Outputs		
	.o_x(weight__35),
.o_y(hit__35),
.o_z(dead__35)
);

PhotonBlock2 photon34(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__33),
.i_y(hit__33),
.i_z(dead__33),
//Outputs		
	.o_x(weight__34),
.o_y(hit__34),
.o_z(dead__34)
);

PhotonBlock2 photon33(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__32),
.i_y(hit__32),
.i_z(dead__32),
//Outputs		
	.o_x(weight__33),
.o_y(hit__33),
.o_z(dead__33)
);

PhotonBlock2 photon32(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__31),
.i_y(hit__31),
.i_z(dead__31),
//Outputs		
	.o_x(weight__32),
.o_y(hit__32),
.o_z(dead__32)
);

PhotonBlock2 photon31(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__30),
.i_y(hit__30),
.i_z(dead__30),
//Outputs		
	.o_x(weight__31),
.o_y(hit__31),
.o_z(dead__31)
);

PhotonBlock2 photon30(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__29),
.i_y(hit__29),
.i_z(dead__29),
//Outputs		
	.o_x(weight__30),
.o_y(hit__30),
.o_z(dead__30)
);

PhotonBlock2 photon29(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__28),
.i_y(hit__28),
.i_z(dead__28),
//Outputs		
	.o_x(weight__29),
.o_y(hit__29),
.o_z(dead__29)
);

PhotonBlock2 photon28(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__27),
.i_y(hit__27),
.i_z(dead__27),
//Outputs		
	.o_x(weight__28),
.o_y(hit__28),
.o_z(dead__28)
);

PhotonBlock2 photon27(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__26),
.i_y(hit__26),
.i_z(dead__26),
//Outputs		
	.o_x(weight__27),
.o_y(hit__27),
.o_z(dead__27)
);

PhotonBlock2 photon26(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__25),
.i_y(hit__25),
.i_z(dead__25),
//Outputs		
	.o_x(weight__26),
.o_y(hit__26),
.o_z(dead__26)
);

PhotonBlock2 photon25(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__24),
.i_y(hit__24),
.i_z(dead__24),
//Outputs		
	.o_x(weight__25),
.o_y(hit__25),
.o_z(dead__25)
);

PhotonBlock2 photon24(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__23),
.i_y(hit__23),
.i_z(dead__23),
//Outputs		
	.o_x(weight__24),
.o_y(hit__24),
.o_z(dead__24)
);

PhotonBlock2 photon23(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__22),
.i_y(hit__22),
.i_z(dead__22),
//Outputs		
	.o_x(weight__23),
.o_y(hit__23),
.o_z(dead__23)
);

PhotonBlock2 photon22(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__21),
.i_y(hit__21),
.i_z(dead__21),
//Outputs		
	.o_x(weight__22),
.o_y(hit__22),
.o_z(dead__22)
);

PhotonBlock2 photon21(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__20),
.i_y(hit__20),
.i_z(dead__20),
//Outputs		
	.o_x(weight__21),
.o_y(hit__21),
.o_z(dead__21)
);

PhotonBlock2 photon20(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__19),
.i_y(hit__19),
.i_z(dead__19),
//Outputs		
	.o_x(weight__20),
.o_y(hit__20),
.o_z(dead__20)
);

PhotonBlock2 photon19(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__18),
.i_y(hit__18),
.i_z(dead__18),
//Outputs		
	.o_x(weight__19),
.o_y(hit__19),
.o_z(dead__19)
);


PhotonBlock2 photon17(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__16),
.i_y(hit__16),
.i_z(dead__16),
//Outputs		
	.o_x(weight__17),
.o_y(hit__17),
.o_z(dead__17)
);

PhotonBlock2 photon16(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__15),
.i_y(hit__15),
.i_z(dead__15),
//Outputs		
	.o_x(weight__16),
.o_y(hit__16),
.o_z(dead__16)
);

PhotonBlock2 photon15(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__14),
.i_y(hit__14),
.i_z(dead__14),
//Outputs		
	.o_x(weight__15),
.o_y(hit__15),
.o_z(dead__15)
);

PhotonBlock2 photon14(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__13),
.i_y(hit__13),
.i_z(dead__13),
//Outputs		
	.o_x(weight__14),
.o_y(hit__14),
.o_z(dead__14)
);

PhotonBlock2 photon13(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__12),
.i_y(hit__12),
.i_z(dead__12),
//Outputs		
	.o_x(weight__13),
.o_y(hit__13),
.o_z(dead__13)
);

PhotonBlock2 photon12(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__11),
.i_y(hit__11),
.i_z(dead__11),
//Outputs		
	.o_x(weight__12),
.o_y(hit__12),
.o_z(dead__12)
);

PhotonBlock2 photon11(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__10),
.i_y(hit__10),
.i_z(dead__10),
//Outputs		
	.o_x(weight__11),
.o_y(hit__11),
.o_z(dead__11)
);

PhotonBlock2 photon10(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__9),
.i_y(hit__9),
.i_z(dead__9),
//Outputs		
	.o_x(weight__10),
.o_y(hit__10),
.o_z(dead__10)
);

PhotonBlock2 photon9(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__8),
.i_y(hit__8),
.i_z(dead__8),
//Outputs		
	.o_x(weight__9),
.o_y(hit__9),
.o_z(dead__9)
);

PhotonBlock2 photon8(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__7),
.i_y(hit__7),
.i_z(dead__7),
//Outputs		
	.o_x(weight__8),
.o_y(hit__8),
.o_z(dead__8)
);

PhotonBlock2 photon7(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__6),
.i_y(hit__6),
.i_z(dead__6),
//Outputs		
	.o_x(weight__7),
.o_y(hit__7),
.o_z(dead__7)
);

PhotonBlock2 photon6(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__5),
.i_y(hit__5),
.i_z(dead__5),
//Outputs		
	.o_x(weight__6),
.o_y(hit__6),
.o_z(dead__6)
);

PhotonBlock2 photon5(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__4),
.i_y(hit__4),
.i_z(dead__4),
//Outputs		
	.o_x(weight__5),
.o_y(hit__5),
.o_z(dead__5)
);

PhotonBlock2 photon4(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__3),
.i_y(hit__3),
.i_z(dead__3),
//Outputs		
	.o_x(weight__4),
.o_y(hit__4),
.o_z(dead__4)
);

PhotonBlock2 photon3(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__2),
.i_y(hit__2),
.i_z(dead__2),
//Outputs		
	.o_x(weight__3),
.o_y(hit__3),
.o_z(dead__3)
);

PhotonBlock2 photon2(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__1),
.i_y(hit__1),
.i_z(dead__1),
//Outputs		
	.o_x(weight__2),
.o_y(hit__2),
.o_z(dead__2)
);

PhotonBlock2 photon1(
.clock(clock),
.reset(reset),
.enable(enable),
.i_x(weight__0),
.i_y(hit__0),
.i_z(dead__0),
//Outputs		
	.o_x(weight__1),
.o_y(hit__1),
.o_z(dead__1)
);


//////////////////////////////////////////////////////////////////////////////
//PIPELINE ir,iz,dwa
//////////////////////////////////////////////////////////////////////////////
//WIRES FOR CONNECTING REGISTERS
//wire	[32-1:0]			ir	[37:0];

wire	[32-1:0]				ir__0;
wire	[32-1:0]				ir__1;
wire	[32-1:0]				ir__2;
wire	[32-1:0]				ir__3;
wire	[32-1:0]				ir__4;
wire	[32-1:0]				ir__5;
wire	[32-1:0]				ir__6;
wire	[32-1:0]				ir__7;
wire	[32-1:0]				ir__8;
wire	[32-1:0]				ir__9;
wire	[32-1:0]				ir__10;
wire	[32-1:0]				ir__11;
wire	[32-1:0]				ir__12;
wire	[32-1:0]				ir__13;
wire	[32-1:0]				ir__14;
wire	[32-1:0]				ir__15;
wire	[32-1:0]				ir__16;
wire	[32-1:0]				ir__17;
wire	[32-1:0]				ir__18;
wire	[32-1:0]				ir__19;
wire	[32-1:0]				ir__20;
wire	[32-1:0]				ir__21;
wire	[32-1:0]				ir__22;
wire	[32-1:0]				ir__23;
wire	[32-1:0]				ir__24;
wire	[32-1:0]				ir__25;
wire	[32-1:0]				ir__26;
wire	[32-1:0]				ir__27;
wire	[32-1:0]				ir__28;
wire	[32-1:0]				ir__29;
wire	[32-1:0]				ir__30;
wire	[32-1:0]				ir__31;
wire	[32-1:0]				ir__32;
wire	[32-1:0]				ir__33;
wire	[32-1:0]				ir__34;
wire	[32-1:0]				ir__35;
wire	[32-1:0]				ir__36;
wire	[32-1:0]				ir__37;


//wire	[32-1:0]			iz	[37:0];


wire	[32-1:0]				iz__0;
wire	[32-1:0]				iz__1;
wire	[32-1:0]				iz__2;
wire	[32-1:0]				iz__3;
wire	[32-1:0]				iz__4;
wire	[32-1:0]				iz__5;
wire	[32-1:0]				iz__6;
wire	[32-1:0]				iz__7;
wire	[32-1:0]				iz__8;
wire	[32-1:0]				iz__9;
wire	[32-1:0]				iz__10;
wire	[32-1:0]				iz__11;
wire	[32-1:0]				iz__12;
wire	[32-1:0]				iz__13;
wire	[32-1:0]				iz__14;
wire	[32-1:0]				iz__15;
wire	[32-1:0]				iz__16;
wire	[32-1:0]				iz__17;
wire	[32-1:0]				iz__18;
wire	[32-1:0]				iz__19;
wire	[32-1:0]				iz__20;
wire	[32-1:0]				iz__21;
wire	[32-1:0]				iz__22;
wire	[32-1:0]				iz__23;
wire	[32-1:0]				iz__24;
wire	[32-1:0]				iz__25;
wire	[32-1:0]				iz__26;
wire	[32-1:0]				iz__27;
wire	[32-1:0]				iz__28;
wire	[32-1:0]				iz__29;
wire	[32-1:0]				iz__30;
wire	[32-1:0]				iz__31;
wire	[32-1:0]				iz__32;
wire	[32-1:0]				iz__33;
wire	[32-1:0]				iz__34;
wire	[32-1:0]				iz__35;
wire	[32-1:0]				iz__36;
wire	[32-1:0]				iz__37;


//wire	[32-1:0]			dwa	[37:0];


wire	[32-1:0]				dwa__0;
wire	[32-1:0]				dwa__1;
wire	[32-1:0]				dwa__2;
wire	[32-1:0]				dwa__3;
wire	[32-1:0]				dwa__4;
wire	[32-1:0]				dwa__5;
wire	[32-1:0]				dwa__6;
wire	[32-1:0]				dwa__7;
wire	[32-1:0]				dwa__8;
wire	[32-1:0]				dwa__9;
wire	[32-1:0]				dwa__10;
wire	[32-1:0]				dwa__11;
wire	[32-1:0]				dwa__12;
wire	[32-1:0]				dwa__13;
wire	[32-1:0]				dwa__14;
wire	[32-1:0]				dwa__15;
wire	[32-1:0]				dwa__16;
wire	[32-1:0]				dwa__17;
wire	[32-1:0]				dwa__18;
wire	[32-1:0]				dwa__19;
wire	[32-1:0]				dwa__20;
wire	[32-1:0]				dwa__21;
wire	[32-1:0]				dwa__22;
wire	[32-1:0]				dwa__23;
wire	[32-1:0]				dwa__24;
wire	[32-1:0]				dwa__25;
wire	[32-1:0]				dwa__26;
wire	[32-1:0]				dwa__27;
wire	[32-1:0]				dwa__28;
wire	[32-1:0]				dwa__29;
wire	[32-1:0]				dwa__30;
wire	[32-1:0]				dwa__31;
wire	[32-1:0]				dwa__32;
wire	[32-1:0]				dwa__33;
wire	[32-1:0]				dwa__34;
wire	[32-1:0]				dwa__35;
wire	[32-1:0]				dwa__36;
wire	[32-1:0]				dwa__37;


//ASSIGNMENTS FROM INPUTS TO PIPE
assign ir__0 = 32'b0;
assign iz__0 = 32'b0;
assign dwa__0 = 32'b0;

//GENERATE PIPELINE
//generate
//	for(i=`PIPE_DEPTH; i>0; i=i-1) begin: IrIzDwaPipe
//		case(i)
//		    
//		//NOTE: STAGE 14 --> REGISTER 14 on diagram !!   ir, iz 
//		15:   
//		begin
//
//		PhotonBlock1 photon(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_x(ir_temp),
//			.i_y(iz_temp),
//			.i_z(dwa[14]),
//			
//			//Outputs			
//			.o_x(ir[15]),
//			.o_y(iz[15]),
//			.o_z(dwa[15])
//		);		
//		
//		end    
//		
//		//NOTE: STAGE 4 --> REGISTER 4 on diagram !!   dwa  
//		5:   
//		begin
//		    
//		PhotonBlock1 photon(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_x(ir[4]),
//			.i_y(iz[4]),
//			.i_z(dwa_temp),
//			
//			//Outputs			
//			.o_x(ir[5]),
//			.o_y(iz[5]),
//			.o_z(dwa[5])
//		);		    
//		
//		end    
//				
//		default:
//		begin
//		    	    
//		PhotonBlock1 photon(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_x(ir[i-1]),
//			.i_y(iz[i-1]),
//			.i_z(dwa[i-1]),
//			
//			//Outputs			
//			.o_x(ir[i]),
//			.o_y(iz[i]),
//			.o_z(dwa[i])
//		);
//		end
//		endcase
//	end
//endgenerate	

//Expanded generation


//special cases first peter m

	

		PhotonBlock1 photon15q(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),
			
			.i_x(ir_temp),
			.i_y(iz_temp),
			.i_z(dwa__14),
			
			//Outputs			
			.o_x(ir__15),
			.o_y(iz__15),
			.o_z(dwa__15)
		);		
		

		
		//NOTE: STAGE 4 --> REGISTER 4 on diagram !!   dwa  

		    
		PhotonBlock1 photon5q(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),
			
			.i_x(ir__4),
			.i_y(iz__4),
			.i_z(dwa_temp),
			
			//Outputs			
			.o_x(ir__5),
			.o_y(iz__5),
			.o_z(dwa__5)
		);		

	PhotonBlock1 photon37q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__36),
.i_y(iz__36),
.i_z(dwa__36),
//Outputs		
	.o_x(ir__37),
.o_y(iz__37),
.o_z(dwa__37)
);
PhotonBlock1 photon36q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__35),
.i_y(iz__35),
.i_z(dwa__35),
//Outputs		
	.o_x(ir__36),
.o_y(iz__36),
.o_z(dwa__36)
);
PhotonBlock1 photon35q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__34),
.i_y(iz__34),
.i_z(dwa__34),
//Outputs		
	.o_x(ir__35),
.o_y(iz__35),
.o_z(dwa__35)
);
PhotonBlock1 photon34q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__33),
.i_y(iz__33),
.i_z(dwa__33),
//Outputs		
	.o_x(ir__34),
.o_y(iz__34),
.o_z(dwa__34)
);
PhotonBlock1 photon33q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__32),
.i_y(iz__32),
.i_z(dwa__32),
//Outputs		
	.o_x(ir__33),
.o_y(iz__33),
.o_z(dwa__33)
);
PhotonBlock1 photon32q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__31),
.i_y(iz__31),
.i_z(dwa__31),
//Outputs		
	.o_x(ir__32),
.o_y(iz__32),
.o_z(dwa__32)
);
PhotonBlock1 photon31q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__30),
.i_y(iz__30),
.i_z(dwa__30),
//Outputs		
	.o_x(ir__31),
.o_y(iz__31),
.o_z(dwa__31)
);
PhotonBlock1 photon30q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__29),
.i_y(iz__29),
.i_z(dwa__29),
//Outputs		
	.o_x(ir__30),
.o_y(iz__30),
.o_z(dwa__30)
);
PhotonBlock1 photon29q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__28),
.i_y(iz__28),
.i_z(dwa__28),
//Outputs		
	.o_x(ir__29),
.o_y(iz__29),
.o_z(dwa__29)
);
PhotonBlock1 photon28q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__27),
.i_y(iz__27),
.i_z(dwa__27),
//Outputs		
	.o_x(ir__28),
.o_y(iz__28),
.o_z(dwa__28)
);
PhotonBlock1 photon27q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__26),
.i_y(iz__26),
.i_z(dwa__26),
//Outputs		
	.o_x(ir__27),
.o_y(iz__27),
.o_z(dwa__27)
);
PhotonBlock1 photon26q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__25),
.i_y(iz__25),
.i_z(dwa__25),
//Outputs		
	.o_x(ir__26),
.o_y(iz__26),
.o_z(dwa__26)
);
PhotonBlock1 photon25q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__24),
.i_y(iz__24),
.i_z(dwa__24),
//Outputs		
	.o_x(ir__25),
.o_y(iz__25),
.o_z(dwa__25)
);
PhotonBlock1 photon24q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__23),
.i_y(iz__23),
.i_z(dwa__23),
//Outputs		
	.o_x(ir__24),
.o_y(iz__24),
.o_z(dwa__24)
);
PhotonBlock1 photon23q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__22),
.i_y(iz__22),
.i_z(dwa__22),
//Outputs		
	.o_x(ir__23),
.o_y(iz__23),
.o_z(dwa__23)
);
PhotonBlock1 photon22q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__21),
.i_y(iz__21),
.i_z(dwa__21),
//Outputs		
	.o_x(ir__22),
.o_y(iz__22),
.o_z(dwa__22)
);
PhotonBlock1 photon21q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__20),
.i_y(iz__20),
.i_z(dwa__20),
//Outputs		
	.o_x(ir__21),
.o_y(iz__21),
.o_z(dwa__21)
);
PhotonBlock1 photon20q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__19),
.i_y(iz__19),
.i_z(dwa__19),
//Outputs		
	.o_x(ir__20),
.o_y(iz__20),
.o_z(dwa__20)
);
PhotonBlock1 photon19q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__18),
.i_y(iz__18),
.i_z(dwa__18),
//Outputs		
	.o_x(ir__19),
.o_y(iz__19),
.o_z(dwa__19)
);
PhotonBlock1 photon18q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__17),
.i_y(iz__17),
.i_z(dwa__17),
//Outputs		
	.o_x(ir__18),
.o_y(iz__18),
.o_z(dwa__18)
);
PhotonBlock1 photon17q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__16),
.i_y(iz__16),
.i_z(dwa__16),
//Outputs		
	.o_x(ir__17),
.o_y(iz__17),
.o_z(dwa__17)
);
PhotonBlock1 photon16q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__15),
.i_y(iz__15),
.i_z(dwa__15),
//Outputs		
	.o_x(ir__16),
.o_y(iz__16),
.o_z(dwa__16)
);




PhotonBlock1 photon14q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__13),
.i_y(iz__13),
.i_z(dwa__13),
//Outputs		
	.o_x(ir__14),
.o_y(iz__14),
.o_z(dwa__14)
);
PhotonBlock1 photon13q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__12),
.i_y(iz__12),
.i_z(dwa__12),
//Outputs		
	.o_x(ir__13),
.o_y(iz__13),
.o_z(dwa__13)
);
PhotonBlock1 photon12q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__11),
.i_y(iz__11),
.i_z(dwa__11),
//Outputs		
	.o_x(ir__12),
.o_y(iz__12),
.o_z(dwa__12)
);
PhotonBlock1 photon11q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__10),
.i_y(iz__10),
.i_z(dwa__10),
//Outputs		
	.o_x(ir__11),
.o_y(iz__11),
.o_z(dwa__11)
);
PhotonBlock1 photon10q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__9),
.i_y(iz__9),
.i_z(dwa__9),
//Outputs		
	.o_x(ir__10),
.o_y(iz__10),
.o_z(dwa__10)
);
PhotonBlock1 photon9q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__8),
.i_y(iz__8),
.i_z(dwa__8),
//Outputs		
	.o_x(ir__9),
.o_y(iz__9),
.o_z(dwa__9)
);
PhotonBlock1 photon8q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__7),
.i_y(iz__7),
.i_z(dwa__7),
//Outputs		
	.o_x(ir__8),
.o_y(iz__8),
.o_z(dwa__8)
);
PhotonBlock1 photon7q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__6),
.i_y(iz__6),
.i_z(dwa__6),
//Outputs		
	.o_x(ir__7),
.o_y(iz__7),
.o_z(dwa__7)
);
PhotonBlock1 photon6q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__5),
.i_y(iz__5),
.i_z(dwa__5),
//Outputs		
	.o_x(ir__6),
.o_y(iz__6),
.o_z(dwa__6)
);



PhotonBlock1 photon4q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__3),
.i_y(iz__3),
.i_z(dwa__3),
//Outputs		
	.o_x(ir__4),
.o_y(iz__4),
.o_z(dwa__4)
);
PhotonBlock1 photon3q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__2),
.i_y(iz__2),
.i_z(dwa__2),
//Outputs		
	.o_x(ir__3),
.o_y(iz__3),
.o_z(dwa__3)
);
PhotonBlock1 photon2q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__1),
.i_y(iz__1),
.i_z(dwa__1),
//Outputs		
	.o_x(ir__2),
.o_y(iz__2),
.o_z(dwa__2)
);
PhotonBlock1 photon1q(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_x(ir__0),
.i_y(iz__0),
.i_z(dwa__0),
//Outputs		
	.o_x(ir__1),
.o_y(iz__1),
.o_z(dwa__1)
);
	


//////////////////////////////////////////////////////////////////////////////
//STAGE BY STAGE PIPELINE DESIGN
//////////////////////////////////////////////////////////////////////////////

///////////////STAGE 2 - square of x and y/////////////////////////
always @(reset or x_pipe or y_pipe) begin
	if (reset)	begin      
		x2_temp=0;      
		y2_temp=0;
	end
	else	begin
	   x2_temp=x_pipe*x_pipe;     
	   y2_temp=y_pipe*y_pipe;
	end 
end

///////////////STAGE 3 - square of r/////////////////////////
always @(reset or x2_P or y2_P) begin
	if (reset)
		r2_temp=0; 
	else 
		r2_temp=x2_P+y2_P; 
end

///////////////STAGE 4 - Find r and dwa/////////////////////////
//Create MUX
always@(layer_pipe or muaFraction1 or muaFraction2 or muaFraction3 or muaFraction4 or muaFraction5)  
   case(layer_pipe) 
       1: fractionScaled=muaFraction1; 
       2: fractionScaled=muaFraction2; 
       3: fractionScaled=muaFraction3; 
       4: fractionScaled=muaFraction4; 
       5: fractionScaled=muaFraction5; 
       default: fractionScaled=0; //Sys Reset case
   endcase


always @(reset or weight__4 or r_P_wire or weight_P4 or fractionScaled or product64bit or dead__4 or hit__4) begin
	if (reset) begin
	   weight_P4=0; 
		r_P=0;  
      product64bit=0; 
      dwa_temp=0; 
   end
	else begin
	   weight_P4=weight__4;    
		r_P=r_P_wire;  //Connect to sqrt block
      product64bit=weight_P4*fractionScaled; 
  
      //Checking corner cases
      if (dead__4==1)       //Dead photon
         dwa_temp=weight_P4;//drop all its weight
      else if (hit__4==1)   //Hit Boundary 
         dwa_temp=0;        //Don't add to absorption array
      else
         dwa_temp=product64bit[63:32]; 	  
	end	
end

assign r2_P_wire=r2_P; 

Sqrt_64b	squareRoot (
				.clk(clock),
				.num_(r2_P_wire),
				.res(r_P_wire)
			);
			
///////////////STAGE 14 - Find ir and iz/////////////////////////
always @(reset or r_P or z_pipe or dead__14 or hit__14 or iz_temp or ir_temp) begin
	if (reset) begin
		ir_temp=0; 
		iz_temp=0;
	end	

	//Checking corner cases!!!
	else begin
		//ir_temp=r_P>>`RGRID_SCLAE_EXP; 
		//iz_temp=z_pipe>>`ZGRID_SCLAE_EXP;
		if (dead__14==1) begin 
			ir_temp=`NR-1;    
			iz_temp=`NZ-1; 
		end
		else if (hit__14==1) begin 
			ir_temp=0;
			iz_temp=0; 
		end 
		else begin
			if ((z_pipe>>`ZGRID_SCLAE_EXP) >=`NZ ) begin
				iz_temp=`NZ-1;
			end 
			else begin
				iz_temp=z_pipe>>`ZGRID_SCLAE_EXP;
			end
			
			if ((r_P>>`RGRID_SCLAE_EXP) >= `NR ) begin
				ir_temp=`NR-1;
			end
			else begin
				ir_temp=r_P>>`RGRID_SCLAE_EXP; 
			end
		end

//		if (iz_temp>=`NZ) begin
//			iz_temp=`NZ-1;   
//		end
//
//  
//		if (ir_temp>=`NR) begin
//			ir_temp=`NR-1; 
//		end

         
	end
end

///////////////STAGE 15 - Compute MEM address/////////////////////////
always @(reset or ir__15 or iz__15 or ir_P or iz_P or ir_scaled) begin
	if (reset) begin
	   ir_P=0; 
	   iz_P=0; 
	   ir_scaled=0; 
      rADDR_temp=0; 
   end
	else begin
	   ir_P=ir__15; 
	   iz_P=iz__15; 
	   ir_scaled=ir_P<<`NR_EXP;  
      rADDR_temp=ir_scaled[15:0] + iz_P[15:0]; 		
   end
end

///////////////STAGE 16 - MEM read/////////////////////////
always @(reset or ir__16 or ir__17 or iz__16 or iz__17 or ir__18 or iz__18 or newAbs_P or q or newAbs_temp) begin
	if (reset) begin
		oldAbs_MEM=0; 
	end else begin
	   //Check Corner cases (RAW hazards) 
      if ((ir__16==ir__17) && (iz__16==iz__17)) begin
         oldAbs_MEM=newAbs_temp; 
      end else if ((ir__16==ir__18) && (iz__16==iz__18)) begin   
         oldAbs_MEM=newAbs_P;       //RAW hazard
      end else begin
         oldAbs_MEM=q;   //Connect to REAL dual-port MEM 
		end
	end
	
end

///////////////STAGE 17 - Update Weight/////////////////////////
//TO BE TESTED!!!
always @(reset or dwa__17 or weight__17 or weight_P or dwa_P or oldAbs_P) begin
	if(reset) begin
	   dwa_P=0;   //How to specify Base 10??? 
		weight_P=0; 
		newWeight = 0;
		newAbs_temp =0; 
   end
	else begin
	   dwa_P=dwa__17;
	   weight_P=weight__17; 
		newWeight=weight_P-dwa_P; 
		newAbs_temp=oldAbs_P+dwa_P;   //Check bit width casting (64-bit<--64-bit+32-bit)
   end 
end    
		
//////////////////////////////////////////////////////////////////////////////
//STAGE BY STAGE - EXTRA REGISTERS
//////////////////////////////////////////////////////////////////////////////   
always @ (posedge clock) 
begin
	if (reset) begin	    
	  //Stage 2
	  x2_P<=0;         
	  y2_P<=0;
	  
	  //Stage 3
	  r2_P<=0;	  
	  
	  //Stage 15
     rADDR_16<=0; 

	  //Stage 16 
	  oldAbs_P<=0; 
	  rADDR_17<=0; 
	  
	  //Stage 17
	  newAbs_P<=0; 
	 // wADDR <=0; 
	end
	
	else if (enable) begin	    
	  //Stage 2
	  x2_P<=x2_temp;    //From comb logic above
	  y2_P<=y2_temp;    
      
 	  //Stage 3
 	  r2_P<=r2_temp;   

	  //Stage 15
     rADDR_16<=rADDR_temp; 
     
     //Stage 16 
	  oldAbs_P<=oldAbs_MEM; 
	  rADDR_17<=rADDR_16; 
	  	     
     //Stage 17
     newAbs_P<=newAbs_temp; 
   //  wADDR <=rADDR_17; 
	end
end

//////////////////////////////////////////////////////////////////////////////
//INTERFACE to on-chip MEM
//////////////////////////////////////////////////////////////////////////////   
always @ (posedge clock) 
begin
	if (reset) 
		  wren <=0; 
	else
		  wren<=1;          //Memory enabled every cycle after global enable 
end	
	    
assign rdaddress=rADDR_temp; 
assign wraddress=rADDR_17; 

assign data=newAbs_temp; 

endmodule
module PhotonBlock1(
	//Inputs
	clock,
	reset,
	enable,
	
   i_x, 
   i_y, 
   i_z, 

	//Outputs
	o_x,
	o_y,
	o_z
	);

//////////////////////////////////////////////////////////////////////////////
//PARAMETERS
//////////////////////////////////////////////////////////////////////////////
//parameter BIT_WIDTH=32;

input				clock;
input				reset;
input				enable;

input	[`BIT_WIDTH-1:0]			i_x;
input	[`BIT_WIDTH-1:0]			i_y;
input	[`BIT_WIDTH-1:0]			i_z;


output	[`BIT_WIDTH-1:0]			o_x;
output	[`BIT_WIDTH-1:0]			o_y;
output	[`BIT_WIDTH-1:0]			o_z;

wire				clock;
wire				reset;
wire				enable;

wire	[`BIT_WIDTH-1:0]			i_x;
wire	[`BIT_WIDTH-1:0]			i_y;
wire	[`BIT_WIDTH-1:0]			i_z;

reg	[`BIT_WIDTH-1:0]			o_x;
reg	[`BIT_WIDTH-1:0]			o_y;
reg	[`BIT_WIDTH-1:0]			o_z;

always @ (posedge clock)
	if(reset) begin
		o_x		<=	{`BIT_WIDTH{1'b0}} ;
		o_y		<=	{`BIT_WIDTH{1'b0}};
		o_z		<=	{`BIT_WIDTH{1'b0}};
	end else if(enable) begin
		o_x		<=	i_x;
		o_y		<=	i_y;
		o_z		<=	i_z;
	end
endmodule
module PhotonBlock2(
	//Inputs
	clock,
	reset,
	enable,
	
   i_x, 
   i_y, 
   i_z, 

	//Outputs
	o_x,
	o_y,
	o_z
	);

//////////////////////////////////////////////////////////////////////////////
//PARAMETERS
//////////////////////////////////////////////////////////////////////////////
//parameter BIT_WIDTH=32;

input				clock;
input				reset;
input				enable;

input	[`BIT_WIDTH-1:0]			i_x;
input	i_y;
input	i_z;


output	[`BIT_WIDTH-1:0]			o_x;
output	o_y;
output	o_z;

wire				clock;
wire				reset;
wire				enable;

wire	[`BIT_WIDTH-1:0]			i_x;
wire	i_y;
wire	i_z;

reg	[`BIT_WIDTH-1:0]			o_x;
reg	o_y;
reg	o_z;

always @ (posedge clock)
	if(reset) begin
		o_x		<=	{`BIT_WIDTH{1'b0}} ;
		o_y		<=	1'b0;
		o_z		<=	1'b0;
	end else if(enable) begin
		o_x		<=	i_x;
		o_y		<=	i_y;
		o_z		<=	i_z;
	end
endmodule

module Sqrt_64b (clk, num_, res);
	input clk;
	input [63:0]num_;
	output [31:0]res;
	reg [31:0]res;
	
	reg [63:0]num;
	
	always @ (posedge clk)
	begin
		num <= num_;
	end
	
///////////////////////////////////////////////////Unchanged starts here
	
//	reg [63:0] one_[32:0];
//	reg [63:0] res_[32:0];
//	reg [63:0] op_[32:0];

	wire [63:0]one__0;
    reg  [63:0]one__1;
    reg  [63:0]one__2;
    reg  [63:0]one__3_d, one__3_q;
    reg  [63:0]one__4;
    reg  [63:0]one__5;
    reg  [63:0]one__6;
    reg  [63:0]one__7_d, one__7_q;
    reg  [63:0]one__8;
    reg  [63:0]one__9;
    reg  [63:0]one__10;
    reg  [63:0]one__11_d, one__11_q;
    reg  [63:0]one__12;
    reg  [63:0]one__13;
    reg  [63:0]one__14;
    reg  [63:0]one__15_d, one__15_q;
    reg  [63:0]one__16;
    reg  [63:0]one__17;
    reg  [63:0]one__18_d, one__18_q;
    reg  [63:0]one__19;
    reg  [63:0]one__20;
    reg  [63:0]one__21_d, one__21_q;
    reg  [63:0]one__22;
    reg  [63:0]one__23;
    reg  [63:0]one__24_d, one__24_q;
    reg  [63:0]one__25;
    reg  [63:0]one__26;
    reg  [63:0]one__27_d, one__27_q;
    reg  [63:0]one__28;
    reg  [63:0]one__29;
    reg  [63:0]one__30_d, one__30_q;
    reg  [63:0]one__31;
	reg  [63:0]one__32;

	wire [63:0]res__0;
    reg  [63:0]res__1;
    reg  [63:0]res__2;
    reg  [63:0]res__3_d, res__3_q;
    reg  [63:0]res__4;
    reg  [63:0]res__5;
    reg  [63:0]res__6;
    reg  [63:0]res__7_d, res__7_q;
    reg  [63:0]res__8;
    reg  [63:0]res__9;
    reg  [63:0]res__10;
    reg  [63:0]res__11_d, res__11_q;
    reg  [63:0]res__12;
    reg  [63:0]res__13;
    reg  [63:0]res__14;
    reg  [63:0]res__15_d, res__15_q;
    reg  [63:0]res__16;
    reg  [63:0]res__17;
    reg  [63:0]res__18_d, res__18_q;
    reg  [63:0]res__19;
    reg  [63:0]res__20;
    reg  [63:0]res__21_d, res__21_q;
    reg  [63:0]res__22;
    reg  [63:0]res__23;
    reg  [63:0]res__24_d, res__24_q;
    reg  [63:0]res__25;
    reg  [63:0]res__26;
    reg  [63:0]res__27_d, res__27_q;
    reg  [63:0]res__28;
    reg  [63:0]res__29;
    reg  [63:0]res__30_d, res__30_q;
    reg  [63:0]res__31;
	reg  [63:0]res__32;
    
	wire [63:0]op__0;
	reg  [63:0]op__1;
    reg  [63:0]op__2;
    reg  [63:0]op__3_d, op__3_q;
    reg  [63:0]op__4;
    reg  [63:0]op__5;
    reg  [63:0]op__6;
    reg  [63:0]op__7_d, op__7_q;
    reg  [63:0]op__8;
    reg  [63:0]op__9;
    reg  [63:0]op__10;
    reg  [63:0]op__11_d, op__11_q;
    reg  [63:0]op__12;
    reg  [63:0]op__13;
    reg  [63:0]op__14;
    reg  [63:0]op__15_d, op__15_q;
    reg  [63:0]op__16;
    reg  [63:0]op__17;
    reg  [63:0]op__18_d, op__18_q;
    reg  [63:0]op__19;
    reg  [63:0]op__20;
    reg  [63:0]op__21_d, op__21_q;
    reg  [63:0]op__22;
    reg  [63:0]op__23;
    reg  [63:0]op__24_d, op__24_q;
    reg  [63:0]op__25;
    reg  [63:0]op__26;
    reg  [63:0]op__27_d, op__27_q;
    reg  [63:0]op__28;
    reg  [63:0]op__29;
    reg  [63:0]op__30_d, op__30_q;
    reg  [63:0]op__31;
	reg  [63:0]op__32;

	
	reg [63:0]one; //This is the one that is selected in first expanded loop
	reg [31:0]one_tmp;
	
	always @ (num) begin
		
		//The first for-loop:
		//all of these will be zero no matter how 'one' is selected.
		one[1] = 0;
		one[3] = 0;
		one[5] = 0;
		one[7] = 0;
		one[9] = 0;
		one[11] = 0;
		one[13] = 0;
		one[15] = 0;
		one[17] = 0;
		one[19] = 0;
		one[21] = 0;
		one[23] = 0;
		one[25] = 0;
		one[27] = 0;
		one[29] = 0;
		one[31] = 0;
		one[33] = 0;
		one[35] = 0;
		one[37] = 0;
		one[39] = 0;
		one[41] = 0;
		one[43] = 0;
		one[45] = 0;
		one[47] = 0;
		one[49] = 0;
		one[51] = 0;
		one[53] = 0;
		one[55] = 0;
		one[57] = 0;
		one[59] = 0;
		one[61] = 0;
		one[63] = 0;
		
		one_tmp[0] = num[0]|num[1];
		one_tmp[1] = num[2]|num[3];
		one_tmp[2] = num[4]|num[5];
		one_tmp[3] = num[6]|num[7];
		one_tmp[4] = num[8]|num[9];
		one_tmp[5] = num[10]|num[11];
		one_tmp[6] = num[12]|num[13];
		one_tmp[7] = num[14]|num[15];
		one_tmp[8] = num[16]|num[17];
		one_tmp[9] = num[18]|num[19];
		one_tmp[10] = num[20]|num[21];
		one_tmp[11] = num[22]|num[23];
		one_tmp[12] = num[24]|num[25];
		one_tmp[13] = num[26]|num[27];
		one_tmp[14] = num[28]|num[29];
		one_tmp[15] = num[30]|num[31];
		one_tmp[16] = num[32]|num[33];
		one_tmp[17] = num[34]|num[35];
		one_tmp[18] = num[36]|num[37];
		one_tmp[19] = num[38]|num[39];
		one_tmp[20] = num[40]|num[41];
		one_tmp[21] = num[42]|num[43];
		one_tmp[22] = num[44]|num[45];
		one_tmp[23] = num[46]|num[47];
		one_tmp[24] = num[48]|num[49];
		one_tmp[25] = num[50]|num[51];
		one_tmp[26] = num[52]|num[53];
		one_tmp[27] = num[54]|num[55];
		one_tmp[28] = num[56]|num[57];
		one_tmp[29] = num[58]|num[59];
		one_tmp[30] = num[60]|num[61];
		one_tmp[31] = num[62]|num[63];
		
		one[0] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&~one_tmp[2]&~one_tmp[1]&one_tmp[0];
		one[2] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&~one_tmp[2]&one_tmp[1];
		one[4] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&one_tmp[2];
		one[6] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&one_tmp[3];
		one[8] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&one_tmp[4];
		one[10] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&one_tmp[5];
		one[12] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&one_tmp[6];
		one[14] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&one_tmp[7];
		one[16] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&one_tmp[8];
		one[18] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&one_tmp[9];
		one[20] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&one_tmp[10];
		one[22] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&one_tmp[11];
		one[24] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&one_tmp[12];
		one[26] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&one_tmp[13];
		one[28] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&one_tmp[14];
		one[30] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&one_tmp[15];
		one[32] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&one_tmp[16];
		one[34] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&one_tmp[17];
		one[36] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&one_tmp[18];
		one[38] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&one_tmp[19];
		one[40] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&one_tmp[20];
		one[42] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&one_tmp[21];
		one[44] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&one_tmp[22];
		one[46] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&one_tmp[23];
		one[48] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&one_tmp[24];
		one[50] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&one_tmp[25];
		one[52] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&one_tmp[26];
		one[54] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&one_tmp[27];
		one[56] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&one_tmp[28];
		one[58] = ~one_tmp[31]&~one_tmp[30]&one_tmp[29];
		one[60] = ~one_tmp[31]&one_tmp[30];
		one[62] = one_tmp[31];
	end
	
//	//2nd for-loop:
//	integer i;
//	always @* begin
//		op_[0] = num;
//		one_[0] = one;
//		res_[0] = 64'b0;
//		res = 63'b0;
//		res_assigned = 1'b0;
//	
//		for (i = 0; i <= 31; i=i+1) begin
//			if ((one_[i] == 0) & ~res_assigned) begin
//				res = res_[i];
//				res_assigned = 1'b1;
//			end
//			
//			//Define the next stage:
//			if (op_[i] >= res_[i] + one_[i]) begin
//				op_[i+1] = op_[i] - res_[i] - one_[i];
//				res_[i+1] = (res_[i]>>1) + one_[i];
//			end else begin
//				op_[i+1] = op_[i]; //this line had to be added for the verilog version.
//				res_[i+1] = (res_[i]>>1);
//			end
//			one_[i+1] = (one_[i] >> 2);
//		end
//	
//		//Add the part for really big numbers later:
//		if (~res_assigned) begin
//			res = res_[32];
//		end
//	end

	//If-statement about defining the next stage:
	assign op__0 = num;
	assign res__0 = 64'b0;
	assign one__0 = one;
	
	always @ (res__0 or op__0 or one__0) begin

       //i = 0
       if (op__0 >= res__0 + one__0) begin
           op__1 = op__0 - res__0 - one__0;
           res__1 = (res__0>>1) + one__0;
       end else begin
           op__1 = op__0;
           res__1 = (res__0>>1);
       end
       one__1 = (one__0 >> 2);

       //i = 1
       if (op__1 >= res__1 + one__1) begin
           op__2 = op__1 - res__1 - one__1;
           res__2 = (res__1>>1) + one__1;
       end else begin
           op__2 = op__1;
           res__2 = (res__1>>1);
       end
       one__2 = (one__1 >> 2);

       //i = 2
       if (op__2 >= res__2 + one__2) begin
           op__3_d = op__2 - res__2 - one__2;
           res__3_d = (res__2>>1) + one__2;
       end else begin
           op__3_d = op__2;
           res__3_d = (res__2>>1);
       end
       one__3_d = (one__2 >> 2);
	end
	
	always @ (posedge clk) begin
		op__3_q <= op__3_d;
		res__3_q <= res__3_d;
		one__3_q <= one__3_d;
	end
	
	always @ (op__3_q or res__3_q or one__3_q) begin
       //i = 3
       if (op__3_q >= res__3_q + one__3_q) begin
           op__4 = op__3_q - res__3_q - one__3_q;
           res__4 = (res__3_q>>1) + one__3_q;
       end else begin
           op__4 = op__3_q;
           res__4 = (res__3_q>>1);
       end
       one__4 = (one__3_q >> 2);

       //i = 4
       if (op__4 >= res__4 + one__4) begin
           op__5 = op__4 - res__4 - one__4;
           res__5 = (res__4>>1) + one__4;
       end else begin
           op__5 = op__4;
           res__5 = (res__4>>1);
       end
       one__5 = (one__4 >> 2);

       //i = 5
       if (op__5 >= res__5 + one__5) begin
           op__6 = op__5 - res__5 - one__5;
           res__6 = (res__5>>1) + one__5;
       end else begin
           op__6 = op__5;
           res__6 = (res__5>>1);
       end
       one__6 = (one__5 >> 2);

       //i = 6
       if (op__6 >= res__6 + one__6) begin
           op__7_d = op__6 - res__6 - one__6;
           res__7_d = (res__6>>1) + one__6;
       end else begin
           op__7_d = op__6;
           res__7_d = (res__6>>1);
       end
       one__7_d = (one__6 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__7_q <= op__7_d;
		one__7_q <= one__7_d;
		res__7_q <= res__7_d;
	end
	
	always @ (op__7_q or res__7_q or one__7_q) begin
       //i = 7
       if (op__7_q >= res__7_q + one__7_q) begin
           op__8 = op__7_q - res__7_q - one__7_q;
           res__8 = (res__7_q>>1) + one__7_q;
       end else begin
           op__8 = op__7_q;
           res__8 = (res__7_q>>1);
       end
       one__8 = (one__7_q >> 2);

       //i = 8
       if (op__8 >= res__8 + one__8) begin
           op__9 = op__8 - res__8 - one__8;
           res__9 = (res__8>>1) + one__8;
       end else begin
           op__9 = op__8;
           res__9 = (res__8>>1);
       end
       one__9 = (one__8 >> 2);

       //i = 9
       if (op__9 >= res__9 + one__9) begin
           op__10 = op__9 - res__9 - one__9;
           res__10 = (res__9>>1) + one__9;
       end else begin
           op__10 = op__9;
           res__10 = (res__9>>1);
       end
       one__10 = (one__9 >> 2);

       //i = 10
       if (op__10 >= res__10 + one__10) begin
           op__11_d = op__10 - res__10 - one__10;
           res__11_d = (res__10>>1) + one__10;
       end else begin
           op__11_d = op__10;
           res__11_d = (res__10>>1);
       end
       one__11_d = (one__10 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__11_q <= op__11_d;
		one__11_q <= one__11_d;
		res__11_q <= res__11_d;
	end
	
	always @ (op__11_q or res__11_q or one__11_q) begin	 
       //i = 11
       if (op__11_q >= res__11_q + one__11_q) begin
           op__12 = op__11_q - res__11_q - one__11_q;
           res__12 = (res__11_q>>1) + one__11_q;
       end else begin
           op__12 = op__11_q;
           res__12 = (res__11_q>>1);
       end
       one__12 = (one__11_q >> 2);

       //i = 12
       if (op__12 >= res__12 + one__12) begin
           op__13 = op__12 - res__12 - one__12;
           res__13 = (res__12>>1) + one__12;
       end else begin
           op__13 = op__12;
           res__13 = (res__12>>1);
       end
       one__13 = (one__12 >> 2);

       //i = 13
       if (op__13 >= res__13 + one__13) begin
           op__14 = op__13 - res__13 - one__13;
           res__14 = (res__13>>1) + one__13;
       end else begin
           op__14 = op__13;
           res__14 = (res__13>>1);
       end
       one__14 = (one__13 >> 2);

       //i = 14
       if (op__14 >= res__14 + one__14) begin
           op__15_d = op__14 - res__14 - one__14;
           res__15_d = (res__14>>1) + one__14;
       end else begin
           op__15_d = op__14;
           res__15_d = (res__14>>1);
       end
       one__15_d = (one__14 >> 2);
	end
	
	always @ (posedge clk) begin
		op__15_q <= op__15_d;
		one__15_q <= one__15_d;
		res__15_q <= res__15_d;
	end
	
	always @ (op__15_q or res__15_q or one__15_q) begin
       //i = 15
       if (op__15_q >= res__15_q + one__15_q) begin
           op__16 = op__15_q - res__15_q - one__15_q;
           res__16 = (res__15_q>>1) + one__15_q;
       end else begin
           op__16 = op__15_q;
           res__16 = (res__15_q>>1);
       end
       one__16 = (one__15_q >> 2);

       //i = 16
       if (op__16 >= res__16 + one__16) begin
           op__17 = op__16 - res__16 - one__16;
           res__17 = (res__16>>1) + one__16;
       end else begin
           op__17 = op__16;
           res__17 = (res__16>>1);
       end
       one__17 = (one__16 >> 2);

       //i = 17
       if (op__17 >= res__17 + one__17) begin
           op__18_d = op__17 - res__17 - one__17;
           res__18_d = (res__17>>1) + one__17;
       end else begin
           op__18_d = op__17;
           res__18_d = (res__17>>1);
       end
       one__18_d = (one__17 >> 2);
	end
	
	always @ (posedge clk) begin
		op__18_q <= op__18_d;
		one__18_q <= one__18_d;
		res__18_q <= res__18_d;
	end
	
	always @ (op__18_q or res__18_q or one__18_q) begin
       //i = 18
       if (op__18_q >= res__18_q + one__18_q) begin
           op__19 = op__18_q - res__18_q - one__18_q;
           res__19 = (res__18_q>>1) + one__18_q;
       end else begin
           op__19 = op__18_q;
           res__19 = (res__18_q>>1);
       end
       one__19 = (one__18_q >> 2);

       //i = 19
       if (op__19 >= res__19 + one__19) begin
           op__20 = op__19 - res__19 - one__19;
           res__20 = (res__19>>1) + one__19;
       end else begin
           op__20 = op__19;
           res__20 = (res__19>>1);
       end
       one__20 = (one__19 >> 2);

       //i = 20
       if (op__20 >= res__20 + one__20) begin
           op__21_d = op__20 - res__20 - one__20;
           res__21_d = (res__20>>1) + one__20;
       end else begin
           op__21_d = op__20;
           res__21_d = (res__20>>1);
       end
       one__21_d = (one__20 >> 2);
	end
	
	always @ (posedge clk) begin
		op__21_q <= op__21_d;
		one__21_q <= one__21_d;
		res__21_q <= res__21_d;
	end
		 
	always @ (op__21_q or res__21_q or one__21_q) begin 
       //i = 21
       if (op__21_q >= res__21_q + one__21_q) begin
           op__22 = op__21_q - res__21_q - one__21_q;
           res__22 = (res__21_q>>1) + one__21_q;
       end else begin
           op__22 = op__21_q;
           res__22 = (res__21_q>>1);
       end
       one__22 = (one__21_q >> 2);

       //i = 22
       if (op__22 >= res__22 + one__22) begin
           op__23 = op__22 - res__22 - one__22;
           res__23 = (res__22>>1) + one__22;
       end else begin
           op__23 = op__22;
           res__23 = (res__22>>1);
       end
       one__23 = (one__22 >> 2);

       //i = 23
       if (op__23 >= res__23 + one__23) begin
           op__24_d = op__23 - res__23 - one__23;
           res__24_d = (res__23>>1) + one__23;
       end else begin
           op__24_d = op__23;
           res__24_d = (res__23>>1);
       end
       one__24_d = (one__23 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__24_q <= op__24_d;
		one__24_q <= one__24_d;
		res__24_q <= res__24_d;
	end
		  
	always @ (op__24_q or res__24_q or one__24_q) begin
       //i = 24
       if (op__24_q >= res__24_q + one__24_q) begin
           op__25 = op__24_q - res__24_q - one__24_q;
           res__25 = (res__24_q>>1) + one__24_q;
       end else begin
           op__25 = op__24_q;
           res__25 = (res__24_q>>1);
       end
       one__25 = (one__24_q >> 2);

       //i = 25
       if (op__25 >= res__25 + one__25) begin
           op__26 = op__25 - res__25 - one__25;
           res__26 = (res__25>>1) + one__25;
       end else begin
           op__26 = op__25;
           res__26 = (res__25>>1);
       end
       one__26 = (one__25 >> 2);

       //i = 26
       if (op__26 >= res__26 + one__26) begin
           op__27_d = op__26 - res__26 - one__26;
           res__27_d = (res__26>>1) + one__26;
       end else begin
           op__27_d = op__26;
           res__27_d = (res__26>>1);
       end
       one__27_d = (one__26 >> 2);
	end

	always @ (posedge clk) begin
		op__27_q <= op__27_d;
		one__27_q <= one__27_d;
		res__27_q <= res__27_d;
	end
	
	always @ (op__27_q or res__27_q or one__27_q) begin
       //i = 27
       if (op__27_q >= res__27_q + one__27_q) begin
           op__28 = op__27_q - res__27_q - one__27_q;
           res__28 = (res__27_q>>1) + one__27_q;
       end else begin
           op__28 = op__27_q;
           res__28 = (res__27_q>>1);
       end
       one__28 = (one__27_q >> 2);

       //i = 28
       if (op__28 >= res__28 + one__28) begin
           op__29 = op__28 - res__28 - one__28;
           res__29 = (res__28>>1) + one__28;
       end else begin
           op__29 = op__28;
           res__29 = (res__28>>1);
       end
       one__29 = (one__28 >> 2);

       //i = 29
       if (op__29 >= res__29 + one__29) begin
           op__30_d = op__29 - res__29 - one__29;
           res__30_d = (res__29>>1) + one__29;
       end else begin
           op__30_d = op__29;
           res__30_d = (res__29>>1);
       end
       one__30_d = (one__29 >> 2);
	end
	
	always @ (posedge clk) begin
		op__30_q <= op__30_d;
		one__30_q <= one__30_d;
		res__30_q <= res__30_d;
	end
	
	always @* begin
       //i = 30
       if (op__30_q >= res__30_q + one__30_q) begin
           op__31 = op__30_q - res__30_q - one__30_q;
           res__31 = (res__30_q>>1) + one__30_q;
       end else begin
           op__31 = op__30_q;
           res__31 = (res__30_q>>1);
       end
       one__31 = (one__30_q >> 2);

       //i = 31
       if (op__31 >= res__31 + one__31) begin
           op__32 = op__31 - res__31 - one__31;
           res__32 = (res__31>>1) + one__31;
       end else begin
           op__32 = op__31;
           res__32 = (res__31>>1);
       end
       one__32 = (one__31 >> 2);
	end


	//If-statement about assigning res:
	always @* begin
		if(one__0 == 0) begin
			res = res__0[31:0];
         end else if (one__1 == 0) begin
             res = res__1[31:0];
         end else if (one__2 == 0) begin
             res = res__2[31:0];
         end else if (one__3_q == 0) begin
             res = res__3_q[31:0];
         end else if (one__4 == 0) begin
             res = res__4[31:0];
         end else if (one__5 == 0) begin
             res = res__5[31:0];
         end else if (one__6 == 0) begin
             res = res__6[31:0];
         end else if (one__7_q == 0) begin
             res = res__7_q[31:0];
         end else if (one__8 == 0) begin
             res = res__8[31:0];
         end else if (one__9 == 0) begin
             res = res__9[31:0];
         end else if (one__10 == 0) begin
             res = res__10[31:0];
         end else if (one__11_q == 0) begin
             res = res__11_q[31:0];
         end else if (one__12 == 0) begin
             res = res__12[31:0];
         end else if (one__13 == 0) begin
             res = res__13[31:0];
         end else if (one__14 == 0) begin
             res = res__14[31:0];
         end else if (one__15_q == 0) begin
             res = res__15_q[31:0];
         end else if (one__16 == 0) begin
             res = res__16[31:0];
         end else if (one__17 == 0) begin
             res = res__17[31:0];
         end else if (one__18_q == 0) begin
             res = res__18_q[31:0];
         end else if (one__19 == 0) begin
             res = res__19[31:0];
         end else if (one__20 == 0) begin
             res = res__20[31:0];
         end else if (one__21_q == 0) begin
             res = res__21_q[31:0];
         end else if (one__22 == 0) begin
             res = res__22[31:0];
         end else if (one__23 == 0) begin
             res = res__23[31:0];
         end else if (one__24_q == 0) begin
             res = res__24_q[31:0];
         end else if (one__25 == 0) begin
             res = res__25[31:0];
         end else if (one__26 == 0) begin
             res = res__26[31:0];
         end else if (one__27_q == 0) begin
             res = res__27_q[31:0];
         end else if (one__28 == 0) begin
             res = res__28[31:0];
         end else if (one__29 == 0) begin
             res = res__29[31:0];
         end else if (one__30_q == 0) begin
             res = res__30_q[31:0];
         end else if (one__31 == 0) begin
             res = res__31[31:0];
		end else begin
			 res = res__32[31:0];
		end
		
	end

	
endmodule 	



