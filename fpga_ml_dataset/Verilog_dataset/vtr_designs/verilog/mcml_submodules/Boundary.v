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

module Boundary ( //INPUTS
				 clock, reset, enable,
				 x_mover, y_mover, z_mover,
				 ux_mover, uy_mover, uz_mover,
				 sz_mover, sr_mover,
				 sleftz_mover, sleftr_mover,
				 layer_mover, weight_mover, dead_mover,

				 //OUTPUTS
				 x_boundaryChecker, y_boundaryChecker, z_boundaryChecker,
				 ux_boundaryChecker, uy_boundaryChecker, uz_boundaryChecker,
				 sz_boundaryChecker, sr_boundaryChecker,
				 sleftz_boundaryChecker, sleftr_boundaryChecker,
				 layer_boundaryChecker, weight_boundaryChecker, dead_boundaryChecker, hit_boundaryChecker,

				 //CONSTANTS
				 z1_0, z1_1, z1_2, z1_3, z1_4, z1_5, 
				 z0_0, z0_1, z0_2, z0_3, z0_4, z0_5,
				 mut_0, mut_1, mut_2, mut_3, mut_4, mut_5, 
				 maxDepth_over_maxRadius
				 );

//parameter BIT_WIDTH=32;
//parameter LAYER_WIDTH=3;
//parameter INTMAX=2147483647;
//parameter INTMIN=-2147483648;
//parameter DIVIDER_LATENCY=30;
//parameter FINAL_LATENCY=28;
//parameter MULT_LATENCY=1;
//parameter ASPECT_RATIO = 7;
//parameter TOTAL_LATENCY = `DIVIDER_LATENCY + `FINAL_LATENCY + `MULT_LATENCY + `MULT_LATENCY;

input clock;
input reset;
input enable;

input [`BIT_WIDTH-1:0] x_mover;
input [`BIT_WIDTH-1:0] y_mover;
input [`BIT_WIDTH-1:0] z_mover;
input [`BIT_WIDTH-1:0] ux_mover;
input [`BIT_WIDTH-1:0] uy_mover;
input [`BIT_WIDTH-1:0] uz_mover;
input [`BIT_WIDTH-1:0] sz_mover;
input [`BIT_WIDTH-1:0] sr_mover;
input [`BIT_WIDTH-1:0] sleftz_mover;
input [`BIT_WIDTH-1:0] sleftr_mover;
input [`LAYER_WIDTH-1:0] layer_mover;
input [`BIT_WIDTH-1:0] weight_mover;
input	dead_mover;

output [`BIT_WIDTH-1:0] x_boundaryChecker;
output [`BIT_WIDTH-1:0] y_boundaryChecker;
output [`BIT_WIDTH-1:0] z_boundaryChecker;
output [`BIT_WIDTH-1:0] ux_boundaryChecker;
output [`BIT_WIDTH-1:0] uy_boundaryChecker;
output [`BIT_WIDTH-1:0] uz_boundaryChecker;
output [`BIT_WIDTH-1:0] sz_boundaryChecker;
output [`BIT_WIDTH-1:0] sr_boundaryChecker;
output [`BIT_WIDTH-1:0] sleftz_boundaryChecker;
output [`BIT_WIDTH-1:0] sleftr_boundaryChecker;
output [`LAYER_WIDTH-1:0]layer_boundaryChecker;
output [`BIT_WIDTH-1:0] weight_boundaryChecker;
output dead_boundaryChecker;
output hit_boundaryChecker;

// Constants
input [`BIT_WIDTH-1:0] z1_0;
input [`BIT_WIDTH-1:0] z1_1;
input [`BIT_WIDTH-1:0] z1_2;
input [`BIT_WIDTH-1:0] z1_3;
input [`BIT_WIDTH-1:0] z1_4;
input [`BIT_WIDTH-1:0] z1_5;
input [`BIT_WIDTH-1:0] z0_0;
input [`BIT_WIDTH-1:0] z0_1;
input [`BIT_WIDTH-1:0] z0_2;
input [`BIT_WIDTH-1:0] z0_3;
input [`BIT_WIDTH-1:0] z0_4;
input [`BIT_WIDTH-1:0] z0_5;
input [`BIT_WIDTH-1:0] mut_0;
input [`BIT_WIDTH-1:0] mut_1;
input [`BIT_WIDTH-1:0] mut_2;
input [`BIT_WIDTH-1:0] mut_3;
input [`BIT_WIDTH-1:0] mut_4;
input [`BIT_WIDTH-1:0] mut_5;
input [`BIT_WIDTH-1:0] maxDepth_over_maxRadius;


//WIRES FOR CONNECTING REGISTERS
//reg	[BIT_WIDTH-1:0]				c_x	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_y	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_z	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_ux	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_uy	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_uz	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_sz	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_sr	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_sleftz	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_sleftr	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_weight	[TOTAL_LATENCY - 1:0];
//reg	[LAYER_WIDTH-1:0]			c_layer	[TOTAL_LATENCY - 1:0];
//reg								c_dead	[TOTAL_LATENCY - 1:0];
//reg								c_hit	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_diff[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_dl_b[TOTAL_LATENCY - 1:0];
//reg	[2*BIT_WIDTH-1:0]			c_numer[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_z1[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_z0[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				c_mut[TOTAL_LATENCY - 1:0];

//reg	[BIT_WIDTH-1:0]				r_x	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_y	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_z	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_ux	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_uy	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_uz	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_sz	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_sr	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_sleftz	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_sleftr	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_weight	[TOTAL_LATENCY - 1:0];
//reg	[LAYER_WIDTH-1:0]			r_layer	[TOTAL_LATENCY - 1:0];
//reg								r_dead	[TOTAL_LATENCY - 1:0];
//reg								r_hit	[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_diff[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_dl_b[TOTAL_LATENCY - 1:0];
//reg	[2*BIT_WIDTH-1:0]			r_numer[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_z1[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_z0[TOTAL_LATENCY - 1:0];
//reg	[BIT_WIDTH-1:0]				r_mut[TOTAL_LATENCY - 1:0];


//EXPANDED FOR ODIN
//reg	[BIT_WIDTH-1:0]				c_x	[TOTAL_LATENCY - 1:0];
reg	[`BIT_WIDTH-1:0]				c_x__0;
reg	[`BIT_WIDTH-1:0]				c_x__1;
reg	[`BIT_WIDTH-1:0]				c_x__2;
reg	[`BIT_WIDTH-1:0]				c_x__3;
reg	[`BIT_WIDTH-1:0]				c_x__4;
reg	[`BIT_WIDTH-1:0]				c_x__5;
reg	[`BIT_WIDTH-1:0]				c_x__6;
reg	[`BIT_WIDTH-1:0]				c_x__7;
reg	[`BIT_WIDTH-1:0]				c_x__8;
reg	[`BIT_WIDTH-1:0]				c_x__9;
reg	[`BIT_WIDTH-1:0]				c_x__10;
reg	[`BIT_WIDTH-1:0]				c_x__11;
reg	[`BIT_WIDTH-1:0]				c_x__12;
reg	[`BIT_WIDTH-1:0]				c_x__13;
reg	[`BIT_WIDTH-1:0]				c_x__14;
reg	[`BIT_WIDTH-1:0]				c_x__15;
reg	[`BIT_WIDTH-1:0]				c_x__16;
reg	[`BIT_WIDTH-1:0]				c_x__17;
reg	[`BIT_WIDTH-1:0]				c_x__18;
reg	[`BIT_WIDTH-1:0]				c_x__19;
reg	[`BIT_WIDTH-1:0]				c_x__20;
reg	[`BIT_WIDTH-1:0]				c_x__21;
reg	[`BIT_WIDTH-1:0]				c_x__22;
reg	[`BIT_WIDTH-1:0]				c_x__23;
reg	[`BIT_WIDTH-1:0]				c_x__24;
reg	[`BIT_WIDTH-1:0]				c_x__25;
reg	[`BIT_WIDTH-1:0]				c_x__26;
reg	[`BIT_WIDTH-1:0]				c_x__27;
reg	[`BIT_WIDTH-1:0]				c_x__28;
reg	[`BIT_WIDTH-1:0]				c_x__29;
reg	[`BIT_WIDTH-1:0]				c_x__30;
reg	[`BIT_WIDTH-1:0]				c_x__31;
reg	[`BIT_WIDTH-1:0]				c_x__32;
reg	[`BIT_WIDTH-1:0]				c_x__33;
reg	[`BIT_WIDTH-1:0]				c_x__34;
reg	[`BIT_WIDTH-1:0]				c_x__35;
reg	[`BIT_WIDTH-1:0]				c_x__36;
reg	[`BIT_WIDTH-1:0]				c_x__37;
reg	[`BIT_WIDTH-1:0]				c_x__38;
reg	[`BIT_WIDTH-1:0]				c_x__39;
reg	[`BIT_WIDTH-1:0]				c_x__40;
reg	[`BIT_WIDTH-1:0]				c_x__41;
reg	[`BIT_WIDTH-1:0]				c_x__42;
reg	[`BIT_WIDTH-1:0]				c_x__43;
reg	[`BIT_WIDTH-1:0]				c_x__44;
reg	[`BIT_WIDTH-1:0]				c_x__45;
reg	[`BIT_WIDTH-1:0]				c_x__46;
reg	[`BIT_WIDTH-1:0]				c_x__47;
reg	[`BIT_WIDTH-1:0]				c_x__48;
reg	[`BIT_WIDTH-1:0]				c_x__49;
reg	[`BIT_WIDTH-1:0]				c_x__50;
reg	[`BIT_WIDTH-1:0]				c_x__51;
reg	[`BIT_WIDTH-1:0]				c_x__52;
reg	[`BIT_WIDTH-1:0]				c_x__53;
reg	[`BIT_WIDTH-1:0]				c_x__54;
reg	[`BIT_WIDTH-1:0]				c_x__55;
reg	[`BIT_WIDTH-1:0]				c_x__56;
reg	[`BIT_WIDTH-1:0]				c_x__57;
reg	[`BIT_WIDTH-1:0]				c_x__58;
reg	[`BIT_WIDTH-1:0]				c_x__59;

//reg	[BIT_WIDTH-1:0]				c_y	[TOTAL_LATENCY - 1:0];


reg	[`BIT_WIDTH-1:0]				c_y__0;
reg	[`BIT_WIDTH-1:0]				c_y__1;
reg	[`BIT_WIDTH-1:0]				c_y__2;
reg	[`BIT_WIDTH-1:0]				c_y__3;
reg	[`BIT_WIDTH-1:0]				c_y__4;
reg	[`BIT_WIDTH-1:0]				c_y__5;
reg	[`BIT_WIDTH-1:0]				c_y__6;
reg	[`BIT_WIDTH-1:0]				c_y__7;
reg	[`BIT_WIDTH-1:0]				c_y__8;
reg	[`BIT_WIDTH-1:0]				c_y__9;
reg	[`BIT_WIDTH-1:0]				c_y__10;
reg	[`BIT_WIDTH-1:0]				c_y__11;
reg	[`BIT_WIDTH-1:0]				c_y__12;
reg	[`BIT_WIDTH-1:0]				c_y__13;
reg	[`BIT_WIDTH-1:0]				c_y__14;
reg	[`BIT_WIDTH-1:0]				c_y__15;
reg	[`BIT_WIDTH-1:0]				c_y__16;
reg	[`BIT_WIDTH-1:0]				c_y__17;
reg	[`BIT_WIDTH-1:0]				c_y__18;
reg	[`BIT_WIDTH-1:0]				c_y__19;
reg	[`BIT_WIDTH-1:0]				c_y__20;
reg	[`BIT_WIDTH-1:0]				c_y__21;
reg	[`BIT_WIDTH-1:0]				c_y__22;
reg	[`BIT_WIDTH-1:0]				c_y__23;
reg	[`BIT_WIDTH-1:0]				c_y__24;
reg	[`BIT_WIDTH-1:0]				c_y__25;
reg	[`BIT_WIDTH-1:0]				c_y__26;
reg	[`BIT_WIDTH-1:0]				c_y__27;
reg	[`BIT_WIDTH-1:0]				c_y__28;
reg	[`BIT_WIDTH-1:0]				c_y__29;
reg	[`BIT_WIDTH-1:0]				c_y__30;
reg	[`BIT_WIDTH-1:0]				c_y__31;
reg	[`BIT_WIDTH-1:0]				c_y__32;
reg	[`BIT_WIDTH-1:0]				c_y__33;
reg	[`BIT_WIDTH-1:0]				c_y__34;
reg	[`BIT_WIDTH-1:0]				c_y__35;
reg	[`BIT_WIDTH-1:0]				c_y__36;
reg	[`BIT_WIDTH-1:0]				c_y__37;
reg	[`BIT_WIDTH-1:0]				c_y__38;
reg	[`BIT_WIDTH-1:0]				c_y__39;
reg	[`BIT_WIDTH-1:0]				c_y__40;
reg	[`BIT_WIDTH-1:0]				c_y__41;
reg	[`BIT_WIDTH-1:0]				c_y__42;
reg	[`BIT_WIDTH-1:0]				c_y__43;
reg	[`BIT_WIDTH-1:0]				c_y__44;
reg	[`BIT_WIDTH-1:0]				c_y__45;
reg	[`BIT_WIDTH-1:0]				c_y__46;
reg	[`BIT_WIDTH-1:0]				c_y__47;
reg	[`BIT_WIDTH-1:0]				c_y__48;
reg	[`BIT_WIDTH-1:0]				c_y__49;
reg	[`BIT_WIDTH-1:0]				c_y__50;
reg	[`BIT_WIDTH-1:0]				c_y__51;
reg	[`BIT_WIDTH-1:0]				c_y__52;
reg	[`BIT_WIDTH-1:0]				c_y__53;
reg	[`BIT_WIDTH-1:0]				c_y__54;
reg	[`BIT_WIDTH-1:0]				c_y__55;
reg	[`BIT_WIDTH-1:0]				c_y__56;
reg	[`BIT_WIDTH-1:0]				c_y__57;
reg	[`BIT_WIDTH-1:0]				c_y__58;
reg	[`BIT_WIDTH-1:0]				c_y__59;


//reg	[BIT_WIDTH-1:0]				c_z	[TOTAL_LATENCY - 1:0];


reg	[`BIT_WIDTH-1:0]				c_z__0;
reg	[`BIT_WIDTH-1:0]				c_z__1;
reg	[`BIT_WIDTH-1:0]				c_z__2;
reg	[`BIT_WIDTH-1:0]				c_z__3;
reg	[`BIT_WIDTH-1:0]				c_z__4;
reg	[`BIT_WIDTH-1:0]				c_z__5;
reg	[`BIT_WIDTH-1:0]				c_z__6;
reg	[`BIT_WIDTH-1:0]				c_z__7;
reg	[`BIT_WIDTH-1:0]				c_z__8;
reg	[`BIT_WIDTH-1:0]				c_z__9;
reg	[`BIT_WIDTH-1:0]				c_z__10;
reg	[`BIT_WIDTH-1:0]				c_z__11;
reg	[`BIT_WIDTH-1:0]				c_z__12;
reg	[`BIT_WIDTH-1:0]				c_z__13;
reg	[`BIT_WIDTH-1:0]				c_z__14;
reg	[`BIT_WIDTH-1:0]				c_z__15;
reg	[`BIT_WIDTH-1:0]				c_z__16;
reg	[`BIT_WIDTH-1:0]				c_z__17;
reg	[`BIT_WIDTH-1:0]				c_z__18;
reg	[`BIT_WIDTH-1:0]				c_z__19;
reg	[`BIT_WIDTH-1:0]				c_z__20;
reg	[`BIT_WIDTH-1:0]				c_z__21;
reg	[`BIT_WIDTH-1:0]				c_z__22;
reg	[`BIT_WIDTH-1:0]				c_z__23;
reg	[`BIT_WIDTH-1:0]				c_z__24;
reg	[`BIT_WIDTH-1:0]				c_z__25;
reg	[`BIT_WIDTH-1:0]				c_z__26;
reg	[`BIT_WIDTH-1:0]				c_z__27;
reg	[`BIT_WIDTH-1:0]				c_z__28;
reg	[`BIT_WIDTH-1:0]				c_z__29;
reg	[`BIT_WIDTH-1:0]				c_z__30;
reg	[`BIT_WIDTH-1:0]				c_z__31;
reg	[`BIT_WIDTH-1:0]				c_z__32;
reg	[`BIT_WIDTH-1:0]				c_z__33;
reg	[`BIT_WIDTH-1:0]				c_z__34;
reg	[`BIT_WIDTH-1:0]				c_z__35;
reg	[`BIT_WIDTH-1:0]				c_z__36;
reg	[`BIT_WIDTH-1:0]				c_z__37;
reg	[`BIT_WIDTH-1:0]				c_z__38;
reg	[`BIT_WIDTH-1:0]				c_z__39;
reg	[`BIT_WIDTH-1:0]				c_z__40;
reg	[`BIT_WIDTH-1:0]				c_z__41;
reg	[`BIT_WIDTH-1:0]				c_z__42;
reg	[`BIT_WIDTH-1:0]				c_z__43;
reg	[`BIT_WIDTH-1:0]				c_z__44;
reg	[`BIT_WIDTH-1:0]				c_z__45;
reg	[`BIT_WIDTH-1:0]				c_z__46;
reg	[`BIT_WIDTH-1:0]				c_z__47;
reg	[`BIT_WIDTH-1:0]				c_z__48;
reg	[`BIT_WIDTH-1:0]				c_z__49;
reg	[`BIT_WIDTH-1:0]				c_z__50;
reg	[`BIT_WIDTH-1:0]				c_z__51;
reg	[`BIT_WIDTH-1:0]				c_z__52;
reg	[`BIT_WIDTH-1:0]				c_z__53;
reg	[`BIT_WIDTH-1:0]				c_z__54;
reg	[`BIT_WIDTH-1:0]				c_z__55;
reg	[`BIT_WIDTH-1:0]				c_z__56;
reg	[`BIT_WIDTH-1:0]				c_z__57;
reg	[`BIT_WIDTH-1:0]				c_z__58;
reg	[`BIT_WIDTH-1:0]				c_z__59;



//reg	[`BIT_WIDTH-1:0]				c_ux	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_ux__0;
reg	[`BIT_WIDTH-1:0]				c_ux__1;
reg	[`BIT_WIDTH-1:0]				c_ux__2;
reg	[`BIT_WIDTH-1:0]				c_ux__3;
reg	[`BIT_WIDTH-1:0]				c_ux__4;
reg	[`BIT_WIDTH-1:0]				c_ux__5;
reg	[`BIT_WIDTH-1:0]				c_ux__6;
reg	[`BIT_WIDTH-1:0]				c_ux__7;
reg	[`BIT_WIDTH-1:0]				c_ux__8;
reg	[`BIT_WIDTH-1:0]				c_ux__9;
reg	[`BIT_WIDTH-1:0]				c_ux__10;
reg	[`BIT_WIDTH-1:0]				c_ux__11;
reg	[`BIT_WIDTH-1:0]				c_ux__12;
reg	[`BIT_WIDTH-1:0]				c_ux__13;
reg	[`BIT_WIDTH-1:0]				c_ux__14;
reg	[`BIT_WIDTH-1:0]				c_ux__15;
reg	[`BIT_WIDTH-1:0]				c_ux__16;
reg	[`BIT_WIDTH-1:0]				c_ux__17;
reg	[`BIT_WIDTH-1:0]				c_ux__18;
reg	[`BIT_WIDTH-1:0]				c_ux__19;
reg	[`BIT_WIDTH-1:0]				c_ux__20;
reg	[`BIT_WIDTH-1:0]				c_ux__21;
reg	[`BIT_WIDTH-1:0]				c_ux__22;
reg	[`BIT_WIDTH-1:0]				c_ux__23;
reg	[`BIT_WIDTH-1:0]				c_ux__24;
reg	[`BIT_WIDTH-1:0]				c_ux__25;
reg	[`BIT_WIDTH-1:0]				c_ux__26;
reg	[`BIT_WIDTH-1:0]				c_ux__27;
reg	[`BIT_WIDTH-1:0]				c_ux__28;
reg	[`BIT_WIDTH-1:0]				c_ux__29;
reg	[`BIT_WIDTH-1:0]				c_ux__30;
reg	[`BIT_WIDTH-1:0]				c_ux__31;
reg	[`BIT_WIDTH-1:0]				c_ux__32;
reg	[`BIT_WIDTH-1:0]				c_ux__33;
reg	[`BIT_WIDTH-1:0]				c_ux__34;
reg	[`BIT_WIDTH-1:0]				c_ux__35;
reg	[`BIT_WIDTH-1:0]				c_ux__36;
reg	[`BIT_WIDTH-1:0]				c_ux__37;
reg	[`BIT_WIDTH-1:0]				c_ux__38;
reg	[`BIT_WIDTH-1:0]				c_ux__39;
reg	[`BIT_WIDTH-1:0]				c_ux__40;
reg	[`BIT_WIDTH-1:0]				c_ux__41;
reg	[`BIT_WIDTH-1:0]				c_ux__42;
reg	[`BIT_WIDTH-1:0]				c_ux__43;
reg	[`BIT_WIDTH-1:0]				c_ux__44;
reg	[`BIT_WIDTH-1:0]				c_ux__45;
reg	[`BIT_WIDTH-1:0]				c_ux__46;
reg	[`BIT_WIDTH-1:0]				c_ux__47;
reg	[`BIT_WIDTH-1:0]				c_ux__48;
reg	[`BIT_WIDTH-1:0]				c_ux__49;
reg	[`BIT_WIDTH-1:0]				c_ux__50;
reg	[`BIT_WIDTH-1:0]				c_ux__51;
reg	[`BIT_WIDTH-1:0]				c_ux__52;
reg	[`BIT_WIDTH-1:0]				c_ux__53;
reg	[`BIT_WIDTH-1:0]				c_ux__54;
reg	[`BIT_WIDTH-1:0]				c_ux__55;
reg	[`BIT_WIDTH-1:0]				c_ux__56;
reg	[`BIT_WIDTH-1:0]				c_ux__57;
reg	[`BIT_WIDTH-1:0]				c_ux__58;
reg	[`BIT_WIDTH-1:0]				c_ux__59;
//reg	[`BIT_WIDTH-1:0]				c_uy	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_uy__0;
reg	[`BIT_WIDTH-1:0]				c_uy__1;
reg	[`BIT_WIDTH-1:0]				c_uy__2;
reg	[`BIT_WIDTH-1:0]				c_uy__3;
reg	[`BIT_WIDTH-1:0]				c_uy__4;
reg	[`BIT_WIDTH-1:0]				c_uy__5;
reg	[`BIT_WIDTH-1:0]				c_uy__6;
reg	[`BIT_WIDTH-1:0]				c_uy__7;
reg	[`BIT_WIDTH-1:0]				c_uy__8;
reg	[`BIT_WIDTH-1:0]				c_uy__9;
reg	[`BIT_WIDTH-1:0]				c_uy__10;
reg	[`BIT_WIDTH-1:0]				c_uy__11;
reg	[`BIT_WIDTH-1:0]				c_uy__12;
reg	[`BIT_WIDTH-1:0]				c_uy__13;
reg	[`BIT_WIDTH-1:0]				c_uy__14;
reg	[`BIT_WIDTH-1:0]				c_uy__15;
reg	[`BIT_WIDTH-1:0]				c_uy__16;
reg	[`BIT_WIDTH-1:0]				c_uy__17;
reg	[`BIT_WIDTH-1:0]				c_uy__18;
reg	[`BIT_WIDTH-1:0]				c_uy__19;
reg	[`BIT_WIDTH-1:0]				c_uy__20;
reg	[`BIT_WIDTH-1:0]				c_uy__21;
reg	[`BIT_WIDTH-1:0]				c_uy__22;
reg	[`BIT_WIDTH-1:0]				c_uy__23;
reg	[`BIT_WIDTH-1:0]				c_uy__24;
reg	[`BIT_WIDTH-1:0]				c_uy__25;
reg	[`BIT_WIDTH-1:0]				c_uy__26;
reg	[`BIT_WIDTH-1:0]				c_uy__27;
reg	[`BIT_WIDTH-1:0]				c_uy__28;
reg	[`BIT_WIDTH-1:0]				c_uy__29;
reg	[`BIT_WIDTH-1:0]				c_uy__30;
reg	[`BIT_WIDTH-1:0]				c_uy__31;
reg	[`BIT_WIDTH-1:0]				c_uy__32;
reg	[`BIT_WIDTH-1:0]				c_uy__33;
reg	[`BIT_WIDTH-1:0]				c_uy__34;
reg	[`BIT_WIDTH-1:0]				c_uy__35;
reg	[`BIT_WIDTH-1:0]				c_uy__36;
reg	[`BIT_WIDTH-1:0]				c_uy__37;
reg	[`BIT_WIDTH-1:0]				c_uy__38;
reg	[`BIT_WIDTH-1:0]				c_uy__39;
reg	[`BIT_WIDTH-1:0]				c_uy__40;
reg	[`BIT_WIDTH-1:0]				c_uy__41;
reg	[`BIT_WIDTH-1:0]				c_uy__42;
reg	[`BIT_WIDTH-1:0]				c_uy__43;
reg	[`BIT_WIDTH-1:0]				c_uy__44;
reg	[`BIT_WIDTH-1:0]				c_uy__45;
reg	[`BIT_WIDTH-1:0]				c_uy__46;
reg	[`BIT_WIDTH-1:0]				c_uy__47;
reg	[`BIT_WIDTH-1:0]				c_uy__48;
reg	[`BIT_WIDTH-1:0]				c_uy__49;
reg	[`BIT_WIDTH-1:0]				c_uy__50;
reg	[`BIT_WIDTH-1:0]				c_uy__51;
reg	[`BIT_WIDTH-1:0]				c_uy__52;
reg	[`BIT_WIDTH-1:0]				c_uy__53;
reg	[`BIT_WIDTH-1:0]				c_uy__54;
reg	[`BIT_WIDTH-1:0]				c_uy__55;
reg	[`BIT_WIDTH-1:0]				c_uy__56;
reg	[`BIT_WIDTH-1:0]				c_uy__57;
reg	[`BIT_WIDTH-1:0]				c_uy__58;
reg	[`BIT_WIDTH-1:0]				c_uy__59;
//reg	[`BIT_WIDTH-1:0]				c_uz	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_uz__0;
reg	[`BIT_WIDTH-1:0]				c_uz__1;
reg	[`BIT_WIDTH-1:0]				c_uz__2;
reg	[`BIT_WIDTH-1:0]				c_uz__3;
reg	[`BIT_WIDTH-1:0]				c_uz__4;
reg	[`BIT_WIDTH-1:0]				c_uz__5;
reg	[`BIT_WIDTH-1:0]				c_uz__6;
reg	[`BIT_WIDTH-1:0]				c_uz__7;
reg	[`BIT_WIDTH-1:0]				c_uz__8;
reg	[`BIT_WIDTH-1:0]				c_uz__9;
reg	[`BIT_WIDTH-1:0]				c_uz__10;
reg	[`BIT_WIDTH-1:0]				c_uz__11;
reg	[`BIT_WIDTH-1:0]				c_uz__12;
reg	[`BIT_WIDTH-1:0]				c_uz__13;
reg	[`BIT_WIDTH-1:0]				c_uz__14;
reg	[`BIT_WIDTH-1:0]				c_uz__15;
reg	[`BIT_WIDTH-1:0]				c_uz__16;
reg	[`BIT_WIDTH-1:0]				c_uz__17;
reg	[`BIT_WIDTH-1:0]				c_uz__18;
reg	[`BIT_WIDTH-1:0]				c_uz__19;
reg	[`BIT_WIDTH-1:0]				c_uz__20;
reg	[`BIT_WIDTH-1:0]				c_uz__21;
reg	[`BIT_WIDTH-1:0]				c_uz__22;
reg	[`BIT_WIDTH-1:0]				c_uz__23;
reg	[`BIT_WIDTH-1:0]				c_uz__24;
reg	[`BIT_WIDTH-1:0]				c_uz__25;
reg	[`BIT_WIDTH-1:0]				c_uz__26;
reg	[`BIT_WIDTH-1:0]				c_uz__27;
reg	[`BIT_WIDTH-1:0]				c_uz__28;
reg	[`BIT_WIDTH-1:0]				c_uz__29;
reg	[`BIT_WIDTH-1:0]				c_uz__30;
reg	[`BIT_WIDTH-1:0]				c_uz__31;
reg	[`BIT_WIDTH-1:0]				c_uz__32;
reg	[`BIT_WIDTH-1:0]				c_uz__33;
reg	[`BIT_WIDTH-1:0]				c_uz__34;
reg	[`BIT_WIDTH-1:0]				c_uz__35;
reg	[`BIT_WIDTH-1:0]				c_uz__36;
reg	[`BIT_WIDTH-1:0]				c_uz__37;
reg	[`BIT_WIDTH-1:0]				c_uz__38;
reg	[`BIT_WIDTH-1:0]				c_uz__39;
reg	[`BIT_WIDTH-1:0]				c_uz__40;
reg	[`BIT_WIDTH-1:0]				c_uz__41;
reg	[`BIT_WIDTH-1:0]				c_uz__42;
reg	[`BIT_WIDTH-1:0]				c_uz__43;
reg	[`BIT_WIDTH-1:0]				c_uz__44;
reg	[`BIT_WIDTH-1:0]				c_uz__45;
reg	[`BIT_WIDTH-1:0]				c_uz__46;
reg	[`BIT_WIDTH-1:0]				c_uz__47;
reg	[`BIT_WIDTH-1:0]				c_uz__48;
reg	[`BIT_WIDTH-1:0]				c_uz__49;
reg	[`BIT_WIDTH-1:0]				c_uz__50;
reg	[`BIT_WIDTH-1:0]				c_uz__51;
reg	[`BIT_WIDTH-1:0]				c_uz__52;
reg	[`BIT_WIDTH-1:0]				c_uz__53;
reg	[`BIT_WIDTH-1:0]				c_uz__54;
reg	[`BIT_WIDTH-1:0]				c_uz__55;
reg	[`BIT_WIDTH-1:0]				c_uz__56;
reg	[`BIT_WIDTH-1:0]				c_uz__57;
reg	[`BIT_WIDTH-1:0]				c_uz__58;
reg	[`BIT_WIDTH-1:0]				c_uz__59;
//reg	[`BIT_WIDTH-1:0]				c_sz	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_sz__0;
reg	[`BIT_WIDTH-1:0]				c_sz__1;
reg	[`BIT_WIDTH-1:0]				c_sz__2;
reg	[`BIT_WIDTH-1:0]				c_sz__3;
reg	[`BIT_WIDTH-1:0]				c_sz__4;
reg	[`BIT_WIDTH-1:0]				c_sz__5;
reg	[`BIT_WIDTH-1:0]				c_sz__6;
reg	[`BIT_WIDTH-1:0]				c_sz__7;
reg	[`BIT_WIDTH-1:0]				c_sz__8;
reg	[`BIT_WIDTH-1:0]				c_sz__9;
reg	[`BIT_WIDTH-1:0]				c_sz__10;
reg	[`BIT_WIDTH-1:0]				c_sz__11;
reg	[`BIT_WIDTH-1:0]				c_sz__12;
reg	[`BIT_WIDTH-1:0]				c_sz__13;
reg	[`BIT_WIDTH-1:0]				c_sz__14;
reg	[`BIT_WIDTH-1:0]				c_sz__15;
reg	[`BIT_WIDTH-1:0]				c_sz__16;
reg	[`BIT_WIDTH-1:0]				c_sz__17;
reg	[`BIT_WIDTH-1:0]				c_sz__18;
reg	[`BIT_WIDTH-1:0]				c_sz__19;
reg	[`BIT_WIDTH-1:0]				c_sz__20;
reg	[`BIT_WIDTH-1:0]				c_sz__21;
reg	[`BIT_WIDTH-1:0]				c_sz__22;
reg	[`BIT_WIDTH-1:0]				c_sz__23;
reg	[`BIT_WIDTH-1:0]				c_sz__24;
reg	[`BIT_WIDTH-1:0]				c_sz__25;
reg	[`BIT_WIDTH-1:0]				c_sz__26;
reg	[`BIT_WIDTH-1:0]				c_sz__27;
reg	[`BIT_WIDTH-1:0]				c_sz__28;
reg	[`BIT_WIDTH-1:0]				c_sz__29;
reg	[`BIT_WIDTH-1:0]				c_sz__30;
reg	[`BIT_WIDTH-1:0]				c_sz__31;
reg	[`BIT_WIDTH-1:0]				c_sz__32;
reg	[`BIT_WIDTH-1:0]				c_sz__33;
reg	[`BIT_WIDTH-1:0]				c_sz__34;
reg	[`BIT_WIDTH-1:0]				c_sz__35;
reg	[`BIT_WIDTH-1:0]				c_sz__36;
reg	[`BIT_WIDTH-1:0]				c_sz__37;
reg	[`BIT_WIDTH-1:0]				c_sz__38;
reg	[`BIT_WIDTH-1:0]				c_sz__39;
reg	[`BIT_WIDTH-1:0]				c_sz__40;
reg	[`BIT_WIDTH-1:0]				c_sz__41;
reg	[`BIT_WIDTH-1:0]				c_sz__42;
reg	[`BIT_WIDTH-1:0]				c_sz__43;
reg	[`BIT_WIDTH-1:0]				c_sz__44;
reg	[`BIT_WIDTH-1:0]				c_sz__45;
reg	[`BIT_WIDTH-1:0]				c_sz__46;
reg	[`BIT_WIDTH-1:0]				c_sz__47;
reg	[`BIT_WIDTH-1:0]				c_sz__48;
reg	[`BIT_WIDTH-1:0]				c_sz__49;
reg	[`BIT_WIDTH-1:0]				c_sz__50;
reg	[`BIT_WIDTH-1:0]				c_sz__51;
reg	[`BIT_WIDTH-1:0]				c_sz__52;
reg	[`BIT_WIDTH-1:0]				c_sz__53;
reg	[`BIT_WIDTH-1:0]				c_sz__54;
reg	[`BIT_WIDTH-1:0]				c_sz__55;
reg	[`BIT_WIDTH-1:0]				c_sz__56;
reg	[`BIT_WIDTH-1:0]				c_sz__57;
reg	[`BIT_WIDTH-1:0]				c_sz__58;
reg	[`BIT_WIDTH-1:0]				c_sz__59;
//reg	[`BIT_WIDTH-1:0]				c_sr	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_sr__0;
reg	[`BIT_WIDTH-1:0]				c_sr__1;
reg	[`BIT_WIDTH-1:0]				c_sr__2;
reg	[`BIT_WIDTH-1:0]				c_sr__3;
reg	[`BIT_WIDTH-1:0]				c_sr__4;
reg	[`BIT_WIDTH-1:0]				c_sr__5;
reg	[`BIT_WIDTH-1:0]				c_sr__6;
reg	[`BIT_WIDTH-1:0]				c_sr__7;
reg	[`BIT_WIDTH-1:0]				c_sr__8;
reg	[`BIT_WIDTH-1:0]				c_sr__9;
reg	[`BIT_WIDTH-1:0]				c_sr__10;
reg	[`BIT_WIDTH-1:0]				c_sr__11;
reg	[`BIT_WIDTH-1:0]				c_sr__12;
reg	[`BIT_WIDTH-1:0]				c_sr__13;
reg	[`BIT_WIDTH-1:0]				c_sr__14;
reg	[`BIT_WIDTH-1:0]				c_sr__15;
reg	[`BIT_WIDTH-1:0]				c_sr__16;
reg	[`BIT_WIDTH-1:0]				c_sr__17;
reg	[`BIT_WIDTH-1:0]				c_sr__18;
reg	[`BIT_WIDTH-1:0]				c_sr__19;
reg	[`BIT_WIDTH-1:0]				c_sr__20;
reg	[`BIT_WIDTH-1:0]				c_sr__21;
reg	[`BIT_WIDTH-1:0]				c_sr__22;
reg	[`BIT_WIDTH-1:0]				c_sr__23;
reg	[`BIT_WIDTH-1:0]				c_sr__24;
reg	[`BIT_WIDTH-1:0]				c_sr__25;
reg	[`BIT_WIDTH-1:0]				c_sr__26;
reg	[`BIT_WIDTH-1:0]				c_sr__27;
reg	[`BIT_WIDTH-1:0]				c_sr__28;
reg	[`BIT_WIDTH-1:0]				c_sr__29;
reg	[`BIT_WIDTH-1:0]				c_sr__30;
reg	[`BIT_WIDTH-1:0]				c_sr__31;
reg	[`BIT_WIDTH-1:0]				c_sr__32;
reg	[`BIT_WIDTH-1:0]				c_sr__33;
reg	[`BIT_WIDTH-1:0]				c_sr__34;
reg	[`BIT_WIDTH-1:0]				c_sr__35;
reg	[`BIT_WIDTH-1:0]				c_sr__36;
reg	[`BIT_WIDTH-1:0]				c_sr__37;
reg	[`BIT_WIDTH-1:0]				c_sr__38;
reg	[`BIT_WIDTH-1:0]				c_sr__39;
reg	[`BIT_WIDTH-1:0]				c_sr__40;
reg	[`BIT_WIDTH-1:0]				c_sr__41;
reg	[`BIT_WIDTH-1:0]				c_sr__42;
reg	[`BIT_WIDTH-1:0]				c_sr__43;
reg	[`BIT_WIDTH-1:0]				c_sr__44;
reg	[`BIT_WIDTH-1:0]				c_sr__45;
reg	[`BIT_WIDTH-1:0]				c_sr__46;
reg	[`BIT_WIDTH-1:0]				c_sr__47;
reg	[`BIT_WIDTH-1:0]				c_sr__48;
reg	[`BIT_WIDTH-1:0]				c_sr__49;
reg	[`BIT_WIDTH-1:0]				c_sr__50;
reg	[`BIT_WIDTH-1:0]				c_sr__51;
reg	[`BIT_WIDTH-1:0]				c_sr__52;
reg	[`BIT_WIDTH-1:0]				c_sr__53;
reg	[`BIT_WIDTH-1:0]				c_sr__54;
reg	[`BIT_WIDTH-1:0]				c_sr__55;
reg	[`BIT_WIDTH-1:0]				c_sr__56;
reg	[`BIT_WIDTH-1:0]				c_sr__57;
reg	[`BIT_WIDTH-1:0]				c_sr__58;
reg	[`BIT_WIDTH-1:0]				c_sr__59;
//reg	[`BIT_WIDTH-1:0]				c_sleftz	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_sleftz__0;
reg	[`BIT_WIDTH-1:0]				c_sleftz__1;
reg	[`BIT_WIDTH-1:0]				c_sleftz__2;
reg	[`BIT_WIDTH-1:0]				c_sleftz__3;
reg	[`BIT_WIDTH-1:0]				c_sleftz__4;
reg	[`BIT_WIDTH-1:0]				c_sleftz__5;
reg	[`BIT_WIDTH-1:0]				c_sleftz__6;
reg	[`BIT_WIDTH-1:0]				c_sleftz__7;
reg	[`BIT_WIDTH-1:0]				c_sleftz__8;
reg	[`BIT_WIDTH-1:0]				c_sleftz__9;
reg	[`BIT_WIDTH-1:0]				c_sleftz__10;
reg	[`BIT_WIDTH-1:0]				c_sleftz__11;
reg	[`BIT_WIDTH-1:0]				c_sleftz__12;
reg	[`BIT_WIDTH-1:0]				c_sleftz__13;
reg	[`BIT_WIDTH-1:0]				c_sleftz__14;
reg	[`BIT_WIDTH-1:0]				c_sleftz__15;
reg	[`BIT_WIDTH-1:0]				c_sleftz__16;
reg	[`BIT_WIDTH-1:0]				c_sleftz__17;
reg	[`BIT_WIDTH-1:0]				c_sleftz__18;
reg	[`BIT_WIDTH-1:0]				c_sleftz__19;
reg	[`BIT_WIDTH-1:0]				c_sleftz__20;
reg	[`BIT_WIDTH-1:0]				c_sleftz__21;
reg	[`BIT_WIDTH-1:0]				c_sleftz__22;
reg	[`BIT_WIDTH-1:0]				c_sleftz__23;
reg	[`BIT_WIDTH-1:0]				c_sleftz__24;
reg	[`BIT_WIDTH-1:0]				c_sleftz__25;
reg	[`BIT_WIDTH-1:0]				c_sleftz__26;
reg	[`BIT_WIDTH-1:0]				c_sleftz__27;
reg	[`BIT_WIDTH-1:0]				c_sleftz__28;
reg	[`BIT_WIDTH-1:0]				c_sleftz__29;
reg	[`BIT_WIDTH-1:0]				c_sleftz__30;
reg	[`BIT_WIDTH-1:0]				c_sleftz__31;
reg	[`BIT_WIDTH-1:0]				c_sleftz__32;
reg	[`BIT_WIDTH-1:0]				c_sleftz__33;
reg	[`BIT_WIDTH-1:0]				c_sleftz__34;
reg	[`BIT_WIDTH-1:0]				c_sleftz__35;
reg	[`BIT_WIDTH-1:0]				c_sleftz__36;
reg	[`BIT_WIDTH-1:0]				c_sleftz__37;
reg	[`BIT_WIDTH-1:0]				c_sleftz__38;
reg	[`BIT_WIDTH-1:0]				c_sleftz__39;
reg	[`BIT_WIDTH-1:0]				c_sleftz__40;
reg	[`BIT_WIDTH-1:0]				c_sleftz__41;
reg	[`BIT_WIDTH-1:0]				c_sleftz__42;
reg	[`BIT_WIDTH-1:0]				c_sleftz__43;
reg	[`BIT_WIDTH-1:0]				c_sleftz__44;
reg	[`BIT_WIDTH-1:0]				c_sleftz__45;
reg	[`BIT_WIDTH-1:0]				c_sleftz__46;
reg	[`BIT_WIDTH-1:0]				c_sleftz__47;
reg	[`BIT_WIDTH-1:0]				c_sleftz__48;
reg	[`BIT_WIDTH-1:0]				c_sleftz__49;
reg	[`BIT_WIDTH-1:0]				c_sleftz__50;
reg	[`BIT_WIDTH-1:0]				c_sleftz__51;
reg	[`BIT_WIDTH-1:0]				c_sleftz__52;
reg	[`BIT_WIDTH-1:0]				c_sleftz__53;
reg	[`BIT_WIDTH-1:0]				c_sleftz__54;
reg	[`BIT_WIDTH-1:0]				c_sleftz__55;
reg	[`BIT_WIDTH-1:0]				c_sleftz__56;
reg	[`BIT_WIDTH-1:0]				c_sleftz__57;
reg	[`BIT_WIDTH-1:0]				c_sleftz__58;
reg	[`BIT_WIDTH-1:0]				c_sleftz__59;
//reg	[`BIT_WIDTH-1:0]				c_sleftr	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_sleftr__0;
reg	[`BIT_WIDTH-1:0]				c_sleftr__1;
reg	[`BIT_WIDTH-1:0]				c_sleftr__2;
reg	[`BIT_WIDTH-1:0]				c_sleftr__3;
reg	[`BIT_WIDTH-1:0]				c_sleftr__4;
reg	[`BIT_WIDTH-1:0]				c_sleftr__5;
reg	[`BIT_WIDTH-1:0]				c_sleftr__6;
reg	[`BIT_WIDTH-1:0]				c_sleftr__7;
reg	[`BIT_WIDTH-1:0]				c_sleftr__8;
reg	[`BIT_WIDTH-1:0]				c_sleftr__9;
reg	[`BIT_WIDTH-1:0]				c_sleftr__10;
reg	[`BIT_WIDTH-1:0]				c_sleftr__11;
reg	[`BIT_WIDTH-1:0]				c_sleftr__12;
reg	[`BIT_WIDTH-1:0]				c_sleftr__13;
reg	[`BIT_WIDTH-1:0]				c_sleftr__14;
reg	[`BIT_WIDTH-1:0]				c_sleftr__15;
reg	[`BIT_WIDTH-1:0]				c_sleftr__16;
reg	[`BIT_WIDTH-1:0]				c_sleftr__17;
reg	[`BIT_WIDTH-1:0]				c_sleftr__18;
reg	[`BIT_WIDTH-1:0]				c_sleftr__19;
reg	[`BIT_WIDTH-1:0]				c_sleftr__20;
reg	[`BIT_WIDTH-1:0]				c_sleftr__21;
reg	[`BIT_WIDTH-1:0]				c_sleftr__22;
reg	[`BIT_WIDTH-1:0]				c_sleftr__23;
reg	[`BIT_WIDTH-1:0]				c_sleftr__24;
reg	[`BIT_WIDTH-1:0]				c_sleftr__25;
reg	[`BIT_WIDTH-1:0]				c_sleftr__26;
reg	[`BIT_WIDTH-1:0]				c_sleftr__27;
reg	[`BIT_WIDTH-1:0]				c_sleftr__28;
reg	[`BIT_WIDTH-1:0]				c_sleftr__29;
reg	[`BIT_WIDTH-1:0]				c_sleftr__30;
reg	[`BIT_WIDTH-1:0]				c_sleftr__31;
reg	[`BIT_WIDTH-1:0]				c_sleftr__32;
reg	[`BIT_WIDTH-1:0]				c_sleftr__33;
reg	[`BIT_WIDTH-1:0]				c_sleftr__34;
reg	[`BIT_WIDTH-1:0]				c_sleftr__35;
reg	[`BIT_WIDTH-1:0]				c_sleftr__36;
reg	[`BIT_WIDTH-1:0]				c_sleftr__37;
reg	[`BIT_WIDTH-1:0]				c_sleftr__38;
reg	[`BIT_WIDTH-1:0]				c_sleftr__39;
reg	[`BIT_WIDTH-1:0]				c_sleftr__40;
reg	[`BIT_WIDTH-1:0]				c_sleftr__41;
reg	[`BIT_WIDTH-1:0]				c_sleftr__42;
reg	[`BIT_WIDTH-1:0]				c_sleftr__43;
reg	[`BIT_WIDTH-1:0]				c_sleftr__44;
reg	[`BIT_WIDTH-1:0]				c_sleftr__45;
reg	[`BIT_WIDTH-1:0]				c_sleftr__46;
reg	[`BIT_WIDTH-1:0]				c_sleftr__47;
reg	[`BIT_WIDTH-1:0]				c_sleftr__48;
reg	[`BIT_WIDTH-1:0]				c_sleftr__49;
reg	[`BIT_WIDTH-1:0]				c_sleftr__50;
reg	[`BIT_WIDTH-1:0]				c_sleftr__51;
reg	[`BIT_WIDTH-1:0]				c_sleftr__52;
reg	[`BIT_WIDTH-1:0]				c_sleftr__53;
reg	[`BIT_WIDTH-1:0]				c_sleftr__54;
reg	[`BIT_WIDTH-1:0]				c_sleftr__55;
reg	[`BIT_WIDTH-1:0]				c_sleftr__56;
reg	[`BIT_WIDTH-1:0]				c_sleftr__57;
reg	[`BIT_WIDTH-1:0]				c_sleftr__58;
reg	[`BIT_WIDTH-1:0]				c_sleftr__59;
//reg	[`BIT_WIDTH-1:0]				c_weight	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_weight__0;
reg	[`BIT_WIDTH-1:0]				c_weight__1;
reg	[`BIT_WIDTH-1:0]				c_weight__2;
reg	[`BIT_WIDTH-1:0]				c_weight__3;
reg	[`BIT_WIDTH-1:0]				c_weight__4;
reg	[`BIT_WIDTH-1:0]				c_weight__5;
reg	[`BIT_WIDTH-1:0]				c_weight__6;
reg	[`BIT_WIDTH-1:0]				c_weight__7;
reg	[`BIT_WIDTH-1:0]				c_weight__8;
reg	[`BIT_WIDTH-1:0]				c_weight__9;
reg	[`BIT_WIDTH-1:0]				c_weight__10;
reg	[`BIT_WIDTH-1:0]				c_weight__11;
reg	[`BIT_WIDTH-1:0]				c_weight__12;
reg	[`BIT_WIDTH-1:0]				c_weight__13;
reg	[`BIT_WIDTH-1:0]				c_weight__14;
reg	[`BIT_WIDTH-1:0]				c_weight__15;
reg	[`BIT_WIDTH-1:0]				c_weight__16;
reg	[`BIT_WIDTH-1:0]				c_weight__17;
reg	[`BIT_WIDTH-1:0]				c_weight__18;
reg	[`BIT_WIDTH-1:0]				c_weight__19;
reg	[`BIT_WIDTH-1:0]				c_weight__20;
reg	[`BIT_WIDTH-1:0]				c_weight__21;
reg	[`BIT_WIDTH-1:0]				c_weight__22;
reg	[`BIT_WIDTH-1:0]				c_weight__23;
reg	[`BIT_WIDTH-1:0]				c_weight__24;
reg	[`BIT_WIDTH-1:0]				c_weight__25;
reg	[`BIT_WIDTH-1:0]				c_weight__26;
reg	[`BIT_WIDTH-1:0]				c_weight__27;
reg	[`BIT_WIDTH-1:0]				c_weight__28;
reg	[`BIT_WIDTH-1:0]				c_weight__29;
reg	[`BIT_WIDTH-1:0]				c_weight__30;
reg	[`BIT_WIDTH-1:0]				c_weight__31;
reg	[`BIT_WIDTH-1:0]				c_weight__32;
reg	[`BIT_WIDTH-1:0]				c_weight__33;
reg	[`BIT_WIDTH-1:0]				c_weight__34;
reg	[`BIT_WIDTH-1:0]				c_weight__35;
reg	[`BIT_WIDTH-1:0]				c_weight__36;
reg	[`BIT_WIDTH-1:0]				c_weight__37;
reg	[`BIT_WIDTH-1:0]				c_weight__38;
reg	[`BIT_WIDTH-1:0]				c_weight__39;
reg	[`BIT_WIDTH-1:0]				c_weight__40;
reg	[`BIT_WIDTH-1:0]				c_weight__41;
reg	[`BIT_WIDTH-1:0]				c_weight__42;
reg	[`BIT_WIDTH-1:0]				c_weight__43;
reg	[`BIT_WIDTH-1:0]				c_weight__44;
reg	[`BIT_WIDTH-1:0]				c_weight__45;
reg	[`BIT_WIDTH-1:0]				c_weight__46;
reg	[`BIT_WIDTH-1:0]				c_weight__47;
reg	[`BIT_WIDTH-1:0]				c_weight__48;
reg	[`BIT_WIDTH-1:0]				c_weight__49;
reg	[`BIT_WIDTH-1:0]				c_weight__50;
reg	[`BIT_WIDTH-1:0]				c_weight__51;
reg	[`BIT_WIDTH-1:0]				c_weight__52;
reg	[`BIT_WIDTH-1:0]				c_weight__53;
reg	[`BIT_WIDTH-1:0]				c_weight__54;
reg	[`BIT_WIDTH-1:0]				c_weight__55;
reg	[`BIT_WIDTH-1:0]				c_weight__56;
reg	[`BIT_WIDTH-1:0]				c_weight__57;
reg	[`BIT_WIDTH-1:0]				c_weight__58;
reg	[`BIT_WIDTH-1:0]				c_weight__59;

//reg	[`LAYER_WIDTH-1:0]			c_layer	[TOTAL_LATENCY - 1:0];

reg	[`LAYER_WIDTH-1:0]				c_layer__0;
reg	[`LAYER_WIDTH-1:0]				c_layer__1;
reg	[`LAYER_WIDTH-1:0]				c_layer__2;
reg	[`LAYER_WIDTH-1:0]				c_layer__3;
reg	[`LAYER_WIDTH-1:0]				c_layer__4;
reg	[`LAYER_WIDTH-1:0]				c_layer__5;
reg	[`LAYER_WIDTH-1:0]				c_layer__6;
reg	[`LAYER_WIDTH-1:0]				c_layer__7;
reg	[`LAYER_WIDTH-1:0]				c_layer__8;
reg	[`LAYER_WIDTH-1:0]				c_layer__9;
reg	[`LAYER_WIDTH-1:0]				c_layer__10;
reg	[`LAYER_WIDTH-1:0]				c_layer__11;
reg	[`LAYER_WIDTH-1:0]				c_layer__12;
reg	[`LAYER_WIDTH-1:0]				c_layer__13;
reg	[`LAYER_WIDTH-1:0]				c_layer__14;
reg	[`LAYER_WIDTH-1:0]				c_layer__15;
reg	[`LAYER_WIDTH-1:0]				c_layer__16;
reg	[`LAYER_WIDTH-1:0]				c_layer__17;
reg	[`LAYER_WIDTH-1:0]				c_layer__18;
reg	[`LAYER_WIDTH-1:0]				c_layer__19;
reg	[`LAYER_WIDTH-1:0]				c_layer__20;
reg	[`LAYER_WIDTH-1:0]				c_layer__21;
reg	[`LAYER_WIDTH-1:0]				c_layer__22;
reg	[`LAYER_WIDTH-1:0]				c_layer__23;
reg	[`LAYER_WIDTH-1:0]				c_layer__24;
reg	[`LAYER_WIDTH-1:0]				c_layer__25;
reg	[`LAYER_WIDTH-1:0]				c_layer__26;
reg	[`LAYER_WIDTH-1:0]				c_layer__27;
reg	[`LAYER_WIDTH-1:0]				c_layer__28;
reg	[`LAYER_WIDTH-1:0]				c_layer__29;
reg	[`LAYER_WIDTH-1:0]				c_layer__30;
reg	[`LAYER_WIDTH-1:0]				c_layer__31;
reg	[`LAYER_WIDTH-1:0]				c_layer__32;
reg	[`LAYER_WIDTH-1:0]				c_layer__33;
reg	[`LAYER_WIDTH-1:0]				c_layer__34;
reg	[`LAYER_WIDTH-1:0]				c_layer__35;
reg	[`LAYER_WIDTH-1:0]				c_layer__36;
reg	[`LAYER_WIDTH-1:0]				c_layer__37;
reg	[`LAYER_WIDTH-1:0]				c_layer__38;
reg	[`LAYER_WIDTH-1:0]				c_layer__39;
reg	[`LAYER_WIDTH-1:0]				c_layer__40;
reg	[`LAYER_WIDTH-1:0]				c_layer__41;
reg	[`LAYER_WIDTH-1:0]				c_layer__42;
reg	[`LAYER_WIDTH-1:0]				c_layer__43;
reg	[`LAYER_WIDTH-1:0]				c_layer__44;
reg	[`LAYER_WIDTH-1:0]				c_layer__45;
reg	[`LAYER_WIDTH-1:0]				c_layer__46;
reg	[`LAYER_WIDTH-1:0]				c_layer__47;
reg	[`LAYER_WIDTH-1:0]				c_layer__48;
reg	[`LAYER_WIDTH-1:0]				c_layer__49;
reg	[`LAYER_WIDTH-1:0]				c_layer__50;
reg	[`LAYER_WIDTH-1:0]				c_layer__51;
reg	[`LAYER_WIDTH-1:0]				c_layer__52;
reg	[`LAYER_WIDTH-1:0]				c_layer__53;
reg	[`LAYER_WIDTH-1:0]				c_layer__54;
reg	[`LAYER_WIDTH-1:0]				c_layer__55;
reg	[`LAYER_WIDTH-1:0]				c_layer__56;
reg	[`LAYER_WIDTH-1:0]				c_layer__57;
reg	[`LAYER_WIDTH-1:0]				c_layer__58;
reg	[`LAYER_WIDTH-1:0]				c_layer__59;



//reg								c_dead	[TOTAL_LATENCY - 1:0];

reg					c_dead__0;
reg					c_dead__1;
reg					c_dead__2;
reg					c_dead__3;
reg					c_dead__4;
reg					c_dead__5;
reg					c_dead__6;
reg					c_dead__7;
reg					c_dead__8;
reg					c_dead__9;
reg					c_dead__10;
reg					c_dead__11;
reg					c_dead__12;
reg					c_dead__13;
reg					c_dead__14;
reg					c_dead__15;
reg					c_dead__16;
reg					c_dead__17;
reg					c_dead__18;
reg					c_dead__19;
reg					c_dead__20;
reg					c_dead__21;
reg					c_dead__22;
reg					c_dead__23;
reg					c_dead__24;
reg					c_dead__25;
reg					c_dead__26;
reg					c_dead__27;
reg					c_dead__28;
reg					c_dead__29;
reg					c_dead__30;
reg					c_dead__31;
reg					c_dead__32;
reg					c_dead__33;
reg					c_dead__34;
reg					c_dead__35;
reg					c_dead__36;
reg					c_dead__37;
reg					c_dead__38;
reg					c_dead__39;
reg					c_dead__40;
reg					c_dead__41;
reg					c_dead__42;
reg					c_dead__43;
reg					c_dead__44;
reg					c_dead__45;
reg					c_dead__46;
reg					c_dead__47;
reg					c_dead__48;
reg					c_dead__49;
reg					c_dead__50;
reg					c_dead__51;
reg					c_dead__52;
reg					c_dead__53;
reg					c_dead__54;
reg					c_dead__55;
reg					c_dead__56;
reg					c_dead__57;
reg					c_dead__58;
reg					c_dead__59;


//reg								c_hit	[TOTAL_LATENCY - 1:0];

reg					c_hit__0;
reg					c_hit__1;
reg					c_hit__2;
reg					c_hit__3;
reg					c_hit__4;
reg					c_hit__5;
reg					c_hit__6;
reg					c_hit__7;
reg					c_hit__8;
reg					c_hit__9;
reg					c_hit__10;
reg					c_hit__11;
reg					c_hit__12;
reg					c_hit__13;
reg					c_hit__14;
reg					c_hit__15;
reg					c_hit__16;
reg					c_hit__17;
reg					c_hit__18;
reg					c_hit__19;
reg					c_hit__20;
reg					c_hit__21;
reg					c_hit__22;
reg					c_hit__23;
reg					c_hit__24;
reg					c_hit__25;
reg					c_hit__26;
reg					c_hit__27;
reg					c_hit__28;
reg					c_hit__29;
reg					c_hit__30;
reg					c_hit__31;
reg					c_hit__32;
reg					c_hit__33;
reg					c_hit__34;
reg					c_hit__35;
reg					c_hit__36;
reg					c_hit__37;
reg					c_hit__38;
reg					c_hit__39;
reg					c_hit__40;
reg					c_hit__41;
reg					c_hit__42;
reg					c_hit__43;
reg					c_hit__44;
reg					c_hit__45;
reg					c_hit__46;
reg					c_hit__47;
reg					c_hit__48;
reg					c_hit__49;
reg					c_hit__50;
reg					c_hit__51;
reg					c_hit__52;
reg					c_hit__53;
reg					c_hit__54;
reg					c_hit__55;
reg					c_hit__56;
reg					c_hit__57;
reg					c_hit__58;
reg					c_hit__59;

//reg	[`BIT_WIDTH-1:0]				c_diff[TOTAL_LATENCY - 1:0];


reg	[`BIT_WIDTH-1:0]				c_diff__0;
reg	[`BIT_WIDTH-1:0]				c_diff__1;
reg	[`BIT_WIDTH-1:0]				c_diff__2;
reg	[`BIT_WIDTH-1:0]				c_diff__3;
reg	[`BIT_WIDTH-1:0]				c_diff__4;
reg	[`BIT_WIDTH-1:0]				c_diff__5;
reg	[`BIT_WIDTH-1:0]				c_diff__6;
reg	[`BIT_WIDTH-1:0]				c_diff__7;
reg	[`BIT_WIDTH-1:0]				c_diff__8;
reg	[`BIT_WIDTH-1:0]				c_diff__9;
reg	[`BIT_WIDTH-1:0]				c_diff__10;
reg	[`BIT_WIDTH-1:0]				c_diff__11;
reg	[`BIT_WIDTH-1:0]				c_diff__12;
reg	[`BIT_WIDTH-1:0]				c_diff__13;
reg	[`BIT_WIDTH-1:0]				c_diff__14;
reg	[`BIT_WIDTH-1:0]				c_diff__15;
reg	[`BIT_WIDTH-1:0]				c_diff__16;
reg	[`BIT_WIDTH-1:0]				c_diff__17;
reg	[`BIT_WIDTH-1:0]				c_diff__18;
reg	[`BIT_WIDTH-1:0]				c_diff__19;
reg	[`BIT_WIDTH-1:0]				c_diff__20;
reg	[`BIT_WIDTH-1:0]				c_diff__21;
reg	[`BIT_WIDTH-1:0]				c_diff__22;
reg	[`BIT_WIDTH-1:0]				c_diff__23;
reg	[`BIT_WIDTH-1:0]				c_diff__24;
reg	[`BIT_WIDTH-1:0]				c_diff__25;
reg	[`BIT_WIDTH-1:0]				c_diff__26;
reg	[`BIT_WIDTH-1:0]				c_diff__27;
reg	[`BIT_WIDTH-1:0]				c_diff__28;
reg	[`BIT_WIDTH-1:0]				c_diff__29;
reg	[`BIT_WIDTH-1:0]				c_diff__30;
reg	[`BIT_WIDTH-1:0]				c_diff__31;
reg	[`BIT_WIDTH-1:0]				c_diff__32;
reg	[`BIT_WIDTH-1:0]				c_diff__33;
reg	[`BIT_WIDTH-1:0]				c_diff__34;
reg	[`BIT_WIDTH-1:0]				c_diff__35;
reg	[`BIT_WIDTH-1:0]				c_diff__36;
reg	[`BIT_WIDTH-1:0]				c_diff__37;
reg	[`BIT_WIDTH-1:0]				c_diff__38;
reg	[`BIT_WIDTH-1:0]				c_diff__39;
reg	[`BIT_WIDTH-1:0]				c_diff__40;
reg	[`BIT_WIDTH-1:0]				c_diff__41;
reg	[`BIT_WIDTH-1:0]				c_diff__42;
reg	[`BIT_WIDTH-1:0]				c_diff__43;
reg	[`BIT_WIDTH-1:0]				c_diff__44;
reg	[`BIT_WIDTH-1:0]				c_diff__45;
reg	[`BIT_WIDTH-1:0]				c_diff__46;
reg	[`BIT_WIDTH-1:0]				c_diff__47;
reg	[`BIT_WIDTH-1:0]				c_diff__48;
reg	[`BIT_WIDTH-1:0]				c_diff__49;
reg	[`BIT_WIDTH-1:0]				c_diff__50;
reg	[`BIT_WIDTH-1:0]				c_diff__51;
reg	[`BIT_WIDTH-1:0]				c_diff__52;
reg	[`BIT_WIDTH-1:0]				c_diff__53;
reg	[`BIT_WIDTH-1:0]				c_diff__54;
reg	[`BIT_WIDTH-1:0]				c_diff__55;
reg	[`BIT_WIDTH-1:0]				c_diff__56;
reg	[`BIT_WIDTH-1:0]				c_diff__57;
reg	[`BIT_WIDTH-1:0]				c_diff__58;
reg	[`BIT_WIDTH-1:0]				c_diff__59;


//reg	[`BIT_WIDTH-1:0]				c_dl_b[TOTAL_LATENCY - 1:0];


reg	[`BIT_WIDTH-1:0]				c_dl_b__0;
reg	[`BIT_WIDTH-1:0]				c_dl_b__1;
reg	[`BIT_WIDTH-1:0]				c_dl_b__2;
reg	[`BIT_WIDTH-1:0]				c_dl_b__3;
reg	[`BIT_WIDTH-1:0]				c_dl_b__4;
reg	[`BIT_WIDTH-1:0]				c_dl_b__5;
reg	[`BIT_WIDTH-1:0]				c_dl_b__6;
reg	[`BIT_WIDTH-1:0]				c_dl_b__7;
reg	[`BIT_WIDTH-1:0]				c_dl_b__8;
reg	[`BIT_WIDTH-1:0]				c_dl_b__9;
reg	[`BIT_WIDTH-1:0]				c_dl_b__10;
reg	[`BIT_WIDTH-1:0]				c_dl_b__11;
reg	[`BIT_WIDTH-1:0]				c_dl_b__12;
reg	[`BIT_WIDTH-1:0]				c_dl_b__13;
reg	[`BIT_WIDTH-1:0]				c_dl_b__14;
reg	[`BIT_WIDTH-1:0]				c_dl_b__15;
reg	[`BIT_WIDTH-1:0]				c_dl_b__16;
reg	[`BIT_WIDTH-1:0]				c_dl_b__17;
reg	[`BIT_WIDTH-1:0]				c_dl_b__18;
reg	[`BIT_WIDTH-1:0]				c_dl_b__19;
reg	[`BIT_WIDTH-1:0]				c_dl_b__20;
reg	[`BIT_WIDTH-1:0]				c_dl_b__21;
reg	[`BIT_WIDTH-1:0]				c_dl_b__22;
reg	[`BIT_WIDTH-1:0]				c_dl_b__23;
reg	[`BIT_WIDTH-1:0]				c_dl_b__24;
reg	[`BIT_WIDTH-1:0]				c_dl_b__25;
reg	[`BIT_WIDTH-1:0]				c_dl_b__26;
reg	[`BIT_WIDTH-1:0]				c_dl_b__27;
reg	[`BIT_WIDTH-1:0]				c_dl_b__28;
reg	[`BIT_WIDTH-1:0]				c_dl_b__29;
reg	[`BIT_WIDTH-1:0]				c_dl_b__30;
reg	[`BIT_WIDTH-1:0]				c_dl_b__31;
reg	[`BIT_WIDTH-1:0]				c_dl_b__32;
reg	[`BIT_WIDTH-1:0]				c_dl_b__33;
reg	[`BIT_WIDTH-1:0]				c_dl_b__34;
reg	[`BIT_WIDTH-1:0]				c_dl_b__35;
reg	[`BIT_WIDTH-1:0]				c_dl_b__36;
reg	[`BIT_WIDTH-1:0]				c_dl_b__37;
reg	[`BIT_WIDTH-1:0]				c_dl_b__38;
reg	[`BIT_WIDTH-1:0]				c_dl_b__39;
reg	[`BIT_WIDTH-1:0]				c_dl_b__40;
reg	[`BIT_WIDTH-1:0]				c_dl_b__41;
reg	[`BIT_WIDTH-1:0]				c_dl_b__42;
reg	[`BIT_WIDTH-1:0]				c_dl_b__43;
reg	[`BIT_WIDTH-1:0]				c_dl_b__44;
reg	[`BIT_WIDTH-1:0]				c_dl_b__45;
reg	[`BIT_WIDTH-1:0]				c_dl_b__46;
reg	[`BIT_WIDTH-1:0]				c_dl_b__47;
reg	[`BIT_WIDTH-1:0]				c_dl_b__48;
reg	[`BIT_WIDTH-1:0]				c_dl_b__49;
reg	[`BIT_WIDTH-1:0]				c_dl_b__50;
reg	[`BIT_WIDTH-1:0]				c_dl_b__51;
reg	[`BIT_WIDTH-1:0]				c_dl_b__52;
reg	[`BIT_WIDTH-1:0]				c_dl_b__53;
reg	[`BIT_WIDTH-1:0]				c_dl_b__54;
reg	[`BIT_WIDTH-1:0]				c_dl_b__55;
reg	[`BIT_WIDTH-1:0]				c_dl_b__56;
reg	[`BIT_WIDTH-1:0]				c_dl_b__57;
reg	[`BIT_WIDTH-1:0]				c_dl_b__58;
reg	[`BIT_WIDTH-1:0]				c_dl_b__59;


//reg	[2*`BIT_WIDTH-1:0]			c_numer[TOTAL_LATENCY - 1:0];


reg	[2*`BIT_WIDTH-1:0]				c_numer__0;
reg	[2*`BIT_WIDTH-1:0]				c_numer__1;
reg	[2*`BIT_WIDTH-1:0]				c_numer__2;
reg	[2*`BIT_WIDTH-1:0]				c_numer__3;
reg	[2*`BIT_WIDTH-1:0]				c_numer__4;
reg	[2*`BIT_WIDTH-1:0]				c_numer__5;
reg	[2*`BIT_WIDTH-1:0]				c_numer__6;
reg	[2*`BIT_WIDTH-1:0]				c_numer__7;
reg	[2*`BIT_WIDTH-1:0]				c_numer__8;
reg	[2*`BIT_WIDTH-1:0]				c_numer__9;
reg	[2*`BIT_WIDTH-1:0]				c_numer__10;
reg	[2*`BIT_WIDTH-1:0]				c_numer__11;
reg	[2*`BIT_WIDTH-1:0]				c_numer__12;
reg	[2*`BIT_WIDTH-1:0]				c_numer__13;
reg	[2*`BIT_WIDTH-1:0]				c_numer__14;
reg	[2*`BIT_WIDTH-1:0]				c_numer__15;
reg	[2*`BIT_WIDTH-1:0]				c_numer__16;
reg	[2*`BIT_WIDTH-1:0]				c_numer__17;
reg	[2*`BIT_WIDTH-1:0]				c_numer__18;
reg	[2*`BIT_WIDTH-1:0]				c_numer__19;
reg	[2*`BIT_WIDTH-1:0]				c_numer__20;
reg	[2*`BIT_WIDTH-1:0]				c_numer__21;
reg	[2*`BIT_WIDTH-1:0]				c_numer__22;
reg	[2*`BIT_WIDTH-1:0]				c_numer__23;
reg	[2*`BIT_WIDTH-1:0]				c_numer__24;
reg	[2*`BIT_WIDTH-1:0]				c_numer__25;
reg	[2*`BIT_WIDTH-1:0]				c_numer__26;
reg	[2*`BIT_WIDTH-1:0]				c_numer__27;
reg	[2*`BIT_WIDTH-1:0]				c_numer__28;
reg	[2*`BIT_WIDTH-1:0]				c_numer__29;
reg	[2*`BIT_WIDTH-1:0]				c_numer__30;
reg	[2*`BIT_WIDTH-1:0]				c_numer__31;
reg	[2*`BIT_WIDTH-1:0]				c_numer__32;
reg	[2*`BIT_WIDTH-1:0]				c_numer__33;
reg	[2*`BIT_WIDTH-1:0]				c_numer__34;
reg	[2*`BIT_WIDTH-1:0]				c_numer__35;
reg	[2*`BIT_WIDTH-1:0]				c_numer__36;
reg	[2*`BIT_WIDTH-1:0]				c_numer__37;
reg	[2*`BIT_WIDTH-1:0]				c_numer__38;
reg	[2*`BIT_WIDTH-1:0]				c_numer__39;
reg	[2*`BIT_WIDTH-1:0]				c_numer__40;
reg	[2*`BIT_WIDTH-1:0]				c_numer__41;
reg	[2*`BIT_WIDTH-1:0]				c_numer__42;
reg	[2*`BIT_WIDTH-1:0]				c_numer__43;
reg	[2*`BIT_WIDTH-1:0]				c_numer__44;
reg	[2*`BIT_WIDTH-1:0]				c_numer__45;
reg	[2*`BIT_WIDTH-1:0]				c_numer__46;
reg	[2*`BIT_WIDTH-1:0]				c_numer__47;
reg	[2*`BIT_WIDTH-1:0]				c_numer__48;
reg	[2*`BIT_WIDTH-1:0]				c_numer__49;
reg	[2*`BIT_WIDTH-1:0]				c_numer__50;
reg	[2*`BIT_WIDTH-1:0]				c_numer__51;
reg	[2*`BIT_WIDTH-1:0]				c_numer__52;
reg	[2*`BIT_WIDTH-1:0]				c_numer__53;
reg	[2*`BIT_WIDTH-1:0]				c_numer__54;
reg	[2*`BIT_WIDTH-1:0]				c_numer__55;
reg	[2*`BIT_WIDTH-1:0]				c_numer__56;
reg	[2*`BIT_WIDTH-1:0]				c_numer__57;
reg	[2*`BIT_WIDTH-1:0]				c_numer__58;
reg	[2*`BIT_WIDTH-1:0]				c_numer__59;

//reg	[`BIT_WIDTH-1:0]				c_z1[TOTAL_LATENCY - 1:0];


reg	[`BIT_WIDTH-1:0]				c_z1__0;
reg	[`BIT_WIDTH-1:0]				c_z1__1;
reg	[`BIT_WIDTH-1:0]				c_z1__2;
reg	[`BIT_WIDTH-1:0]				c_z1__3;
reg	[`BIT_WIDTH-1:0]				c_z1__4;
reg	[`BIT_WIDTH-1:0]				c_z1__5;
reg	[`BIT_WIDTH-1:0]				c_z1__6;
reg	[`BIT_WIDTH-1:0]				c_z1__7;
reg	[`BIT_WIDTH-1:0]				c_z1__8;
reg	[`BIT_WIDTH-1:0]				c_z1__9;
reg	[`BIT_WIDTH-1:0]				c_z1__10;
reg	[`BIT_WIDTH-1:0]				c_z1__11;
reg	[`BIT_WIDTH-1:0]				c_z1__12;
reg	[`BIT_WIDTH-1:0]				c_z1__13;
reg	[`BIT_WIDTH-1:0]				c_z1__14;
reg	[`BIT_WIDTH-1:0]				c_z1__15;
reg	[`BIT_WIDTH-1:0]				c_z1__16;
reg	[`BIT_WIDTH-1:0]				c_z1__17;
reg	[`BIT_WIDTH-1:0]				c_z1__18;
reg	[`BIT_WIDTH-1:0]				c_z1__19;
reg	[`BIT_WIDTH-1:0]				c_z1__20;
reg	[`BIT_WIDTH-1:0]				c_z1__21;
reg	[`BIT_WIDTH-1:0]				c_z1__22;
reg	[`BIT_WIDTH-1:0]				c_z1__23;
reg	[`BIT_WIDTH-1:0]				c_z1__24;
reg	[`BIT_WIDTH-1:0]				c_z1__25;
reg	[`BIT_WIDTH-1:0]				c_z1__26;
reg	[`BIT_WIDTH-1:0]				c_z1__27;
reg	[`BIT_WIDTH-1:0]				c_z1__28;
reg	[`BIT_WIDTH-1:0]				c_z1__29;
reg	[`BIT_WIDTH-1:0]				c_z1__30;
reg	[`BIT_WIDTH-1:0]				c_z1__31;
reg	[`BIT_WIDTH-1:0]				c_z1__32;
reg	[`BIT_WIDTH-1:0]				c_z1__33;
reg	[`BIT_WIDTH-1:0]				c_z1__34;
reg	[`BIT_WIDTH-1:0]				c_z1__35;
reg	[`BIT_WIDTH-1:0]				c_z1__36;
reg	[`BIT_WIDTH-1:0]				c_z1__37;
reg	[`BIT_WIDTH-1:0]				c_z1__38;
reg	[`BIT_WIDTH-1:0]				c_z1__39;
reg	[`BIT_WIDTH-1:0]				c_z1__40;
reg	[`BIT_WIDTH-1:0]				c_z1__41;
reg	[`BIT_WIDTH-1:0]				c_z1__42;
reg	[`BIT_WIDTH-1:0]				c_z1__43;
reg	[`BIT_WIDTH-1:0]				c_z1__44;
reg	[`BIT_WIDTH-1:0]				c_z1__45;
reg	[`BIT_WIDTH-1:0]				c_z1__46;
reg	[`BIT_WIDTH-1:0]				c_z1__47;
reg	[`BIT_WIDTH-1:0]				c_z1__48;
reg	[`BIT_WIDTH-1:0]				c_z1__49;
reg	[`BIT_WIDTH-1:0]				c_z1__50;
reg	[`BIT_WIDTH-1:0]				c_z1__51;
reg	[`BIT_WIDTH-1:0]				c_z1__52;
reg	[`BIT_WIDTH-1:0]				c_z1__53;
reg	[`BIT_WIDTH-1:0]				c_z1__54;
reg	[`BIT_WIDTH-1:0]				c_z1__55;
reg	[`BIT_WIDTH-1:0]				c_z1__56;
reg	[`BIT_WIDTH-1:0]				c_z1__57;
reg	[`BIT_WIDTH-1:0]				c_z1__58;
reg	[`BIT_WIDTH-1:0]				c_z1__59;

//reg	[`BIT_WIDTH-1:0]				c_z0[TOTAL_LATENCY - 1:0];


reg	[`BIT_WIDTH-1:0]				c_z0__0;
reg	[`BIT_WIDTH-1:0]				c_z0__1;
reg	[`BIT_WIDTH-1:0]				c_z0__2;
reg	[`BIT_WIDTH-1:0]				c_z0__3;
reg	[`BIT_WIDTH-1:0]				c_z0__4;
reg	[`BIT_WIDTH-1:0]				c_z0__5;
reg	[`BIT_WIDTH-1:0]				c_z0__6;
reg	[`BIT_WIDTH-1:0]				c_z0__7;
reg	[`BIT_WIDTH-1:0]				c_z0__8;
reg	[`BIT_WIDTH-1:0]				c_z0__9;
reg	[`BIT_WIDTH-1:0]				c_z0__10;
reg	[`BIT_WIDTH-1:0]				c_z0__11;
reg	[`BIT_WIDTH-1:0]				c_z0__12;
reg	[`BIT_WIDTH-1:0]				c_z0__13;
reg	[`BIT_WIDTH-1:0]				c_z0__14;
reg	[`BIT_WIDTH-1:0]				c_z0__15;
reg	[`BIT_WIDTH-1:0]				c_z0__16;
reg	[`BIT_WIDTH-1:0]				c_z0__17;
reg	[`BIT_WIDTH-1:0]				c_z0__18;
reg	[`BIT_WIDTH-1:0]				c_z0__19;
reg	[`BIT_WIDTH-1:0]				c_z0__20;
reg	[`BIT_WIDTH-1:0]				c_z0__21;
reg	[`BIT_WIDTH-1:0]				c_z0__22;
reg	[`BIT_WIDTH-1:0]				c_z0__23;
reg	[`BIT_WIDTH-1:0]				c_z0__24;
reg	[`BIT_WIDTH-1:0]				c_z0__25;
reg	[`BIT_WIDTH-1:0]				c_z0__26;
reg	[`BIT_WIDTH-1:0]				c_z0__27;
reg	[`BIT_WIDTH-1:0]				c_z0__28;
reg	[`BIT_WIDTH-1:0]				c_z0__29;
reg	[`BIT_WIDTH-1:0]				c_z0__30;
reg	[`BIT_WIDTH-1:0]				c_z0__31;
reg	[`BIT_WIDTH-1:0]				c_z0__32;
reg	[`BIT_WIDTH-1:0]				c_z0__33;
reg	[`BIT_WIDTH-1:0]				c_z0__34;
reg	[`BIT_WIDTH-1:0]				c_z0__35;
reg	[`BIT_WIDTH-1:0]				c_z0__36;
reg	[`BIT_WIDTH-1:0]				c_z0__37;
reg	[`BIT_WIDTH-1:0]				c_z0__38;
reg	[`BIT_WIDTH-1:0]				c_z0__39;
reg	[`BIT_WIDTH-1:0]				c_z0__40;
reg	[`BIT_WIDTH-1:0]				c_z0__41;
reg	[`BIT_WIDTH-1:0]				c_z0__42;
reg	[`BIT_WIDTH-1:0]				c_z0__43;
reg	[`BIT_WIDTH-1:0]				c_z0__44;
reg	[`BIT_WIDTH-1:0]				c_z0__45;
reg	[`BIT_WIDTH-1:0]				c_z0__46;
reg	[`BIT_WIDTH-1:0]				c_z0__47;
reg	[`BIT_WIDTH-1:0]				c_z0__48;
reg	[`BIT_WIDTH-1:0]				c_z0__49;
reg	[`BIT_WIDTH-1:0]				c_z0__50;
reg	[`BIT_WIDTH-1:0]				c_z0__51;
reg	[`BIT_WIDTH-1:0]				c_z0__52;
reg	[`BIT_WIDTH-1:0]				c_z0__53;
reg	[`BIT_WIDTH-1:0]				c_z0__54;
reg	[`BIT_WIDTH-1:0]				c_z0__55;
reg	[`BIT_WIDTH-1:0]				c_z0__56;
reg	[`BIT_WIDTH-1:0]				c_z0__57;
reg	[`BIT_WIDTH-1:0]				c_z0__58;
reg	[`BIT_WIDTH-1:0]				c_z0__59;



//reg	[`BIT_WIDTH-1:0]				c_mut[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				c_mut__0;
reg	[`BIT_WIDTH-1:0]				c_mut__1;
reg	[`BIT_WIDTH-1:0]				c_mut__2;
reg	[`BIT_WIDTH-1:0]				c_mut__3;
reg	[`BIT_WIDTH-1:0]				c_mut__4;
reg	[`BIT_WIDTH-1:0]				c_mut__5;
reg	[`BIT_WIDTH-1:0]				c_mut__6;
reg	[`BIT_WIDTH-1:0]				c_mut__7;
reg	[`BIT_WIDTH-1:0]				c_mut__8;
reg	[`BIT_WIDTH-1:0]				c_mut__9;
reg	[`BIT_WIDTH-1:0]				c_mut__10;
reg	[`BIT_WIDTH-1:0]				c_mut__11;
reg	[`BIT_WIDTH-1:0]				c_mut__12;
reg	[`BIT_WIDTH-1:0]				c_mut__13;
reg	[`BIT_WIDTH-1:0]				c_mut__14;
reg	[`BIT_WIDTH-1:0]				c_mut__15;
reg	[`BIT_WIDTH-1:0]				c_mut__16;
reg	[`BIT_WIDTH-1:0]				c_mut__17;
reg	[`BIT_WIDTH-1:0]				c_mut__18;
reg	[`BIT_WIDTH-1:0]				c_mut__19;
reg	[`BIT_WIDTH-1:0]				c_mut__20;
reg	[`BIT_WIDTH-1:0]				c_mut__21;
reg	[`BIT_WIDTH-1:0]				c_mut__22;
reg	[`BIT_WIDTH-1:0]				c_mut__23;
reg	[`BIT_WIDTH-1:0]				c_mut__24;
reg	[`BIT_WIDTH-1:0]				c_mut__25;
reg	[`BIT_WIDTH-1:0]				c_mut__26;
reg	[`BIT_WIDTH-1:0]				c_mut__27;
reg	[`BIT_WIDTH-1:0]				c_mut__28;
reg	[`BIT_WIDTH-1:0]				c_mut__29;
reg	[`BIT_WIDTH-1:0]				c_mut__30;
reg	[`BIT_WIDTH-1:0]				c_mut__31;
reg	[`BIT_WIDTH-1:0]				c_mut__32;
reg	[`BIT_WIDTH-1:0]				c_mut__33;
reg	[`BIT_WIDTH-1:0]				c_mut__34;
reg	[`BIT_WIDTH-1:0]				c_mut__35;
reg	[`BIT_WIDTH-1:0]				c_mut__36;
reg	[`BIT_WIDTH-1:0]				c_mut__37;
reg	[`BIT_WIDTH-1:0]				c_mut__38;
reg	[`BIT_WIDTH-1:0]				c_mut__39;
reg	[`BIT_WIDTH-1:0]				c_mut__40;
reg	[`BIT_WIDTH-1:0]				c_mut__41;
reg	[`BIT_WIDTH-1:0]				c_mut__42;
reg	[`BIT_WIDTH-1:0]				c_mut__43;
reg	[`BIT_WIDTH-1:0]				c_mut__44;
reg	[`BIT_WIDTH-1:0]				c_mut__45;
reg	[`BIT_WIDTH-1:0]				c_mut__46;
reg	[`BIT_WIDTH-1:0]				c_mut__47;
reg	[`BIT_WIDTH-1:0]				c_mut__48;
reg	[`BIT_WIDTH-1:0]				c_mut__49;
reg	[`BIT_WIDTH-1:0]				c_mut__50;
reg	[`BIT_WIDTH-1:0]				c_mut__51;
reg	[`BIT_WIDTH-1:0]				c_mut__52;
reg	[`BIT_WIDTH-1:0]				c_mut__53;
reg	[`BIT_WIDTH-1:0]				c_mut__54;
reg	[`BIT_WIDTH-1:0]				c_mut__55;
reg	[`BIT_WIDTH-1:0]				c_mut__56;
reg	[`BIT_WIDTH-1:0]				c_mut__57;
reg	[`BIT_WIDTH-1:0]				c_mut__58;
reg	[`BIT_WIDTH-1:0]				c_mut__59;


//reg	[`BIT_WIDTH-1:0]				r_x	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_x__0;
reg	[`BIT_WIDTH-1:0]				r_x__1;
reg	[`BIT_WIDTH-1:0]				r_x__2;
reg	[`BIT_WIDTH-1:0]				r_x__3;
reg	[`BIT_WIDTH-1:0]				r_x__4;
reg	[`BIT_WIDTH-1:0]				r_x__5;
reg	[`BIT_WIDTH-1:0]				r_x__6;
reg	[`BIT_WIDTH-1:0]				r_x__7;
reg	[`BIT_WIDTH-1:0]				r_x__8;
reg	[`BIT_WIDTH-1:0]				r_x__9;
reg	[`BIT_WIDTH-1:0]				r_x__10;
reg	[`BIT_WIDTH-1:0]				r_x__11;
reg	[`BIT_WIDTH-1:0]				r_x__12;
reg	[`BIT_WIDTH-1:0]				r_x__13;
reg	[`BIT_WIDTH-1:0]				r_x__14;
reg	[`BIT_WIDTH-1:0]				r_x__15;
reg	[`BIT_WIDTH-1:0]				r_x__16;
reg	[`BIT_WIDTH-1:0]				r_x__17;
reg	[`BIT_WIDTH-1:0]				r_x__18;
reg	[`BIT_WIDTH-1:0]				r_x__19;
reg	[`BIT_WIDTH-1:0]				r_x__20;
reg	[`BIT_WIDTH-1:0]				r_x__21;
reg	[`BIT_WIDTH-1:0]				r_x__22;
reg	[`BIT_WIDTH-1:0]				r_x__23;
reg	[`BIT_WIDTH-1:0]				r_x__24;
reg	[`BIT_WIDTH-1:0]				r_x__25;
reg	[`BIT_WIDTH-1:0]				r_x__26;
reg	[`BIT_WIDTH-1:0]				r_x__27;
reg	[`BIT_WIDTH-1:0]				r_x__28;
reg	[`BIT_WIDTH-1:0]				r_x__29;
reg	[`BIT_WIDTH-1:0]				r_x__30;
reg	[`BIT_WIDTH-1:0]				r_x__31;
reg	[`BIT_WIDTH-1:0]				r_x__32;
reg	[`BIT_WIDTH-1:0]				r_x__33;
reg	[`BIT_WIDTH-1:0]				r_x__34;
reg	[`BIT_WIDTH-1:0]				r_x__35;
reg	[`BIT_WIDTH-1:0]				r_x__36;
reg	[`BIT_WIDTH-1:0]				r_x__37;
reg	[`BIT_WIDTH-1:0]				r_x__38;
reg	[`BIT_WIDTH-1:0]				r_x__39;
reg	[`BIT_WIDTH-1:0]				r_x__40;
reg	[`BIT_WIDTH-1:0]				r_x__41;
reg	[`BIT_WIDTH-1:0]				r_x__42;
reg	[`BIT_WIDTH-1:0]				r_x__43;
reg	[`BIT_WIDTH-1:0]				r_x__44;
reg	[`BIT_WIDTH-1:0]				r_x__45;
reg	[`BIT_WIDTH-1:0]				r_x__46;
reg	[`BIT_WIDTH-1:0]				r_x__47;
reg	[`BIT_WIDTH-1:0]				r_x__48;
reg	[`BIT_WIDTH-1:0]				r_x__49;
reg	[`BIT_WIDTH-1:0]				r_x__50;
reg	[`BIT_WIDTH-1:0]				r_x__51;
reg	[`BIT_WIDTH-1:0]				r_x__52;
reg	[`BIT_WIDTH-1:0]				r_x__53;
reg	[`BIT_WIDTH-1:0]				r_x__54;
reg	[`BIT_WIDTH-1:0]				r_x__55;
reg	[`BIT_WIDTH-1:0]				r_x__56;
reg	[`BIT_WIDTH-1:0]				r_x__57;
reg	[`BIT_WIDTH-1:0]				r_x__58;
reg	[`BIT_WIDTH-1:0]				r_x__59;

//reg	[`BIT_WIDTH-1:0]				r_y	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_y__0;
reg	[`BIT_WIDTH-1:0]				r_y__1;
reg	[`BIT_WIDTH-1:0]				r_y__2;
reg	[`BIT_WIDTH-1:0]				r_y__3;
reg	[`BIT_WIDTH-1:0]				r_y__4;
reg	[`BIT_WIDTH-1:0]				r_y__5;
reg	[`BIT_WIDTH-1:0]				r_y__6;
reg	[`BIT_WIDTH-1:0]				r_y__7;
reg	[`BIT_WIDTH-1:0]				r_y__8;
reg	[`BIT_WIDTH-1:0]				r_y__9;
reg	[`BIT_WIDTH-1:0]				r_y__10;
reg	[`BIT_WIDTH-1:0]				r_y__11;
reg	[`BIT_WIDTH-1:0]				r_y__12;
reg	[`BIT_WIDTH-1:0]				r_y__13;
reg	[`BIT_WIDTH-1:0]				r_y__14;
reg	[`BIT_WIDTH-1:0]				r_y__15;
reg	[`BIT_WIDTH-1:0]				r_y__16;
reg	[`BIT_WIDTH-1:0]				r_y__17;
reg	[`BIT_WIDTH-1:0]				r_y__18;
reg	[`BIT_WIDTH-1:0]				r_y__19;
reg	[`BIT_WIDTH-1:0]				r_y__20;
reg	[`BIT_WIDTH-1:0]				r_y__21;
reg	[`BIT_WIDTH-1:0]				r_y__22;
reg	[`BIT_WIDTH-1:0]				r_y__23;
reg	[`BIT_WIDTH-1:0]				r_y__24;
reg	[`BIT_WIDTH-1:0]				r_y__25;
reg	[`BIT_WIDTH-1:0]				r_y__26;
reg	[`BIT_WIDTH-1:0]				r_y__27;
reg	[`BIT_WIDTH-1:0]				r_y__28;
reg	[`BIT_WIDTH-1:0]				r_y__29;
reg	[`BIT_WIDTH-1:0]				r_y__30;
reg	[`BIT_WIDTH-1:0]				r_y__31;
reg	[`BIT_WIDTH-1:0]				r_y__32;
reg	[`BIT_WIDTH-1:0]				r_y__33;
reg	[`BIT_WIDTH-1:0]				r_y__34;
reg	[`BIT_WIDTH-1:0]				r_y__35;
reg	[`BIT_WIDTH-1:0]				r_y__36;
reg	[`BIT_WIDTH-1:0]				r_y__37;
reg	[`BIT_WIDTH-1:0]				r_y__38;
reg	[`BIT_WIDTH-1:0]				r_y__39;
reg	[`BIT_WIDTH-1:0]				r_y__40;
reg	[`BIT_WIDTH-1:0]				r_y__41;
reg	[`BIT_WIDTH-1:0]				r_y__42;
reg	[`BIT_WIDTH-1:0]				r_y__43;
reg	[`BIT_WIDTH-1:0]				r_y__44;
reg	[`BIT_WIDTH-1:0]				r_y__45;
reg	[`BIT_WIDTH-1:0]				r_y__46;
reg	[`BIT_WIDTH-1:0]				r_y__47;
reg	[`BIT_WIDTH-1:0]				r_y__48;
reg	[`BIT_WIDTH-1:0]				r_y__49;
reg	[`BIT_WIDTH-1:0]				r_y__50;
reg	[`BIT_WIDTH-1:0]				r_y__51;
reg	[`BIT_WIDTH-1:0]				r_y__52;
reg	[`BIT_WIDTH-1:0]				r_y__53;
reg	[`BIT_WIDTH-1:0]				r_y__54;
reg	[`BIT_WIDTH-1:0]				r_y__55;
reg	[`BIT_WIDTH-1:0]				r_y__56;
reg	[`BIT_WIDTH-1:0]				r_y__57;
reg	[`BIT_WIDTH-1:0]				r_y__58;
reg	[`BIT_WIDTH-1:0]				r_y__59;



//reg	[`BIT_WIDTH-1:0]				r_z	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_z__0;
reg	[`BIT_WIDTH-1:0]				r_z__1;
reg	[`BIT_WIDTH-1:0]				r_z__2;
reg	[`BIT_WIDTH-1:0]				r_z__3;
reg	[`BIT_WIDTH-1:0]				r_z__4;
reg	[`BIT_WIDTH-1:0]				r_z__5;
reg	[`BIT_WIDTH-1:0]				r_z__6;
reg	[`BIT_WIDTH-1:0]				r_z__7;
reg	[`BIT_WIDTH-1:0]				r_z__8;
reg	[`BIT_WIDTH-1:0]				r_z__9;
reg	[`BIT_WIDTH-1:0]				r_z__10;
reg	[`BIT_WIDTH-1:0]				r_z__11;
reg	[`BIT_WIDTH-1:0]				r_z__12;
reg	[`BIT_WIDTH-1:0]				r_z__13;
reg	[`BIT_WIDTH-1:0]				r_z__14;
reg	[`BIT_WIDTH-1:0]				r_z__15;
reg	[`BIT_WIDTH-1:0]				r_z__16;
reg	[`BIT_WIDTH-1:0]				r_z__17;
reg	[`BIT_WIDTH-1:0]				r_z__18;
reg	[`BIT_WIDTH-1:0]				r_z__19;
reg	[`BIT_WIDTH-1:0]				r_z__20;
reg	[`BIT_WIDTH-1:0]				r_z__21;
reg	[`BIT_WIDTH-1:0]				r_z__22;
reg	[`BIT_WIDTH-1:0]				r_z__23;
reg	[`BIT_WIDTH-1:0]				r_z__24;
reg	[`BIT_WIDTH-1:0]				r_z__25;
reg	[`BIT_WIDTH-1:0]				r_z__26;
reg	[`BIT_WIDTH-1:0]				r_z__27;
reg	[`BIT_WIDTH-1:0]				r_z__28;
reg	[`BIT_WIDTH-1:0]				r_z__29;
reg	[`BIT_WIDTH-1:0]				r_z__30;
reg	[`BIT_WIDTH-1:0]				r_z__31;
reg	[`BIT_WIDTH-1:0]				r_z__32;
reg	[`BIT_WIDTH-1:0]				r_z__33;
reg	[`BIT_WIDTH-1:0]				r_z__34;
reg	[`BIT_WIDTH-1:0]				r_z__35;
reg	[`BIT_WIDTH-1:0]				r_z__36;
reg	[`BIT_WIDTH-1:0]				r_z__37;
reg	[`BIT_WIDTH-1:0]				r_z__38;
reg	[`BIT_WIDTH-1:0]				r_z__39;
reg	[`BIT_WIDTH-1:0]				r_z__40;
reg	[`BIT_WIDTH-1:0]				r_z__41;
reg	[`BIT_WIDTH-1:0]				r_z__42;
reg	[`BIT_WIDTH-1:0]				r_z__43;
reg	[`BIT_WIDTH-1:0]				r_z__44;
reg	[`BIT_WIDTH-1:0]				r_z__45;
reg	[`BIT_WIDTH-1:0]				r_z__46;
reg	[`BIT_WIDTH-1:0]				r_z__47;
reg	[`BIT_WIDTH-1:0]				r_z__48;
reg	[`BIT_WIDTH-1:0]				r_z__49;
reg	[`BIT_WIDTH-1:0]				r_z__50;
reg	[`BIT_WIDTH-1:0]				r_z__51;
reg	[`BIT_WIDTH-1:0]				r_z__52;
reg	[`BIT_WIDTH-1:0]				r_z__53;
reg	[`BIT_WIDTH-1:0]				r_z__54;
reg	[`BIT_WIDTH-1:0]				r_z__55;
reg	[`BIT_WIDTH-1:0]				r_z__56;
reg	[`BIT_WIDTH-1:0]				r_z__57;
reg	[`BIT_WIDTH-1:0]				r_z__58;
reg	[`BIT_WIDTH-1:0]				r_z__59;

//reg	[`BIT_WIDTH-1:0]				r_ux	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_ux__0;
reg	[`BIT_WIDTH-1:0]				r_ux__1;
reg	[`BIT_WIDTH-1:0]				r_ux__2;
reg	[`BIT_WIDTH-1:0]				r_ux__3;
reg	[`BIT_WIDTH-1:0]				r_ux__4;
reg	[`BIT_WIDTH-1:0]				r_ux__5;
reg	[`BIT_WIDTH-1:0]				r_ux__6;
reg	[`BIT_WIDTH-1:0]				r_ux__7;
reg	[`BIT_WIDTH-1:0]				r_ux__8;
reg	[`BIT_WIDTH-1:0]				r_ux__9;
reg	[`BIT_WIDTH-1:0]				r_ux__10;
reg	[`BIT_WIDTH-1:0]				r_ux__11;
reg	[`BIT_WIDTH-1:0]				r_ux__12;
reg	[`BIT_WIDTH-1:0]				r_ux__13;
reg	[`BIT_WIDTH-1:0]				r_ux__14;
reg	[`BIT_WIDTH-1:0]				r_ux__15;
reg	[`BIT_WIDTH-1:0]				r_ux__16;
reg	[`BIT_WIDTH-1:0]				r_ux__17;
reg	[`BIT_WIDTH-1:0]				r_ux__18;
reg	[`BIT_WIDTH-1:0]				r_ux__19;
reg	[`BIT_WIDTH-1:0]				r_ux__20;
reg	[`BIT_WIDTH-1:0]				r_ux__21;
reg	[`BIT_WIDTH-1:0]				r_ux__22;
reg	[`BIT_WIDTH-1:0]				r_ux__23;
reg	[`BIT_WIDTH-1:0]				r_ux__24;
reg	[`BIT_WIDTH-1:0]				r_ux__25;
reg	[`BIT_WIDTH-1:0]				r_ux__26;
reg	[`BIT_WIDTH-1:0]				r_ux__27;
reg	[`BIT_WIDTH-1:0]				r_ux__28;
reg	[`BIT_WIDTH-1:0]				r_ux__29;
reg	[`BIT_WIDTH-1:0]				r_ux__30;
reg	[`BIT_WIDTH-1:0]				r_ux__31;
reg	[`BIT_WIDTH-1:0]				r_ux__32;
reg	[`BIT_WIDTH-1:0]				r_ux__33;
reg	[`BIT_WIDTH-1:0]				r_ux__34;
reg	[`BIT_WIDTH-1:0]				r_ux__35;
reg	[`BIT_WIDTH-1:0]				r_ux__36;
reg	[`BIT_WIDTH-1:0]				r_ux__37;
reg	[`BIT_WIDTH-1:0]				r_ux__38;
reg	[`BIT_WIDTH-1:0]				r_ux__39;
reg	[`BIT_WIDTH-1:0]				r_ux__40;
reg	[`BIT_WIDTH-1:0]				r_ux__41;
reg	[`BIT_WIDTH-1:0]				r_ux__42;
reg	[`BIT_WIDTH-1:0]				r_ux__43;
reg	[`BIT_WIDTH-1:0]				r_ux__44;
reg	[`BIT_WIDTH-1:0]				r_ux__45;
reg	[`BIT_WIDTH-1:0]				r_ux__46;
reg	[`BIT_WIDTH-1:0]				r_ux__47;
reg	[`BIT_WIDTH-1:0]				r_ux__48;
reg	[`BIT_WIDTH-1:0]				r_ux__49;
reg	[`BIT_WIDTH-1:0]				r_ux__50;
reg	[`BIT_WIDTH-1:0]				r_ux__51;
reg	[`BIT_WIDTH-1:0]				r_ux__52;
reg	[`BIT_WIDTH-1:0]				r_ux__53;
reg	[`BIT_WIDTH-1:0]				r_ux__54;
reg	[`BIT_WIDTH-1:0]				r_ux__55;
reg	[`BIT_WIDTH-1:0]				r_ux__56;
reg	[`BIT_WIDTH-1:0]				r_ux__57;
reg	[`BIT_WIDTH-1:0]				r_ux__58;
reg	[`BIT_WIDTH-1:0]				r_ux__59;

//reg	[`BIT_WIDTH-1:0]				r_uy	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_uy__0;
reg	[`BIT_WIDTH-1:0]				r_uy__1;
reg	[`BIT_WIDTH-1:0]				r_uy__2;
reg	[`BIT_WIDTH-1:0]				r_uy__3;
reg	[`BIT_WIDTH-1:0]				r_uy__4;
reg	[`BIT_WIDTH-1:0]				r_uy__5;
reg	[`BIT_WIDTH-1:0]				r_uy__6;
reg	[`BIT_WIDTH-1:0]				r_uy__7;
reg	[`BIT_WIDTH-1:0]				r_uy__8;
reg	[`BIT_WIDTH-1:0]				r_uy__9;
reg	[`BIT_WIDTH-1:0]				r_uy__10;
reg	[`BIT_WIDTH-1:0]				r_uy__11;
reg	[`BIT_WIDTH-1:0]				r_uy__12;
reg	[`BIT_WIDTH-1:0]				r_uy__13;
reg	[`BIT_WIDTH-1:0]				r_uy__14;
reg	[`BIT_WIDTH-1:0]				r_uy__15;
reg	[`BIT_WIDTH-1:0]				r_uy__16;
reg	[`BIT_WIDTH-1:0]				r_uy__17;
reg	[`BIT_WIDTH-1:0]				r_uy__18;
reg	[`BIT_WIDTH-1:0]				r_uy__19;
reg	[`BIT_WIDTH-1:0]				r_uy__20;
reg	[`BIT_WIDTH-1:0]				r_uy__21;
reg	[`BIT_WIDTH-1:0]				r_uy__22;
reg	[`BIT_WIDTH-1:0]				r_uy__23;
reg	[`BIT_WIDTH-1:0]				r_uy__24;
reg	[`BIT_WIDTH-1:0]				r_uy__25;
reg	[`BIT_WIDTH-1:0]				r_uy__26;
reg	[`BIT_WIDTH-1:0]				r_uy__27;
reg	[`BIT_WIDTH-1:0]				r_uy__28;
reg	[`BIT_WIDTH-1:0]				r_uy__29;
reg	[`BIT_WIDTH-1:0]				r_uy__30;
reg	[`BIT_WIDTH-1:0]				r_uy__31;
reg	[`BIT_WIDTH-1:0]				r_uy__32;
reg	[`BIT_WIDTH-1:0]				r_uy__33;
reg	[`BIT_WIDTH-1:0]				r_uy__34;
reg	[`BIT_WIDTH-1:0]				r_uy__35;
reg	[`BIT_WIDTH-1:0]				r_uy__36;
reg	[`BIT_WIDTH-1:0]				r_uy__37;
reg	[`BIT_WIDTH-1:0]				r_uy__38;
reg	[`BIT_WIDTH-1:0]				r_uy__39;
reg	[`BIT_WIDTH-1:0]				r_uy__40;
reg	[`BIT_WIDTH-1:0]				r_uy__41;
reg	[`BIT_WIDTH-1:0]				r_uy__42;
reg	[`BIT_WIDTH-1:0]				r_uy__43;
reg	[`BIT_WIDTH-1:0]				r_uy__44;
reg	[`BIT_WIDTH-1:0]				r_uy__45;
reg	[`BIT_WIDTH-1:0]				r_uy__46;
reg	[`BIT_WIDTH-1:0]				r_uy__47;
reg	[`BIT_WIDTH-1:0]				r_uy__48;
reg	[`BIT_WIDTH-1:0]				r_uy__49;
reg	[`BIT_WIDTH-1:0]				r_uy__50;
reg	[`BIT_WIDTH-1:0]				r_uy__51;
reg	[`BIT_WIDTH-1:0]				r_uy__52;
reg	[`BIT_WIDTH-1:0]				r_uy__53;
reg	[`BIT_WIDTH-1:0]				r_uy__54;
reg	[`BIT_WIDTH-1:0]				r_uy__55;
reg	[`BIT_WIDTH-1:0]				r_uy__56;
reg	[`BIT_WIDTH-1:0]				r_uy__57;
reg	[`BIT_WIDTH-1:0]				r_uy__58;
reg	[`BIT_WIDTH-1:0]				r_uy__59;

//reg	[`BIT_WIDTH-1:0]				r_uz	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_uz__0;
reg	[`BIT_WIDTH-1:0]				r_uz__1;
reg	[`BIT_WIDTH-1:0]				r_uz__2;
reg	[`BIT_WIDTH-1:0]				r_uz__3;
reg	[`BIT_WIDTH-1:0]				r_uz__4;
reg	[`BIT_WIDTH-1:0]				r_uz__5;
reg	[`BIT_WIDTH-1:0]				r_uz__6;
reg	[`BIT_WIDTH-1:0]				r_uz__7;
reg	[`BIT_WIDTH-1:0]				r_uz__8;
reg	[`BIT_WIDTH-1:0]				r_uz__9;
reg	[`BIT_WIDTH-1:0]				r_uz__10;
reg	[`BIT_WIDTH-1:0]				r_uz__11;
reg	[`BIT_WIDTH-1:0]				r_uz__12;
reg	[`BIT_WIDTH-1:0]				r_uz__13;
reg	[`BIT_WIDTH-1:0]				r_uz__14;
reg	[`BIT_WIDTH-1:0]				r_uz__15;
reg	[`BIT_WIDTH-1:0]				r_uz__16;
reg	[`BIT_WIDTH-1:0]				r_uz__17;
reg	[`BIT_WIDTH-1:0]				r_uz__18;
reg	[`BIT_WIDTH-1:0]				r_uz__19;
reg	[`BIT_WIDTH-1:0]				r_uz__20;
reg	[`BIT_WIDTH-1:0]				r_uz__21;
reg	[`BIT_WIDTH-1:0]				r_uz__22;
reg	[`BIT_WIDTH-1:0]				r_uz__23;
reg	[`BIT_WIDTH-1:0]				r_uz__24;
reg	[`BIT_WIDTH-1:0]				r_uz__25;
reg	[`BIT_WIDTH-1:0]				r_uz__26;
reg	[`BIT_WIDTH-1:0]				r_uz__27;
reg	[`BIT_WIDTH-1:0]				r_uz__28;
reg	[`BIT_WIDTH-1:0]				r_uz__29;
reg	[`BIT_WIDTH-1:0]				r_uz__30;
reg	[`BIT_WIDTH-1:0]				r_uz__31;
reg	[`BIT_WIDTH-1:0]				r_uz__32;
reg	[`BIT_WIDTH-1:0]				r_uz__33;
reg	[`BIT_WIDTH-1:0]				r_uz__34;
reg	[`BIT_WIDTH-1:0]				r_uz__35;
reg	[`BIT_WIDTH-1:0]				r_uz__36;
reg	[`BIT_WIDTH-1:0]				r_uz__37;
reg	[`BIT_WIDTH-1:0]				r_uz__38;
reg	[`BIT_WIDTH-1:0]				r_uz__39;
reg	[`BIT_WIDTH-1:0]				r_uz__40;
reg	[`BIT_WIDTH-1:0]				r_uz__41;
reg	[`BIT_WIDTH-1:0]				r_uz__42;
reg	[`BIT_WIDTH-1:0]				r_uz__43;
reg	[`BIT_WIDTH-1:0]				r_uz__44;
reg	[`BIT_WIDTH-1:0]				r_uz__45;
reg	[`BIT_WIDTH-1:0]				r_uz__46;
reg	[`BIT_WIDTH-1:0]				r_uz__47;
reg	[`BIT_WIDTH-1:0]				r_uz__48;
reg	[`BIT_WIDTH-1:0]				r_uz__49;
reg	[`BIT_WIDTH-1:0]				r_uz__50;
reg	[`BIT_WIDTH-1:0]				r_uz__51;
reg	[`BIT_WIDTH-1:0]				r_uz__52;
reg	[`BIT_WIDTH-1:0]				r_uz__53;
reg	[`BIT_WIDTH-1:0]				r_uz__54;
reg	[`BIT_WIDTH-1:0]				r_uz__55;
reg	[`BIT_WIDTH-1:0]				r_uz__56;
reg	[`BIT_WIDTH-1:0]				r_uz__57;
reg	[`BIT_WIDTH-1:0]				r_uz__58;
reg	[`BIT_WIDTH-1:0]				r_uz__59;


//reg	[`BIT_WIDTH-1:0]				r_sz	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_sz__0;
reg	[`BIT_WIDTH-1:0]				r_sz__1;
reg	[`BIT_WIDTH-1:0]				r_sz__2;
reg	[`BIT_WIDTH-1:0]				r_sz__3;
reg	[`BIT_WIDTH-1:0]				r_sz__4;
reg	[`BIT_WIDTH-1:0]				r_sz__5;
reg	[`BIT_WIDTH-1:0]				r_sz__6;
reg	[`BIT_WIDTH-1:0]				r_sz__7;
reg	[`BIT_WIDTH-1:0]				r_sz__8;
reg	[`BIT_WIDTH-1:0]				r_sz__9;
reg	[`BIT_WIDTH-1:0]				r_sz__10;
reg	[`BIT_WIDTH-1:0]				r_sz__11;
reg	[`BIT_WIDTH-1:0]				r_sz__12;
reg	[`BIT_WIDTH-1:0]				r_sz__13;
reg	[`BIT_WIDTH-1:0]				r_sz__14;
reg	[`BIT_WIDTH-1:0]				r_sz__15;
reg	[`BIT_WIDTH-1:0]				r_sz__16;
reg	[`BIT_WIDTH-1:0]				r_sz__17;
reg	[`BIT_WIDTH-1:0]				r_sz__18;
reg	[`BIT_WIDTH-1:0]				r_sz__19;
reg	[`BIT_WIDTH-1:0]				r_sz__20;
reg	[`BIT_WIDTH-1:0]				r_sz__21;
reg	[`BIT_WIDTH-1:0]				r_sz__22;
reg	[`BIT_WIDTH-1:0]				r_sz__23;
reg	[`BIT_WIDTH-1:0]				r_sz__24;
reg	[`BIT_WIDTH-1:0]				r_sz__25;
reg	[`BIT_WIDTH-1:0]				r_sz__26;
reg	[`BIT_WIDTH-1:0]				r_sz__27;
reg	[`BIT_WIDTH-1:0]				r_sz__28;
reg	[`BIT_WIDTH-1:0]				r_sz__29;
reg	[`BIT_WIDTH-1:0]				r_sz__30;
reg	[`BIT_WIDTH-1:0]				r_sz__31;
reg	[`BIT_WIDTH-1:0]				r_sz__32;
reg	[`BIT_WIDTH-1:0]				r_sz__33;
reg	[`BIT_WIDTH-1:0]				r_sz__34;
reg	[`BIT_WIDTH-1:0]				r_sz__35;
reg	[`BIT_WIDTH-1:0]				r_sz__36;
reg	[`BIT_WIDTH-1:0]				r_sz__37;
reg	[`BIT_WIDTH-1:0]				r_sz__38;
reg	[`BIT_WIDTH-1:0]				r_sz__39;
reg	[`BIT_WIDTH-1:0]				r_sz__40;
reg	[`BIT_WIDTH-1:0]				r_sz__41;
reg	[`BIT_WIDTH-1:0]				r_sz__42;
reg	[`BIT_WIDTH-1:0]				r_sz__43;
reg	[`BIT_WIDTH-1:0]				r_sz__44;
reg	[`BIT_WIDTH-1:0]				r_sz__45;
reg	[`BIT_WIDTH-1:0]				r_sz__46;
reg	[`BIT_WIDTH-1:0]				r_sz__47;
reg	[`BIT_WIDTH-1:0]				r_sz__48;
reg	[`BIT_WIDTH-1:0]				r_sz__49;
reg	[`BIT_WIDTH-1:0]				r_sz__50;
reg	[`BIT_WIDTH-1:0]				r_sz__51;
reg	[`BIT_WIDTH-1:0]				r_sz__52;
reg	[`BIT_WIDTH-1:0]				r_sz__53;
reg	[`BIT_WIDTH-1:0]				r_sz__54;
reg	[`BIT_WIDTH-1:0]				r_sz__55;
reg	[`BIT_WIDTH-1:0]				r_sz__56;
reg	[`BIT_WIDTH-1:0]				r_sz__57;
reg	[`BIT_WIDTH-1:0]				r_sz__58;
reg	[`BIT_WIDTH-1:0]				r_sz__59;

//reg	[`BIT_WIDTH-1:0]				r_sr	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_sr__0;
reg	[`BIT_WIDTH-1:0]				r_sr__1;
reg	[`BIT_WIDTH-1:0]				r_sr__2;
reg	[`BIT_WIDTH-1:0]				r_sr__3;
reg	[`BIT_WIDTH-1:0]				r_sr__4;
reg	[`BIT_WIDTH-1:0]				r_sr__5;
reg	[`BIT_WIDTH-1:0]				r_sr__6;
reg	[`BIT_WIDTH-1:0]				r_sr__7;
reg	[`BIT_WIDTH-1:0]				r_sr__8;
reg	[`BIT_WIDTH-1:0]				r_sr__9;
reg	[`BIT_WIDTH-1:0]				r_sr__10;
reg	[`BIT_WIDTH-1:0]				r_sr__11;
reg	[`BIT_WIDTH-1:0]				r_sr__12;
reg	[`BIT_WIDTH-1:0]				r_sr__13;
reg	[`BIT_WIDTH-1:0]				r_sr__14;
reg	[`BIT_WIDTH-1:0]				r_sr__15;
reg	[`BIT_WIDTH-1:0]				r_sr__16;
reg	[`BIT_WIDTH-1:0]				r_sr__17;
reg	[`BIT_WIDTH-1:0]				r_sr__18;
reg	[`BIT_WIDTH-1:0]				r_sr__19;
reg	[`BIT_WIDTH-1:0]				r_sr__20;
reg	[`BIT_WIDTH-1:0]				r_sr__21;
reg	[`BIT_WIDTH-1:0]				r_sr__22;
reg	[`BIT_WIDTH-1:0]				r_sr__23;
reg	[`BIT_WIDTH-1:0]				r_sr__24;
reg	[`BIT_WIDTH-1:0]				r_sr__25;
reg	[`BIT_WIDTH-1:0]				r_sr__26;
reg	[`BIT_WIDTH-1:0]				r_sr__27;
reg	[`BIT_WIDTH-1:0]				r_sr__28;
reg	[`BIT_WIDTH-1:0]				r_sr__29;
reg	[`BIT_WIDTH-1:0]				r_sr__30;
reg	[`BIT_WIDTH-1:0]				r_sr__31;
reg	[`BIT_WIDTH-1:0]				r_sr__32;
reg	[`BIT_WIDTH-1:0]				r_sr__33;
reg	[`BIT_WIDTH-1:0]				r_sr__34;
reg	[`BIT_WIDTH-1:0]				r_sr__35;
reg	[`BIT_WIDTH-1:0]				r_sr__36;
reg	[`BIT_WIDTH-1:0]				r_sr__37;
reg	[`BIT_WIDTH-1:0]				r_sr__38;
reg	[`BIT_WIDTH-1:0]				r_sr__39;
reg	[`BIT_WIDTH-1:0]				r_sr__40;
reg	[`BIT_WIDTH-1:0]				r_sr__41;
reg	[`BIT_WIDTH-1:0]				r_sr__42;
reg	[`BIT_WIDTH-1:0]				r_sr__43;
reg	[`BIT_WIDTH-1:0]				r_sr__44;
reg	[`BIT_WIDTH-1:0]				r_sr__45;
reg	[`BIT_WIDTH-1:0]				r_sr__46;
reg	[`BIT_WIDTH-1:0]				r_sr__47;
reg	[`BIT_WIDTH-1:0]				r_sr__48;
reg	[`BIT_WIDTH-1:0]				r_sr__49;
reg	[`BIT_WIDTH-1:0]				r_sr__50;
reg	[`BIT_WIDTH-1:0]				r_sr__51;
reg	[`BIT_WIDTH-1:0]				r_sr__52;
reg	[`BIT_WIDTH-1:0]				r_sr__53;
reg	[`BIT_WIDTH-1:0]				r_sr__54;
reg	[`BIT_WIDTH-1:0]				r_sr__55;
reg	[`BIT_WIDTH-1:0]				r_sr__56;
reg	[`BIT_WIDTH-1:0]				r_sr__57;
reg	[`BIT_WIDTH-1:0]				r_sr__58;
reg	[`BIT_WIDTH-1:0]				r_sr__59;

//reg	[`BIT_WIDTH-1:0]				r_sleftz	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_sleftz__0;
reg	[`BIT_WIDTH-1:0]				r_sleftz__1;
reg	[`BIT_WIDTH-1:0]				r_sleftz__2;
reg	[`BIT_WIDTH-1:0]				r_sleftz__3;
reg	[`BIT_WIDTH-1:0]				r_sleftz__4;
reg	[`BIT_WIDTH-1:0]				r_sleftz__5;
reg	[`BIT_WIDTH-1:0]				r_sleftz__6;
reg	[`BIT_WIDTH-1:0]				r_sleftz__7;
reg	[`BIT_WIDTH-1:0]				r_sleftz__8;
reg	[`BIT_WIDTH-1:0]				r_sleftz__9;
reg	[`BIT_WIDTH-1:0]				r_sleftz__10;
reg	[`BIT_WIDTH-1:0]				r_sleftz__11;
reg	[`BIT_WIDTH-1:0]				r_sleftz__12;
reg	[`BIT_WIDTH-1:0]				r_sleftz__13;
reg	[`BIT_WIDTH-1:0]				r_sleftz__14;
reg	[`BIT_WIDTH-1:0]				r_sleftz__15;
reg	[`BIT_WIDTH-1:0]				r_sleftz__16;
reg	[`BIT_WIDTH-1:0]				r_sleftz__17;
reg	[`BIT_WIDTH-1:0]				r_sleftz__18;
reg	[`BIT_WIDTH-1:0]				r_sleftz__19;
reg	[`BIT_WIDTH-1:0]				r_sleftz__20;
reg	[`BIT_WIDTH-1:0]				r_sleftz__21;
reg	[`BIT_WIDTH-1:0]				r_sleftz__22;
reg	[`BIT_WIDTH-1:0]				r_sleftz__23;
reg	[`BIT_WIDTH-1:0]				r_sleftz__24;
reg	[`BIT_WIDTH-1:0]				r_sleftz__25;
reg	[`BIT_WIDTH-1:0]				r_sleftz__26;
reg	[`BIT_WIDTH-1:0]				r_sleftz__27;
reg	[`BIT_WIDTH-1:0]				r_sleftz__28;
reg	[`BIT_WIDTH-1:0]				r_sleftz__29;
reg	[`BIT_WIDTH-1:0]				r_sleftz__30;
reg	[`BIT_WIDTH-1:0]				r_sleftz__31;
reg	[`BIT_WIDTH-1:0]				r_sleftz__32;
reg	[`BIT_WIDTH-1:0]				r_sleftz__33;
reg	[`BIT_WIDTH-1:0]				r_sleftz__34;
reg	[`BIT_WIDTH-1:0]				r_sleftz__35;
reg	[`BIT_WIDTH-1:0]				r_sleftz__36;
reg	[`BIT_WIDTH-1:0]				r_sleftz__37;
reg	[`BIT_WIDTH-1:0]				r_sleftz__38;
reg	[`BIT_WIDTH-1:0]				r_sleftz__39;
reg	[`BIT_WIDTH-1:0]				r_sleftz__40;
reg	[`BIT_WIDTH-1:0]				r_sleftz__41;
reg	[`BIT_WIDTH-1:0]				r_sleftz__42;
reg	[`BIT_WIDTH-1:0]				r_sleftz__43;
reg	[`BIT_WIDTH-1:0]				r_sleftz__44;
reg	[`BIT_WIDTH-1:0]				r_sleftz__45;
reg	[`BIT_WIDTH-1:0]				r_sleftz__46;
reg	[`BIT_WIDTH-1:0]				r_sleftz__47;
reg	[`BIT_WIDTH-1:0]				r_sleftz__48;
reg	[`BIT_WIDTH-1:0]				r_sleftz__49;
reg	[`BIT_WIDTH-1:0]				r_sleftz__50;
reg	[`BIT_WIDTH-1:0]				r_sleftz__51;
reg	[`BIT_WIDTH-1:0]				r_sleftz__52;
reg	[`BIT_WIDTH-1:0]				r_sleftz__53;
reg	[`BIT_WIDTH-1:0]				r_sleftz__54;
reg	[`BIT_WIDTH-1:0]				r_sleftz__55;
reg	[`BIT_WIDTH-1:0]				r_sleftz__56;
reg	[`BIT_WIDTH-1:0]				r_sleftz__57;
reg	[`BIT_WIDTH-1:0]				r_sleftz__58;
reg	[`BIT_WIDTH-1:0]				r_sleftz__59;



//reg	[`BIT_WIDTH-1:0]				r_sleftr	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_sleftr__0;
reg	[`BIT_WIDTH-1:0]				r_sleftr__1;
reg	[`BIT_WIDTH-1:0]				r_sleftr__2;
reg	[`BIT_WIDTH-1:0]				r_sleftr__3;
reg	[`BIT_WIDTH-1:0]				r_sleftr__4;
reg	[`BIT_WIDTH-1:0]				r_sleftr__5;
reg	[`BIT_WIDTH-1:0]				r_sleftr__6;
reg	[`BIT_WIDTH-1:0]				r_sleftr__7;
reg	[`BIT_WIDTH-1:0]				r_sleftr__8;
reg	[`BIT_WIDTH-1:0]				r_sleftr__9;
reg	[`BIT_WIDTH-1:0]				r_sleftr__10;
reg	[`BIT_WIDTH-1:0]				r_sleftr__11;
reg	[`BIT_WIDTH-1:0]				r_sleftr__12;
reg	[`BIT_WIDTH-1:0]				r_sleftr__13;

reg	[`BIT_WIDTH-1:0]				r_sleftr__14;
reg	[`BIT_WIDTH-1:0]				r_sleftr__15;
reg	[`BIT_WIDTH-1:0]				r_sleftr__16;
reg	[`BIT_WIDTH-1:0]				r_sleftr__17;
reg	[`BIT_WIDTH-1:0]				r_sleftr__18;
reg	[`BIT_WIDTH-1:0]				r_sleftr__19;
reg	[`BIT_WIDTH-1:0]				r_sleftr__20;
reg	[`BIT_WIDTH-1:0]				r_sleftr__21;
reg	[`BIT_WIDTH-1:0]				r_sleftr__22;
reg	[`BIT_WIDTH-1:0]				r_sleftr__23;
reg	[`BIT_WIDTH-1:0]				r_sleftr__24;
reg	[`BIT_WIDTH-1:0]				r_sleftr__25;
reg	[`BIT_WIDTH-1:0]				r_sleftr__26;
reg	[`BIT_WIDTH-1:0]				r_sleftr__27;
reg	[`BIT_WIDTH-1:0]				r_sleftr__28;
reg	[`BIT_WIDTH-1:0]				r_sleftr__29;
reg	[`BIT_WIDTH-1:0]				r_sleftr__30;
reg	[`BIT_WIDTH-1:0]				r_sleftr__31;
reg	[`BIT_WIDTH-1:0]				r_sleftr__32;
reg	[`BIT_WIDTH-1:0]				r_sleftr__33;
reg	[`BIT_WIDTH-1:0]				r_sleftr__34;
reg	[`BIT_WIDTH-1:0]				r_sleftr__35;
reg	[`BIT_WIDTH-1:0]				r_sleftr__36;
reg	[`BIT_WIDTH-1:0]				r_sleftr__37;
reg	[`BIT_WIDTH-1:0]				r_sleftr__38;
reg	[`BIT_WIDTH-1:0]				r_sleftr__39;
reg	[`BIT_WIDTH-1:0]				r_sleftr__40;
reg	[`BIT_WIDTH-1:0]				r_sleftr__41;
reg	[`BIT_WIDTH-1:0]				r_sleftr__42;
reg	[`BIT_WIDTH-1:0]				r_sleftr__43;
reg	[`BIT_WIDTH-1:0]				r_sleftr__44;
reg	[`BIT_WIDTH-1:0]				r_sleftr__45;
reg	[`BIT_WIDTH-1:0]				r_sleftr__46;
reg	[`BIT_WIDTH-1:0]				r_sleftr__47;
reg	[`BIT_WIDTH-1:0]				r_sleftr__48;
reg	[`BIT_WIDTH-1:0]				r_sleftr__49;
reg	[`BIT_WIDTH-1:0]				r_sleftr__50;
reg	[`BIT_WIDTH-1:0]				r_sleftr__51;
reg	[`BIT_WIDTH-1:0]				r_sleftr__52;
reg	[`BIT_WIDTH-1:0]				r_sleftr__53;
reg	[`BIT_WIDTH-1:0]				r_sleftr__54;
reg	[`BIT_WIDTH-1:0]				r_sleftr__55;
reg	[`BIT_WIDTH-1:0]				r_sleftr__56;
reg	[`BIT_WIDTH-1:0]				r_sleftr__57;
reg	[`BIT_WIDTH-1:0]				r_sleftr__58;
reg	[`BIT_WIDTH-1:0]				r_sleftr__59;


//reg	[`BIT_WIDTH-1:0]				r_weight	[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_weight__0;
reg	[`BIT_WIDTH-1:0]				r_weight__1;
reg	[`BIT_WIDTH-1:0]				r_weight__2;
reg	[`BIT_WIDTH-1:0]				r_weight__3;
reg	[`BIT_WIDTH-1:0]				r_weight__4;
reg	[`BIT_WIDTH-1:0]				r_weight__5;
reg	[`BIT_WIDTH-1:0]				r_weight__6;
reg	[`BIT_WIDTH-1:0]				r_weight__7;
reg	[`BIT_WIDTH-1:0]				r_weight__8;
reg	[`BIT_WIDTH-1:0]				r_weight__9;
reg	[`BIT_WIDTH-1:0]				r_weight__10;
reg	[`BIT_WIDTH-1:0]				r_weight__11;
reg	[`BIT_WIDTH-1:0]				r_weight__12;
reg	[`BIT_WIDTH-1:0]				r_weight__13;
reg	[`BIT_WIDTH-1:0]				r_weight__14;
reg	[`BIT_WIDTH-1:0]				r_weight__15;
reg	[`BIT_WIDTH-1:0]				r_weight__16;
reg	[`BIT_WIDTH-1:0]				r_weight__17;
reg	[`BIT_WIDTH-1:0]				r_weight__18;
reg	[`BIT_WIDTH-1:0]				r_weight__19;
reg	[`BIT_WIDTH-1:0]				r_weight__20;
reg	[`BIT_WIDTH-1:0]				r_weight__21;
reg	[`BIT_WIDTH-1:0]				r_weight__22;
reg	[`BIT_WIDTH-1:0]				r_weight__23;
reg	[`BIT_WIDTH-1:0]				r_weight__24;
reg	[`BIT_WIDTH-1:0]				r_weight__25;
reg	[`BIT_WIDTH-1:0]				r_weight__26;
reg	[`BIT_WIDTH-1:0]				r_weight__27;
reg	[`BIT_WIDTH-1:0]				r_weight__28;
reg	[`BIT_WIDTH-1:0]				r_weight__29;
reg	[`BIT_WIDTH-1:0]				r_weight__30;
reg	[`BIT_WIDTH-1:0]				r_weight__31;
reg	[`BIT_WIDTH-1:0]				r_weight__32;
reg	[`BIT_WIDTH-1:0]				r_weight__33;
reg	[`BIT_WIDTH-1:0]				r_weight__34;
reg	[`BIT_WIDTH-1:0]				r_weight__35;
reg	[`BIT_WIDTH-1:0]				r_weight__36;
reg	[`BIT_WIDTH-1:0]				r_weight__37;
reg	[`BIT_WIDTH-1:0]				r_weight__38;
reg	[`BIT_WIDTH-1:0]				r_weight__39;
reg	[`BIT_WIDTH-1:0]				r_weight__40;
reg	[`BIT_WIDTH-1:0]				r_weight__41;
reg	[`BIT_WIDTH-1:0]				r_weight__42;
reg	[`BIT_WIDTH-1:0]				r_weight__43;
reg	[`BIT_WIDTH-1:0]				r_weight__44;
reg	[`BIT_WIDTH-1:0]				r_weight__45;
reg	[`BIT_WIDTH-1:0]				r_weight__46;
reg	[`BIT_WIDTH-1:0]				r_weight__47;
reg	[`BIT_WIDTH-1:0]				r_weight__48;
reg	[`BIT_WIDTH-1:0]				r_weight__49;
reg	[`BIT_WIDTH-1:0]				r_weight__50;
reg	[`BIT_WIDTH-1:0]				r_weight__51;
reg	[`BIT_WIDTH-1:0]				r_weight__52;
reg	[`BIT_WIDTH-1:0]				r_weight__53;
reg	[`BIT_WIDTH-1:0]				r_weight__54;
reg	[`BIT_WIDTH-1:0]				r_weight__55;
reg	[`BIT_WIDTH-1:0]				r_weight__56;
reg	[`BIT_WIDTH-1:0]				r_weight__57;
reg	[`BIT_WIDTH-1:0]				r_weight__58;
reg	[`BIT_WIDTH-1:0]				r_weight__59;

//reg	[`LAYER_WIDTH-1:0]			r_layer	[TOTAL_LATENCY - 1:0];

reg	[`LAYER_WIDTH-1:0]				r_layer__0;
reg	[`LAYER_WIDTH-1:0]				r_layer__1;
reg	[`LAYER_WIDTH-1:0]				r_layer__2;
reg	[`LAYER_WIDTH-1:0]				r_layer__3;
reg	[`LAYER_WIDTH-1:0]				r_layer__4;
reg	[`LAYER_WIDTH-1:0]				r_layer__5;
reg	[`LAYER_WIDTH-1:0]				r_layer__6;
reg	[`LAYER_WIDTH-1:0]				r_layer__7;
reg	[`LAYER_WIDTH-1:0]				r_layer__8;
reg	[`LAYER_WIDTH-1:0]				r_layer__9;
reg	[`LAYER_WIDTH-1:0]				r_layer__10;
reg	[`LAYER_WIDTH-1:0]				r_layer__11;
reg	[`LAYER_WIDTH-1:0]				r_layer__12;
reg	[`LAYER_WIDTH-1:0]				r_layer__13;
reg	[`LAYER_WIDTH-1:0]				r_layer__14;
reg	[`LAYER_WIDTH-1:0]				r_layer__15;
reg	[`LAYER_WIDTH-1:0]				r_layer__16;
reg	[`LAYER_WIDTH-1:0]				r_layer__17;
reg	[`LAYER_WIDTH-1:0]				r_layer__18;
reg	[`LAYER_WIDTH-1:0]				r_layer__19;
reg	[`LAYER_WIDTH-1:0]				r_layer__20;
reg	[`LAYER_WIDTH-1:0]				r_layer__21;
reg	[`LAYER_WIDTH-1:0]				r_layer__22;
reg	[`LAYER_WIDTH-1:0]				r_layer__23;
reg	[`LAYER_WIDTH-1:0]				r_layer__24;
reg	[`LAYER_WIDTH-1:0]				r_layer__25;
reg	[`LAYER_WIDTH-1:0]				r_layer__26;
reg	[`LAYER_WIDTH-1:0]				r_layer__27;
reg	[`LAYER_WIDTH-1:0]				r_layer__28;
reg	[`LAYER_WIDTH-1:0]				r_layer__29;
reg	[`LAYER_WIDTH-1:0]				r_layer__30;
reg	[`LAYER_WIDTH-1:0]				r_layer__31;
reg	[`LAYER_WIDTH-1:0]				r_layer__32;
reg	[`LAYER_WIDTH-1:0]				r_layer__33;
reg	[`LAYER_WIDTH-1:0]				r_layer__34;
reg	[`LAYER_WIDTH-1:0]				r_layer__35;
reg	[`LAYER_WIDTH-1:0]				r_layer__36;
reg	[`LAYER_WIDTH-1:0]				r_layer__37;
reg	[`LAYER_WIDTH-1:0]				r_layer__38;
reg	[`LAYER_WIDTH-1:0]				r_layer__39;
reg	[`LAYER_WIDTH-1:0]				r_layer__40;
reg	[`LAYER_WIDTH-1:0]				r_layer__41;
reg	[`LAYER_WIDTH-1:0]				r_layer__42;
reg	[`LAYER_WIDTH-1:0]				r_layer__43;
reg	[`LAYER_WIDTH-1:0]				r_layer__44;
reg	[`LAYER_WIDTH-1:0]				r_layer__45;
reg	[`LAYER_WIDTH-1:0]				r_layer__46;
reg	[`LAYER_WIDTH-1:0]				r_layer__47;
reg	[`LAYER_WIDTH-1:0]				r_layer__48;
reg	[`LAYER_WIDTH-1:0]				r_layer__49;
reg	[`LAYER_WIDTH-1:0]				r_layer__50;
reg	[`LAYER_WIDTH-1:0]				r_layer__51;
reg	[`LAYER_WIDTH-1:0]				r_layer__52;
reg	[`LAYER_WIDTH-1:0]				r_layer__53;
reg	[`LAYER_WIDTH-1:0]				r_layer__54;
reg	[`LAYER_WIDTH-1:0]				r_layer__55;
reg	[`LAYER_WIDTH-1:0]				r_layer__56;
reg	[`LAYER_WIDTH-1:0]				r_layer__57;
reg	[`LAYER_WIDTH-1:0]				r_layer__58;
reg	[`LAYER_WIDTH-1:0]				r_layer__59;

//reg								r_dead	[TOTAL_LATENCY - 1:0];

reg					r_dead__0;
reg					r_dead__1;
reg					r_dead__2;
reg					r_dead__3;
reg					r_dead__4;
reg					r_dead__5;
reg					r_dead__6;
reg					r_dead__7;
reg					r_dead__8;
reg					r_dead__9;
reg					r_dead__10;
reg					r_dead__11;
reg					r_dead__12;
reg					r_dead__13;
reg					r_dead__14;
reg					r_dead__15;
reg					r_dead__16;
reg					r_dead__17;
reg					r_dead__18;
reg					r_dead__19;
reg					r_dead__20;
reg					r_dead__21;
reg					r_dead__22;
reg					r_dead__23;
reg					r_dead__24;
reg					r_dead__25;
reg					r_dead__26;
reg					r_dead__27;
reg					r_dead__28;
reg					r_dead__29;
reg					r_dead__30;
reg					r_dead__31;
reg					r_dead__32;
reg					r_dead__33;
reg					r_dead__34;
reg					r_dead__35;
reg					r_dead__36;
reg					r_dead__37;
reg					r_dead__38;
reg					r_dead__39;
reg					r_dead__40;
reg					r_dead__41;
reg					r_dead__42;
reg					r_dead__43;
reg					r_dead__44;
reg					r_dead__45;
reg					r_dead__46;
reg					r_dead__47;
reg					r_dead__48;
reg					r_dead__49;
reg					r_dead__50;
reg					r_dead__51;
reg					r_dead__52;
reg					r_dead__53;
reg					r_dead__54;
reg					r_dead__55;
reg					r_dead__56;
reg					r_dead__57;
reg					r_dead__58;
reg					r_dead__59;

//reg								r_hit	[TOTAL_LATENCY - 1:0];

reg					r_hit__0;
reg					r_hit__1;
reg					r_hit__2;
reg					r_hit__3;
reg					r_hit__4;
reg					r_hit__5;
reg					r_hit__6;
reg					r_hit__7;
reg					r_hit__8;
reg					r_hit__9;
reg					r_hit__10;
reg					r_hit__11;
reg					r_hit__12;
reg					r_hit__13;
reg					r_hit__14;
reg					r_hit__15;
reg					r_hit__16;
reg					r_hit__17;
reg					r_hit__18;
reg					r_hit__19;
reg					r_hit__20;
reg					r_hit__21;
reg					r_hit__22;
reg					r_hit__23;
reg					r_hit__24;
reg					r_hit__25;
reg					r_hit__26;
reg					r_hit__27;
reg					r_hit__28;
reg					r_hit__29;
reg					r_hit__30;
reg					r_hit__31;
reg					r_hit__32;
reg					r_hit__33;
reg					r_hit__34;
reg					r_hit__35;
reg					r_hit__36;
reg					r_hit__37;
reg					r_hit__38;
reg					r_hit__39;
reg					r_hit__40;
reg					r_hit__41;
reg					r_hit__42;
reg					r_hit__43;
reg					r_hit__44;
reg					r_hit__45;
reg					r_hit__46;
reg					r_hit__47;
reg					r_hit__48;
reg					r_hit__49;
reg					r_hit__50;
reg					r_hit__51;
reg					r_hit__52;
reg					r_hit__53;
reg					r_hit__54;
reg					r_hit__55;
reg					r_hit__56;
reg					r_hit__57;
reg					r_hit__58;
reg					r_hit__59;

//reg	[`BIT_WIDTH-1:0]				r_diff[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_diff__0;
reg	[`BIT_WIDTH-1:0]				r_diff__1;
reg	[`BIT_WIDTH-1:0]				r_diff__2;
reg	[`BIT_WIDTH-1:0]				r_diff__3;
reg	[`BIT_WIDTH-1:0]				r_diff__4;
reg	[`BIT_WIDTH-1:0]				r_diff__5;
reg	[`BIT_WIDTH-1:0]				r_diff__6;
reg	[`BIT_WIDTH-1:0]				r_diff__7;
reg	[`BIT_WIDTH-1:0]				r_diff__8;
reg	[`BIT_WIDTH-1:0]				r_diff__9;
reg	[`BIT_WIDTH-1:0]				r_diff__10;
reg	[`BIT_WIDTH-1:0]				r_diff__11;
reg	[`BIT_WIDTH-1:0]				r_diff__12;
reg	[`BIT_WIDTH-1:0]				r_diff__13;
reg	[`BIT_WIDTH-1:0]				r_diff__14;
reg	[`BIT_WIDTH-1:0]				r_diff__15;
reg	[`BIT_WIDTH-1:0]				r_diff__16;
reg	[`BIT_WIDTH-1:0]				r_diff__17;
reg	[`BIT_WIDTH-1:0]				r_diff__18;
reg	[`BIT_WIDTH-1:0]				r_diff__19;
reg	[`BIT_WIDTH-1:0]				r_diff__20;
reg	[`BIT_WIDTH-1:0]				r_diff__21;
reg	[`BIT_WIDTH-1:0]				r_diff__22;
reg	[`BIT_WIDTH-1:0]				r_diff__23;
reg	[`BIT_WIDTH-1:0]				r_diff__24;
reg	[`BIT_WIDTH-1:0]				r_diff__25;
reg	[`BIT_WIDTH-1:0]				r_diff__26;
reg	[`BIT_WIDTH-1:0]				r_diff__27;
reg	[`BIT_WIDTH-1:0]				r_diff__28;
reg	[`BIT_WIDTH-1:0]				r_diff__29;
reg	[`BIT_WIDTH-1:0]				r_diff__30;
reg	[`BIT_WIDTH-1:0]				r_diff__31;
reg	[`BIT_WIDTH-1:0]				r_diff__32;
reg	[`BIT_WIDTH-1:0]				r_diff__33;
reg	[`BIT_WIDTH-1:0]				r_diff__34;
reg	[`BIT_WIDTH-1:0]				r_diff__35;
reg	[`BIT_WIDTH-1:0]				r_diff__36;
reg	[`BIT_WIDTH-1:0]				r_diff__37;
reg	[`BIT_WIDTH-1:0]				r_diff__38;
reg	[`BIT_WIDTH-1:0]				r_diff__39;
reg	[`BIT_WIDTH-1:0]				r_diff__40;
reg	[`BIT_WIDTH-1:0]				r_diff__41;
reg	[`BIT_WIDTH-1:0]				r_diff__42;
reg	[`BIT_WIDTH-1:0]				r_diff__43;
reg	[`BIT_WIDTH-1:0]				r_diff__44;
reg	[`BIT_WIDTH-1:0]				r_diff__45;
reg	[`BIT_WIDTH-1:0]				r_diff__46;
reg	[`BIT_WIDTH-1:0]				r_diff__47;
reg	[`BIT_WIDTH-1:0]				r_diff__48;
reg	[`BIT_WIDTH-1:0]				r_diff__49;
reg	[`BIT_WIDTH-1:0]				r_diff__50;
reg	[`BIT_WIDTH-1:0]				r_diff__51;
reg	[`BIT_WIDTH-1:0]				r_diff__52;
reg	[`BIT_WIDTH-1:0]				r_diff__53;
reg	[`BIT_WIDTH-1:0]				r_diff__54;
reg	[`BIT_WIDTH-1:0]				r_diff__55;
reg	[`BIT_WIDTH-1:0]				r_diff__56;
reg	[`BIT_WIDTH-1:0]				r_diff__57;
reg	[`BIT_WIDTH-1:0]				r_diff__58;
reg	[`BIT_WIDTH-1:0]				r_diff__59;

//reg	[`BIT_WIDTH-1:0]				r_dl_b[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_dl_b__0;
reg	[`BIT_WIDTH-1:0]				r_dl_b__1;
reg	[`BIT_WIDTH-1:0]				r_dl_b__2;
reg	[`BIT_WIDTH-1:0]				r_dl_b__3;
reg	[`BIT_WIDTH-1:0]				r_dl_b__4;
reg	[`BIT_WIDTH-1:0]				r_dl_b__5;
reg	[`BIT_WIDTH-1:0]				r_dl_b__6;
reg	[`BIT_WIDTH-1:0]				r_dl_b__7;
reg	[`BIT_WIDTH-1:0]				r_dl_b__8;
reg	[`BIT_WIDTH-1:0]				r_dl_b__9;
reg	[`BIT_WIDTH-1:0]				r_dl_b__10;
reg	[`BIT_WIDTH-1:0]				r_dl_b__11;
reg	[`BIT_WIDTH-1:0]				r_dl_b__12;
reg	[`BIT_WIDTH-1:0]				r_dl_b__13;
reg	[`BIT_WIDTH-1:0]				r_dl_b__14;
reg	[`BIT_WIDTH-1:0]				r_dl_b__15;
reg	[`BIT_WIDTH-1:0]				r_dl_b__16;
reg	[`BIT_WIDTH-1:0]				r_dl_b__17;
reg	[`BIT_WIDTH-1:0]				r_dl_b__18;
reg	[`BIT_WIDTH-1:0]				r_dl_b__19;
reg	[`BIT_WIDTH-1:0]				r_dl_b__20;
reg	[`BIT_WIDTH-1:0]				r_dl_b__21;
reg	[`BIT_WIDTH-1:0]				r_dl_b__22;
reg	[`BIT_WIDTH-1:0]				r_dl_b__23;
reg	[`BIT_WIDTH-1:0]				r_dl_b__24;
reg	[`BIT_WIDTH-1:0]				r_dl_b__25;
reg	[`BIT_WIDTH-1:0]				r_dl_b__26;
reg	[`BIT_WIDTH-1:0]				r_dl_b__27;
reg	[`BIT_WIDTH-1:0]				r_dl_b__28;
reg	[`BIT_WIDTH-1:0]				r_dl_b__29;
reg	[`BIT_WIDTH-1:0]				r_dl_b__30;
reg	[`BIT_WIDTH-1:0]				r_dl_b__31;
reg	[`BIT_WIDTH-1:0]				r_dl_b__32;
reg	[`BIT_WIDTH-1:0]				r_dl_b__33;
reg	[`BIT_WIDTH-1:0]				r_dl_b__34;
reg	[`BIT_WIDTH-1:0]				r_dl_b__35;
reg	[`BIT_WIDTH-1:0]				r_dl_b__36;
reg	[`BIT_WIDTH-1:0]				r_dl_b__37;
reg	[`BIT_WIDTH-1:0]				r_dl_b__38;
reg	[`BIT_WIDTH-1:0]				r_dl_b__39;
reg	[`BIT_WIDTH-1:0]				r_dl_b__40;
reg	[`BIT_WIDTH-1:0]				r_dl_b__41;
reg	[`BIT_WIDTH-1:0]				r_dl_b__42;
reg	[`BIT_WIDTH-1:0]				r_dl_b__43;
reg	[`BIT_WIDTH-1:0]				r_dl_b__44;
reg	[`BIT_WIDTH-1:0]				r_dl_b__45;
reg	[`BIT_WIDTH-1:0]				r_dl_b__46;
reg	[`BIT_WIDTH-1:0]				r_dl_b__47;
reg	[`BIT_WIDTH-1:0]				r_dl_b__48;
reg	[`BIT_WIDTH-1:0]				r_dl_b__49;
reg	[`BIT_WIDTH-1:0]				r_dl_b__50;
reg	[`BIT_WIDTH-1:0]				r_dl_b__51;
reg	[`BIT_WIDTH-1:0]				r_dl_b__52;
reg	[`BIT_WIDTH-1:0]				r_dl_b__53;
reg	[`BIT_WIDTH-1:0]				r_dl_b__54;
reg	[`BIT_WIDTH-1:0]				r_dl_b__55;
reg	[`BIT_WIDTH-1:0]				r_dl_b__56;
reg	[`BIT_WIDTH-1:0]				r_dl_b__57;
reg	[`BIT_WIDTH-1:0]				r_dl_b__58;
reg	[`BIT_WIDTH-1:0]				r_dl_b__59;

//reg	[2*`BIT_WIDTH-1:0]			r_numer[TOTAL_LATENCY - 1:0];

reg	[2*`BIT_WIDTH-1:0]				r_numer__0;
reg	[2*`BIT_WIDTH-1:0]				r_numer__1;
reg	[2*`BIT_WIDTH-1:0]				r_numer__2;
reg	[2*`BIT_WIDTH-1:0]				r_numer__3;
reg	[2*`BIT_WIDTH-1:0]				r_numer__4;
reg	[2*`BIT_WIDTH-1:0]				r_numer__5;
reg	[2*`BIT_WIDTH-1:0]				r_numer__6;
reg	[2*`BIT_WIDTH-1:0]				r_numer__7;
reg	[2*`BIT_WIDTH-1:0]				r_numer__8;
reg	[2*`BIT_WIDTH-1:0]				r_numer__9;
reg	[2*`BIT_WIDTH-1:0]				r_numer__10;
reg	[2*`BIT_WIDTH-1:0]				r_numer__11;
reg	[2*`BIT_WIDTH-1:0]				r_numer__12;
reg	[2*`BIT_WIDTH-1:0]				r_numer__13;
reg	[2*`BIT_WIDTH-1:0]				r_numer__14;
reg	[2*`BIT_WIDTH-1:0]				r_numer__15;
reg	[2*`BIT_WIDTH-1:0]				r_numer__16;
reg	[2*`BIT_WIDTH-1:0]				r_numer__17;
reg	[2*`BIT_WIDTH-1:0]				r_numer__18;
reg	[2*`BIT_WIDTH-1:0]				r_numer__19;
reg	[2*`BIT_WIDTH-1:0]				r_numer__20;
reg	[2*`BIT_WIDTH-1:0]				r_numer__21;
reg	[2*`BIT_WIDTH-1:0]				r_numer__22;
reg	[2*`BIT_WIDTH-1:0]				r_numer__23;
reg	[2*`BIT_WIDTH-1:0]				r_numer__24;
reg	[2*`BIT_WIDTH-1:0]				r_numer__25;
reg	[2*`BIT_WIDTH-1:0]				r_numer__26;
reg	[2*`BIT_WIDTH-1:0]				r_numer__27;
reg	[2*`BIT_WIDTH-1:0]				r_numer__28;
reg	[2*`BIT_WIDTH-1:0]				r_numer__29;
reg	[2*`BIT_WIDTH-1:0]				r_numer__30;
reg	[2*`BIT_WIDTH-1:0]				r_numer__31;
reg	[2*`BIT_WIDTH-1:0]				r_numer__32;
reg	[2*`BIT_WIDTH-1:0]				r_numer__33;
reg	[2*`BIT_WIDTH-1:0]				r_numer__34;
reg	[2*`BIT_WIDTH-1:0]				r_numer__35;
reg	[2*`BIT_WIDTH-1:0]				r_numer__36;
reg	[2*`BIT_WIDTH-1:0]				r_numer__37;
reg	[2*`BIT_WIDTH-1:0]				r_numer__38;
reg	[2*`BIT_WIDTH-1:0]				r_numer__39;
reg	[2*`BIT_WIDTH-1:0]				r_numer__40;
reg	[2*`BIT_WIDTH-1:0]				r_numer__41;
reg	[2*`BIT_WIDTH-1:0]				r_numer__42;
reg	[2*`BIT_WIDTH-1:0]				r_numer__43;
reg	[2*`BIT_WIDTH-1:0]				r_numer__44;
reg	[2*`BIT_WIDTH-1:0]				r_numer__45;
reg	[2*`BIT_WIDTH-1:0]				r_numer__46;
reg	[2*`BIT_WIDTH-1:0]				r_numer__47;
reg	[2*`BIT_WIDTH-1:0]				r_numer__48;
reg	[2*`BIT_WIDTH-1:0]				r_numer__49;
reg	[2*`BIT_WIDTH-1:0]				r_numer__50;
reg	[2*`BIT_WIDTH-1:0]				r_numer__51;
reg	[2*`BIT_WIDTH-1:0]				r_numer__52;
reg	[2*`BIT_WIDTH-1:0]				r_numer__53;
reg	[2*`BIT_WIDTH-1:0]				r_numer__54;
reg	[2*`BIT_WIDTH-1:0]				r_numer__55;
reg	[2*`BIT_WIDTH-1:0]				r_numer__56;
reg	[2*`BIT_WIDTH-1:0]				r_numer__57;
reg	[2*`BIT_WIDTH-1:0]				r_numer__58;
reg	[2*`BIT_WIDTH-1:0]				r_numer__59;

//reg	[`BIT_WIDTH-1:0]				r_z1[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_z1__0;
reg	[`BIT_WIDTH-1:0]				r_z1__1;
reg	[`BIT_WIDTH-1:0]				r_z1__2;
reg	[`BIT_WIDTH-1:0]				r_z1__3;
reg	[`BIT_WIDTH-1:0]				r_z1__4;
reg	[`BIT_WIDTH-1:0]				r_z1__5;
reg	[`BIT_WIDTH-1:0]				r_z1__6;
reg	[`BIT_WIDTH-1:0]				r_z1__7;
reg	[`BIT_WIDTH-1:0]				r_z1__8;
reg	[`BIT_WIDTH-1:0]				r_z1__9;
reg	[`BIT_WIDTH-1:0]				r_z1__10;
reg	[`BIT_WIDTH-1:0]				r_z1__11;
reg	[`BIT_WIDTH-1:0]				r_z1__12;
reg	[`BIT_WIDTH-1:0]				r_z1__13;
reg	[`BIT_WIDTH-1:0]				r_z1__14;
reg	[`BIT_WIDTH-1:0]				r_z1__15;
reg	[`BIT_WIDTH-1:0]				r_z1__16;
reg	[`BIT_WIDTH-1:0]				r_z1__17;
reg	[`BIT_WIDTH-1:0]				r_z1__18;
reg	[`BIT_WIDTH-1:0]				r_z1__19;
reg	[`BIT_WIDTH-1:0]				r_z1__20;
reg	[`BIT_WIDTH-1:0]				r_z1__21;
reg	[`BIT_WIDTH-1:0]				r_z1__22;
reg	[`BIT_WIDTH-1:0]				r_z1__23;
reg	[`BIT_WIDTH-1:0]				r_z1__24;
reg	[`BIT_WIDTH-1:0]				r_z1__25;
reg	[`BIT_WIDTH-1:0]				r_z1__26;
reg	[`BIT_WIDTH-1:0]				r_z1__27;
reg	[`BIT_WIDTH-1:0]				r_z1__28;
reg	[`BIT_WIDTH-1:0]				r_z1__29;
reg	[`BIT_WIDTH-1:0]				r_z1__30;
reg	[`BIT_WIDTH-1:0]				r_z1__31;
reg	[`BIT_WIDTH-1:0]				r_z1__32;
reg	[`BIT_WIDTH-1:0]				r_z1__33;
reg	[`BIT_WIDTH-1:0]				r_z1__34;
reg	[`BIT_WIDTH-1:0]				r_z1__35;
reg	[`BIT_WIDTH-1:0]				r_z1__36;
reg	[`BIT_WIDTH-1:0]				r_z1__37;
reg	[`BIT_WIDTH-1:0]				r_z1__38;
reg	[`BIT_WIDTH-1:0]				r_z1__39;
reg	[`BIT_WIDTH-1:0]				r_z1__40;
reg	[`BIT_WIDTH-1:0]				r_z1__41;
reg	[`BIT_WIDTH-1:0]				r_z1__42;
reg	[`BIT_WIDTH-1:0]				r_z1__43;
reg	[`BIT_WIDTH-1:0]				r_z1__44;
reg	[`BIT_WIDTH-1:0]				r_z1__45;
reg	[`BIT_WIDTH-1:0]				r_z1__46;
reg	[`BIT_WIDTH-1:0]				r_z1__47;
reg	[`BIT_WIDTH-1:0]				r_z1__48;
reg	[`BIT_WIDTH-1:0]				r_z1__49;
reg	[`BIT_WIDTH-1:0]				r_z1__50;
reg	[`BIT_WIDTH-1:0]				r_z1__51;
reg	[`BIT_WIDTH-1:0]				r_z1__52;
reg	[`BIT_WIDTH-1:0]				r_z1__53;
reg	[`BIT_WIDTH-1:0]				r_z1__54;
reg	[`BIT_WIDTH-1:0]				r_z1__55;
reg	[`BIT_WIDTH-1:0]				r_z1__56;
reg	[`BIT_WIDTH-1:0]				r_z1__57;
reg	[`BIT_WIDTH-1:0]				r_z1__58;
reg	[`BIT_WIDTH-1:0]				r_z1__59;

//reg	[`BIT_WIDTH-1:0]				r_z0[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_z0__0;
reg	[`BIT_WIDTH-1:0]				r_z0__1;
reg	[`BIT_WIDTH-1:0]				r_z0__2;
reg	[`BIT_WIDTH-1:0]				r_z0__3;
reg	[`BIT_WIDTH-1:0]				r_z0__4;
reg	[`BIT_WIDTH-1:0]				r_z0__5;
reg	[`BIT_WIDTH-1:0]				r_z0__6;
reg	[`BIT_WIDTH-1:0]				r_z0__7;
reg	[`BIT_WIDTH-1:0]				r_z0__8;
reg	[`BIT_WIDTH-1:0]				r_z0__9;
reg	[`BIT_WIDTH-1:0]				r_z0__10;
reg	[`BIT_WIDTH-1:0]				r_z0__11;
reg	[`BIT_WIDTH-1:0]				r_z0__12;
reg	[`BIT_WIDTH-1:0]				r_z0__13;
reg	[`BIT_WIDTH-1:0]				r_z0__14;
reg	[`BIT_WIDTH-1:0]				r_z0__15;
reg	[`BIT_WIDTH-1:0]				r_z0__16;
reg	[`BIT_WIDTH-1:0]				r_z0__17;
reg	[`BIT_WIDTH-1:0]				r_z0__18;
reg	[`BIT_WIDTH-1:0]				r_z0__19;
reg	[`BIT_WIDTH-1:0]				r_z0__20;
reg	[`BIT_WIDTH-1:0]				r_z0__21;
reg	[`BIT_WIDTH-1:0]				r_z0__22;
reg	[`BIT_WIDTH-1:0]				r_z0__23;
reg	[`BIT_WIDTH-1:0]				r_z0__24;
reg	[`BIT_WIDTH-1:0]				r_z0__25;
reg	[`BIT_WIDTH-1:0]				r_z0__26;
reg	[`BIT_WIDTH-1:0]				r_z0__27;
reg	[`BIT_WIDTH-1:0]				r_z0__28;
reg	[`BIT_WIDTH-1:0]				r_z0__29;
reg	[`BIT_WIDTH-1:0]				r_z0__30;
reg	[`BIT_WIDTH-1:0]				r_z0__31;
reg	[`BIT_WIDTH-1:0]				r_z0__32;
reg	[`BIT_WIDTH-1:0]				r_z0__33;
reg	[`BIT_WIDTH-1:0]				r_z0__34;
reg	[`BIT_WIDTH-1:0]				r_z0__35;
reg	[`BIT_WIDTH-1:0]				r_z0__36;
reg	[`BIT_WIDTH-1:0]				r_z0__37;
reg	[`BIT_WIDTH-1:0]				r_z0__38;
reg	[`BIT_WIDTH-1:0]				r_z0__39;
reg	[`BIT_WIDTH-1:0]				r_z0__40;
reg	[`BIT_WIDTH-1:0]				r_z0__41;
reg	[`BIT_WIDTH-1:0]				r_z0__42;
reg	[`BIT_WIDTH-1:0]				r_z0__43;
reg	[`BIT_WIDTH-1:0]				r_z0__44;
reg	[`BIT_WIDTH-1:0]				r_z0__45;
reg	[`BIT_WIDTH-1:0]				r_z0__46;
reg	[`BIT_WIDTH-1:0]				r_z0__47;
reg	[`BIT_WIDTH-1:0]				r_z0__48;
reg	[`BIT_WIDTH-1:0]				r_z0__49;
reg	[`BIT_WIDTH-1:0]				r_z0__50;
reg	[`BIT_WIDTH-1:0]				r_z0__51;
reg	[`BIT_WIDTH-1:0]				r_z0__52;
reg	[`BIT_WIDTH-1:0]				r_z0__53;
reg	[`BIT_WIDTH-1:0]				r_z0__54;
reg	[`BIT_WIDTH-1:0]				r_z0__55;
reg	[`BIT_WIDTH-1:0]				r_z0__56;
reg	[`BIT_WIDTH-1:0]				r_z0__57;
reg	[`BIT_WIDTH-1:0]				r_z0__58;
reg	[`BIT_WIDTH-1:0]				r_z0__59;
//reg	[`BIT_WIDTH-1:0]				r_mut[TOTAL_LATENCY - 1:0];

reg	[`BIT_WIDTH-1:0]				r_mut__0;
reg	[`BIT_WIDTH-1:0]				r_mut__1;
reg	[`BIT_WIDTH-1:0]				r_mut__2;
reg	[`BIT_WIDTH-1:0]				r_mut__3;
reg	[`BIT_WIDTH-1:0]				r_mut__4;
reg	[`BIT_WIDTH-1:0]				r_mut__5;
reg	[`BIT_WIDTH-1:0]				r_mut__6;
reg	[`BIT_WIDTH-1:0]				r_mut__7;
reg	[`BIT_WIDTH-1:0]				r_mut__8;
reg	[`BIT_WIDTH-1:0]				r_mut__9;
reg	[`BIT_WIDTH-1:0]				r_mut__10;
reg	[`BIT_WIDTH-1:0]				r_mut__11;
reg	[`BIT_WIDTH-1:0]				r_mut__12;
reg	[`BIT_WIDTH-1:0]				r_mut__13;
reg	[`BIT_WIDTH-1:0]				r_mut__14;
reg	[`BIT_WIDTH-1:0]				r_mut__15;
reg	[`BIT_WIDTH-1:0]				r_mut__16;
reg	[`BIT_WIDTH-1:0]				r_mut__17;
reg	[`BIT_WIDTH-1:0]				r_mut__18;
reg	[`BIT_WIDTH-1:0]				r_mut__19;
reg	[`BIT_WIDTH-1:0]				r_mut__20;
reg	[`BIT_WIDTH-1:0]				r_mut__21;
reg	[`BIT_WIDTH-1:0]				r_mut__22;
reg	[`BIT_WIDTH-1:0]				r_mut__23;
reg	[`BIT_WIDTH-1:0]				r_mut__24;
reg	[`BIT_WIDTH-1:0]				r_mut__25;
reg	[`BIT_WIDTH-1:0]				r_mut__26;
reg	[`BIT_WIDTH-1:0]				r_mut__27;
reg	[`BIT_WIDTH-1:0]				r_mut__28;
reg	[`BIT_WIDTH-1:0]				r_mut__29;
reg	[`BIT_WIDTH-1:0]				r_mut__30;
reg	[`BIT_WIDTH-1:0]				r_mut__31;
reg	[`BIT_WIDTH-1:0]				r_mut__32;
reg	[`BIT_WIDTH-1:0]				r_mut__33;
reg	[`BIT_WIDTH-1:0]				r_mut__34;
reg	[`BIT_WIDTH-1:0]				r_mut__35;
reg	[`BIT_WIDTH-1:0]				r_mut__36;
reg	[`BIT_WIDTH-1:0]				r_mut__37;
reg	[`BIT_WIDTH-1:0]				r_mut__38;
reg	[`BIT_WIDTH-1:0]				r_mut__39;
reg	[`BIT_WIDTH-1:0]				r_mut__40;
reg	[`BIT_WIDTH-1:0]				r_mut__41;
reg	[`BIT_WIDTH-1:0]				r_mut__42;
reg	[`BIT_WIDTH-1:0]				r_mut__43;
reg	[`BIT_WIDTH-1:0]				r_mut__44;
reg	[`BIT_WIDTH-1:0]				r_mut__45;
reg	[`BIT_WIDTH-1:0]				r_mut__46;
reg	[`BIT_WIDTH-1:0]				r_mut__47;
reg	[`BIT_WIDTH-1:0]				r_mut__48;
reg	[`BIT_WIDTH-1:0]				r_mut__49;
reg	[`BIT_WIDTH-1:0]				r_mut__50;
reg	[`BIT_WIDTH-1:0]				r_mut__51;
reg	[`BIT_WIDTH-1:0]				r_mut__52;
reg	[`BIT_WIDTH-1:0]				r_mut__53;
reg	[`BIT_WIDTH-1:0]				r_mut__54;
reg	[`BIT_WIDTH-1:0]				r_mut__55;
reg	[`BIT_WIDTH-1:0]				r_mut__56;
reg	[`BIT_WIDTH-1:0]				r_mut__57;
reg	[`BIT_WIDTH-1:0]				r_mut__58;
reg	[`BIT_WIDTH-1:0]				r_mut__59;

wire	[2*`BIT_WIDTH-1:0]			sleftz_big;
wire	[2*`BIT_WIDTH-1:0]			sleftr_big;
wire	[2*`BIT_WIDTH-1:0]			sr_big;
wire	[`BIT_WIDTH-1:0]			remainder_div1;
wire	[2*`BIT_WIDTH-1:0]			quotient_div1;

//ASSIGNMENTS FROM PIPE TO OUTPUT
assign x_boundaryChecker = r_x__59;
assign y_boundaryChecker = r_y__59;
assign z_boundaryChecker = r_z__59;
assign ux_boundaryChecker = r_ux__59;
assign uy_boundaryChecker = r_uy__59;
assign uz_boundaryChecker = r_uz__59;
assign sz_boundaryChecker = r_sz__59;
assign sr_boundaryChecker = r_sr__59;
assign sleftz_boundaryChecker = r_sleftz__59;
assign sleftr_boundaryChecker = r_sleftr__59;
assign weight_boundaryChecker = r_weight__59;
assign layer_boundaryChecker = r_layer__59;
assign dead_boundaryChecker = r_dead__59;
assign hit_boundaryChecker = r_hit__59;

// divider
signed_div_30 divide_u1 (
	.clock(clock),
	.denom(c_uz__0),
	.numer(c_numer__0),
	.quotient(quotient_div1),
	.remain(remainder_div1));

// multipliers
mult_signed_32_bc mult_u1(
	.clock(clock),
	.dataa(c_diff__30),
	.datab(c_mut__30),
	.result(sleftz_big));

mult_signed_32_bc mult_u2(
	.clock(clock),
	.dataa(maxDepth_over_maxRadius),
	.datab(c_sleftz__31),
	.result(sleftr_big));

mult_signed_32_bc mult_u3(
	.clock(clock),
	.dataa(maxDepth_over_maxRadius),
	.datab(c_dl_b__30),
	.result(sr_big));

// multiplexor to find z1 and z0
always @(c_layer__0 or z1_0 or z0_0 or mut_0 or
					z1_1 or z0_1 or mut_1 or
					z1_2 or z0_2 or mut_2 or
					z1_3 or z0_3 or mut_3 or
					z1_4 or z0_4 or mut_4 or
					z1_5 or z0_5 or mut_5)
begin
	case(c_layer__0)
		3'b000:
		begin
			c_z1__0 = z1_0;
			c_z0__0 = z0_0;
			c_mut__0 = mut_0;
		end
		3'b001:
		begin
			c_z1__0 = z1_1;
			c_z0__0 = z0_1;
			c_mut__0 = mut_1;
		end
		3'b010:
		begin
			c_z1__0 = z1_2;
			c_z0__0 = z0_2;
			c_mut__0 = mut_2;
		end
		3'b011:
		begin
			c_z1__0 = z1_3;
			c_z0__0 = z0_3;
			c_mut__0 = mut_3;
		end
		3'b100:
		begin
			c_z1__0 = z1_4;
			c_z0__0 = z0_4;
			c_mut__0 = mut_4;
		end
		3'b101:
		begin
			c_z1__0 = z1_5;
			c_z0__0 = z0_5;
			c_mut__0 = mut_5;
		end
		default:
		begin
			c_z1__0 = 0;
			c_z0__0 = 0;
			c_mut__0 = 0;
		end
	endcase
end

// May have to change block staments on this one for odin
// set numerator
always @(c_uz__0 or c_z1__0 or c_z__0 or c_z0__0)
begin
	//c_numer__0 = 63'b0;
	if(c_uz__0[31] == 1'b0)
	begin
		c_numer__0[63:32] = c_z1__0 - c_z__0;
		c_numer__0[31:0] = 32'b0;
	end
	else if(c_uz__0[31] == 1'b1)
	begin
		c_numer__0[63:32] = c_z0__0 - c_z__0;
		c_numer__0[31:0] = 32'b0;
	end
	else
	begin
		c_numer__0 = 63'b0;
	end
end

// initialize uninitialized data in pipeline
always @(x_mover or y_mover or z_mover or 
		ux_mover or uy_mover or uz_mover or
		sz_mover or sr_mover or sleftz_mover or sleftr_mover or
		weight_mover or layer_mover or dead_mover)
begin
	c_x__0 = x_mover;
	c_y__0 = y_mover;
	c_z__0 = z_mover;
	c_ux__0 = ux_mover;
	c_uy__0 = uy_mover;
	c_uz__0 = uz_mover;
	c_sz__0 = sz_mover;
	c_sr__0 = sr_mover;
	c_sleftz__0 = sleftz_mover;
	c_sleftr__0 = sleftr_mover;
	c_weight__0 = weight_mover;
	c_layer__0 = layer_mover;
	c_dead__0 = dead_mover;
	c_hit__0 = 1'b0;
	c_diff__0 = 32'b0;
	c_dl_b__0 = 32'b0;
end

// Determine new (x,y,z) coordinates
always @(r_x__0 or r_y__0 or r_z__0 or r_ux__0 or r_uy__0 or r_uz__0 or r_sz__0 or r_sr__0 or r_sleftz__0 or r_sleftr__0 or
		r_weight__0 or r_layer__0 or r_dead__0 or r_hit__0 or r_diff__0 or r_dl_b__0 or r_numer__0 or r_z1__0 or r_z0__0 or r_mut__0 or

		r_x__1 or r_y__1 or r_z__1 or r_ux__1 or r_uy__1 or r_uz__1 or r_sz__1 or r_sr__1 or r_sleftz__1 or r_sleftr__1 or
		r_weight__1 or r_layer__1 or r_dead__1 or r_hit__1 or r_diff__1 or r_dl_b__1 or r_numer__1 or r_z1__1 or r_z0__1 or r_mut__1 or

		r_x__2 or r_y__2 or r_z__2 or r_ux__2 or r_uy__2 or r_uz__2 or r_sz__2 or r_sr__2 or r_sleftz__2 or r_sleftr__2 or
		r_weight__2 or r_layer__2 or r_dead__2 or r_hit__2 or r_diff__2 or r_dl_b__2 or r_numer__2 or r_z1__2 or r_z0__2 or r_mut__2 or

		r_x__3 or r_y__3 or r_z__3 or r_ux__3 or r_uy__3 or r_uz__3 or r_sz__3 or r_sr__3 or r_sleftz__3 or r_sleftr__3 or
		r_weight__3 or r_layer__3 or r_dead__3 or r_hit__3 or r_diff__3 or r_dl_b__3 or r_numer__3 or r_z1__3 or r_z0__3 or r_mut__3 or

		r_x__4 or r_y__4 or r_z__4 or r_ux__4 or r_uy__4 or r_uz__4 or r_sz__4 or r_sr__4 or r_sleftz__4 or r_sleftr__4 or
		r_weight__4 or r_layer__4 or r_dead__4 or r_hit__4 or r_diff__4 or r_dl_b__4 or r_numer__4 or r_z1__4 or r_z0__4 or r_mut__4 or

		r_x__5 or r_y__5 or r_z__5 or r_ux__5 or r_uy__5 or r_uz__5 or r_sz__5 or r_sr__5 or r_sleftz__5 or r_sleftr__5 or
		r_weight__5 or r_layer__5 or r_dead__5 or r_hit__5 or r_diff__5 or r_dl_b__5 or r_numer__5 or r_z1__5 or r_z0__5 or r_mut__5 or

		r_x__6 or r_y__6 or r_z__6 or r_ux__6 or r_uy__6 or r_uz__6 or r_sz__6 or r_sr__6 or r_sleftz__6 or r_sleftr__6 or
		r_weight__6 or r_layer__6 or r_dead__6 or r_hit__6 or r_diff__6 or r_dl_b__6 or r_numer__6 or r_z1__6 or r_z0__6 or r_mut__6 or

		r_x__7 or r_y__7 or r_z__7 or r_ux__7 or r_uy__7 or r_uz__7 or r_sz__7 or r_sr__7 or r_sleftz__7 or r_sleftr__7 or
		r_weight__7 or r_layer__7 or r_dead__7 or r_hit__7 or r_diff__7 or r_dl_b__7 or r_numer__7 or r_z1__7 or r_z0__7 or r_mut__7 or

		r_x__8 or r_y__8 or r_z__8 or r_ux__8 or r_uy__8 or r_uz__8 or r_sz__8 or r_sr__8 or r_sleftz__8 or r_sleftr__8 or
		r_weight__8 or r_layer__8 or r_dead__8 or r_hit__8 or r_diff__8 or r_dl_b__8 or r_numer__8 or r_z1__8 or r_z0__8 or r_mut__8 or

		r_x__9 or r_y__9 or r_z__9 or r_ux__9 or r_uy__9 or r_uz__9 or r_sz__9 or r_sr__9 or r_sleftz__9 or r_sleftr__9 or
		r_weight__9 or r_layer__9 or r_dead__9 or r_hit__9 or r_diff__9 or r_dl_b__9 or r_numer__9 or r_z1__9 or r_z0__9 or r_mut__9 or

		r_x__10 or r_y__10 or r_z__10 or r_ux__10 or r_uy__10 or r_uz__10 or r_sz__10 or r_sr__10 or r_sleftz__10 or r_sleftr__10 or
		r_weight__10 or r_layer__10 or r_dead__10 or r_hit__10 or r_diff__10 or r_dl_b__10 or r_numer__10 or r_z1__10 or r_z0__10 or r_mut__10 or

		r_x__11 or r_y__11 or r_z__11 or r_ux__11 or r_uy__11 or r_uz__11 or r_sz__11 or r_sr__11 or r_sleftz__11 or r_sleftr__11 or
		r_weight__11 or r_layer__11 or r_dead__11 or r_hit__11 or r_diff__11 or r_dl_b__11 or r_numer__11 or r_z1__11 or r_z0__11 or r_mut__11 or

		r_x__12 or r_y__12 or r_z__12 or r_ux__12 or r_uy__12 or r_uz__12 or r_sz__12 or r_sr__12 or r_sleftz__12 or r_sleftr__12 or
		r_weight__12 or r_layer__12 or r_dead__12 or r_hit__12 or r_diff__12 or r_dl_b__12 or r_numer__12 or r_z1__12 or r_z0__12 or r_mut__12 or

		r_x__13 or r_y__13 or r_z__13 or r_ux__13 or r_uy__13 or r_uz__13 or r_sz__13 or r_sr__13 or r_sleftz__13 or r_sleftr__13 or
		r_weight__13 or r_layer__13 or r_dead__13 or r_hit__13 or r_diff__13 or r_dl_b__13 or r_numer__13 or r_z1__13 or r_z0__13 or r_mut__13 or

		r_x__14 or r_y__14 or r_z__14 or r_ux__14 or r_uy__14 or r_uz__14 or r_sz__14 or r_sr__14 or r_sleftz__14 or r_sleftr__14 or
		r_weight__14 or r_layer__14 or r_dead__14 or r_hit__14 or r_diff__14 or r_dl_b__14 or r_numer__14 or r_z1__14 or r_z0__14 or r_mut__14 or

		r_x__15 or r_y__15 or r_z__15 or r_ux__15 or r_uy__15 or r_uz__15 or r_sz__15 or r_sr__15 or r_sleftz__15 or r_sleftr__15 or
		r_weight__15 or r_layer__15 or r_dead__15 or r_hit__15 or r_diff__15 or r_dl_b__15 or r_numer__15 or r_z1__15 or r_z0__15 or r_mut__15 or

		r_x__16 or r_y__16 or r_z__16 or r_ux__16 or r_uy__16 or r_uz__16 or r_sz__16 or r_sr__16 or r_sleftz__16 or r_sleftr__16 or
		r_weight__16 or r_layer__16 or r_dead__16 or r_hit__16 or r_diff__16 or r_dl_b__16 or r_numer__16 or r_z1__16 or r_z0__16 or r_mut__16 or

		r_x__17 or r_y__17 or r_z__17 or r_ux__17 or r_uy__17 or r_uz__17 or r_sz__17 or r_sr__17 or r_sleftz__17 or r_sleftr__17 or
		r_weight__17 or r_layer__17 or r_dead__17 or r_hit__17 or r_diff__17 or r_dl_b__17 or r_numer__17 or r_z1__17 or r_z0__17 or r_mut__17 or

		r_x__18 or r_y__18 or r_z__18 or r_ux__18 or r_uy__18 or r_uz__18 or r_sz__18 or r_sr__18 or r_sleftz__18 or r_sleftr__18 or
		r_weight__18 or r_layer__18 or r_dead__18 or r_hit__18 or r_diff__18 or r_dl_b__18 or r_numer__18 or r_z1__18 or r_z0__18 or r_mut__18 or

		r_x__19 or r_y__19 or r_z__19 or r_ux__19 or r_uy__19 or r_uz__19 or r_sz__19 or r_sr__19 or r_sleftz__19 or r_sleftr__19 or
		r_weight__19 or r_layer__19 or r_dead__19 or r_hit__19 or r_diff__19 or r_dl_b__19 or r_numer__19 or r_z1__19 or r_z0__19 or r_mut__19 or

		r_x__20 or r_y__20 or r_z__20 or r_ux__20 or r_uy__20 or r_uz__20 or r_sz__20 or r_sr__20 or r_sleftz__20 or r_sleftr__20 or
		r_weight__20 or r_layer__20 or r_dead__20 or r_hit__20 or r_diff__20 or r_dl_b__20 or r_numer__20 or r_z1__20 or r_z0__20 or r_mut__20 or

		r_x__21 or r_y__21 or r_z__21 or r_ux__21 or r_uy__21 or r_uz__21 or r_sz__21 or r_sr__21 or r_sleftz__21 or r_sleftr__21 or
		r_weight__21 or r_layer__21 or r_dead__21 or r_hit__21 or r_diff__21 or r_dl_b__21 or r_numer__21 or r_z1__21 or r_z0__21 or r_mut__21 or

		r_x__22 or r_y__22 or r_z__22 or r_ux__22 or r_uy__22 or r_uz__22 or r_sz__22 or r_sr__22 or r_sleftz__22 or r_sleftr__22 or
		r_weight__22 or r_layer__22 or r_dead__22 or r_hit__22 or r_diff__22 or r_dl_b__22 or r_numer__22 or r_z1__22 or r_z0__22 or r_mut__22 or

		r_x__23 or r_y__23 or r_z__23 or r_ux__23 or r_uy__23 or r_uz__23 or r_sz__23 or r_sr__23 or r_sleftz__23 or r_sleftr__23 or
		r_weight__23 or r_layer__23 or r_dead__23 or r_hit__23 or r_diff__23 or r_dl_b__23 or r_numer__23 or r_z1__23 or r_z0__23 or r_mut__23 or

		r_x__24 or r_y__24 or r_z__24 or r_ux__24 or r_uy__24 or r_uz__24 or r_sz__24 or r_sr__24 or r_sleftz__24 or r_sleftr__24 or
		r_weight__24 or r_layer__24 or r_dead__24 or r_hit__24 or r_diff__24 or r_dl_b__24 or r_numer__24 or r_z1__24 or r_z0__24 or r_mut__24 or

		r_x__25 or r_y__25 or r_z__25 or r_ux__25 or r_uy__25 or r_uz__25 or r_sz__25 or r_sr__25 or r_sleftz__25 or r_sleftr__25 or
		r_weight__25 or r_layer__25 or r_dead__25 or r_hit__25 or r_diff__25 or r_dl_b__25 or r_numer__25 or r_z1__25 or r_z0__25 or r_mut__25 or

		r_x__26 or r_y__26 or r_z__26 or r_ux__26 or r_uy__26 or r_uz__26 or r_sz__26 or r_sr__26 or r_sleftz__26 or r_sleftr__26 or
		r_weight__26 or r_layer__26 or r_dead__26 or r_hit__26 or r_diff__26 or r_dl_b__26 or r_numer__26 or r_z1__26 or r_z0__26 or r_mut__26 or

		r_x__27 or r_y__27 or r_z__27 or r_ux__27 or r_uy__27 or r_uz__27 or r_sz__27 or r_sr__27 or r_sleftz__27 or r_sleftr__27 or
		r_weight__27 or r_layer__27 or r_dead__27 or r_hit__27 or r_diff__27 or r_dl_b__27 or r_numer__27 or r_z1__27 or r_z0__27 or r_mut__27 or

		r_x__28 or r_y__28 or r_z__28 or r_ux__28 or r_uy__28 or r_uz__28 or r_sz__28 or r_sr__28 or r_sleftz__28 or r_sleftr__28 or
		r_weight__28 or r_layer__28 or r_dead__28 or r_hit__28 or r_diff__28 or r_dl_b__28 or r_numer__28 or r_z1__28 or r_z0__28 or r_mut__28 or

		r_x__29 or r_y__29 or r_z__29 or r_ux__29 or r_uy__29 or r_uz__29 or r_sz__29 or r_sr__29 or r_sleftz__29 or r_sleftr__29 or
		r_weight__29 or r_layer__29 or r_dead__29 or r_hit__29 or r_diff__29 or r_dl_b__29 or r_numer__29 or r_z1__29 or r_z0__29 or r_mut__29 or

		r_x__30 or r_y__30 or r_z__30 or r_ux__30 or r_uy__30 or r_uz__30 or r_sz__30 or r_sr__30 or r_sleftz__30 or r_sleftr__30 or
		r_weight__30 or r_layer__30 or r_dead__30 or r_hit__30 or r_diff__30 or r_dl_b__30 or r_numer__30 or r_z1__30 or r_z0__30 or r_mut__30 or

		r_x__31 or r_y__31 or r_z__31 or r_ux__31 or r_uy__31 or r_uz__31 or r_sz__31 or r_sr__31 or r_sleftz__31 or r_sleftr__31 or
		r_weight__31 or r_layer__31 or r_dead__31 or r_hit__31 or r_diff__31 or r_dl_b__31 or r_numer__31 or r_z1__31 or r_z0__31 or r_mut__31 or

		r_x__32 or r_y__32 or r_z__32 or r_ux__32 or r_uy__32 or r_uz__32 or r_sz__32 or r_sr__32 or r_sleftz__32 or r_sleftr__32 or
		r_weight__32 or r_layer__32 or r_dead__32 or r_hit__32 or r_diff__32 or r_dl_b__32 or r_numer__32 or r_z1__32 or r_z0__32 or r_mut__32 or

		r_x__33 or r_y__33 or r_z__33 or r_ux__33 or r_uy__33 or r_uz__33 or r_sz__33 or r_sr__33 or r_sleftz__33 or r_sleftr__33 or
		r_weight__33 or r_layer__33 or r_dead__33 or r_hit__33 or r_diff__33 or r_dl_b__33 or r_numer__33 or r_z1__33 or r_z0__33 or r_mut__33 or

		r_x__34 or r_y__34 or r_z__34 or r_ux__34 or r_uy__34 or r_uz__34 or r_sz__34 or r_sr__34 or r_sleftz__34 or r_sleftr__34 or
		r_weight__34 or r_layer__34 or r_dead__34 or r_hit__34 or r_diff__34 or r_dl_b__34 or r_numer__34 or r_z1__34 or r_z0__34 or r_mut__34 or

		r_x__35 or r_y__35 or r_z__35 or r_ux__35 or r_uy__35 or r_uz__35 or r_sz__35 or r_sr__35 or r_sleftz__35 or r_sleftr__35 or
		r_weight__35 or r_layer__35 or r_dead__35 or r_hit__35 or r_diff__35 or r_dl_b__35 or r_numer__35 or r_z1__35 or r_z0__35 or r_mut__35 or

		r_x__36 or r_y__36 or r_z__36 or r_ux__36 or r_uy__36 or r_uz__36 or r_sz__36 or r_sr__36 or r_sleftz__36 or r_sleftr__36 or
		r_weight__36 or r_layer__36 or r_dead__36 or r_hit__36 or r_diff__36 or r_dl_b__36 or r_numer__36 or r_z1__36 or r_z0__36 or r_mut__36 or

		r_x__37 or r_y__37 or r_z__37 or r_ux__37 or r_uy__37 or r_uz__37 or r_sz__37 or r_sr__37 or r_sleftz__37 or r_sleftr__37 or
		r_weight__37 or r_layer__37 or r_dead__37 or r_hit__37 or r_diff__37 or r_dl_b__37 or r_numer__37 or r_z1__37 or r_z0__37 or r_mut__37 or

		r_x__38 or r_y__38 or r_z__38 or r_ux__38 or r_uy__38 or r_uz__38 or r_sz__38 or r_sr__38 or r_sleftz__38 or r_sleftr__38 or
		r_weight__38 or r_layer__38 or r_dead__38 or r_hit__38 or r_diff__38 or r_dl_b__38 or r_numer__38 or r_z1__38 or r_z0__38 or r_mut__38 or

		r_x__39 or r_y__39 or r_z__39 or r_ux__39 or r_uy__39 or r_uz__39 or r_sz__39 or r_sr__39 or r_sleftz__39 or r_sleftr__39 or
		r_weight__39 or r_layer__39 or r_dead__39 or r_hit__39 or r_diff__39 or r_dl_b__39 or r_numer__39 or r_z1__39 or r_z0__39 or r_mut__39 or

		r_x__40 or r_y__40 or r_z__40 or r_ux__40 or r_uy__40 or r_uz__40 or r_sz__40 or r_sr__40 or r_sleftz__40 or r_sleftr__40 or
		r_weight__40 or r_layer__40 or r_dead__40 or r_hit__40 or r_diff__40 or r_dl_b__40 or r_numer__40 or r_z1__40 or r_z0__40 or r_mut__40 or

		r_x__41 or r_y__41 or r_z__41 or r_ux__41 or r_uy__41 or r_uz__41 or r_sz__41 or r_sr__41 or r_sleftz__41 or r_sleftr__41 or
		r_weight__41 or r_layer__41 or r_dead__41 or r_hit__41 or r_diff__41 or r_dl_b__41 or r_numer__41 or r_z1__41 or r_z0__41 or r_mut__41 or

		r_x__42 or r_y__42 or r_z__42 or r_ux__42 or r_uy__42 or r_uz__42 or r_sz__42 or r_sr__42 or r_sleftz__42 or r_sleftr__42 or
		r_weight__42 or r_layer__42 or r_dead__42 or r_hit__42 or r_diff__42 or r_dl_b__42 or r_numer__42 or r_z1__42 or r_z0__42 or r_mut__42 or

		r_x__43 or r_y__43 or r_z__43 or r_ux__43 or r_uy__43 or r_uz__43 or r_sz__43 or r_sr__43 or r_sleftz__43 or r_sleftr__43 or
		r_weight__43 or r_layer__43 or r_dead__43 or r_hit__43 or r_diff__43 or r_dl_b__43 or r_numer__43 or r_z1__43 or r_z0__43 or r_mut__43 or

		r_x__44 or r_y__44 or r_z__44 or r_ux__44 or r_uy__44 or r_uz__44 or r_sz__44 or r_sr__44 or r_sleftz__44 or r_sleftr__44 or
		r_weight__44 or r_layer__44 or r_dead__44 or r_hit__44 or r_diff__44 or r_dl_b__44 or r_numer__44 or r_z1__44 or r_z0__44 or r_mut__44 or

		r_x__45 or r_y__45 or r_z__45 or r_ux__45 or r_uy__45 or r_uz__45 or r_sz__45 or r_sr__45 or r_sleftz__45 or r_sleftr__45 or
		r_weight__45 or r_layer__45 or r_dead__45 or r_hit__45 or r_diff__45 or r_dl_b__45 or r_numer__45 or r_z1__45 or r_z0__45 or r_mut__45 or

		r_x__46 or r_y__46 or r_z__46 or r_ux__46 or r_uy__46 or r_uz__46 or r_sz__46 or r_sr__46 or r_sleftz__46 or r_sleftr__46 or
		r_weight__46 or r_layer__46 or r_dead__46 or r_hit__46 or r_diff__46 or r_dl_b__46 or r_numer__46 or r_z1__46 or r_z0__46 or r_mut__46 or

		r_x__47 or r_y__47 or r_z__47 or r_ux__47 or r_uy__47 or r_uz__47 or r_sz__47 or r_sr__47 or r_sleftz__47 or r_sleftr__47 or
		r_weight__47 or r_layer__47 or r_dead__47 or r_hit__47 or r_diff__47 or r_dl_b__47 or r_numer__47 or r_z1__47 or r_z0__47 or r_mut__47 or

		r_x__48 or r_y__48 or r_z__48 or r_ux__48 or r_uy__48 or r_uz__48 or r_sz__48 or r_sr__48 or r_sleftz__48 or r_sleftr__48 or
		r_weight__48 or r_layer__48 or r_dead__48 or r_hit__48 or r_diff__48 or r_dl_b__48 or r_numer__48 or r_z1__48 or r_z0__48 or r_mut__48 or

		r_x__49 or r_y__49 or r_z__49 or r_ux__49 or r_uy__49 or r_uz__49 or r_sz__49 or r_sr__49 or r_sleftz__49 or r_sleftr__49 or
		r_weight__49 or r_layer__49 or r_dead__49 or r_hit__49 or r_diff__49 or r_dl_b__49 or r_numer__49 or r_z1__49 or r_z0__49 or r_mut__49 or

		r_x__50 or r_y__50 or r_z__50 or r_ux__50 or r_uy__50 or r_uz__50 or r_sz__50 or r_sr__50 or r_sleftz__50 or r_sleftr__50 or
		r_weight__50 or r_layer__50 or r_dead__50 or r_hit__50 or r_diff__50 or r_dl_b__50 or r_numer__50 or r_z1__50 or r_z0__50 or r_mut__50 or

		r_x__51 or r_y__51 or r_z__51 or r_ux__51 or r_uy__51 or r_uz__51 or r_sz__51 or r_sr__51 or r_sleftz__51 or r_sleftr__51 or
		r_weight__51 or r_layer__51 or r_dead__51 or r_hit__51 or r_diff__51 or r_dl_b__51 or r_numer__51 or r_z1__51 or r_z0__51 or r_mut__51 or

		r_x__52 or r_y__52 or r_z__52 or r_ux__52 or r_uy__52 or r_uz__52 or r_sz__52 or r_sr__52 or r_sleftz__52 or r_sleftr__52 or
		r_weight__52 or r_layer__52 or r_dead__52 or r_hit__52 or r_diff__52 or r_dl_b__52 or r_numer__52 or r_z1__52 or r_z0__52 or r_mut__52 or

		r_x__53 or r_y__53 or r_z__53 or r_ux__53 or r_uy__53 or r_uz__53 or r_sz__53 or r_sr__53 or r_sleftz__53 or r_sleftr__53 or
		r_weight__53 or r_layer__53 or r_dead__53 or r_hit__53 or r_diff__53 or r_dl_b__53 or r_numer__53 or r_z1__53 or r_z0__53 or r_mut__53 or

		r_x__54 or r_y__54 or r_z__54 or r_ux__54 or r_uy__54 or r_uz__54 or r_sz__54 or r_sr__54 or r_sleftz__54 or r_sleftr__54 or
		r_weight__54 or r_layer__54 or r_dead__54 or r_hit__54 or r_diff__54 or r_dl_b__54 or r_numer__54 or r_z1__54 or r_z0__54 or r_mut__54 or

		r_x__55 or r_y__55 or r_z__55 or r_ux__55 or r_uy__55 or r_uz__55 or r_sz__55 or r_sr__55 or r_sleftz__55 or r_sleftr__55 or
		r_weight__55 or r_layer__55 or r_dead__55 or r_hit__55 or r_diff__55 or r_dl_b__55 or r_numer__55 or r_z1__55 or r_z0__55 or r_mut__55 or

		r_x__56 or r_y__56 or r_z__56 or r_ux__56 or r_uy__56 or r_uz__56 or r_sz__56 or r_sr__56 or r_sleftz__56 or r_sleftr__56 or
		r_weight__56 or r_layer__56 or r_dead__56 or r_hit__56 or r_diff__56 or r_dl_b__56 or r_numer__56 or r_z1__56 or r_z0__56 or r_mut__56 or

		r_x__57 or r_y__57 or r_z__57 or r_ux__57 or r_uy__57 or r_uz__57 or r_sz__57 or r_sr__57 or r_sleftz__57 or r_sleftr__57 or
		r_weight__57 or r_layer__57 or r_dead__57 or r_hit__57 or r_diff__57 or r_dl_b__57 or r_numer__57 or r_z1__57 or r_z0__57 or r_mut__57 or

		r_x__58 or r_y__58 or r_z__58 or r_ux__58 or r_uy__58 or r_uz__58 or r_sz__58 or r_sr__58 or r_sleftz__58 or r_sleftr__58 or
		r_weight__58 or r_layer__58 or r_dead__58 or r_hit__58 or r_diff__58 or r_dl_b__58 or r_numer__58 or r_z1__58 or r_z0__58 or r_mut__58 or

		r_x__59 or r_y__59 or r_z__59 or r_ux__59 or r_uy__59 or r_uz__59 or r_sz__59 or r_sr__59 or r_sleftz__59 or r_sleftr__59 or
		r_weight__59 or r_layer__59 or r_dead__59 or r_hit__59 or r_diff__59 or r_dl_b__59 or r_numer__59 or r_z1__59 or r_z0__59 or r_mut__59 or 
		
		sr_big or sleftz_big or sleftr_big or quotient_div1)

	// default
	// setup standard pipeline
//	for(i = 1; i < `TOTAL_LATENCY; i = i + 1)
//	begin
//		c_x[i]	= r_x[i-1];
//		c_y[i]	= r_y[i-1];
//		c_z[i]	= r_z[i-1];
//		c_ux[i]	= r_ux[i-1];
//		c_uy[i]	= r_uy[i-1];
//		c_uz[i]	= r_uz[i-1];
//		c_sz[i]	= r_sz[i-1];
//		c_sr[i]	= r_sr[i-1];
//		c_sleftz[i]	= r_sleftz[i-1];
//		c_sleftr[i]	= r_sleftr[i-1];
//		c_weight[i]	= r_weight[i-1];
//		c_layer[i]	= r_layer[i-1];
//		c_dead[i]	= r_dead[i-1];
//		c_hit[i]	= r_hit[i-1];
//		c_diff[i] = r_diff[i-1];
//		c_dl_b[i] = r_dl_b[i-1];
//		c_numer[i] = r_numer[i-1];
//		c_z1[i] = r_z1[i-1];
//		c_z0[i] = r_z0[i-1];
//		c_mut[i] = r_mut[i-1];
//	end

begin
	//Instatiate all 60 instances of the above for-loop
	//for 1
		c_x__1	= r_x__0;
		c_y__1	= r_y__0;
		c_z__1	= r_z__0;
		c_ux__1	= r_ux__0;
		c_uy__1	= r_uy__0;
		c_uz__1	= r_uz__0;
		c_sz__1	= r_sz__0;
		c_sr__1	= r_sr__0;
		c_sleftz__1	= r_sleftz__0;
		c_sleftr__1	= r_sleftr__0;
		c_weight__1	= r_weight__0;
		c_layer__1	= r_layer__0;
		c_dead__1	= r_dead__0;
		c_hit__1	= r_hit__0;
		c_diff__1 = r_diff__0;
		c_dl_b__1 = r_dl_b__0;
		c_numer__1 = r_numer__0;
		c_z1__1 = r_z1__0;
		c_z0__1 = r_z0__0;
		c_mut__1 = r_mut__0;
		
		//for 2
		c_x__2	= r_x__1;
		c_y__2	= r_y__1;
		c_z__2	= r_z__1;
		c_ux__2	= r_ux__1;
		c_uy__2	= r_uy__1;
		c_uz__2	= r_uz__1;
		c_sz__2	= r_sz__1;
		c_sr__2	= r_sr__1;
		c_sleftz__2	= r_sleftz__1;
		c_sleftr__2	= r_sleftr__1;
		c_weight__2	= r_weight__1;
		c_layer__2	= r_layer__1;
		c_dead__2	= r_dead__1;
		c_hit__2	= r_hit__1;
		c_diff__2 = r_diff__1;
		c_dl_b__2 = r_dl_b__1;
		c_numer__2 = r_numer__1;
		c_z1__2 = r_z1__1;
		c_z0__2 = r_z0__1;
		c_mut__2 = r_mut__1;
	
		//for 3
		c_x__3	= r_x__2;
		c_y__3	= r_y__2;
		c_z__3	= r_z__2;
		c_ux__3	= r_ux__2;
		c_uy__3	= r_uy__2;
		c_uz__3	= r_uz__2;
		c_sz__3	= r_sz__2;
		c_sr__3	= r_sr__2;
		c_sleftz__3	= r_sleftz__2;
		c_sleftr__3	= r_sleftr__2;
		c_weight__3	= r_weight__2;
		c_layer__3	= r_layer__2;
		c_dead__3	= r_dead__2;
		c_hit__3	= r_hit__2;
		c_diff__3 = r_diff__2;
		c_dl_b__3 = r_dl_b__2;
		c_numer__3 = r_numer__2;
		c_z1__3 = r_z1__2;
		c_z0__3 = r_z0__2;
		c_mut__3 = r_mut__2;
		
		//for 4
		c_x__4	= r_x__3;
		c_y__4	= r_y__3;
		c_z__4	= r_z__3;
		c_ux__4	= r_ux__3;
		c_uy__4	= r_uy__3;
		c_uz__4	= r_uz__3;
		c_sz__4	= r_sz__3;
		c_sr__4	= r_sr__3;
		c_sleftz__4	= r_sleftz__3;
		c_sleftr__4	= r_sleftr__3;
		c_weight__4	= r_weight__3;
		c_layer__4	= r_layer__3;
		c_dead__4	= r_dead__3;
		c_hit__4	= r_hit__3;
		c_diff__4 = r_diff__3;
		c_dl_b__4 = r_dl_b__3;
		c_numer__4 = r_numer__3;
		c_z1__4 = r_z1__3;
		c_z0__4 = r_z0__3;
		c_mut__4 = r_mut__3;
		
		//for 5
		c_x__5	= r_x__4;
		c_y__5	= r_y__4;
		c_z__5	= r_z__4;
		c_ux__5	= r_ux__4;
		c_uy__5	= r_uy__4;
		c_uz__5	= r_uz__4;
		c_sz__5	= r_sz__4;
		c_sr__5	= r_sr__4;
		c_sleftz__5	= r_sleftz__4;
		c_sleftr__5	= r_sleftr__4;
		c_weight__5	= r_weight__4;
		c_layer__5	= r_layer__4;
		c_dead__5	= r_dead__4;
		c_hit__5	= r_hit__4;
		c_diff__5 = r_diff__4;
		c_dl_b__5 = r_dl_b__4;
		c_numer__5 = r_numer__4;
		c_z1__5 = r_z1__4;
		c_z0__5 = r_z0__4;
		c_mut__5 = r_mut__4;
		
		//for 6
		c_x__6	= r_x__5;
		c_y__6	= r_y__5;
		c_z__6	= r_z__5;
		c_ux__6	= r_ux__5;
		c_uy__6	= r_uy__5;
		c_uz__6	= r_uz__5;
		c_sz__6	= r_sz__5;
		c_sr__6	= r_sr__5;
		c_sleftz__6	= r_sleftz__5;
		c_sleftr__6	= r_sleftr__5;
		c_weight__6	= r_weight__5;
		c_layer__6	= r_layer__5;
		c_dead__6	= r_dead__5;
		c_hit__6	= r_hit__5;
		c_diff__6 = r_diff__5;
		c_dl_b__6 = r_dl_b__5;
		c_numer__6 = r_numer__5;
		c_z1__6 = r_z1__5;
		c_z0__6 = r_z0__5;
		c_mut__6 = r_mut__5;
		
		//for 7
		c_x__7	= r_x__6;
		c_y__7	= r_y__6;
		c_z__7	= r_z__6;
		c_ux__7	= r_ux__6;
		c_uy__7	= r_uy__6;
		c_uz__7	= r_uz__6;
		c_sz__7	= r_sz__6;
		c_sr__7	= r_sr__6;
		c_sleftz__7	= r_sleftz__6;
		c_sleftr__7	= r_sleftr__6;
		c_weight__7	= r_weight__6;
		c_layer__7	= r_layer__6;
		c_dead__7	= r_dead__6;
		c_hit__7	= r_hit__6;
		c_diff__7 = r_diff__6;
		c_dl_b__7 = r_dl_b__6;
		c_numer__7 = r_numer__6;
		c_z1__7 = r_z1__6;
		c_z0__7 = r_z0__6;
		c_mut__7 = r_mut__6;
		
		//for 8
		c_x__8	= r_x__7;
		c_y__8	= r_y__7;
		c_z__8	= r_z__7;
		c_ux__8	= r_ux__7;
		c_uy__8	= r_uy__7;
		c_uz__8	= r_uz__7;
		c_sz__8	= r_sz__7;
		c_sr__8	= r_sr__7;
		c_sleftz__8	= r_sleftz__7;
		c_sleftr__8	= r_sleftr__7;
		c_weight__8	= r_weight__7;
		c_layer__8	= r_layer__7;
		c_dead__8	= r_dead__7;
		c_hit__8	= r_hit__7;
		c_diff__8 = r_diff__7;
		c_dl_b__8 = r_dl_b__7;
		c_numer__8 = r_numer__7;
		c_z1__8 = r_z1__7;
		c_z0__8 = r_z0__7;
		c_mut__8 = r_mut__7;
		
		//for 9
		c_x__9	= r_x__8;
		c_y__9	= r_y__8;
		c_z__9	= r_z__8;
		c_ux__9	= r_ux__8;
		c_uy__9	= r_uy__8;
		c_uz__9	= r_uz__8;
		c_sz__9	= r_sz__8;
		c_sr__9	= r_sr__8;
		c_sleftz__9	= r_sleftz__8;
		c_sleftr__9	= r_sleftr__8;
		c_weight__9	= r_weight__8;
		c_layer__9	= r_layer__8;
		c_dead__9	= r_dead__8;
		c_hit__9	= r_hit__8;
		c_diff__9 = r_diff__8;
		c_dl_b__9 = r_dl_b__8;
		c_numer__9 = r_numer__8;
		c_z1__9 = r_z1__8;
		c_z0__9 = r_z0__8;
		c_mut__9 = r_mut__8;
		
		//for 10
		c_x__10	= r_x__9;
		c_y__10	= r_y__9;
		c_z__10	= r_z__9;
		c_ux__10	= r_ux__9;
		c_uy__10	= r_uy__9;
		c_uz__10	= r_uz__9;
		c_sz__10	= r_sz__9;
		c_sr__10	= r_sr__9;
		c_sleftz__10	= r_sleftz__9;
		c_sleftr__10	= r_sleftr__9;
		c_weight__10	= r_weight__9;
		c_layer__10	= r_layer__9;
		c_dead__10	= r_dead__9;
		c_hit__10	= r_hit__9;
		c_diff__10 = r_diff__9;
		c_dl_b__10 = r_dl_b__9;
		c_numer__10 = r_numer__9;
		c_z1__10 = r_z1__9;
		c_z0__10 = r_z0__9;
		c_mut__10 = r_mut__9;
		
		//for 11
		c_x__11	= r_x__10;
		c_y__11	= r_y__10;
		c_z__11	= r_z__10;
		c_ux__11	= r_ux__10;
		c_uy__11	= r_uy__10;
		c_uz__11	= r_uz__10;
		c_sz__11	= r_sz__10;
		c_sr__11	= r_sr__10;
		c_sleftz__11	= r_sleftz__10;
		c_sleftr__11	= r_sleftr__10;
		c_weight__11	= r_weight__10;
		c_layer__11	= r_layer__10;
		c_dead__11	= r_dead__10;
		c_hit__11	= r_hit__10;
		c_diff__11 = r_diff__10;
		c_dl_b__11 = r_dl_b__10;
		c_numer__11 = r_numer__10;
		c_z1__11 = r_z1__10;
		c_z0__11 = r_z0__10;
		c_mut__11 = r_mut__10;
		
		//for 12
		c_x__12	= r_x__11;
		c_y__12	= r_y__11;
		c_z__12	= r_z__11;
		c_ux__12	= r_ux__11;
		c_uy__12	= r_uy__11;
		c_uz__12	= r_uz__11;
		c_sz__12	= r_sz__11;
		c_sr__12	= r_sr__11;
		c_sleftz__12	= r_sleftz__11;
		c_sleftr__12	= r_sleftr__11;
		c_weight__12	= r_weight__11;
		c_layer__12	= r_layer__11;
		c_dead__12	= r_dead__11;
		c_hit__12	= r_hit__11;
		c_diff__12 = r_diff__11;
		c_dl_b__12 = r_dl_b__11;
		c_numer__12 = r_numer__11;
		c_z1__12 = r_z1__11;
		c_z0__12 = r_z0__11;
		c_mut__12 = r_mut__11;
		
		//for 13
		c_x__13	= r_x__12;
		c_y__13	= r_y__12;
		c_z__13	= r_z__12;
		c_ux__13	= r_ux__12;
		c_uy__13	= r_uy__12;
		c_uz__13	= r_uz__12;
		c_sz__13	= r_sz__12;
		c_sr__13	= r_sr__12;
		c_sleftz__13	= r_sleftz__12;
		c_sleftr__13	= r_sleftr__12;
		c_weight__13	= r_weight__12;
		c_layer__13	= r_layer__12;
		c_dead__13	= r_dead__12;
		c_hit__13	= r_hit__12;
		c_diff__13 = r_diff__12;
		c_dl_b__13 = r_dl_b__12;
		c_numer__13 = r_numer__12;
		c_z1__13 = r_z1__12;
		c_z0__13 = r_z0__12;
		c_mut__13 = r_mut__12;
		
		//for 14
		c_x__14	= r_x__13;
		c_y__14	= r_y__13;
		c_z__14	= r_z__13;
		c_ux__14	= r_ux__13;
		c_uy__14	= r_uy__13;
		c_uz__14	= r_uz__13;
		c_sz__14	= r_sz__13;
		c_sr__14	= r_sr__13;
		c_sleftz__14	= r_sleftz__13;
		c_sleftr__14	= r_sleftr__13;
		c_weight__14	= r_weight__13;
		c_layer__14	= r_layer__13;
		c_dead__14	= r_dead__13;
		c_hit__14	= r_hit__13;
		c_diff__14 = r_diff__13;
		c_dl_b__14 = r_dl_b__13;
		c_numer__14 = r_numer__13;
		c_z1__14 = r_z1__13;
		c_z0__14 = r_z0__13;
		c_mut__14 = r_mut__13;
		
		//for 15
		c_x__15	= r_x__14;
		c_y__15	= r_y__14;
		c_z__15	= r_z__14;
		c_ux__15	= r_ux__14;
		c_uy__15	= r_uy__14;
		c_uz__15	= r_uz__14;
		c_sz__15	= r_sz__14;
		c_sr__15	= r_sr__14;
		c_sleftz__15	= r_sleftz__14;
		c_sleftr__15	= r_sleftr__14;
		c_weight__15	= r_weight__14;
		c_layer__15	= r_layer__14;
		c_dead__15	= r_dead__14;
		c_hit__15	= r_hit__14;
		c_diff__15 = r_diff__14;
		c_dl_b__15 = r_dl_b__14;
		c_numer__15 = r_numer__14;
		c_z1__15 = r_z1__14;
		c_z0__15 = r_z0__14;
		c_mut__15 = r_mut__14;
		
		//for 16
		c_x__16	= r_x__15;
		c_y__16	= r_y__15;
		c_z__16	= r_z__15;
		c_ux__16	= r_ux__15;
		c_uy__16	= r_uy__15;
		c_uz__16	= r_uz__15;
		c_sz__16	= r_sz__15;
		c_sr__16	= r_sr__15;
		c_sleftz__16	= r_sleftz__15;
		c_sleftr__16	= r_sleftr__15;
		c_weight__16	= r_weight__15;
		c_layer__16	= r_layer__15;
		c_dead__16	= r_dead__15;
		c_hit__16	= r_hit__15;
		c_diff__16 = r_diff__15;
		c_dl_b__16 = r_dl_b__15;
		c_numer__16 = r_numer__15;
		c_z1__16 = r_z1__15;
		c_z0__16 = r_z0__15;
		c_mut__16 = r_mut__15;
		
		//for 17
		c_x__17	= r_x__16;
		c_y__17	= r_y__16;
		c_z__17	= r_z__16;
		c_ux__17	= r_ux__16;
		c_uy__17	= r_uy__16;
		c_uz__17	= r_uz__16;
		c_sz__17	= r_sz__16;
		c_sr__17	= r_sr__16;
		c_sleftz__17	= r_sleftz__16;
		c_sleftr__17	= r_sleftr__16;
		c_weight__17	= r_weight__16;
		c_layer__17	= r_layer__16;
		c_dead__17	= r_dead__16;
		c_hit__17	= r_hit__16;
		c_diff__17 = r_diff__16;
		c_dl_b__17 = r_dl_b__16;
		c_numer__17 = r_numer__16;
		c_z1__17 = r_z1__16;
		c_z0__17 = r_z0__16;
		c_mut__17 = r_mut__16;
		
		//for 18
		c_x__18	= r_x__17;
		c_y__18	= r_y__17;
		c_z__18	= r_z__17;
		c_ux__18	= r_ux__17;
		c_uy__18	= r_uy__17;
		c_uz__18	= r_uz__17;
		c_sz__18	= r_sz__17;
		c_sr__18	= r_sr__17;
		c_sleftz__18	= r_sleftz__17;
		c_sleftr__18	= r_sleftr__17;
		c_weight__18	= r_weight__17;
		c_layer__18	= r_layer__17;
		c_dead__18	= r_dead__17;
		c_hit__18	= r_hit__17;
		c_diff__18 = r_diff__17;
		c_dl_b__18 = r_dl_b__17;
		c_numer__18 = r_numer__17;
		c_z1__18 = r_z1__17;
		c_z0__18 = r_z0__17;
		c_mut__18 = r_mut__17;
		
		//for 19
		c_x__19	= r_x__18;
		c_y__19	= r_y__18;
		c_z__19	= r_z__18;
		c_ux__19	= r_ux__18;
		c_uy__19	= r_uy__18;
		c_uz__19	= r_uz__18;
		c_sz__19	= r_sz__18;
		c_sr__19	= r_sr__18;
		c_sleftz__19	= r_sleftz__18;
		c_sleftr__19	= r_sleftr__18;
		c_weight__19	= r_weight__18;
		c_layer__19	= r_layer__18;
		c_dead__19	= r_dead__18;
		c_hit__19	= r_hit__18;
		c_diff__19 = r_diff__18;
		c_dl_b__19 = r_dl_b__18;
		c_numer__19 = r_numer__18;
		c_z1__19 = r_z1__18;
		c_z0__19 = r_z0__18;
		c_mut__19 = r_mut__18;
		
		//for 20
		c_x__20	= r_x__19;
		c_y__20	= r_y__19;
		c_z__20	= r_z__19;
		c_ux__20	= r_ux__19;
		c_uy__20	= r_uy__19;
		c_uz__20	= r_uz__19;
		c_sz__20	= r_sz__19;
		c_sr__20	= r_sr__19;
		c_sleftz__20	= r_sleftz__19;
		c_sleftr__20	= r_sleftr__19;
		c_weight__20	= r_weight__19;
		c_layer__20	= r_layer__19;
		c_dead__20	= r_dead__19;
		c_hit__20	= r_hit__19;
		c_diff__20 = r_diff__19;
		c_dl_b__20 = r_dl_b__19;
		c_numer__20 = r_numer__19;
		c_z1__20 = r_z1__19;
		c_z0__20 = r_z0__19;
		c_mut__20 = r_mut__19;
		
		
		//for 21
		c_x__21	= r_x__20;
		c_y__21	= r_y__20;
		c_z__21	= r_z__20;
		c_ux__21	= r_ux__20;
		c_uy__21	= r_uy__20;
		c_uz__21	= r_uz__20;
		c_sz__21	= r_sz__20;
		c_sr__21	= r_sr__20;
		c_sleftz__21	= r_sleftz__20;
		c_sleftr__21	= r_sleftr__20;
		c_weight__21	= r_weight__20;
		c_layer__21	= r_layer__20;
		c_dead__21	= r_dead__20;
		c_hit__21	= r_hit__20;
		c_diff__21 = r_diff__20;
		c_dl_b__21 = r_dl_b__20;
		c_numer__21 = r_numer__20;
		c_z1__21 = r_z1__20;
		c_z0__21 = r_z0__20;
		c_mut__21 = r_mut__20;
		
		//for 22
		c_x__22	= r_x__21;
		c_y__22	= r_y__21;
		c_z__22	= r_z__21;
		c_ux__22	= r_ux__21;
		c_uy__22	= r_uy__21;
		c_uz__22	= r_uz__21;
		c_sz__22	= r_sz__21;
		c_sr__22	= r_sr__21;
		c_sleftz__22	= r_sleftz__21;
		c_sleftr__22	= r_sleftr__21;
		c_weight__22	= r_weight__21;
		c_layer__22	= r_layer__21;
		c_dead__22	= r_dead__21;
		c_hit__22	= r_hit__21;
		c_diff__22 = r_diff__21;
		c_dl_b__22 = r_dl_b__21;
		c_numer__22 = r_numer__21;
		c_z1__22 = r_z1__21;
		c_z0__22 = r_z0__21;
		c_mut__22 = r_mut__21;
		
		//for 23
		c_x__23	= r_x__22;
		c_y__23	= r_y__22;
		c_z__23	= r_z__22;
		c_ux__23	= r_ux__22;
		c_uy__23	= r_uy__22;
		c_uz__23	= r_uz__22;
		c_sz__23	= r_sz__22;
		c_sr__23	= r_sr__22;
		c_sleftz__23	= r_sleftz__22;
		c_sleftr__23	= r_sleftr__22;
		c_weight__23	= r_weight__22;
		c_layer__23	= r_layer__22;
		c_dead__23	= r_dead__22;
		c_hit__23	= r_hit__22;
		c_diff__23 = r_diff__22;
		c_dl_b__23 = r_dl_b__22;
		c_numer__23 = r_numer__22;
		c_z1__23 = r_z1__22;
		c_z0__23 = r_z0__22;
		c_mut__23 = r_mut__22;
		
		//for 24
		c_x__24	= r_x__23;
		c_y__24	= r_y__23;
		c_z__24	= r_z__23;
		c_ux__24	= r_ux__23;
		c_uy__24	= r_uy__23;
		c_uz__24	= r_uz__23;
		c_sz__24	= r_sz__23;
		c_sr__24	= r_sr__23;
		c_sleftz__24	= r_sleftz__23;
		c_sleftr__24	= r_sleftr__23;
		c_weight__24	= r_weight__23;
		c_layer__24	= r_layer__23;
		c_dead__24	= r_dead__23;
		c_hit__24	= r_hit__23;
		c_diff__24 = r_diff__23;
		c_dl_b__24 = r_dl_b__23;
		c_numer__24 = r_numer__23;
		c_z1__24 = r_z1__23;
		c_z0__24 = r_z0__23;
		c_mut__24 = r_mut__23;
		
		//for 25
		c_x__25	= r_x__24;
		c_y__25	= r_y__24;
		c_z__25	= r_z__24;
		c_ux__25	= r_ux__24;
		c_uy__25	= r_uy__24;
		c_uz__25	= r_uz__24;
		c_sz__25	= r_sz__24;
		c_sr__25	= r_sr__24;
		c_sleftz__25	= r_sleftz__24;
		c_sleftr__25	= r_sleftr__24;
		c_weight__25	= r_weight__24;
		c_layer__25	= r_layer__24;
		c_dead__25	= r_dead__24;
		c_hit__25	= r_hit__24;
		c_diff__25 = r_diff__24;
		c_dl_b__25 = r_dl_b__24;
		c_numer__25 = r_numer__24;
		c_z1__25 = r_z1__24;
		c_z0__25 = r_z0__24;
		c_mut__25 = r_mut__24;
		
		//for 26
		c_x__26	= r_x__25;
		c_y__26	= r_y__25;
		c_z__26	= r_z__25;
		c_ux__26	= r_ux__25;
		c_uy__26	= r_uy__25;
		c_uz__26	= r_uz__25;
		c_sz__26	= r_sz__25;
		c_sr__26	= r_sr__25;
		c_sleftz__26	= r_sleftz__25;
		c_sleftr__26	= r_sleftr__25;
		c_weight__26	= r_weight__25;
		c_layer__26	= r_layer__25;
		c_dead__26	= r_dead__25;
		c_hit__26	= r_hit__25;
		c_diff__26 = r_diff__25;
		c_dl_b__26 = r_dl_b__25;
		c_numer__26 = r_numer__25;
		c_z1__26 = r_z1__25;
		c_z0__26 = r_z0__25;
		c_mut__26 = r_mut__25;
		
		//for 27
		c_x__27	= r_x__26;
		c_y__27	= r_y__26;
		c_z__27	= r_z__26;
		c_ux__27	= r_ux__26;
		c_uy__27	= r_uy__26;
		c_uz__27	= r_uz__26;
		c_sz__27	= r_sz__26;
		c_sr__27	= r_sr__26;
		c_sleftz__27	= r_sleftz__26;
		c_sleftr__27	= r_sleftr__26;
		c_weight__27	= r_weight__26;
		c_layer__27	= r_layer__26;
		c_dead__27	= r_dead__26;
		c_hit__27	= r_hit__26;
		c_diff__27 = r_diff__26;
		c_dl_b__27 = r_dl_b__26;
		c_numer__27 = r_numer__26;
		c_z1__27 = r_z1__26;
		c_z0__27 = r_z0__26;
		c_mut__27 = r_mut__26;
		
		//for 28
		c_x__28	= r_x__27;
		c_y__28	= r_y__27;
		c_z__28	= r_z__27;
		c_ux__28	= r_ux__27;
		c_uy__28	= r_uy__27;
		c_uz__28	= r_uz__27;
		c_sz__28	= r_sz__27;
		c_sr__28	= r_sr__27;
		c_sleftz__28	= r_sleftz__27;
		c_sleftr__28	= r_sleftr__27;
		c_weight__28	= r_weight__27;
		c_layer__28	= r_layer__27;
		c_dead__28	= r_dead__27;
		c_hit__28	= r_hit__27;
		c_diff__28 = r_diff__27;
		c_dl_b__28 = r_dl_b__27;
		c_numer__28 = r_numer__27;
		c_z1__28 = r_z1__27;
		c_z0__28 = r_z0__27;
		c_mut__28 = r_mut__27;
		
		//for 29
		c_x__29	= r_x__28;
		c_y__29	= r_y__28;
		c_z__29	= r_z__28;
		c_ux__29	= r_ux__28;
		c_uy__29	= r_uy__28;
		c_uz__29	= r_uz__28;
		c_sz__29	= r_sz__28;
		c_sr__29	= r_sr__28;
		c_sleftz__29	= r_sleftz__28;
		c_sleftr__29	= r_sleftr__28;
		c_weight__29	= r_weight__28;
		c_layer__29	= r_layer__28;
		c_dead__29	= r_dead__28;
		c_hit__29	= r_hit__28;
		c_diff__29 = r_diff__28;
		c_dl_b__29 = r_dl_b__28;
		c_numer__29 = r_numer__28;
		c_z1__29 = r_z1__28;
		c_z0__29 = r_z0__28;
		c_mut__29 = r_mut__28;
		
		//for 30
		c_x__30	= r_x__29;
		c_y__30	= r_y__29;
		c_z__30	= r_z__29;
		c_ux__30	= r_ux__29;
		c_uy__30	= r_uy__29;
		c_uz__30	= r_uz__29;
		c_sz__30	= r_sz__29;
		c_sr__30	= r_sr__29;
		c_sleftz__30	= r_sleftz__29;
		c_sleftr__30	= r_sleftr__29;
		c_weight__30	= r_weight__29;
		c_layer__30	= r_layer__29;
		c_dead__30	= r_dead__29;
	//	c_hit__30	= r_hit__29;//
	//	c_diff__30 = r_diff__29;//
	// this value is set later, removing default - peter m	
	//	c_dl_b__30 = r_dl_b__29;//
	// this one too
		c_numer__30 = r_numer__29;
		c_z1__30 = r_z1__29;
		c_z0__30 = r_z0__29;
		c_mut__30 = r_mut__29;
		
		//for 31
		c_x__31	= r_x__30;
		c_y__31	= r_y__30;
	//	c_z__31	= r_z__30;//
		c_ux__31	= r_ux__30;
		c_uy__31	= r_uy__30;
		c_uz__31	= r_uz__30;
	//	c_sz__31	= r_sz__30;//
	//	c_sr__31	= r_sr__30;//
	//	c_sleftz__31	= r_sleftz__30;//
		c_sleftr__31	= r_sleftr__30;
		c_weight__31	= r_weight__30;
		c_layer__31	= r_layer__30;
		c_dead__31	= r_dead__30;
		c_hit__31	= r_hit__30;
		c_diff__31 = r_diff__30;
		c_dl_b__31 = r_dl_b__30;
		c_numer__31 = r_numer__30;
		c_z1__31 = r_z1__30;
		c_z0__31 = r_z0__30;
		c_mut__31 = r_mut__30;
		
		//for 32
		c_x__32	= r_x__31;
		c_y__32	= r_y__31;
		c_z__32	= r_z__31;
		c_ux__32	= r_ux__31;
		c_uy__32	= r_uy__31;
		c_uz__32	= r_uz__31;
		c_sz__32	= r_sz__31;
		c_sr__32	= r_sr__31;
		c_sleftz__32	= r_sleftz__31;
	//	c_sleftr__32	= r_sleftr__31;//
		c_weight__32	= r_weight__31;
		c_layer__32	= r_layer__31;
		c_dead__32	= r_dead__31;
		c_hit__32	= r_hit__31;
		c_diff__32 = r_diff__31;
		c_dl_b__32 = r_dl_b__31;
		c_numer__32 = r_numer__31;
		c_z1__32 = r_z1__31;
		c_z0__32 = r_z0__31;
		c_mut__32 = r_mut__31;
		
		//for 33
		c_x__33	= r_x__32;
		c_y__33	= r_y__32;
		c_z__33	= r_z__32;
		c_ux__33	= r_ux__32;
		c_uy__33	= r_uy__32;
		c_uz__33	= r_uz__32;
		c_sz__33	= r_sz__32;
		c_sr__33	= r_sr__32;
		c_sleftz__33	= r_sleftz__32;
		c_sleftr__33	= r_sleftr__32;
		c_weight__33	= r_weight__32;
		c_layer__33	= r_layer__32;
		c_dead__33	= r_dead__32;
		c_hit__33	= r_hit__32;
		c_diff__33 = r_diff__32;
		c_dl_b__33 = r_dl_b__32;
		c_numer__33 = r_numer__32;
		c_z1__33 = r_z1__32;
		c_z0__33 = r_z0__32;
		c_mut__33 = r_mut__32;
		
		//for 34
		c_x__34	= r_x__33;
		c_y__34	= r_y__33;
		c_z__34	= r_z__33;
		c_ux__34	= r_ux__33;
		c_uy__34	= r_uy__33;
		c_uz__34	= r_uz__33;
		c_sz__34	= r_sz__33;
		c_sr__34	= r_sr__33;
		c_sleftz__34	= r_sleftz__33;
		c_sleftr__34	= r_sleftr__33;
		c_weight__34	= r_weight__33;
		c_layer__34	= r_layer__33;
		c_dead__34	= r_dead__33;
		c_hit__34	= r_hit__33;
		c_diff__34 = r_diff__33;
		c_dl_b__34 = r_dl_b__33;
		c_numer__34 = r_numer__33;
		c_z1__34 = r_z1__33;
		c_z0__34 = r_z0__33;
		c_mut__34 = r_mut__33;
		
		//for 35
		c_x__35	= r_x__34;
		c_y__35	= r_y__34;
		c_z__35	= r_z__34;
		c_ux__35	= r_ux__34;
		c_uy__35	= r_uy__34;
		c_uz__35	= r_uz__34;
		c_sz__35	= r_sz__34;
		c_sr__35	= r_sr__34;
		c_sleftz__35	= r_sleftz__34;
		c_sleftr__35	= r_sleftr__34;
		c_weight__35	= r_weight__34;
		c_layer__35	= r_layer__34;
		c_dead__35	= r_dead__34;
		c_hit__35	= r_hit__34;
		c_diff__35 = r_diff__34;
		c_dl_b__35 = r_dl_b__34;
		c_numer__35 = r_numer__34;
		c_z1__35 = r_z1__34;
		c_z0__35 = r_z0__34;
		c_mut__35 = r_mut__34;
		
		//for 36
		c_x__36	= r_x__35;
		c_y__36	= r_y__35;
		c_z__36	= r_z__35;
		c_ux__36	= r_ux__35;
		c_uy__36	= r_uy__35;
		c_uz__36	= r_uz__35;
		c_sz__36	= r_sz__35;
		c_sr__36	= r_sr__35;
		c_sleftz__36	= r_sleftz__35;
		c_sleftr__36	= r_sleftr__35;
		c_weight__36	= r_weight__35;
		c_layer__36	= r_layer__35;
		c_dead__36	= r_dead__35;
		c_hit__36	= r_hit__35;
		c_diff__36 = r_diff__35;
		c_dl_b__36 = r_dl_b__35;
		c_numer__36 = r_numer__35;
		c_z1__36 = r_z1__35;
		c_z0__36 = r_z0__35;
		c_mut__36 = r_mut__35;
		
		//for 37
		c_x__37	= r_x__36;
		c_y__37	= r_y__36;
		c_z__37	= r_z__36;
		c_ux__37	= r_ux__36;
		c_uy__37	= r_uy__36;
		c_uz__37	= r_uz__36;
		c_sz__37	= r_sz__36;
		c_sr__37	= r_sr__36;
		c_sleftz__37	= r_sleftz__36;
		c_sleftr__37	= r_sleftr__36;
		c_weight__37	= r_weight__36;
		c_layer__37	= r_layer__36;
		c_dead__37	= r_dead__36;
		c_hit__37	= r_hit__36;
		c_diff__37 = r_diff__36;
		c_dl_b__37 = r_dl_b__36;
		c_numer__37 = r_numer__36;
		c_z1__37 = r_z1__36;
		c_z0__37 = r_z0__36;
		c_mut__37 = r_mut__36;
		
		//for 38
		c_x__38	= r_x__37;
		c_y__38	= r_y__37;
		c_z__38	= r_z__37;
		c_ux__38	= r_ux__37;
		c_uy__38	= r_uy__37;
		c_uz__38	= r_uz__37;
		c_sz__38	= r_sz__37;
		c_sr__38	= r_sr__37;
		c_sleftz__38	= r_sleftz__37;
		c_sleftr__38	= r_sleftr__37;
		c_weight__38	= r_weight__37;
		c_layer__38	= r_layer__37;
		c_dead__38	= r_dead__37;
		c_hit__38	= r_hit__37;
		c_diff__38 = r_diff__37;
		c_dl_b__38 = r_dl_b__37;
		c_numer__38 = r_numer__37;
		c_z1__38 = r_z1__37;
		c_z0__38 = r_z0__37;
		c_mut__38 = r_mut__37;
		
		//for 39
		c_x__39	= r_x__38;
		c_y__39	= r_y__38;
		c_z__39	= r_z__38;
		c_ux__39	= r_ux__38;
		c_uy__39	= r_uy__38;
		c_uz__39	= r_uz__38;
		c_sz__39	= r_sz__38;
		c_sr__39	= r_sr__38;
		c_sleftz__39	= r_sleftz__38;
		c_sleftr__39	= r_sleftr__38;
		c_weight__39	= r_weight__38;
		c_layer__39	= r_layer__38;
		c_dead__39	= r_dead__38;
		c_hit__39	= r_hit__38;
		c_diff__39 = r_diff__38;
		c_dl_b__39 = r_dl_b__38;
		c_numer__39 = r_numer__38;
		c_z1__39 = r_z1__38;
		c_z0__39 = r_z0__38;
		c_mut__39 = r_mut__38;
		
		//for 40
		c_x__40	= r_x__39;
		c_y__40	= r_y__39;
		c_z__40	= r_z__39;
		c_ux__40	= r_ux__39;
		c_uy__40	= r_uy__39;
		c_uz__40	= r_uz__39;
		c_sz__40	= r_sz__39;
		c_sr__40	= r_sr__39;
		c_sleftz__40	= r_sleftz__39;
		c_sleftr__40	= r_sleftr__39;
		c_weight__40	= r_weight__39;
		c_layer__40	= r_layer__39;
		c_dead__40	= r_dead__39;
		c_hit__40	= r_hit__39;
		c_diff__40 = r_diff__39;
		c_dl_b__40 = r_dl_b__39;
		c_numer__40 = r_numer__39;
		c_z1__40 = r_z1__39;
		c_z0__40 = r_z0__39;
		c_mut__40 = r_mut__39;
		
		//for 41
		c_x__41	= r_x__40;
		c_y__41	= r_y__40;
		c_z__41	= r_z__40;
		c_ux__41	= r_ux__40;
		c_uy__41	= r_uy__40;
		c_uz__41	= r_uz__40;
		c_sz__41	= r_sz__40;
		c_sr__41	= r_sr__40;
		c_sleftz__41	= r_sleftz__40;
		c_sleftr__41	= r_sleftr__40;
		c_weight__41	= r_weight__40;
		c_layer__41	= r_layer__40;
		c_dead__41	= r_dead__40;
		c_hit__41	= r_hit__40;
		c_diff__41 = r_diff__40;
		c_dl_b__41 = r_dl_b__40;
		c_numer__41 = r_numer__40;
		c_z1__41 = r_z1__40;
		c_z0__41 = r_z0__40;
		c_mut__41 = r_mut__40;
		
		//for 42
		c_x__42	= r_x__41;
		c_y__42	= r_y__41;
		c_z__42	= r_z__41;
		c_ux__42	= r_ux__41;
		c_uy__42	= r_uy__41;
		c_uz__42	= r_uz__41;
		c_sz__42	= r_sz__41;
		c_sr__42	= r_sr__41;
		c_sleftz__42	= r_sleftz__41;
		c_sleftr__42	= r_sleftr__41;
		c_weight__42	= r_weight__41;
		c_layer__42	= r_layer__41;
		c_dead__42	= r_dead__41;
		c_hit__42	= r_hit__41;
		c_diff__42 = r_diff__41;
		c_dl_b__42 = r_dl_b__41;
		c_numer__42 = r_numer__41;
		c_z1__42 = r_z1__41;
		c_z0__42 = r_z0__41;
		c_mut__42 = r_mut__41;
		
		//for 43
		c_x__43	= r_x__42;
		c_y__43	= r_y__42;
		c_z__43	= r_z__42;
		c_ux__43	= r_ux__42;
		c_uy__43	= r_uy__42;
		c_uz__43	= r_uz__42;
		c_sz__43	= r_sz__42;
		c_sr__43	= r_sr__42;
		c_sleftz__43	= r_sleftz__42;
		c_sleftr__43	= r_sleftr__42;
		c_weight__43	= r_weight__42;
		c_layer__43	= r_layer__42;
		c_dead__43	= r_dead__42;
		c_hit__43	= r_hit__42;
		c_diff__43 = r_diff__42;
		c_dl_b__43 = r_dl_b__42;
		c_numer__43 = r_numer__42;
		c_z1__43 = r_z1__42;
		c_z0__43 = r_z0__42;
		c_mut__43 = r_mut__42;
		
		//for 44
		c_x__44	= r_x__43;
		c_y__44	= r_y__43;
		c_z__44	= r_z__43;
		c_ux__44	= r_ux__43;
		c_uy__44	= r_uy__43;
		c_uz__44	= r_uz__43;
		c_sz__44	= r_sz__43;
		c_sr__44	= r_sr__43;
		c_sleftz__44	= r_sleftz__43;
		c_sleftr__44	= r_sleftr__43;
		c_weight__44	= r_weight__43;
		c_layer__44	= r_layer__43;
		c_dead__44	= r_dead__43;
		c_hit__44	= r_hit__43;
		c_diff__44 = r_diff__43;
		c_dl_b__44 = r_dl_b__43;
		c_numer__44 = r_numer__43;
		c_z1__44 = r_z1__43;
		c_z0__44 = r_z0__43;
		c_mut__44 = r_mut__43;
		
		//for 45
		c_x__45	= r_x__44;
		c_y__45	= r_y__44;
		c_z__45	= r_z__44;
		c_ux__45	= r_ux__44;
		c_uy__45	= r_uy__44;
		c_uz__45	= r_uz__44;
		c_sz__45	= r_sz__44;
		c_sr__45	= r_sr__44;
		c_sleftz__45	= r_sleftz__44;
		c_sleftr__45	= r_sleftr__44;
		c_weight__45	= r_weight__44;
		c_layer__45	= r_layer__44;
		c_dead__45	= r_dead__44;
		c_hit__45	= r_hit__44;
		c_diff__45 = r_diff__44;
		c_dl_b__45 = r_dl_b__44;
		c_numer__45 = r_numer__44;
		c_z1__45 = r_z1__44;
		c_z0__45 = r_z0__44;
		c_mut__45 = r_mut__44;
		
		//for 46
		c_x__46	= r_x__45;
		c_y__46	= r_y__45;
		c_z__46	= r_z__45;
		c_ux__46	= r_ux__45;
		c_uy__46	= r_uy__45;
		c_uz__46	= r_uz__45;
		c_sz__46	= r_sz__45;
		c_sr__46	= r_sr__45;
		c_sleftz__46	= r_sleftz__45;
		c_sleftr__46	= r_sleftr__45;
		c_weight__46	= r_weight__45;
		c_layer__46	= r_layer__45;
		c_dead__46	= r_dead__45;
		c_hit__46	= r_hit__45;
		c_diff__46 = r_diff__45;
		c_dl_b__46 = r_dl_b__45;
		c_numer__46 = r_numer__45;
		c_z1__46 = r_z1__45;
		c_z0__46 = r_z0__45;
		c_mut__46 = r_mut__45;
		
		//for 47
		c_x__47	= r_x__46;
		c_y__47	= r_y__46;
		c_z__47	= r_z__46;
		c_ux__47	= r_ux__46;
		c_uy__47	= r_uy__46;
		c_uz__47	= r_uz__46;
		c_sz__47	= r_sz__46;
		c_sr__47	= r_sr__46;
		c_sleftz__47	= r_sleftz__46;
		c_sleftr__47	= r_sleftr__46;
		c_weight__47	= r_weight__46;
		c_layer__47	= r_layer__46;
		c_dead__47	= r_dead__46;
		c_hit__47	= r_hit__46;
		c_diff__47 = r_diff__46;
		c_dl_b__47 = r_dl_b__46;
		c_numer__47 = r_numer__46;
		c_z1__47 = r_z1__46;
		c_z0__47 = r_z0__46;
		c_mut__47 = r_mut__46;
		
		//for 48
		c_x__48	= r_x__47;
		c_y__48	= r_y__47;
		c_z__48	= r_z__47;
		c_ux__48	= r_ux__47;
		c_uy__48	= r_uy__47;
		c_uz__48	= r_uz__47;
		c_sz__48	= r_sz__47;
		c_sr__48	= r_sr__47;
		c_sleftz__48	= r_sleftz__47;
		c_sleftr__48	= r_sleftr__47;
		c_weight__48	= r_weight__47;
		c_layer__48	= r_layer__47;
		c_dead__48	= r_dead__47;
		c_hit__48	= r_hit__47;
		c_diff__48 = r_diff__47;
		c_dl_b__48 = r_dl_b__47;
		c_numer__48 = r_numer__47;
		c_z1__48 = r_z1__47;
		c_z0__48 = r_z0__47;
		c_mut__48 = r_mut__47;
		
		//for 49
		c_x__49	= r_x__48;
		c_y__49	= r_y__48;
		c_z__49	= r_z__48;
		c_ux__49	= r_ux__48;
		c_uy__49	= r_uy__48;
		c_uz__49	= r_uz__48;
		c_sz__49	= r_sz__48;
		c_sr__49	= r_sr__48;
		c_sleftz__49	= r_sleftz__48;
		c_sleftr__49	= r_sleftr__48;
		c_weight__49	= r_weight__48;
		c_layer__49	= r_layer__48;
		c_dead__49	= r_dead__48;
		c_hit__49	= r_hit__48;
		c_diff__49 = r_diff__48;
		c_dl_b__49 = r_dl_b__48;
		c_numer__49 = r_numer__48;
		c_z1__49 = r_z1__48;
		c_z0__49 = r_z0__48;
		c_mut__49 = r_mut__48;
		
		//for 50
		c_x__50	= r_x__49;
		c_y__50	= r_y__49;
		c_z__50	= r_z__49;
		c_ux__50	= r_ux__49;
		c_uy__50	= r_uy__49;
		c_uz__50	= r_uz__49;
		c_sz__50	= r_sz__49;
		c_sr__50	= r_sr__49;
		c_sleftz__50	= r_sleftz__49;
		c_sleftr__50	= r_sleftr__49;
		c_weight__50	= r_weight__49;
		c_layer__50	= r_layer__49;
		c_dead__50	= r_dead__49;
		c_hit__50	= r_hit__49;
		c_diff__50 = r_diff__49;
		c_dl_b__50 = r_dl_b__49;
		c_numer__50 = r_numer__49;
		c_z1__50 = r_z1__49;
		c_z0__50 = r_z0__49;
		c_mut__50 = r_mut__49;
		
		//for 51
		c_x__51	= r_x__50;
		c_y__51	= r_y__50;
		c_z__51	= r_z__50;
		c_ux__51	= r_ux__50;
		c_uy__51	= r_uy__50;
		c_uz__51	= r_uz__50;
		c_sz__51	= r_sz__50;
		c_sr__51	= r_sr__50;
		c_sleftz__51	= r_sleftz__50;
		c_sleftr__51	= r_sleftr__50;
		c_weight__51	= r_weight__50;
		c_layer__51	= r_layer__50;
		c_dead__51	= r_dead__50;
		c_hit__51	= r_hit__50;
		c_diff__51 = r_diff__50;
		c_dl_b__51 = r_dl_b__50;
		c_numer__51 = r_numer__50;
		c_z1__51 = r_z1__50;
		c_z0__51 = r_z0__50;
		c_mut__51 = r_mut__50;
		
		//for 52
		c_x__52	= r_x__51;
		c_y__52	= r_y__51;
		c_z__52	= r_z__51;
		c_ux__52	= r_ux__51;
		c_uy__52	= r_uy__51;
		c_uz__52	= r_uz__51;
		c_sz__52	= r_sz__51;
		c_sr__52	= r_sr__51;
		c_sleftz__52	= r_sleftz__51;
		c_sleftr__52	= r_sleftr__51;
		c_weight__52	= r_weight__51;
		c_layer__52	= r_layer__51;
		c_dead__52	= r_dead__51;
		c_hit__52	= r_hit__51;
		c_diff__52 = r_diff__51;
		c_dl_b__52 = r_dl_b__51;
		c_numer__52 = r_numer__51;
		c_z1__52 = r_z1__51;
		c_z0__52 = r_z0__51;
		c_mut__52 = r_mut__51;
		
		//for 53
		c_x__53	= r_x__52;
		c_y__53	= r_y__52;
		c_z__53	= r_z__52;
		c_ux__53	= r_ux__52;
		c_uy__53	= r_uy__52;
		c_uz__53	= r_uz__52;
		c_sz__53	= r_sz__52;
		c_sr__53	= r_sr__52;
		c_sleftz__53	= r_sleftz__52;
		c_sleftr__53	= r_sleftr__52;
		c_weight__53	= r_weight__52;
		c_layer__53	= r_layer__52;
		c_dead__53	= r_dead__52;
		c_hit__53	= r_hit__52;
		c_diff__53 = r_diff__52;
		c_dl_b__53 = r_dl_b__52;
		c_numer__53 = r_numer__52;
		c_z1__53 = r_z1__52;
		c_z0__53 = r_z0__52;
		c_mut__53 = r_mut__52;
		
		//for 54
		c_x__54	= r_x__53;
		c_y__54	= r_y__53;
		c_z__54	= r_z__53;
		c_ux__54	= r_ux__53;
		c_uy__54	= r_uy__53;
		c_uz__54	= r_uz__53;
		c_sz__54	= r_sz__53;
		c_sr__54	= r_sr__53;
		c_sleftz__54	= r_sleftz__53;
		c_sleftr__54	= r_sleftr__53;
		c_weight__54	= r_weight__53;
		c_layer__54	= r_layer__53;
		c_dead__54	= r_dead__53;
		c_hit__54	= r_hit__53;
		c_diff__54 = r_diff__53;
		c_dl_b__54 = r_dl_b__53;
		c_numer__54 = r_numer__53;
		c_z1__54 = r_z1__53;
		c_z0__54 = r_z0__53;
		c_mut__54 = r_mut__53;
		
		//for 55
		c_x__55	= r_x__54;
		c_y__55	= r_y__54;
		c_z__55	= r_z__54;
		c_ux__55	= r_ux__54;
		c_uy__55	= r_uy__54;
		c_uz__55	= r_uz__54;
		c_sz__55	= r_sz__54;
		c_sr__55	= r_sr__54;
		c_sleftz__55	= r_sleftz__54;
		c_sleftr__55	= r_sleftr__54;
		c_weight__55	= r_weight__54;
		c_layer__55	= r_layer__54;
		c_dead__55	= r_dead__54;
		c_hit__55	= r_hit__54;
		c_diff__55 = r_diff__54;
		c_dl_b__55 = r_dl_b__54;
		c_numer__55 = r_numer__54;
		c_z1__55 = r_z1__54;
		c_z0__55 = r_z0__54;
		c_mut__55 = r_mut__54;
		
		//for 56
		c_x__56	= r_x__55;
		c_y__56	= r_y__55;
		c_z__56	= r_z__55;
		c_ux__56	= r_ux__55;
		c_uy__56	= r_uy__55;
		c_uz__56	= r_uz__55;
		c_sz__56	= r_sz__55;
		c_sr__56	= r_sr__55;
		c_sleftz__56	= r_sleftz__55;
		c_sleftr__56	= r_sleftr__55;
		c_weight__56	= r_weight__55;
		c_layer__56	= r_layer__55;
		c_dead__56	= r_dead__55;
		c_hit__56	= r_hit__55;
		c_diff__56 = r_diff__55;
		c_dl_b__56 = r_dl_b__55;
		c_numer__56 = r_numer__55;
		c_z1__56 = r_z1__55;
		c_z0__56 = r_z0__55;
		c_mut__56 = r_mut__55;
		
		//for 57
		c_x__57	= r_x__56;
		c_y__57	= r_y__56;
		c_z__57	= r_z__56;
		c_ux__57	= r_ux__56;
		c_uy__57	= r_uy__56;
		c_uz__57	= r_uz__56;
		c_sz__57	= r_sz__56;
		c_sr__57	= r_sr__56;
		c_sleftz__57	= r_sleftz__56;
		c_sleftr__57	= r_sleftr__56;
		c_weight__57	= r_weight__56;
		c_layer__57	= r_layer__56;
		c_dead__57	= r_dead__56;
		c_hit__57	= r_hit__56;
		c_diff__57 = r_diff__56;
		c_dl_b__57 = r_dl_b__56;
		c_numer__57 = r_numer__56;
		c_z1__57 = r_z1__56;
		c_z0__57 = r_z0__56;
		c_mut__57 = r_mut__56;
		
		//for 58
		c_x__58	= r_x__57;
		c_y__58	= r_y__57;
		c_z__58	= r_z__57;
		c_ux__58	= r_ux__57;
		c_uy__58	= r_uy__57;
		c_uz__58	= r_uz__57;
		c_sz__58	= r_sz__57;
		c_sr__58	= r_sr__57;
		c_sleftz__58	= r_sleftz__57;
		c_sleftr__58	= r_sleftr__57;
		c_weight__58	= r_weight__57;
		c_layer__58	= r_layer__57;
		c_dead__58	= r_dead__57;
		c_hit__58	= r_hit__57;
		c_diff__58 = r_diff__57;
		c_dl_b__58 = r_dl_b__57;
		c_numer__58 = r_numer__57;
		c_z1__58 = r_z1__57;
		c_z0__58 = r_z0__57;
		c_mut__58 = r_mut__57;
		
		//for 59
		c_x__59	= r_x__58;
		c_y__59	= r_y__58;
		c_z__59	= r_z__58;
		c_ux__59	= r_ux__58;
		c_uy__59	= r_uy__58;
		c_uz__59	= r_uz__58;
		c_sz__59	= r_sz__58;
		c_sr__59	= r_sr__58;
		c_sleftz__59	= r_sleftz__58;
		c_sleftr__59	= r_sleftr__58;
		c_weight__59	= r_weight__58;
		c_layer__59	= r_layer__58;
		c_dead__59	= r_dead__58;
		c_hit__59	= r_hit__58;
		c_diff__59 = r_diff__58;
		c_dl_b__59 = r_dl_b__58;
		c_numer__59 = r_numer__58;
		c_z1__59 = r_z1__58;
		c_z0__59 = r_z0__58;
		c_mut__59 = r_mut__58;
	

	// Pull out and replace signals in pipe
	/* STAGE 1: Division completed */
	c_dl_b__30 = quotient_div1[32:1];
	c_diff__30 = c_sz__30 - c_dl_b__30;

	if(c_uz__30 != 32'b0 && c_sz__30 > c_dl_b__30 && quotient_div1[63:32] == 32'b0)
	begin
		/* not horizontal & crossing. */
		c_hit__30 = 1'b1;
	end
	//Remove blocking on c_hit__30
	else
	begin
		c_hit__30	= r_hit__29;
	end

	/* STAGE 2: First multiply completed */
	if(c_hit__31 == 1'b1)
	begin
		/*step left = (original step - distance travelled) * scaling factor*/

		c_sleftz__31 = sleftz_big[2*`BIT_WIDTH-2:`BIT_WIDTH - 1];
		if(c_uz__31[`BIT_WIDTH-1] == 1'b0) 
		begin
			c_z__31 = c_z1__31;
		end
		else
		begin
			c_z__31 = c_z0__31;
		end

		c_sz__31 = c_dl_b__31;
		c_sr__31 = sr_big[2*`BIT_WIDTH-2 - `ASPECT_RATIO:`BIT_WIDTH - 1 - `ASPECT_RATIO];
	end
	//Remove blocking on c_sleftz_31, c_sr__31, c_sz__31, c_z__31
	else 
	begin
		c_sleftz__31 = r_sleftz__30;
		c_sr__31 = r_sr__30;
		c_sz__31 = r_sz__30;
		c_z__31	= r_z__30;
	end

	/* STAGE 3: Second multiply completed */
	if(c_hit__32 == 1'b1)
	begin
		/*additional scaling factor on dl_b to switch to r-dimension scale*/
		c_sleftr__32 = sleftr_big[2*`BIT_WIDTH-2 - `ASPECT_RATIO:`BIT_WIDTH - 1 - `ASPECT_RATIO];
	end
	//Remove blocking on c_sleftr__32
	else
	begin
		c_sleftr__32 = r_sleftr__31;
	
	end
end

// latch values
always @ (posedge clock)
begin
//	for(j = 0; j < `TOTAL_LATENCY; j = j + 1)
//	begin
//		if (reset)
//		begin
//			r_x[j]	<= 32'b0;
//			r_y[j]	<= 32'b0;
//			r_z[j]	<= 32'b0;
//			r_ux[j]	<= 32'b0;
//			r_uy[j]	<= 32'b0;
//			r_uz[j]	<= 32'b0;
//			r_sz[j]	<= 32'b0;
//			r_sr[j]	<= 32'b0;
//			r_sleftz[j]	<= 32'b0;
//			r_sleftr[j]	<= 32'b0;
//			r_weight[j]	<= 32'b0;
//			r_layer[j]	<= 3'b0;
//			r_dead[j]	<= 1'b1;
//			r_hit[j]	<= 1'b0;
//			r_diff[j] <= 32'b0;
//			r_dl_b[j] <= 32'b0;
//			r_numer[j] <= 64'b0;
//			r_z1[j] <= 32'b0;
//			r_z0[j] <= 32'b0;
//			r_mut[j] <= 32'b0;
//		end
//		else
//		begin
//			if(enable)
//			begin
//				r_x[j]	<= c_x[j];
//				r_y[j]	<= c_y[j];
//				r_z[j]	<= c_z[j];
//				r_ux[j]	<= c_ux[j];
//				r_uy[j]	<= c_uy[j];
//				r_uz[j]	<= c_uz[j];
//				r_sz[j]	<= c_sz[j];
//				r_sr[j]	<= c_sr[j];
//				r_sleftz[j]	<= c_sleftz[j];
//				r_sleftr[j]	<= c_sleftr[j];
//				r_weight[j]	<= c_weight[j];
//				r_layer[j]	<= c_layer[j];
//				r_dead[j]	<= c_dead[j];
//				r_hit[j]	<= c_hit[j];
//				r_diff[j] <= c_diff[j];
//				r_dl_b[j] <= c_dl_b[j];
//				r_numer[j] <= c_numer[j];
//				r_z1[j] <= c_z1[j];
//				r_z0[j] <= c_z0[j];
//				r_mut[j] <= c_mut[j];
//			end
//		end
//	end
	if(reset)
	begin
		//Instantiate all 60 aspects of loop
			r_x__59	<= 32'b00000000000000000000000000000000;
			r_y__59	<= 32'b00000000000000000000000000000000;
			r_z__59	<= 32'b00000000000000000000000000000000;
			r_ux__59	<= 32'b00000000000000000000000000000000;
			r_uy__59	<= 32'b00000000000000000000000000000000;
			r_uz__59	<= 32'b00000000000000000000000000000000;
			r_sz__59	<= 32'b00000000000000000000000000000000;
			r_sr__59	<= 32'b00000000000000000000000000000000;
			r_sleftz__59	<= 32'b00000000000000000000000000000000;
			r_sleftr__59	<= 32'b00000000000000000000000000000000;
			r_weight__59	<= 32'b00000000000000000000000000000000;
			r_layer__59	<= 3'b000;
			r_dead__59	<= 1'b1;
			r_hit__59	<= 1'b0;
			r_diff__59 <= 32'b00000000000000000000000000000000;
			r_dl_b__59 <= 32'b00000000000000000000000000000000;
			r_numer__59 <= 0;
			r_z1__59 <= 32'b00000000000000000000000000000000;
			r_z0__59 <= 32'b00000000000000000000000000000000;
			r_mut__59 <= 32'b00000000000000000000000000000000;

			r_x__58	<= 32'b00000000000000000000000000000000;
			r_y__58	<= 32'b00000000000000000000000000000000;
			r_z__58	<= 32'b00000000000000000000000000000000;
			r_ux__58	<= 32'b00000000000000000000000000000000;
			r_uy__58	<= 32'b00000000000000000000000000000000;
			r_uz__58	<= 32'b00000000000000000000000000000000;
			r_sz__58	<= 32'b00000000000000000000000000000000;
			r_sr__58	<= 32'b00000000000000000000000000000000;
			r_sleftz__58	<= 32'b00000000000000000000000000000000;
			r_sleftr__58	<= 32'b00000000000000000000000000000000;
			r_weight__58	<= 32'b00000000000000000000000000000000;
			r_layer__58	<= 3'b000;
			r_dead__58	<= 1'b1;
			r_hit__58	<= 1'b0;
			r_diff__58 <= 32'b00000000000000000000000000000000;
			r_dl_b__58 <= 32'b00000000000000000000000000000000;
			r_numer__58 <= 0;
			r_z1__58 <= 32'b00000000000000000000000000000000;
			r_z0__58 <= 32'b00000000000000000000000000000000;
			r_mut__58 <= 32'b00000000000000000000000000000000;

			r_x__57	<= 32'b00000000000000000000000000000000;
			r_y__57	<= 32'b00000000000000000000000000000000;
			r_z__57	<= 32'b00000000000000000000000000000000;
			r_ux__57	<= 32'b00000000000000000000000000000000;
			r_uy__57	<= 32'b00000000000000000000000000000000;
			r_uz__57	<= 32'b00000000000000000000000000000000;
			r_sz__57	<= 32'b00000000000000000000000000000000;
			r_sr__57	<= 32'b00000000000000000000000000000000;
			r_sleftz__57	<= 32'b00000000000000000000000000000000;
			r_sleftr__57	<= 32'b00000000000000000000000000000000;
			r_weight__57	<= 32'b00000000000000000000000000000000;
			r_layer__57	<= 3'b000;
			r_dead__57	<= 1'b1;
			r_hit__57	<= 1'b0;
			r_diff__57 <= 32'b00000000000000000000000000000000;
			r_dl_b__57 <= 32'b00000000000000000000000000000000;
			r_numer__57 <= 0;
			r_z1__57 <= 32'b00000000000000000000000000000000;
			r_z0__57 <= 32'b00000000000000000000000000000000;
			r_mut__57 <= 32'b00000000000000000000000000000000;

			r_x__56	<= 32'b00000000000000000000000000000000;
			r_y__56	<= 32'b00000000000000000000000000000000;
			r_z__56	<= 32'b00000000000000000000000000000000;
			r_ux__56	<= 32'b00000000000000000000000000000000;
			r_uy__56	<= 32'b00000000000000000000000000000000;
			r_uz__56	<= 32'b00000000000000000000000000000000;
			r_sz__56	<= 32'b00000000000000000000000000000000;
			r_sr__56	<= 32'b00000000000000000000000000000000;
			r_sleftz__56	<= 32'b00000000000000000000000000000000;
			r_sleftr__56	<= 32'b00000000000000000000000000000000;
			r_weight__56	<= 32'b00000000000000000000000000000000;
			r_layer__56	<= 3'b000;
			r_dead__56	<= 1'b1;
			r_hit__56	<= 1'b0;
			r_diff__56 <= 32'b00000000000000000000000000000000;
			r_dl_b__56 <= 32'b00000000000000000000000000000000;
			r_numer__56 <= 0;
			r_z1__56 <= 32'b00000000000000000000000000000000;
			r_z0__56 <= 32'b00000000000000000000000000000000;
			r_mut__56 <= 32'b00000000000000000000000000000000;

			r_x__55	<= 32'b00000000000000000000000000000000;
			r_y__55	<= 32'b00000000000000000000000000000000;
			r_z__55	<= 32'b00000000000000000000000000000000;
			r_ux__55	<= 32'b00000000000000000000000000000000;
			r_uy__55	<= 32'b00000000000000000000000000000000;
			r_uz__55	<= 32'b00000000000000000000000000000000;
			r_sz__55	<= 32'b00000000000000000000000000000000;
			r_sr__55	<= 32'b00000000000000000000000000000000;
			r_sleftz__55	<= 32'b00000000000000000000000000000000;
			r_sleftr__55	<= 32'b00000000000000000000000000000000;
			r_weight__55	<= 32'b00000000000000000000000000000000;
			r_layer__55	<= 3'b000;
			r_dead__55	<= 1'b1;
			r_hit__55	<= 1'b0;
			r_diff__55 <= 32'b00000000000000000000000000000000;
			r_dl_b__55 <= 32'b00000000000000000000000000000000;
			r_numer__55 <= 0;
			r_z1__55 <= 32'b00000000000000000000000000000000;
			r_z0__55 <= 32'b00000000000000000000000000000000;
			r_mut__55 <= 32'b00000000000000000000000000000000;

			r_x__54	<= 32'b00000000000000000000000000000000;
			r_y__54	<= 32'b00000000000000000000000000000000;
			r_z__54	<= 32'b00000000000000000000000000000000;
			r_ux__54	<= 32'b00000000000000000000000000000000;
			r_uy__54	<= 32'b00000000000000000000000000000000;
			r_uz__54	<= 32'b00000000000000000000000000000000;
			r_sz__54	<= 32'b00000000000000000000000000000000;
			r_sr__54	<= 32'b00000000000000000000000000000000;
			r_sleftz__54	<= 32'b00000000000000000000000000000000;
			r_sleftr__54	<= 32'b00000000000000000000000000000000;
			r_weight__54	<= 32'b00000000000000000000000000000000;
			r_layer__54	<= 3'b000;
			r_dead__54	<= 1'b1;
			r_hit__54	<= 1'b0;
			r_diff__54 <= 32'b00000000000000000000000000000000;
			r_dl_b__54 <= 32'b00000000000000000000000000000000;
			r_numer__54 <= 0;
			r_z1__54 <= 32'b00000000000000000000000000000000;
			r_z0__54 <= 32'b00000000000000000000000000000000;
			r_mut__54 <= 32'b00000000000000000000000000000000;

			r_x__53	<= 32'b00000000000000000000000000000000;
			r_y__53	<= 32'b00000000000000000000000000000000;
			r_z__53	<= 32'b00000000000000000000000000000000;
			r_ux__53	<= 32'b00000000000000000000000000000000;
			r_uy__53	<= 32'b00000000000000000000000000000000;
			r_uz__53	<= 32'b00000000000000000000000000000000;
			r_sz__53	<= 32'b00000000000000000000000000000000;
			r_sr__53	<= 32'b00000000000000000000000000000000;
			r_sleftz__53	<= 32'b00000000000000000000000000000000;
			r_sleftr__53	<= 32'b00000000000000000000000000000000;
			r_weight__53	<= 32'b00000000000000000000000000000000;
			r_layer__53	<= 3'b000;
			r_dead__53	<= 1'b1;
			r_hit__53	<= 1'b0;
			r_diff__53 <= 32'b00000000000000000000000000000000;
			r_dl_b__53 <= 32'b00000000000000000000000000000000;
			r_numer__53 <= 0;
			r_z1__53 <= 32'b00000000000000000000000000000000;
			r_z0__53 <= 32'b00000000000000000000000000000000;
			r_mut__53 <= 32'b00000000000000000000000000000000;

			r_x__52	<= 32'b00000000000000000000000000000000;
			r_y__52	<= 32'b00000000000000000000000000000000;
			r_z__52	<= 32'b00000000000000000000000000000000;
			r_ux__52	<= 32'b00000000000000000000000000000000;
			r_uy__52	<= 32'b00000000000000000000000000000000;
			r_uz__52	<= 32'b00000000000000000000000000000000;
			r_sz__52	<= 32'b00000000000000000000000000000000;
			r_sr__52	<= 32'b00000000000000000000000000000000;
			r_sleftz__52	<= 32'b00000000000000000000000000000000;
			r_sleftr__52	<= 32'b00000000000000000000000000000000;
			r_weight__52	<= 32'b00000000000000000000000000000000;
			r_layer__52	<= 3'b000;
			r_dead__52	<= 1'b1;
			r_hit__52	<= 1'b0;
			r_diff__52 <= 32'b00000000000000000000000000000000;
			r_dl_b__52 <= 32'b00000000000000000000000000000000;
			r_numer__52 <= 0;
			r_z1__52 <= 32'b00000000000000000000000000000000;
			r_z0__52 <= 32'b00000000000000000000000000000000;
			r_mut__52 <= 32'b00000000000000000000000000000000;

			r_x__51	<= 32'b00000000000000000000000000000000;
			r_y__51	<= 32'b00000000000000000000000000000000;
			r_z__51	<= 32'b00000000000000000000000000000000;
			r_ux__51	<= 32'b00000000000000000000000000000000;
			r_uy__51	<= 32'b00000000000000000000000000000000;
			r_uz__51	<= 32'b00000000000000000000000000000000;
			r_sz__51	<= 32'b00000000000000000000000000000000;
			r_sr__51	<= 32'b00000000000000000000000000000000;
			r_sleftz__51	<= 32'b00000000000000000000000000000000;
			r_sleftr__51	<= 32'b00000000000000000000000000000000;
			r_weight__51	<= 32'b00000000000000000000000000000000;
			r_layer__51	<= 3'b000;
			r_dead__51	<= 1'b1;
			r_hit__51	<= 1'b0;
			r_diff__51 <= 32'b00000000000000000000000000000000;
			r_dl_b__51 <= 32'b00000000000000000000000000000000;
			r_numer__51 <= 0;
			r_z1__51 <= 32'b00000000000000000000000000000000;
			r_z0__51 <= 32'b00000000000000000000000000000000;
			r_mut__51 <= 32'b00000000000000000000000000000000;

			r_x__50	<= 32'b00000000000000000000000000000000;
			r_y__50	<= 32'b00000000000000000000000000000000;
			r_z__50	<= 32'b00000000000000000000000000000000;
			r_ux__50	<= 32'b00000000000000000000000000000000;
			r_uy__50	<= 32'b00000000000000000000000000000000;
			r_uz__50	<= 32'b00000000000000000000000000000000;
			r_sz__50	<= 32'b00000000000000000000000000000000;
			r_sr__50	<= 32'b00000000000000000000000000000000;
			r_sleftz__50	<= 32'b00000000000000000000000000000000;
			r_sleftr__50	<= 32'b00000000000000000000000000000000;
			r_weight__50	<= 32'b00000000000000000000000000000000;
			r_layer__50	<= 3'b000;
			r_dead__50	<= 1'b1;
			r_hit__50	<= 1'b0;
			r_diff__50 <= 32'b00000000000000000000000000000000;
			r_dl_b__50 <= 32'b00000000000000000000000000000000;
			r_numer__50 <= 0;
			r_z1__50 <= 32'b00000000000000000000000000000000;
			r_z0__50 <= 32'b00000000000000000000000000000000;
			r_mut__50 <= 32'b00000000000000000000000000000000;

			r_x__49	<= 32'b00000000000000000000000000000000;
			r_y__49	<= 32'b00000000000000000000000000000000;
			r_z__49	<= 32'b00000000000000000000000000000000;
			r_ux__49	<= 32'b00000000000000000000000000000000;
			r_uy__49	<= 32'b00000000000000000000000000000000;
			r_uz__49	<= 32'b00000000000000000000000000000000;
			r_sz__49	<= 32'b00000000000000000000000000000000;
			r_sr__49	<= 32'b00000000000000000000000000000000;
			r_sleftz__49	<= 32'b00000000000000000000000000000000;
			r_sleftr__49	<= 32'b00000000000000000000000000000000;
			r_weight__49	<= 32'b00000000000000000000000000000000;
			r_layer__49	<= 3'b000;
			r_dead__49	<= 1'b1;
			r_hit__49	<= 1'b0;
			r_diff__49 <= 32'b00000000000000000000000000000000;
			r_dl_b__49 <= 32'b00000000000000000000000000000000;
			r_numer__49 <= 0;
			r_z1__49 <= 32'b00000000000000000000000000000000;
			r_z0__49 <= 32'b00000000000000000000000000000000;
			r_mut__49 <= 32'b00000000000000000000000000000000;

			r_x__48	<= 32'b00000000000000000000000000000000;
			r_y__48	<= 32'b00000000000000000000000000000000;
			r_z__48	<= 32'b00000000000000000000000000000000;
			r_ux__48	<= 32'b00000000000000000000000000000000;
			r_uy__48	<= 32'b00000000000000000000000000000000;
			r_uz__48	<= 32'b00000000000000000000000000000000;
			r_sz__48	<= 32'b00000000000000000000000000000000;
			r_sr__48	<= 32'b00000000000000000000000000000000;
			r_sleftz__48	<= 32'b00000000000000000000000000000000;
			r_sleftr__48	<= 32'b00000000000000000000000000000000;
			r_weight__48	<= 32'b00000000000000000000000000000000;
			r_layer__48	<= 3'b000;
			r_dead__48	<= 1'b1;
			r_hit__48	<= 1'b0;
			r_diff__48 <= 32'b00000000000000000000000000000000;
			r_dl_b__48 <= 32'b00000000000000000000000000000000;
			r_numer__48 <= 0;
			r_z1__48 <= 32'b00000000000000000000000000000000;
			r_z0__48 <= 32'b00000000000000000000000000000000;
			r_mut__48 <= 32'b00000000000000000000000000000000;

			r_x__47	<= 32'b00000000000000000000000000000000;
			r_y__47	<= 32'b00000000000000000000000000000000;
			r_z__47	<= 32'b00000000000000000000000000000000;
			r_ux__47	<= 32'b00000000000000000000000000000000;
			r_uy__47	<= 32'b00000000000000000000000000000000;
			r_uz__47	<= 32'b00000000000000000000000000000000;
			r_sz__47	<= 32'b00000000000000000000000000000000;
			r_sr__47	<= 32'b00000000000000000000000000000000;
			r_sleftz__47	<= 32'b00000000000000000000000000000000;
			r_sleftr__47	<= 32'b00000000000000000000000000000000;
			r_weight__47	<= 32'b00000000000000000000000000000000;
			r_layer__47	<= 3'b000;
			r_dead__47	<= 1'b1;
			r_hit__47	<= 1'b0;
			r_diff__47 <= 32'b00000000000000000000000000000000;
			r_dl_b__47 <= 32'b00000000000000000000000000000000;
			r_numer__47 <= 0;
			r_z1__47 <= 32'b00000000000000000000000000000000;
			r_z0__47 <= 32'b00000000000000000000000000000000;
			r_mut__47 <= 32'b00000000000000000000000000000000;

			r_x__46	<= 32'b00000000000000000000000000000000;
			r_y__46	<= 32'b00000000000000000000000000000000;
			r_z__46	<= 32'b00000000000000000000000000000000;
			r_ux__46	<= 32'b00000000000000000000000000000000;
			r_uy__46	<= 32'b00000000000000000000000000000000;
			r_uz__46	<= 32'b00000000000000000000000000000000;
			r_sz__46	<= 32'b00000000000000000000000000000000;
			r_sr__46	<= 32'b00000000000000000000000000000000;
			r_sleftz__46	<= 32'b00000000000000000000000000000000;
			r_sleftr__46	<= 32'b00000000000000000000000000000000;
			r_weight__46	<= 32'b00000000000000000000000000000000;
			r_layer__46	<= 3'b000;
			r_dead__46	<= 1'b1;
			r_hit__46	<= 1'b0;
			r_diff__46 <= 32'b00000000000000000000000000000000;
			r_dl_b__46 <= 32'b00000000000000000000000000000000;
			r_numer__46 <= 0;
			r_z1__46 <= 32'b00000000000000000000000000000000;
			r_z0__46 <= 32'b00000000000000000000000000000000;
			r_mut__46 <= 32'b00000000000000000000000000000000;

			r_x__45	<= 32'b00000000000000000000000000000000;
			r_y__45	<= 32'b00000000000000000000000000000000;
			r_z__45	<= 32'b00000000000000000000000000000000;
			r_ux__45	<= 32'b00000000000000000000000000000000;
			r_uy__45	<= 32'b00000000000000000000000000000000;
			r_uz__45	<= 32'b00000000000000000000000000000000;
			r_sz__45	<= 32'b00000000000000000000000000000000;
			r_sr__45	<= 32'b00000000000000000000000000000000;
			r_sleftz__45	<= 32'b00000000000000000000000000000000;
			r_sleftr__45	<= 32'b00000000000000000000000000000000;
			r_weight__45	<= 32'b00000000000000000000000000000000;
			r_layer__45	<= 3'b000;
			r_dead__45	<= 1'b1;
			r_hit__45	<= 1'b0;
			r_diff__45 <= 32'b00000000000000000000000000000000;
			r_dl_b__45 <= 32'b00000000000000000000000000000000;
			r_numer__45 <= 0;
			r_z1__45 <= 32'b00000000000000000000000000000000;
			r_z0__45 <= 32'b00000000000000000000000000000000;
			r_mut__45 <= 32'b00000000000000000000000000000000;

			r_x__44	<= 32'b00000000000000000000000000000000;
			r_y__44	<= 32'b00000000000000000000000000000000;
			r_z__44	<= 32'b00000000000000000000000000000000;
			r_ux__44	<= 32'b00000000000000000000000000000000;
			r_uy__44	<= 32'b00000000000000000000000000000000;
			r_uz__44	<= 32'b00000000000000000000000000000000;
			r_sz__44	<= 32'b00000000000000000000000000000000;
			r_sr__44	<= 32'b00000000000000000000000000000000;
			r_sleftz__44	<= 32'b00000000000000000000000000000000;
			r_sleftr__44	<= 32'b00000000000000000000000000000000;
			r_weight__44	<= 32'b00000000000000000000000000000000;
			r_layer__44	<= 3'b000;
			r_dead__44	<= 1'b1;
			r_hit__44	<= 1'b0;
			r_diff__44 <= 32'b00000000000000000000000000000000;
			r_dl_b__44 <= 32'b00000000000000000000000000000000;
			r_numer__44 <= 0;
			r_z1__44 <= 32'b00000000000000000000000000000000;
			r_z0__44 <= 32'b00000000000000000000000000000000;
			r_mut__44 <= 32'b00000000000000000000000000000000;

			r_x__43	<= 32'b00000000000000000000000000000000;
			r_y__43	<= 32'b00000000000000000000000000000000;
			r_z__43	<= 32'b00000000000000000000000000000000;
			r_ux__43	<= 32'b00000000000000000000000000000000;
			r_uy__43	<= 32'b00000000000000000000000000000000;
			r_uz__43	<= 32'b00000000000000000000000000000000;
			r_sz__43	<= 32'b00000000000000000000000000000000;
			r_sr__43	<= 32'b00000000000000000000000000000000;
			r_sleftz__43	<= 32'b00000000000000000000000000000000;
			r_sleftr__43	<= 32'b00000000000000000000000000000000;
			r_weight__43	<= 32'b00000000000000000000000000000000;
			r_layer__43	<= 3'b000;
			r_dead__43	<= 1'b1;
			r_hit__43	<= 1'b0;
			r_diff__43 <= 32'b00000000000000000000000000000000;
			r_dl_b__43 <= 32'b00000000000000000000000000000000;
			r_numer__43 <= 0;
			r_z1__43 <= 32'b00000000000000000000000000000000;
			r_z0__43 <= 32'b00000000000000000000000000000000;
			r_mut__43 <= 32'b00000000000000000000000000000000;

			r_x__42	<= 32'b00000000000000000000000000000000;
			r_y__42	<= 32'b00000000000000000000000000000000;
			r_z__42	<= 32'b00000000000000000000000000000000;
			r_ux__42	<= 32'b00000000000000000000000000000000;
			r_uy__42	<= 32'b00000000000000000000000000000000;
			r_uz__42	<= 32'b00000000000000000000000000000000;
			r_sz__42	<= 32'b00000000000000000000000000000000;
			r_sr__42	<= 32'b00000000000000000000000000000000;
			r_sleftz__42	<= 32'b00000000000000000000000000000000;
			r_sleftr__42	<= 32'b00000000000000000000000000000000;
			r_weight__42	<= 32'b00000000000000000000000000000000;
			r_layer__42	<= 3'b000;
			r_dead__42	<= 1'b1;
			r_hit__42	<= 1'b0;
			r_diff__42 <= 32'b00000000000000000000000000000000;
			r_dl_b__42 <= 32'b00000000000000000000000000000000;
			r_numer__42 <= 0;
			r_z1__42 <= 32'b00000000000000000000000000000000;
			r_z0__42 <= 32'b00000000000000000000000000000000;
			r_mut__42 <= 32'b00000000000000000000000000000000;

			r_x__41	<= 32'b00000000000000000000000000000000;
			r_y__41	<= 32'b00000000000000000000000000000000;
			r_z__41	<= 32'b00000000000000000000000000000000;
			r_ux__41	<= 32'b00000000000000000000000000000000;
			r_uy__41	<= 32'b00000000000000000000000000000000;
			r_uz__41	<= 32'b00000000000000000000000000000000;
			r_sz__41	<= 32'b00000000000000000000000000000000;
			r_sr__41	<= 32'b00000000000000000000000000000000;
			r_sleftz__41	<= 32'b00000000000000000000000000000000;
			r_sleftr__41	<= 32'b00000000000000000000000000000000;
			r_weight__41	<= 32'b00000000000000000000000000000000;
			r_layer__41	<= 3'b000;
			r_dead__41	<= 1'b1;
			r_hit__41	<= 1'b0;
			r_diff__41 <= 32'b00000000000000000000000000000000;
			r_dl_b__41 <= 32'b00000000000000000000000000000000;
			r_numer__41 <= 0;
			r_z1__41 <= 32'b00000000000000000000000000000000;
			r_z0__41 <= 32'b00000000000000000000000000000000;
			r_mut__41 <= 32'b00000000000000000000000000000000;

			r_x__40	<= 32'b00000000000000000000000000000000;
			r_y__40	<= 32'b00000000000000000000000000000000;
			r_z__40	<= 32'b00000000000000000000000000000000;
			r_ux__40	<= 32'b00000000000000000000000000000000;
			r_uy__40	<= 32'b00000000000000000000000000000000;
			r_uz__40	<= 32'b00000000000000000000000000000000;
			r_sz__40	<= 32'b00000000000000000000000000000000;
			r_sr__40	<= 32'b00000000000000000000000000000000;
			r_sleftz__40	<= 32'b00000000000000000000000000000000;
			r_sleftr__40	<= 32'b00000000000000000000000000000000;
			r_weight__40	<= 32'b00000000000000000000000000000000;
			r_layer__40	<= 3'b000;
			r_dead__40	<= 1'b1;
			r_hit__40	<= 1'b0;
			r_diff__40 <= 32'b00000000000000000000000000000000;
			r_dl_b__40 <= 32'b00000000000000000000000000000000;
			r_numer__40 <= 0;
			r_z1__40 <= 32'b00000000000000000000000000000000;
			r_z0__40 <= 32'b00000000000000000000000000000000;
			r_mut__40 <= 32'b00000000000000000000000000000000;

			r_x__39	<= 32'b00000000000000000000000000000000;
			r_y__39	<= 32'b00000000000000000000000000000000;
			r_z__39	<= 32'b00000000000000000000000000000000;
			r_ux__39	<= 32'b00000000000000000000000000000000;
			r_uy__39	<= 32'b00000000000000000000000000000000;
			r_uz__39	<= 32'b00000000000000000000000000000000;
			r_sz__39	<= 32'b00000000000000000000000000000000;
			r_sr__39	<= 32'b00000000000000000000000000000000;
			r_sleftz__39	<= 32'b00000000000000000000000000000000;
			r_sleftr__39	<= 32'b00000000000000000000000000000000;
			r_weight__39	<= 32'b00000000000000000000000000000000;
			r_layer__39	<= 3'b000;
			r_dead__39	<= 1'b1;
			r_hit__39	<= 1'b0;
			r_diff__39 <= 32'b00000000000000000000000000000000;
			r_dl_b__39 <= 32'b00000000000000000000000000000000;
			r_numer__39 <= 0;
			r_z1__39 <= 32'b00000000000000000000000000000000;
			r_z0__39 <= 32'b00000000000000000000000000000000;
			r_mut__39 <= 32'b00000000000000000000000000000000;

			r_x__38	<= 32'b00000000000000000000000000000000;
			r_y__38	<= 32'b00000000000000000000000000000000;
			r_z__38	<= 32'b00000000000000000000000000000000;
			r_ux__38	<= 32'b00000000000000000000000000000000;
			r_uy__38	<= 32'b00000000000000000000000000000000;
			r_uz__38	<= 32'b00000000000000000000000000000000;
			r_sz__38	<= 32'b00000000000000000000000000000000;
			r_sr__38	<= 32'b00000000000000000000000000000000;
			r_sleftz__38	<= 32'b00000000000000000000000000000000;
			r_sleftr__38	<= 32'b00000000000000000000000000000000;
			r_weight__38	<= 32'b00000000000000000000000000000000;
			r_layer__38	<= 3'b000;
			r_dead__38	<= 1'b1;
			r_hit__38	<= 1'b0;
			r_diff__38 <= 32'b00000000000000000000000000000000;
			r_dl_b__38 <= 32'b00000000000000000000000000000000;
			r_numer__38 <= 0;
			r_z1__38 <= 32'b00000000000000000000000000000000;
			r_z0__38 <= 32'b00000000000000000000000000000000;
			r_mut__38 <= 32'b00000000000000000000000000000000;

			r_x__37	<= 32'b00000000000000000000000000000000;
			r_y__37	<= 32'b00000000000000000000000000000000;
			r_z__37	<= 32'b00000000000000000000000000000000;
			r_ux__37	<= 32'b00000000000000000000000000000000;
			r_uy__37	<= 32'b00000000000000000000000000000000;
			r_uz__37	<= 32'b00000000000000000000000000000000;
			r_sz__37	<= 32'b00000000000000000000000000000000;
			r_sr__37	<= 32'b00000000000000000000000000000000;
			r_sleftz__37	<= 32'b00000000000000000000000000000000;
			r_sleftr__37	<= 32'b00000000000000000000000000000000;
			r_weight__37	<= 32'b00000000000000000000000000000000;
			r_layer__37	<= 3'b000;
			r_dead__37	<= 1'b1;
			r_hit__37	<= 1'b0;
			r_diff__37 <= 32'b00000000000000000000000000000000;
			r_dl_b__37 <= 32'b00000000000000000000000000000000;
			r_numer__37 <= 0;
			r_z1__37 <= 32'b00000000000000000000000000000000;
			r_z0__37 <= 32'b00000000000000000000000000000000;
			r_mut__37 <= 32'b00000000000000000000000000000000;

			r_x__36	<= 32'b00000000000000000000000000000000;
			r_y__36	<= 32'b00000000000000000000000000000000;
			r_z__36	<= 32'b00000000000000000000000000000000;
			r_ux__36	<= 32'b00000000000000000000000000000000;
			r_uy__36	<= 32'b00000000000000000000000000000000;
			r_uz__36	<= 32'b00000000000000000000000000000000;
			r_sz__36	<= 32'b00000000000000000000000000000000;
			r_sr__36	<= 32'b00000000000000000000000000000000;
			r_sleftz__36	<= 32'b00000000000000000000000000000000;
			r_sleftr__36	<= 32'b00000000000000000000000000000000;
			r_weight__36	<= 32'b00000000000000000000000000000000;
			r_layer__36	<= 3'b000;
			r_dead__36	<= 1'b1;
			r_hit__36	<= 1'b0;
			r_diff__36 <= 32'b00000000000000000000000000000000;
			r_dl_b__36 <= 32'b00000000000000000000000000000000;
			r_numer__36 <= 0;
			r_z1__36 <= 32'b00000000000000000000000000000000;
			r_z0__36 <= 32'b00000000000000000000000000000000;
			r_mut__36 <= 32'b00000000000000000000000000000000;

			r_x__35	<= 32'b00000000000000000000000000000000;
			r_y__35	<= 32'b00000000000000000000000000000000;
			r_z__35	<= 32'b00000000000000000000000000000000;
			r_ux__35	<= 32'b00000000000000000000000000000000;
			r_uy__35	<= 32'b00000000000000000000000000000000;
			r_uz__35	<= 32'b00000000000000000000000000000000;
			r_sz__35	<= 32'b00000000000000000000000000000000;
			r_sr__35	<= 32'b00000000000000000000000000000000;
			r_sleftz__35	<= 32'b00000000000000000000000000000000;
			r_sleftr__35	<= 32'b00000000000000000000000000000000;
			r_weight__35	<= 32'b00000000000000000000000000000000;
			r_layer__35	<= 3'b000;
			r_dead__35	<= 1'b1;
			r_hit__35	<= 1'b0;
			r_diff__35 <= 32'b00000000000000000000000000000000;
			r_dl_b__35 <= 32'b00000000000000000000000000000000;
			r_numer__35 <= 0;
			r_z1__35 <= 32'b00000000000000000000000000000000;
			r_z0__35 <= 32'b00000000000000000000000000000000;
			r_mut__35 <= 32'b00000000000000000000000000000000;

			r_x__34	<= 32'b00000000000000000000000000000000;
			r_y__34	<= 32'b00000000000000000000000000000000;
			r_z__34	<= 32'b00000000000000000000000000000000;
			r_ux__34	<= 32'b00000000000000000000000000000000;
			r_uy__34	<= 32'b00000000000000000000000000000000;
			r_uz__34	<= 32'b00000000000000000000000000000000;
			r_sz__34	<= 32'b00000000000000000000000000000000;
			r_sr__34	<= 32'b00000000000000000000000000000000;
			r_sleftz__34	<= 32'b00000000000000000000000000000000;
			r_sleftr__34	<= 32'b00000000000000000000000000000000;
			r_weight__34	<= 32'b00000000000000000000000000000000;
			r_layer__34	<= 3'b000;
			r_dead__34	<= 1'b1;
			r_hit__34	<= 1'b0;
			r_diff__34 <= 32'b00000000000000000000000000000000;
			r_dl_b__34 <= 32'b00000000000000000000000000000000;
			r_numer__34 <= 0;
			r_z1__34 <= 32'b00000000000000000000000000000000;
			r_z0__34 <= 32'b00000000000000000000000000000000;
			r_mut__34 <= 32'b00000000000000000000000000000000;

			r_x__33	<= 32'b00000000000000000000000000000000;
			r_y__33	<= 32'b00000000000000000000000000000000;
			r_z__33	<= 32'b00000000000000000000000000000000;
			r_ux__33	<= 32'b00000000000000000000000000000000;
			r_uy__33	<= 32'b00000000000000000000000000000000;
			r_uz__33	<= 32'b00000000000000000000000000000000;
			r_sz__33	<= 32'b00000000000000000000000000000000;
			r_sr__33	<= 32'b00000000000000000000000000000000;
			r_sleftz__33	<= 32'b00000000000000000000000000000000;
			r_sleftr__33	<= 32'b00000000000000000000000000000000;
			r_weight__33	<= 32'b00000000000000000000000000000000;
			r_layer__33	<= 3'b000;
			r_dead__33	<= 1'b1;
			r_hit__33	<= 1'b0;
			r_diff__33 <= 32'b00000000000000000000000000000000;
			r_dl_b__33 <= 32'b00000000000000000000000000000000;
			r_numer__33 <= 0;
			r_z1__33 <= 32'b00000000000000000000000000000000;
			r_z0__33 <= 32'b00000000000000000000000000000000;
			r_mut__33 <= 32'b00000000000000000000000000000000;

			r_x__32	<= 32'b00000000000000000000000000000000;
			r_y__32	<= 32'b00000000000000000000000000000000;
			r_z__32	<= 32'b00000000000000000000000000000000;
			r_ux__32	<= 32'b00000000000000000000000000000000;
			r_uy__32	<= 32'b00000000000000000000000000000000;
			r_uz__32	<= 32'b00000000000000000000000000000000;
			r_sz__32	<= 32'b00000000000000000000000000000000;
			r_sr__32	<= 32'b00000000000000000000000000000000;
			r_sleftz__32	<= 32'b00000000000000000000000000000000;
			r_sleftr__32	<= 32'b00000000000000000000000000000000;
			r_weight__32	<= 32'b00000000000000000000000000000000;
			r_layer__32	<= 3'b000;
			r_dead__32	<= 1'b1;
			r_hit__32	<= 1'b0;
			r_diff__32 <= 32'b00000000000000000000000000000000;
			r_dl_b__32 <= 32'b00000000000000000000000000000000;
			r_numer__32 <= 0;
			r_z1__32 <= 32'b00000000000000000000000000000000;
			r_z0__32 <= 32'b00000000000000000000000000000000;
			r_mut__32 <= 32'b00000000000000000000000000000000;

			r_x__31	<= 32'b00000000000000000000000000000000;
			r_y__31	<= 32'b00000000000000000000000000000000;
			r_z__31	<= 32'b00000000000000000000000000000000;
			r_ux__31	<= 32'b00000000000000000000000000000000;
			r_uy__31	<= 32'b00000000000000000000000000000000;
			r_uz__31	<= 32'b00000000000000000000000000000000;
			r_sz__31	<= 32'b00000000000000000000000000000000;
			r_sr__31	<= 32'b00000000000000000000000000000000;
			r_sleftz__31	<= 32'b00000000000000000000000000000000;
			r_sleftr__31	<= 32'b00000000000000000000000000000000;
			r_weight__31	<= 32'b00000000000000000000000000000000;
			r_layer__31	<= 3'b000;
			r_dead__31	<= 1'b1;
			r_hit__31	<= 1'b0;
			r_diff__31 <= 32'b00000000000000000000000000000000;
			r_dl_b__31 <= 32'b00000000000000000000000000000000;
			r_numer__31 <= 0;
			r_z1__31 <= 32'b00000000000000000000000000000000;
			r_z0__31 <= 32'b00000000000000000000000000000000;
			r_mut__31 <= 32'b00000000000000000000000000000000;

			r_x__30	<= 32'b00000000000000000000000000000000;
			r_y__30	<= 32'b00000000000000000000000000000000;
			r_z__30	<= 32'b00000000000000000000000000000000;
			r_ux__30	<= 32'b00000000000000000000000000000000;
			r_uy__30	<= 32'b00000000000000000000000000000000;
			r_uz__30	<= 32'b00000000000000000000000000000000;
			r_sz__30	<= 32'b00000000000000000000000000000000;
			r_sr__30	<= 32'b00000000000000000000000000000000;
			r_sleftz__30	<= 32'b00000000000000000000000000000000;
			r_sleftr__30	<= 32'b00000000000000000000000000000000;
			r_weight__30	<= 32'b00000000000000000000000000000000;
			r_layer__30	<= 3'b000;
			r_dead__30	<= 1'b1;
			r_hit__30	<= 1'b0;
			r_diff__30 <= 32'b00000000000000000000000000000000;
			r_dl_b__30 <= 32'b00000000000000000000000000000000;
			r_numer__30 <= 0;
			r_z1__30 <= 32'b00000000000000000000000000000000;
			r_z0__30 <= 32'b00000000000000000000000000000000;
			r_mut__30 <= 32'b00000000000000000000000000000000;

			r_x__29	<= 32'b00000000000000000000000000000000;
			r_y__29	<= 32'b00000000000000000000000000000000;
			r_z__29	<= 32'b00000000000000000000000000000000;
			r_ux__29	<= 32'b00000000000000000000000000000000;
			r_uy__29	<= 32'b00000000000000000000000000000000;
			r_uz__29	<= 32'b00000000000000000000000000000000;
			r_sz__29	<= 32'b00000000000000000000000000000000;
			r_sr__29	<= 32'b00000000000000000000000000000000;
			r_sleftz__29	<= 32'b00000000000000000000000000000000;
			r_sleftr__29	<= 32'b00000000000000000000000000000000;
			r_weight__29	<= 32'b00000000000000000000000000000000;
			r_layer__29	<= 3'b000;
			r_dead__29	<= 1'b1;
			r_hit__29	<= 1'b0;
			r_diff__29 <= 32'b00000000000000000000000000000000;
			r_dl_b__29 <= 32'b00000000000000000000000000000000;
			r_numer__29 <= 0;
			r_z1__29 <= 32'b00000000000000000000000000000000;
			r_z0__29 <= 32'b00000000000000000000000000000000;
			r_mut__29 <= 32'b00000000000000000000000000000000;

			r_x__28	<= 32'b00000000000000000000000000000000;
			r_y__28	<= 32'b00000000000000000000000000000000;
			r_z__28	<= 32'b00000000000000000000000000000000;
			r_ux__28	<= 32'b00000000000000000000000000000000;
			r_uy__28	<= 32'b00000000000000000000000000000000;
			r_uz__28	<= 32'b00000000000000000000000000000000;
			r_sz__28	<= 32'b00000000000000000000000000000000;
			r_sr__28	<= 32'b00000000000000000000000000000000;
			r_sleftz__28	<= 32'b00000000000000000000000000000000;
			r_sleftr__28	<= 32'b00000000000000000000000000000000;
			r_weight__28	<= 32'b00000000000000000000000000000000;
			r_layer__28	<= 3'b000;
			r_dead__28	<= 1'b1;
			r_hit__28	<= 1'b0;
			r_diff__28 <= 32'b00000000000000000000000000000000;
			r_dl_b__28 <= 32'b00000000000000000000000000000000;
			r_numer__28 <= 0;
			r_z1__28 <= 32'b00000000000000000000000000000000;
			r_z0__28 <= 32'b00000000000000000000000000000000;
			r_mut__28 <= 32'b00000000000000000000000000000000;

			r_x__27	<= 32'b00000000000000000000000000000000;
			r_y__27	<= 32'b00000000000000000000000000000000;
			r_z__27	<= 32'b00000000000000000000000000000000;
			r_ux__27	<= 32'b00000000000000000000000000000000;
			r_uy__27	<= 32'b00000000000000000000000000000000;
			r_uz__27	<= 32'b00000000000000000000000000000000;
			r_sz__27	<= 32'b00000000000000000000000000000000;
			r_sr__27	<= 32'b00000000000000000000000000000000;
			r_sleftz__27	<= 32'b00000000000000000000000000000000;
			r_sleftr__27	<= 32'b00000000000000000000000000000000;
			r_weight__27	<= 32'b00000000000000000000000000000000;
			r_layer__27	<= 3'b000;
			r_dead__27	<= 1'b1;
			r_hit__27	<= 1'b0;
			r_diff__27 <= 32'b00000000000000000000000000000000;
			r_dl_b__27 <= 32'b00000000000000000000000000000000;
			r_numer__27 <= 0;
			r_z1__27 <= 32'b00000000000000000000000000000000;
			r_z0__27 <= 32'b00000000000000000000000000000000;
			r_mut__27 <= 32'b00000000000000000000000000000000;

			r_x__26	<= 32'b00000000000000000000000000000000;
			r_y__26	<= 32'b00000000000000000000000000000000;
			r_z__26	<= 32'b00000000000000000000000000000000;
			r_ux__26	<= 32'b00000000000000000000000000000000;
			r_uy__26	<= 32'b00000000000000000000000000000000;
			r_uz__26	<= 32'b00000000000000000000000000000000;
			r_sz__26	<= 32'b00000000000000000000000000000000;
			r_sr__26	<= 32'b00000000000000000000000000000000;
			r_sleftz__26	<= 32'b00000000000000000000000000000000;
			r_sleftr__26	<= 32'b00000000000000000000000000000000;
			r_weight__26	<= 32'b00000000000000000000000000000000;
			r_layer__26	<= 3'b000;
			r_dead__26	<= 1'b1;
			r_hit__26	<= 1'b0;
			r_diff__26 <= 32'b00000000000000000000000000000000;
			r_dl_b__26 <= 32'b00000000000000000000000000000000;
			r_numer__26 <= 0;
			r_z1__26 <= 32'b00000000000000000000000000000000;
			r_z0__26 <= 32'b00000000000000000000000000000000;
			r_mut__26 <= 32'b00000000000000000000000000000000;

			r_x__25	<= 32'b00000000000000000000000000000000;
			r_y__25	<= 32'b00000000000000000000000000000000;
			r_z__25	<= 32'b00000000000000000000000000000000;
			r_ux__25	<= 32'b00000000000000000000000000000000;
			r_uy__25	<= 32'b00000000000000000000000000000000;
			r_uz__25	<= 32'b00000000000000000000000000000000;
			r_sz__25	<= 32'b00000000000000000000000000000000;
			r_sr__25	<= 32'b00000000000000000000000000000000;
			r_sleftz__25	<= 32'b00000000000000000000000000000000;
			r_sleftr__25	<= 32'b00000000000000000000000000000000;
			r_weight__25	<= 32'b00000000000000000000000000000000;
			r_layer__25	<= 3'b000;
			r_dead__25	<= 1'b1;
			r_hit__25	<= 1'b0;
			r_diff__25 <= 32'b00000000000000000000000000000000;
			r_dl_b__25 <= 32'b00000000000000000000000000000000;
			r_numer__25 <= 0;
			r_z1__25 <= 32'b00000000000000000000000000000000;
			r_z0__25 <= 32'b00000000000000000000000000000000;
			r_mut__25 <= 32'b00000000000000000000000000000000;

			r_x__24	<= 32'b00000000000000000000000000000000;
			r_y__24	<= 32'b00000000000000000000000000000000;
			r_z__24	<= 32'b00000000000000000000000000000000;
			r_ux__24	<= 32'b00000000000000000000000000000000;
			r_uy__24	<= 32'b00000000000000000000000000000000;
			r_uz__24	<= 32'b00000000000000000000000000000000;
			r_sz__24	<= 32'b00000000000000000000000000000000;
			r_sr__24	<= 32'b00000000000000000000000000000000;
			r_sleftz__24	<= 32'b00000000000000000000000000000000;
			r_sleftr__24	<= 32'b00000000000000000000000000000000;
			r_weight__24	<= 32'b00000000000000000000000000000000;
			r_layer__24	<= 3'b000;
			r_dead__24	<= 1'b1;
			r_hit__24	<= 1'b0;
			r_diff__24 <= 32'b00000000000000000000000000000000;
			r_dl_b__24 <= 32'b00000000000000000000000000000000;
			r_numer__24 <= 0;
			r_z1__24 <= 32'b00000000000000000000000000000000;
			r_z0__24 <= 32'b00000000000000000000000000000000;
			r_mut__24 <= 32'b00000000000000000000000000000000;

			r_x__23	<= 32'b00000000000000000000000000000000;
			r_y__23	<= 32'b00000000000000000000000000000000;
			r_z__23	<= 32'b00000000000000000000000000000000;
			r_ux__23	<= 32'b00000000000000000000000000000000;
			r_uy__23	<= 32'b00000000000000000000000000000000;
			r_uz__23	<= 32'b00000000000000000000000000000000;
			r_sz__23	<= 32'b00000000000000000000000000000000;
			r_sr__23	<= 32'b00000000000000000000000000000000;
			r_sleftz__23	<= 32'b00000000000000000000000000000000;
			r_sleftr__23	<= 32'b00000000000000000000000000000000;
			r_weight__23	<= 32'b00000000000000000000000000000000;
			r_layer__23	<= 3'b000;
			r_dead__23	<= 1'b1;
			r_hit__23	<= 1'b0;
			r_diff__23 <= 32'b00000000000000000000000000000000;
			r_dl_b__23 <= 32'b00000000000000000000000000000000;
			r_numer__23 <= 0;
			r_z1__23 <= 32'b00000000000000000000000000000000;
			r_z0__23 <= 32'b00000000000000000000000000000000;
			r_mut__23 <= 32'b00000000000000000000000000000000;

			r_x__22	<= 32'b00000000000000000000000000000000;
			r_y__22	<= 32'b00000000000000000000000000000000;
			r_z__22	<= 32'b00000000000000000000000000000000;
			r_ux__22	<= 32'b00000000000000000000000000000000;
			r_uy__22	<= 32'b00000000000000000000000000000000;
			r_uz__22	<= 32'b00000000000000000000000000000000;
			r_sz__22	<= 32'b00000000000000000000000000000000;
			r_sr__22	<= 32'b00000000000000000000000000000000;
			r_sleftz__22	<= 32'b00000000000000000000000000000000;
			r_sleftr__22	<= 32'b00000000000000000000000000000000;
			r_weight__22	<= 32'b00000000000000000000000000000000;
			r_layer__22	<= 3'b000;
			r_dead__22	<= 1'b1;
			r_hit__22	<= 1'b0;
			r_diff__22 <= 32'b00000000000000000000000000000000;
			r_dl_b__22 <= 32'b00000000000000000000000000000000;
			r_numer__22 <= 0;
			r_z1__22 <= 32'b00000000000000000000000000000000;
			r_z0__22 <= 32'b00000000000000000000000000000000;
			r_mut__22 <= 32'b00000000000000000000000000000000;

			r_x__21	<= 32'b00000000000000000000000000000000;
			r_y__21	<= 32'b00000000000000000000000000000000;
			r_z__21	<= 32'b00000000000000000000000000000000;
			r_ux__21	<= 32'b00000000000000000000000000000000;
			r_uy__21	<= 32'b00000000000000000000000000000000;
			r_uz__21	<= 32'b00000000000000000000000000000000;
			r_sz__21	<= 32'b00000000000000000000000000000000;
			r_sr__21	<= 32'b00000000000000000000000000000000;
			r_sleftz__21	<= 32'b00000000000000000000000000000000;
			r_sleftr__21	<= 32'b00000000000000000000000000000000;
			r_weight__21	<= 32'b00000000000000000000000000000000;
			r_layer__21	<= 3'b000;
			r_dead__21	<= 1'b1;
			r_hit__21	<= 1'b0;
			r_diff__21 <= 32'b00000000000000000000000000000000;
			r_dl_b__21 <= 32'b00000000000000000000000000000000;
			r_numer__21 <= 0;
			r_z1__21 <= 32'b00000000000000000000000000000000;
			r_z0__21 <= 32'b00000000000000000000000000000000;
			r_mut__21 <= 32'b00000000000000000000000000000000;

			r_x__20	<= 32'b00000000000000000000000000000000;
			r_y__20	<= 32'b00000000000000000000000000000000;
			r_z__20	<= 32'b00000000000000000000000000000000;
			r_ux__20	<= 32'b00000000000000000000000000000000;
			r_uy__20	<= 32'b00000000000000000000000000000000;
			r_uz__20	<= 32'b00000000000000000000000000000000;
			r_sz__20	<= 32'b00000000000000000000000000000000;
			r_sr__20	<= 32'b00000000000000000000000000000000;
			r_sleftz__20	<= 32'b00000000000000000000000000000000;
			r_sleftr__20	<= 32'b00000000000000000000000000000000;
			r_weight__20	<= 32'b00000000000000000000000000000000;
			r_layer__20	<= 3'b000;
			r_dead__20	<= 1'b1;
			r_hit__20	<= 1'b0;
			r_diff__20 <= 32'b00000000000000000000000000000000;
			r_dl_b__20 <= 32'b00000000000000000000000000000000;
			r_numer__20 <= 0;
			r_z1__20 <= 32'b00000000000000000000000000000000;
			r_z0__20 <= 32'b00000000000000000000000000000000;
			r_mut__20 <= 32'b00000000000000000000000000000000;

			r_x__19	<= 32'b00000000000000000000000000000000;
			r_y__19	<= 32'b00000000000000000000000000000000;
			r_z__19	<= 32'b00000000000000000000000000000000;
			r_ux__19	<= 32'b00000000000000000000000000000000;
			r_uy__19	<= 32'b00000000000000000000000000000000;
			r_uz__19	<= 32'b00000000000000000000000000000000;
			r_sz__19	<= 32'b00000000000000000000000000000000;
			r_sr__19	<= 32'b00000000000000000000000000000000;
			r_sleftz__19	<= 32'b00000000000000000000000000000000;
			r_sleftr__19	<= 32'b00000000000000000000000000000000;
			r_weight__19	<= 32'b00000000000000000000000000000000;
			r_layer__19	<= 3'b000;
			r_dead__19	<= 1'b1;
			r_hit__19	<= 1'b0;
			r_diff__19 <= 32'b00000000000000000000000000000000;
			r_dl_b__19 <= 32'b00000000000000000000000000000000;
			r_numer__19 <= 0;
			r_z1__19 <= 32'b00000000000000000000000000000000;
			r_z0__19 <= 32'b00000000000000000000000000000000;
			r_mut__19 <= 32'b00000000000000000000000000000000;

			r_x__18	<= 32'b00000000000000000000000000000000;
			r_y__18	<= 32'b00000000000000000000000000000000;
			r_z__18	<= 32'b00000000000000000000000000000000;
			r_ux__18	<= 32'b00000000000000000000000000000000;
			r_uy__18	<= 32'b00000000000000000000000000000000;
			r_uz__18	<= 32'b00000000000000000000000000000000;
			r_sz__18	<= 32'b00000000000000000000000000000000;
			r_sr__18	<= 32'b00000000000000000000000000000000;
			r_sleftz__18	<= 32'b00000000000000000000000000000000;
			r_sleftr__18	<= 32'b00000000000000000000000000000000;
			r_weight__18	<= 32'b00000000000000000000000000000000;
			r_layer__18	<= 3'b000;
			r_dead__18	<= 1'b1;
			r_hit__18	<= 1'b0;
			r_diff__18 <= 32'b00000000000000000000000000000000;
			r_dl_b__18 <= 32'b00000000000000000000000000000000;
			r_numer__18 <= 0;
			r_z1__18 <= 32'b00000000000000000000000000000000;
			r_z0__18 <= 32'b00000000000000000000000000000000;
			r_mut__18 <= 32'b00000000000000000000000000000000;

			r_x__17	<= 32'b00000000000000000000000000000000;
			r_y__17	<= 32'b00000000000000000000000000000000;
			r_z__17	<= 32'b00000000000000000000000000000000;
			r_ux__17	<= 32'b00000000000000000000000000000000;
			r_uy__17	<= 32'b00000000000000000000000000000000;
			r_uz__17	<= 32'b00000000000000000000000000000000;
			r_sz__17	<= 32'b00000000000000000000000000000000;
			r_sr__17	<= 32'b00000000000000000000000000000000;
			r_sleftz__17	<= 32'b00000000000000000000000000000000;
			r_sleftr__17	<= 32'b00000000000000000000000000000000;
			r_weight__17	<= 32'b00000000000000000000000000000000;
			r_layer__17	<= 3'b000;
			r_dead__17	<= 1'b1;
			r_hit__17	<= 1'b0;
			r_diff__17 <= 32'b00000000000000000000000000000000;
			r_dl_b__17 <= 32'b00000000000000000000000000000000;
			r_numer__17 <= 0;
			r_z1__17 <= 32'b00000000000000000000000000000000;
			r_z0__17 <= 32'b00000000000000000000000000000000;
			r_mut__17 <= 32'b00000000000000000000000000000000;

			r_x__16	<= 32'b00000000000000000000000000000000;
			r_y__16	<= 32'b00000000000000000000000000000000;
			r_z__16	<= 32'b00000000000000000000000000000000;
			r_ux__16	<= 32'b00000000000000000000000000000000;
			r_uy__16	<= 32'b00000000000000000000000000000000;
			r_uz__16	<= 32'b00000000000000000000000000000000;
			r_sz__16	<= 32'b00000000000000000000000000000000;
			r_sr__16	<= 32'b00000000000000000000000000000000;
			r_sleftz__16	<= 32'b00000000000000000000000000000000;
			r_sleftr__16	<= 32'b00000000000000000000000000000000;
			r_weight__16	<= 32'b00000000000000000000000000000000;
			r_layer__16	<= 3'b000;
			r_dead__16	<= 1'b1;
			r_hit__16	<= 1'b0;
			r_diff__16 <= 32'b00000000000000000000000000000000;
			r_dl_b__16 <= 32'b00000000000000000000000000000000;
			r_numer__16 <= 0;
			r_z1__16 <= 32'b00000000000000000000000000000000;
			r_z0__16 <= 32'b00000000000000000000000000000000;
			r_mut__16 <= 32'b00000000000000000000000000000000;

			r_x__15	<= 32'b00000000000000000000000000000000;
			r_y__15	<= 32'b00000000000000000000000000000000;
			r_z__15	<= 32'b00000000000000000000000000000000;
			r_ux__15	<= 32'b00000000000000000000000000000000;
			r_uy__15	<= 32'b00000000000000000000000000000000;
			r_uz__15	<= 32'b00000000000000000000000000000000;
			r_sz__15	<= 32'b00000000000000000000000000000000;
			r_sr__15	<= 32'b00000000000000000000000000000000;
			r_sleftz__15	<= 32'b00000000000000000000000000000000;
			r_sleftr__15	<= 32'b00000000000000000000000000000000;
			r_weight__15	<= 32'b00000000000000000000000000000000;
			r_layer__15	<= 3'b000;
			r_dead__15	<= 1'b1;
			r_hit__15	<= 1'b0;
			r_diff__15 <= 32'b00000000000000000000000000000000;
			r_dl_b__15 <= 32'b00000000000000000000000000000000;
			r_numer__15 <= 0;
			r_z1__15 <= 32'b00000000000000000000000000000000;
			r_z0__15 <= 32'b00000000000000000000000000000000;
			r_mut__15 <= 32'b00000000000000000000000000000000;

			r_x__14	<= 32'b00000000000000000000000000000000;
			r_y__14	<= 32'b00000000000000000000000000000000;
			r_z__14	<= 32'b00000000000000000000000000000000;
			r_ux__14	<= 32'b00000000000000000000000000000000;
			r_uy__14	<= 32'b00000000000000000000000000000000;
			r_uz__14	<= 32'b00000000000000000000000000000000;
			r_sz__14	<= 32'b00000000000000000000000000000000;
			r_sr__14	<= 32'b00000000000000000000000000000000;
			r_sleftz__14	<= 32'b00000000000000000000000000000000;
			r_sleftr__14	<= 32'b00000000000000000000000000000000;
			r_weight__14	<= 32'b00000000000000000000000000000000;
			r_layer__14	<= 3'b000;
			r_dead__14	<= 1'b1;
			r_hit__14	<= 1'b0;
			r_diff__14 <= 32'b00000000000000000000000000000000;
			r_dl_b__14 <= 32'b00000000000000000000000000000000;
			r_numer__14 <= 0;
			r_z1__14 <= 32'b00000000000000000000000000000000;
			r_z0__14 <= 32'b00000000000000000000000000000000;
			r_mut__14 <= 32'b00000000000000000000000000000000;

			r_x__13	<= 32'b00000000000000000000000000000000;
			r_y__13	<= 32'b00000000000000000000000000000000;
			r_z__13	<= 32'b00000000000000000000000000000000;
			r_ux__13	<= 32'b00000000000000000000000000000000;
			r_uy__13	<= 32'b00000000000000000000000000000000;
			r_uz__13	<= 32'b00000000000000000000000000000000;
			r_sz__13	<= 32'b00000000000000000000000000000000;
			r_sr__13	<= 32'b00000000000000000000000000000000;
			r_sleftz__13	<= 32'b00000000000000000000000000000000;
			r_sleftr__13	<= 32'b00000000000000000000000000000000;
			r_weight__13	<= 32'b00000000000000000000000000000000;
			r_layer__13	<= 3'b000;
			r_dead__13	<= 1'b1;
			r_hit__13	<= 1'b0;
			r_diff__13 <= 32'b00000000000000000000000000000000;
			r_dl_b__13 <= 32'b00000000000000000000000000000000;
			r_numer__13 <= 0;
			r_z1__13 <= 32'b00000000000000000000000000000000;
			r_z0__13 <= 32'b00000000000000000000000000000000;
			r_mut__13 <= 32'b00000000000000000000000000000000;

			r_x__12	<= 32'b00000000000000000000000000000000;
			r_y__12	<= 32'b00000000000000000000000000000000;
			r_z__12	<= 32'b00000000000000000000000000000000;
			r_ux__12	<= 32'b00000000000000000000000000000000;
			r_uy__12	<= 32'b00000000000000000000000000000000;
			r_uz__12	<= 32'b00000000000000000000000000000000;
			r_sz__12	<= 32'b00000000000000000000000000000000;
			r_sr__12	<= 32'b00000000000000000000000000000000;
			r_sleftz__12	<= 32'b00000000000000000000000000000000;
			r_sleftr__12	<= 32'b00000000000000000000000000000000;
			r_weight__12	<= 32'b00000000000000000000000000000000;
			r_layer__12	<= 3'b000;
			r_dead__12	<= 1'b1;
			r_hit__12	<= 1'b0;
			r_diff__12 <= 32'b00000000000000000000000000000000;
			r_dl_b__12 <= 32'b00000000000000000000000000000000;
			r_numer__12 <= 0;
			r_z1__12 <= 32'b00000000000000000000000000000000;
			r_z0__12 <= 32'b00000000000000000000000000000000;
			r_mut__12 <= 32'b00000000000000000000000000000000;

			r_x__11	<= 32'b00000000000000000000000000000000;
			r_y__11	<= 32'b00000000000000000000000000000000;
			r_z__11	<= 32'b00000000000000000000000000000000;
			r_ux__11	<= 32'b00000000000000000000000000000000;
			r_uy__11	<= 32'b00000000000000000000000000000000;
			r_uz__11	<= 32'b00000000000000000000000000000000;
			r_sz__11	<= 32'b00000000000000000000000000000000;
			r_sr__11	<= 32'b00000000000000000000000000000000;
			r_sleftz__11	<= 32'b00000000000000000000000000000000;
			r_sleftr__11	<= 32'b00000000000000000000000000000000;
			r_weight__11	<= 32'b00000000000000000000000000000000;
			r_layer__11	<= 3'b000;
			r_dead__11	<= 1'b1;
			r_hit__11	<= 1'b0;
			r_diff__11 <= 32'b00000000000000000000000000000000;
			r_dl_b__11 <= 32'b00000000000000000000000000000000;
			r_numer__11 <= 0;
			r_z1__11 <= 32'b00000000000000000000000000000000;
			r_z0__11 <= 32'b00000000000000000000000000000000;
			r_mut__11 <= 32'b00000000000000000000000000000000;

			r_x__10	<= 32'b00000000000000000000000000000000;
			r_y__10	<= 32'b00000000000000000000000000000000;
			r_z__10	<= 32'b00000000000000000000000000000000;
			r_ux__10	<= 32'b00000000000000000000000000000000;
			r_uy__10	<= 32'b00000000000000000000000000000000;
			r_uz__10	<= 32'b00000000000000000000000000000000;
			r_sz__10	<= 32'b00000000000000000000000000000000;
			r_sr__10	<= 32'b00000000000000000000000000000000;
			r_sleftz__10	<= 32'b00000000000000000000000000000000;
			r_sleftr__10	<= 32'b00000000000000000000000000000000;
			r_weight__10	<= 32'b00000000000000000000000000000000;
			r_layer__10	<= 3'b000;
			r_dead__10	<= 1'b1;
			r_hit__10	<= 1'b0;
			r_diff__10 <= 32'b00000000000000000000000000000000;
			r_dl_b__10 <= 32'b00000000000000000000000000000000;
			r_numer__10 <= 0;
			r_z1__10 <= 32'b00000000000000000000000000000000;
			r_z0__10 <= 32'b00000000000000000000000000000000;
			r_mut__10 <= 32'b00000000000000000000000000000000;

			r_x__9	<= 32'b00000000000000000000000000000000;
			r_y__9	<= 32'b00000000000000000000000000000000;
			r_z__9	<= 32'b00000000000000000000000000000000;
			r_ux__9	<= 32'b00000000000000000000000000000000;
			r_uy__9	<= 32'b00000000000000000000000000000000;
			r_uz__9	<= 32'b00000000000000000000000000000000;
			r_sz__9	<= 32'b00000000000000000000000000000000;
			r_sr__9	<= 32'b00000000000000000000000000000000;
			r_sleftz__9	<= 32'b00000000000000000000000000000000;
			r_sleftr__9	<= 32'b00000000000000000000000000000000;
			r_weight__9	<= 32'b00000000000000000000000000000000;
			r_layer__9	<= 3'b000;
			r_dead__9	<= 1'b1;
			r_hit__9	<= 1'b0;
			r_diff__9 <= 32'b00000000000000000000000000000000;
			r_dl_b__9 <= 32'b00000000000000000000000000000000;
			r_numer__9 <= 0;
			r_z1__9 <= 32'b00000000000000000000000000000000;
			r_z0__9 <= 32'b00000000000000000000000000000000;
			r_mut__9 <= 32'b00000000000000000000000000000000;

			r_x__8	<= 32'b00000000000000000000000000000000;
			r_y__8	<= 32'b00000000000000000000000000000000;
			r_z__8	<= 32'b00000000000000000000000000000000;
			r_ux__8	<= 32'b00000000000000000000000000000000;
			r_uy__8	<= 32'b00000000000000000000000000000000;
			r_uz__8	<= 32'b00000000000000000000000000000000;
			r_sz__8	<= 32'b00000000000000000000000000000000;
			r_sr__8	<= 32'b00000000000000000000000000000000;
			r_sleftz__8	<= 32'b00000000000000000000000000000000;
			r_sleftr__8	<= 32'b00000000000000000000000000000000;
			r_weight__8	<= 32'b00000000000000000000000000000000;
			r_layer__8	<= 3'b000;
			r_dead__8	<= 1'b1;
			r_hit__8	<= 1'b0;
			r_diff__8 <= 32'b00000000000000000000000000000000;
			r_dl_b__8 <= 32'b00000000000000000000000000000000;
			r_numer__8 <= 0;
			r_z1__8 <= 32'b00000000000000000000000000000000;
			r_z0__8 <= 32'b00000000000000000000000000000000;
			r_mut__8 <= 32'b00000000000000000000000000000000;

			r_x__7	<= 32'b00000000000000000000000000000000;
			r_y__7	<= 32'b00000000000000000000000000000000;
			r_z__7	<= 32'b00000000000000000000000000000000;
			r_ux__7	<= 32'b00000000000000000000000000000000;
			r_uy__7	<= 32'b00000000000000000000000000000000;
			r_uz__7	<= 32'b00000000000000000000000000000000;
			r_sz__7	<= 32'b00000000000000000000000000000000;
			r_sr__7	<= 32'b00000000000000000000000000000000;
			r_sleftz__7	<= 32'b00000000000000000000000000000000;
			r_sleftr__7	<= 32'b00000000000000000000000000000000;
			r_weight__7	<= 32'b00000000000000000000000000000000;
			r_layer__7	<= 3'b000;
			r_dead__7	<= 1'b1;
			r_hit__7	<= 1'b0;
			r_diff__7 <= 32'b00000000000000000000000000000000;
			r_dl_b__7 <= 32'b00000000000000000000000000000000;
			r_numer__7 <= 0;
			r_z1__7 <= 32'b00000000000000000000000000000000;
			r_z0__7 <= 32'b00000000000000000000000000000000;
			r_mut__7 <= 32'b00000000000000000000000000000000;

			r_x__6	<= 32'b00000000000000000000000000000000;
			r_y__6	<= 32'b00000000000000000000000000000000;
			r_z__6	<= 32'b00000000000000000000000000000000;
			r_ux__6	<= 32'b00000000000000000000000000000000;
			r_uy__6	<= 32'b00000000000000000000000000000000;
			r_uz__6	<= 32'b00000000000000000000000000000000;
			r_sz__6	<= 32'b00000000000000000000000000000000;
			r_sr__6	<= 32'b00000000000000000000000000000000;
			r_sleftz__6	<= 32'b00000000000000000000000000000000;
			r_sleftr__6	<= 32'b00000000000000000000000000000000;
			r_weight__6	<= 32'b00000000000000000000000000000000;
			r_layer__6	<= 3'b000;
			r_dead__6	<= 1'b1;
			r_hit__6	<= 1'b0;
			r_diff__6 <= 32'b00000000000000000000000000000000;
			r_dl_b__6 <= 32'b00000000000000000000000000000000;
			r_numer__6 <= 0;
			r_z1__6 <= 32'b00000000000000000000000000000000;
			r_z0__6 <= 32'b00000000000000000000000000000000;
			r_mut__6 <= 32'b00000000000000000000000000000000;

			r_x__5	<= 32'b00000000000000000000000000000000;
			r_y__5	<= 32'b00000000000000000000000000000000;
			r_z__5	<= 32'b00000000000000000000000000000000;
			r_ux__5	<= 32'b00000000000000000000000000000000;
			r_uy__5	<= 32'b00000000000000000000000000000000;
			r_uz__5	<= 32'b00000000000000000000000000000000;
			r_sz__5	<= 32'b00000000000000000000000000000000;
			r_sr__5	<= 32'b00000000000000000000000000000000;
			r_sleftz__5	<= 32'b00000000000000000000000000000000;
			r_sleftr__5	<= 32'b00000000000000000000000000000000;
			r_weight__5	<= 32'b00000000000000000000000000000000;
			r_layer__5	<= 3'b000;
			r_dead__5	<= 1'b1;
			r_hit__5	<= 1'b0;
			r_diff__5 <= 32'b00000000000000000000000000000000;
			r_dl_b__5 <= 32'b00000000000000000000000000000000;
			r_numer__5 <= 0;
			r_z1__5 <= 32'b00000000000000000000000000000000;
			r_z0__5 <= 32'b00000000000000000000000000000000;
			r_mut__5 <= 32'b00000000000000000000000000000000;

			r_x__4	<= 32'b00000000000000000000000000000000;
			r_y__4	<= 32'b00000000000000000000000000000000;
			r_z__4	<= 32'b00000000000000000000000000000000;
			r_ux__4	<= 32'b00000000000000000000000000000000;
			r_uy__4	<= 32'b00000000000000000000000000000000;
			r_uz__4	<= 32'b00000000000000000000000000000000;
			r_sz__4	<= 32'b00000000000000000000000000000000;
			r_sr__4	<= 32'b00000000000000000000000000000000;
			r_sleftz__4	<= 32'b00000000000000000000000000000000;
			r_sleftr__4	<= 32'b00000000000000000000000000000000;
			r_weight__4	<= 32'b00000000000000000000000000000000;
			r_layer__4	<= 3'b000;
			r_dead__4	<= 1'b1;
			r_hit__4	<= 1'b0;
			r_diff__4 <= 32'b00000000000000000000000000000000;
			r_dl_b__4 <= 32'b00000000000000000000000000000000;
			r_numer__4 <= 0;
			r_z1__4 <= 32'b00000000000000000000000000000000;
			r_z0__4 <= 32'b00000000000000000000000000000000;
			r_mut__4 <= 32'b00000000000000000000000000000000;

			r_x__3	<= 32'b00000000000000000000000000000000;
			r_y__3	<= 32'b00000000000000000000000000000000;
			r_z__3	<= 32'b00000000000000000000000000000000;
			r_ux__3	<= 32'b00000000000000000000000000000000;
			r_uy__3	<= 32'b00000000000000000000000000000000;
			r_uz__3	<= 32'b00000000000000000000000000000000;
			r_sz__3	<= 32'b00000000000000000000000000000000;
			r_sr__3	<= 32'b00000000000000000000000000000000;
			r_sleftz__3	<= 32'b00000000000000000000000000000000;
			r_sleftr__3	<= 32'b00000000000000000000000000000000;
			r_weight__3	<= 32'b00000000000000000000000000000000;
			r_layer__3	<= 3'b000;
			r_dead__3	<= 1'b1;
			r_hit__3	<= 1'b0;
			r_diff__3 <= 32'b00000000000000000000000000000000;
			r_dl_b__3 <= 32'b00000000000000000000000000000000;
			r_numer__3 <= 0;
			r_z1__3 <= 32'b00000000000000000000000000000000;
			r_z0__3 <= 32'b00000000000000000000000000000000;
			r_mut__3 <= 32'b00000000000000000000000000000000;

			r_x__2	<= 32'b00000000000000000000000000000000;
			r_y__2	<= 32'b00000000000000000000000000000000;
			r_z__2	<= 32'b00000000000000000000000000000000;
			r_ux__2	<= 32'b00000000000000000000000000000000;
			r_uy__2	<= 32'b00000000000000000000000000000000;
			r_uz__2	<= 32'b00000000000000000000000000000000;
			r_sz__2	<= 32'b00000000000000000000000000000000;
			r_sr__2	<= 32'b00000000000000000000000000000000;
			r_sleftz__2	<= 32'b00000000000000000000000000000000;
			r_sleftr__2	<= 32'b00000000000000000000000000000000;
			r_weight__2	<= 32'b00000000000000000000000000000000;
			r_layer__2	<= 3'b000;
			r_dead__2	<= 1'b1;
			r_hit__2	<= 1'b0;
			r_diff__2 <= 32'b00000000000000000000000000000000;
			r_dl_b__2 <= 32'b00000000000000000000000000000000;
			r_numer__2 <= 0;
			r_z1__2 <= 32'b00000000000000000000000000000000;
			r_z0__2 <= 32'b00000000000000000000000000000000;
			r_mut__2 <= 32'b00000000000000000000000000000000;

			r_x__1	<= 32'b00000000000000000000000000000000;
			r_y__1	<= 32'b00000000000000000000000000000000;
			r_z__1	<= 32'b00000000000000000000000000000000;
			r_ux__1	<= 32'b00000000000000000000000000000000;
			r_uy__1	<= 32'b00000000000000000000000000000000;
			r_uz__1	<= 32'b00000000000000000000000000000000;
			r_sz__1	<= 32'b00000000000000000000000000000000;
			r_sr__1	<= 32'b00000000000000000000000000000000;
			r_sleftz__1	<= 32'b00000000000000000000000000000000;
			r_sleftr__1	<= 32'b00000000000000000000000000000000;
			r_weight__1	<= 32'b00000000000000000000000000000000;
			r_layer__1	<= 3'b000;
			r_dead__1	<= 1'b1;
			r_hit__1	<= 1'b0;
			r_diff__1 <= 32'b00000000000000000000000000000000;
			r_dl_b__1 <= 32'b00000000000000000000000000000000;
			r_numer__1 <= 0;
			r_z1__1 <= 32'b00000000000000000000000000000000;
			r_z0__1 <= 32'b00000000000000000000000000000000;
			r_mut__1 <= 32'b00000000000000000000000000000000;
			
				r_x__0	<= 32'b00000000000000000000000000000000;
			r_y__0	<= 32'b00000000000000000000000000000000;
			r_z__0	<= 32'b00000000000000000000000000000000;
			r_ux__0	<= 32'b00000000000000000000000000000000;
			r_uy__0	<= 32'b00000000000000000000000000000000;
			r_uz__0	<= 32'b00000000000000000000000000000000;
			r_sz__0	<= 32'b00000000000000000000000000000000;
			r_sr__0	<= 32'b00000000000000000000000000000000;
			r_sleftz__0	<= 32'b00000000000000000000000000000000;
			r_sleftr__0	<= 32'b00000000000000000000000000000000;
			r_weight__0	<= 32'b00000000000000000000000000000000;
			r_layer__0	<= 3'b000;
			r_dead__0	<= 1'b0;
			r_hit__0	<= 1'b0;
			r_diff__0 <= 32'b00000000000000000000000000000000;
			r_dl_b__0 <= 32'b00000000000000000000000000000000;
			r_numer__0 <= 0;
			r_z1__0 <= 32'b00000000000000000000000000000000;
			r_z0__0 <= 32'b00000000000000000000000000000000;
			r_mut__0 <= 32'b00000000000000000000000000000000;
	end
	
	else 
	begin
		if(enable)
		begin
		
			//for 0
		r_x__0	<=c_x__0;
		r_y__0	<=c_y__0;
		r_z__0	<=c_z__0;
		r_ux__0	<=c_ux__0;
		r_uy__0	<=c_uy__0;
		r_uz__0	<=c_uz__0;
		r_sz__0	<=c_sz__0;
		r_sr__0	<=c_sr__0;
		r_sleftz__0	<=c_sleftz__0;
		r_sleftr__0	<=c_sleftr__0;
		r_weight__0	<=c_weight__0;
		r_layer__0	<=c_layer__0;
		r_dead__0	<=c_dead__0;
		r_hit__0	<=c_hit__0;
		r_diff__0 <=c_diff__0;
		r_dl_b__0 <=c_dl_b__0;
		r_numer__0 <=c_numer__0;
		r_z1__0 <=c_z1__0;
		r_z0__0 <=c_z0__0;
		r_mut__0 <=c_mut__0;
		
	//for 1
	
		r_x__1	<=c_x__1;
		r_y__1	<=c_y__1;
		r_z__1	<=c_z__1;
		r_ux__1	<=c_ux__1;
		r_uy__1	<=c_uy__1;
		r_uz__1	<=c_uz__1;
		r_sz__1	<=c_sz__1;
		r_sr__1	<=c_sr__1;
		r_sleftz__1	<=c_sleftz__1;
		r_sleftr__1	<=c_sleftr__1;
		r_weight__1	<=c_weight__1;
		r_layer__1	<=c_layer__1;
		r_dead__1	<=c_dead__1;
		r_hit__1	<=c_hit__1;
		r_diff__1 <=c_diff__1;
		r_dl_b__1 <=c_dl_b__1;
		r_numer__1 <=c_numer__1;
		r_z1__1 <=c_z1__1;
		r_z0__1 <=c_z0__1;
		r_mut__1 <=c_mut__1;
		
		//for 2
		r_x__2	<=c_x__2;
		r_y__2	<=c_y__2;
		r_z__2	<=c_z__2;
		r_ux__2	<=c_ux__2;
		r_uy__2	<=c_uy__2;
		r_uz__2	<=c_uz__2;
		r_sz__2	<=c_sz__2;
		r_sr__2	<=c_sr__2;
		r_sleftz__2	<=c_sleftz__2;
		r_sleftr__2	<=c_sleftr__2;
		r_weight__2	<=c_weight__2;
		r_layer__2	<=c_layer__2;
		r_dead__2	<=c_dead__2;
		r_hit__2	<=c_hit__2;
		r_diff__2 <=c_diff__2;
		r_dl_b__2 <=c_dl_b__2;
		r_numer__2 <=c_numer__2;
		r_z1__2 <=c_z1__2;
		r_z0__2 <=c_z0__2;
		r_mut__2 <=c_mut__2;
	
		//for 3
		r_x__3	<=c_x__3;
		r_y__3	<=c_y__3;
		r_z__3	<=c_z__3;
		r_ux__3	<=c_ux__3;
		r_uy__3	<=c_uy__3;
		r_uz__3	<=c_uz__3;
		r_sz__3	<=c_sz__3;
		r_sr__3	<=c_sr__3;
		r_sleftz__3	<=c_sleftz__3;
		r_sleftr__3	<=c_sleftr__3;
		r_weight__3	<=c_weight__3;
		r_layer__3	<=c_layer__3;
		r_dead__3	<=c_dead__3;
		r_hit__3	<=c_hit__3;
		r_diff__3 <=c_diff__3;
		r_dl_b__3 <=c_dl_b__3;
		r_numer__3 <=c_numer__3;
		r_z1__3 <=c_z1__3;
		r_z0__3 <=c_z0__3;
		r_mut__3 <=c_mut__3;
		
		//for 4
		r_x__4	<=c_x__4;
		r_y__4	<=c_y__4;
		r_z__4	<=c_z__4;
		r_ux__4	<=c_ux__4;
		r_uy__4	<=c_uy__4;
		r_uz__4	<=c_uz__4;
		r_sz__4	<=c_sz__4;
		r_sr__4	<=c_sr__4;
		r_sleftz__4	<=c_sleftz__4;
		r_sleftr__4	<=c_sleftr__4;
		r_weight__4	<=c_weight__4;
		r_layer__4	<=c_layer__4;
		r_dead__4	<=c_dead__4;
		r_hit__4	<=c_hit__4;
		r_diff__4 <=c_diff__4;
		r_dl_b__4 <=c_dl_b__4;
		r_numer__4 <=c_numer__4;
		r_z1__4 <=c_z1__4;
		r_z0__4 <=c_z0__4;
		r_mut__4 <=c_mut__4;
		
		//for 5
		r_x__5	<=c_x__5;
		r_y__5	<=c_y__5;
		r_z__5	<=c_z__5;
		r_ux__5	<=c_ux__5;
		r_uy__5	<=c_uy__5;
		r_uz__5	<=c_uz__5;
		r_sz__5	<=c_sz__5;
		r_sr__5	<=c_sr__5;
		r_sleftz__5	<=c_sleftz__5;
		r_sleftr__5	<=c_sleftr__5;
		r_weight__5	<=c_weight__5;
		r_layer__5	<=c_layer__5;
		r_dead__5	<=c_dead__5;
		r_hit__5	<=c_hit__5;
		r_diff__5 <=c_diff__5;
		r_dl_b__5 <=c_dl_b__5;
		r_numer__5 <=c_numer__5;
		r_z1__5 <=c_z1__5;
		r_z0__5 <=c_z0__5;
		r_mut__5 <=c_mut__5;
		
		//for 6
		r_x__6	<=c_x__6;
		r_y__6	<=c_y__6;
		r_z__6	<=c_z__6;
		r_ux__6	<=c_ux__6;
		r_uy__6	<=c_uy__6;
		r_uz__6	<=c_uz__6;
		r_sz__6	<=c_sz__6;
		r_sr__6	<=c_sr__6;
		r_sleftz__6	<=c_sleftz__6;
		r_sleftr__6	<=c_sleftr__6;
		r_weight__6	<=c_weight__6;
		r_layer__6	<=c_layer__6;
		r_dead__6	<=c_dead__6;
		r_hit__6	<=c_hit__6;
		r_diff__6 <=c_diff__6;
		r_dl_b__6 <=c_dl_b__6;
		r_numer__6 <=c_numer__6;
		r_z1__6 <=c_z1__6;
		r_z0__6 <=c_z0__6;
		r_mut__6 <=c_mut__6;
		
		//for 7
		r_x__7	<=c_x__7;
		r_y__7	<=c_y__7;
		r_z__7	<=c_z__7;
		r_ux__7	<=c_ux__7;
		r_uy__7	<=c_uy__7;
		r_uz__7	<=c_uz__7;
		r_sz__7	<=c_sz__7;
		r_sr__7	<=c_sr__7;
		r_sleftz__7	<=c_sleftz__7;
		r_sleftr__7	<=c_sleftr__7;
		r_weight__7	<=c_weight__7;
		r_layer__7	<=c_layer__7;
		r_dead__7	<=c_dead__7;
		r_hit__7	<=c_hit__7;
		r_diff__7 <=c_diff__7;
		r_dl_b__7 <=c_dl_b__7;
		r_numer__7 <=c_numer__7;
		r_z1__7 <=c_z1__7;
		r_z0__7 <=c_z0__7;
		r_mut__7 <=c_mut__7;
		
		//for 8
		r_x__8	<=c_x__8;
		r_y__8	<=c_y__8;
		r_z__8	<=c_z__8;
		r_ux__8	<=c_ux__8;
		r_uy__8	<=c_uy__8;
		r_uz__8	<=c_uz__8;
		r_sz__8	<=c_sz__8;
		r_sr__8	<=c_sr__8;
		r_sleftz__8	<=c_sleftz__8;
		r_sleftr__8	<=c_sleftr__8;
		r_weight__8	<=c_weight__8;
		r_layer__8	<=c_layer__8;
		r_dead__8	<=c_dead__8;
		r_hit__8	<=c_hit__8;
		r_diff__8 <=c_diff__8;
		r_dl_b__8 <=c_dl_b__8;
		r_numer__8 <=c_numer__8;
		r_z1__8 <=c_z1__8;
		r_z0__8 <=c_z0__8;
		r_mut__8 <=c_mut__8;
		
		//for 9
		r_x__9	<=c_x__9;
		r_y__9	<=c_y__9;
		r_z__9	<=c_z__9;
		r_ux__9	<=c_ux__9;
		r_uy__9	<=c_uy__9;
		r_uz__9	<=c_uz__9;
		r_sz__9	<=c_sz__9;
		r_sr__9	<=c_sr__9;
		r_sleftz__9	<=c_sleftz__9;
		r_sleftr__9	<=c_sleftr__9;
		r_weight__9	<=c_weight__9;
		r_layer__9	<=c_layer__9;
		r_dead__9	<=c_dead__9;
		r_hit__9	<=c_hit__9;
		r_diff__9 <=c_diff__9;
		r_dl_b__9 <=c_dl_b__9;
		r_numer__9 <=c_numer__9;
		r_z1__9 <=c_z1__9;
		r_z0__9 <=c_z0__9;
		r_mut__9 <=c_mut__9;
		
		//for 10
		r_x__10	<=c_x__10;
		r_y__10	<=c_y__10;
		r_z__10	<=c_z__10;
		r_ux__10	<=c_ux__10;
		r_uy__10	<=c_uy__10;
		r_uz__10	<=c_uz__10;
		r_sz__10	<=c_sz__10;
		r_sr__10	<=c_sr__10;
		r_sleftz__10	<=c_sleftz__10;
		r_sleftr__10	<=c_sleftr__10;
		r_weight__10	<=c_weight__10;
		r_layer__10	<=c_layer__10;
		r_dead__10	<=c_dead__10;
		r_hit__10	<=c_hit__10;
		r_diff__10 <=c_diff__10;
		r_dl_b__10 <=c_dl_b__10;
		r_numer__10 <=c_numer__10;
		r_z1__10 <=c_z1__10;
		r_z0__10 <=c_z0__10;
		r_mut__10 <=c_mut__10;
		
		//for 11
		r_x__11	<=c_x__11;
		r_y__11	<=c_y__11;
		r_z__11	<=c_z__11;
		r_ux__11	<=c_ux__11;
		r_uy__11	<=c_uy__11;
		r_uz__11	<=c_uz__11;
		r_sz__11	<=c_sz__11;
		r_sr__11	<=c_sr__11;
		r_sleftz__11	<=c_sleftz__11;
		r_sleftr__11	<=c_sleftr__11;
		r_weight__11	<=c_weight__11;
		r_layer__11	<=c_layer__11;
		r_dead__11	<=c_dead__11;
		r_hit__11	<=c_hit__11;
		r_diff__11 <=c_diff__11;
		r_dl_b__11 <=c_dl_b__11;
		r_numer__11 <=c_numer__11;
		r_z1__11 <=c_z1__11;
		r_z0__11 <=c_z0__11;
		r_mut__11 <=c_mut__11;
		
		//for 12
		r_x__12	<=c_x__12;
		r_y__12	<=c_y__12;
		r_z__12	<=c_z__12;
		r_ux__12	<=c_ux__12;
		r_uy__12	<=c_uy__12;
		r_uz__12	<=c_uz__12;
		r_sz__12	<=c_sz__12;
		r_sr__12	<=c_sr__12;
		r_sleftz__12	<=c_sleftz__12;
		r_sleftr__12	<=c_sleftr__12;
		r_weight__12	<=c_weight__12;
		r_layer__12	<=c_layer__12;
		r_dead__12	<=c_dead__12;
		r_hit__12	<=c_hit__12;
		r_diff__12 <=c_diff__12;
		r_dl_b__12 <=c_dl_b__12;
		r_numer__12 <=c_numer__12;
		r_z1__12 <=c_z1__12;
		r_z0__12 <=c_z0__12;
		r_mut__12 <=c_mut__12;
		
		//for 13
		r_x__13	<=c_x__13;
		r_y__13	<=c_y__13;
		r_z__13	<=c_z__13;
		r_ux__13	<=c_ux__13;
		r_uy__13	<=c_uy__13;
		r_uz__13	<=c_uz__13;
		r_sz__13	<=c_sz__13;
		r_sr__13	<=c_sr__13;
		r_sleftz__13	<=c_sleftz__13;
		r_sleftr__13	<=c_sleftr__13;
		r_weight__13	<=c_weight__13;
		r_layer__13	<=c_layer__13;
		r_dead__13	<=c_dead__13;
		r_hit__13	<=c_hit__13;
		r_diff__13 <=c_diff__13;
		r_dl_b__13 <=c_dl_b__13;
		r_numer__13 <=c_numer__13;
		r_z1__13 <=c_z1__13;
		r_z0__13 <=c_z0__13;
		r_mut__13 <=c_mut__13;
		
		//for 14
		r_x__14	<=c_x__14;
		r_y__14	<=c_y__14;
		r_z__14	<=c_z__14;
		r_ux__14	<=c_ux__14;
		r_uy__14	<=c_uy__14;
		r_uz__14	<=c_uz__14;
		r_sz__14	<=c_sz__14;
		r_sr__14	<=c_sr__14;
		r_sleftz__14	<=c_sleftz__14;
		r_sleftr__14	<=c_sleftr__14;
		r_weight__14	<=c_weight__14;
		r_layer__14	<=c_layer__14;
		r_dead__14	<=c_dead__14;
		r_hit__14	<=c_hit__14;
		r_diff__14 <=c_diff__14;
		r_dl_b__14 <=c_dl_b__14;
		r_numer__14 <=c_numer__14;
		r_z1__14 <=c_z1__14;
		r_z0__14 <=c_z0__14;
		r_mut__14 <=c_mut__14;
		
		//for 15
		r_x__15	<=c_x__15;
		r_y__15	<=c_y__15;
		r_z__15	<=c_z__15;
		r_ux__15	<=c_ux__15;
		r_uy__15	<=c_uy__15;
		r_uz__15	<=c_uz__15;
		r_sz__15	<=c_sz__15;
		r_sr__15	<=c_sr__15;
		r_sleftz__15	<=c_sleftz__15;
		r_sleftr__15	<=c_sleftr__15;
		r_weight__15	<=c_weight__15;
		r_layer__15	<=c_layer__15;
		r_dead__15	<=c_dead__15;
		r_hit__15	<=c_hit__15;
		r_diff__15 <=c_diff__15;
		r_dl_b__15 <=c_dl_b__15;
		r_numer__15 <=c_numer__15;
		r_z1__15 <=c_z1__15;
		r_z0__15 <=c_z0__15;
		r_mut__15 <=c_mut__15;
		
		//for 16
		r_x__16	<=c_x__16;
		r_y__16	<=c_y__16;
		r_z__16	<=c_z__16;
		r_ux__16	<=c_ux__16;
		r_uy__16	<=c_uy__16;
		r_uz__16	<=c_uz__16;
		r_sz__16	<=c_sz__16;
		r_sr__16	<=c_sr__16;
		r_sleftz__16	<=c_sleftz__16;
		r_sleftr__16	<=c_sleftr__16;
		r_weight__16	<=c_weight__16;
		r_layer__16	<=c_layer__16;
		r_dead__16	<=c_dead__16;
		r_hit__16	<=c_hit__16;
		r_diff__16 <=c_diff__16;
		r_dl_b__16 <=c_dl_b__16;
		r_numer__16 <=c_numer__16;
		r_z1__16 <=c_z1__16;
		r_z0__16 <=c_z0__16;
		r_mut__16 <=c_mut__16;
		
		//for 17
		r_x__17	<=c_x__17;
		r_y__17	<=c_y__17;
		r_z__17	<=c_z__17;
		r_ux__17	<=c_ux__17;
		r_uy__17	<=c_uy__17;
		r_uz__17	<=c_uz__17;
		r_sz__17	<=c_sz__17;
		r_sr__17	<=c_sr__17;
		r_sleftz__17	<=c_sleftz__17;
		r_sleftr__17	<=c_sleftr__17;
		r_weight__17	<=c_weight__17;
		r_layer__17	<=c_layer__17;
		r_dead__17	<=c_dead__17;
		r_hit__17	<=c_hit__17;
		r_diff__17 <=c_diff__17;
		r_dl_b__17 <=c_dl_b__17;
		r_numer__17 <=c_numer__17;
		r_z1__17 <=c_z1__17;
		r_z0__17 <=c_z0__17;
		r_mut__17 <=c_mut__17;
		
		//for 18
		r_x__18	<=c_x__18;
		r_y__18	<=c_y__18;
		r_z__18	<=c_z__18;
		r_ux__18	<=c_ux__18;
		r_uy__18	<=c_uy__18;
		r_uz__18	<=c_uz__18;
		r_sz__18	<=c_sz__18;
		r_sr__18	<=c_sr__18;
		r_sleftz__18	<=c_sleftz__18;
		r_sleftr__18	<=c_sleftr__18;
		r_weight__18	<=c_weight__18;
		r_layer__18	<=c_layer__18;
		r_dead__18	<=c_dead__18;
		r_hit__18	<=c_hit__18;
		r_diff__18 <=c_diff__18;
		r_dl_b__18 <=c_dl_b__18;
		r_numer__18 <=c_numer__18;
		r_z1__18 <=c_z1__18;
		r_z0__18 <=c_z0__18;
		r_mut__18 <=c_mut__18;
		
		//for 19
		r_x__19	<=c_x__19;
		r_y__19	<=c_y__19;
		r_z__19	<=c_z__19;
		r_ux__19	<=c_ux__19;
		r_uy__19	<=c_uy__19;
		r_uz__19	<=c_uz__19;
		r_sz__19	<=c_sz__19;
		r_sr__19	<=c_sr__19;
		r_sleftz__19	<=c_sleftz__19;
		r_sleftr__19	<=c_sleftr__19;
		r_weight__19	<=c_weight__19;
		r_layer__19	<=c_layer__19;
		r_dead__19	<=c_dead__19;
		r_hit__19	<=c_hit__19;
		r_diff__19 <=c_diff__19;
		r_dl_b__19 <=c_dl_b__19;
		r_numer__19 <=c_numer__19;
		r_z1__19 <=c_z1__19;
		r_z0__19 <=c_z0__19;
		r_mut__19 <=c_mut__19;
		
		//for 20
		r_x__20	<=c_x__20;
		r_y__20	<=c_y__20;
		r_z__20	<=c_z__20;
		r_ux__20	<=c_ux__20;
		r_uy__20	<=c_uy__20;
		r_uz__20	<=c_uz__20;
		r_sz__20	<=c_sz__20;
		r_sr__20	<=c_sr__20;
		r_sleftz__20	<=c_sleftz__20;
		r_sleftr__20	<=c_sleftr__20;
		r_weight__20	<=c_weight__20;
		r_layer__20	<=c_layer__20;
		r_dead__20	<=c_dead__20;
		r_hit__20	<=c_hit__20;
		r_diff__20 <=c_diff__20;
		r_dl_b__20 <=c_dl_b__20;
		r_numer__20 <=c_numer__20;
		r_z1__20 <=c_z1__20;
		r_z0__20 <=c_z0__20;
		r_mut__20 <=c_mut__20;
		
		
		//for 21
		r_x__21	<=c_x__21;
		r_y__21	<=c_y__21;
		r_z__21	<=c_z__21;
		r_ux__21	<=c_ux__21;
		r_uy__21	<=c_uy__21;
		r_uz__21	<=c_uz__21;
		r_sz__21	<=c_sz__21;
		r_sr__21	<=c_sr__21;
		r_sleftz__21	<=c_sleftz__21;
		r_sleftr__21	<=c_sleftr__21;
		r_weight__21	<=c_weight__21;
		r_layer__21	<=c_layer__21;
		r_dead__21	<=c_dead__21;
		r_hit__21	<=c_hit__21;
		r_diff__21 <=c_diff__21;
		r_dl_b__21 <=c_dl_b__21;
		r_numer__21 <=c_numer__21;
		r_z1__21 <=c_z1__21;
		r_z0__21 <=c_z0__21;
		r_mut__21 <=c_mut__21;
		
		//for 22
		r_x__22	<=c_x__22;
		r_y__22	<=c_y__22;
		r_z__22	<=c_z__22;
		r_ux__22	<=c_ux__22;
		r_uy__22	<=c_uy__22;
		r_uz__22	<=c_uz__22;
		r_sz__22	<=c_sz__22;
		r_sr__22	<=c_sr__22;
		r_sleftz__22	<=c_sleftz__22;
		r_sleftr__22	<=c_sleftr__22;
		r_weight__22	<=c_weight__22;
		r_layer__22	<=c_layer__22;
		r_dead__22	<=c_dead__22;
		r_hit__22	<=c_hit__22;
		r_diff__22 <=c_diff__22;
		r_dl_b__22 <=c_dl_b__22;
		r_numer__22 <=c_numer__22;
		r_z1__22 <=c_z1__22;
		r_z0__22 <=c_z0__22;
		r_mut__22 <=c_mut__22;
		
		//for 23
		r_x__23	<=c_x__23;
		r_y__23	<=c_y__23;
		r_z__23	<=c_z__23;
		r_ux__23	<=c_ux__23;
		r_uy__23	<=c_uy__23;
		r_uz__23	<=c_uz__23;
		r_sz__23	<=c_sz__23;
		r_sr__23	<=c_sr__23;
		r_sleftz__23	<=c_sleftz__23;
		r_sleftr__23	<=c_sleftr__23;
		r_weight__23	<=c_weight__23;
		r_layer__23	<=c_layer__23;
		r_dead__23	<=c_dead__23;
		r_hit__23	<=c_hit__23;
		r_diff__23 <=c_diff__23;
		r_dl_b__23 <=c_dl_b__23;
		r_numer__23 <=c_numer__23;
		r_z1__23 <=c_z1__23;
		r_z0__23 <=c_z0__23;
		r_mut__23 <=c_mut__23;
		
		//for 24
		r_x__24	<=c_x__24;
		r_y__24	<=c_y__24;
		r_z__24	<=c_z__24;
		r_ux__24	<=c_ux__24;
		r_uy__24	<=c_uy__24;
		r_uz__24	<=c_uz__24;
		r_sz__24	<=c_sz__24;
		r_sr__24	<=c_sr__24;
		r_sleftz__24	<=c_sleftz__24;
		r_sleftr__24	<=c_sleftr__24;
		r_weight__24	<=c_weight__24;
		r_layer__24	<=c_layer__24;
		r_dead__24	<=c_dead__24;
		r_hit__24	<=c_hit__24;
		r_diff__24 <=c_diff__24;
		r_dl_b__24 <=c_dl_b__24;
		r_numer__24 <=c_numer__24;
		r_z1__24 <=c_z1__24;
		r_z0__24 <=c_z0__24;
		r_mut__24 <=c_mut__24;
		
		//for 25
		r_x__25	<=c_x__25;
		r_y__25	<=c_y__25;
		r_z__25	<=c_z__25;
		r_ux__25	<=c_ux__25;
		r_uy__25	<=c_uy__25;
		r_uz__25	<=c_uz__25;
		r_sz__25	<=c_sz__25;
		r_sr__25	<=c_sr__25;
		r_sleftz__25	<=c_sleftz__25;
		r_sleftr__25	<=c_sleftr__25;
		r_weight__25	<=c_weight__25;
		r_layer__25	<=c_layer__25;
		r_dead__25	<=c_dead__25;
		r_hit__25	<=c_hit__25;
		r_diff__25 <=c_diff__25;
		r_dl_b__25 <=c_dl_b__25;
		r_numer__25 <=c_numer__25;
		r_z1__25 <=c_z1__25;
		r_z0__25 <=c_z0__25;
		r_mut__25 <=c_mut__25;
		
		//for 26
		r_x__26	<=c_x__26;
		r_y__26	<=c_y__26;
		r_z__26	<=c_z__26;
		r_ux__26	<=c_ux__26;
		r_uy__26	<=c_uy__26;
		r_uz__26	<=c_uz__26;
		r_sz__26	<=c_sz__26;
		r_sr__26	<=c_sr__26;
		r_sleftz__26	<=c_sleftz__26;
		r_sleftr__26	<=c_sleftr__26;
		r_weight__26	<=c_weight__26;
		r_layer__26	<=c_layer__26;
		r_dead__26	<=c_dead__26;
		r_hit__26	<=c_hit__26;
		r_diff__26 <=c_diff__26;
		r_dl_b__26 <=c_dl_b__26;
		r_numer__26 <=c_numer__26;
		r_z1__26 <=c_z1__26;
		r_z0__26 <=c_z0__26;
		r_mut__26 <=c_mut__26;
		
		//for 27
		r_x__27	<=c_x__27;
		r_y__27	<=c_y__27;
		r_z__27	<=c_z__27;
		r_ux__27	<=c_ux__27;
		r_uy__27	<=c_uy__27;
		r_uz__27	<=c_uz__27;
		r_sz__27	<=c_sz__27;
		r_sr__27	<=c_sr__27;
		r_sleftz__27	<=c_sleftz__27;
		r_sleftr__27	<=c_sleftr__27;
		r_weight__27	<=c_weight__27;
		r_layer__27	<=c_layer__27;
		r_dead__27	<=c_dead__27;
		r_hit__27	<=c_hit__27;
		r_diff__27 <=c_diff__27;
		r_dl_b__27 <=c_dl_b__27;
		r_numer__27 <=c_numer__27;
		r_z1__27 <=c_z1__27;
		r_z0__27 <=c_z0__27;
		r_mut__27 <=c_mut__27;
		
		//for 28
		r_x__28	<=c_x__28;
		r_y__28	<=c_y__28;
		r_z__28	<=c_z__28;
		r_ux__28	<=c_ux__28;
		r_uy__28	<=c_uy__28;
		r_uz__28	<=c_uz__28;
		r_sz__28	<=c_sz__28;
		r_sr__28	<=c_sr__28;
		r_sleftz__28	<=c_sleftz__28;
		r_sleftr__28	<=c_sleftr__28;
		r_weight__28	<=c_weight__28;
		r_layer__28	<=c_layer__28;
		r_dead__28	<=c_dead__28;
		r_hit__28	<=c_hit__28;
		r_diff__28 <=c_diff__28;
		r_dl_b__28 <=c_dl_b__28;
		r_numer__28 <=c_numer__28;
		r_z1__28 <=c_z1__28;
		r_z0__28 <=c_z0__28;
		r_mut__28 <=c_mut__28;
		
		//for 29
		r_x__29	<=c_x__29;
		r_y__29	<=c_y__29;
		r_z__29	<=c_z__29;
		r_ux__29	<=c_ux__29;
		r_uy__29	<=c_uy__29;
		r_uz__29	<=c_uz__29;
		r_sz__29	<=c_sz__29;
		r_sr__29	<=c_sr__29;
		r_sleftz__29	<=c_sleftz__29;
		r_sleftr__29	<=c_sleftr__29;
		r_weight__29	<=c_weight__29;
		r_layer__29	<=c_layer__29;
		r_dead__29	<=c_dead__29;
		r_hit__29	<=c_hit__29;
		r_diff__29 <=c_diff__29;
		r_dl_b__29 <=c_dl_b__29;
		r_numer__29 <=c_numer__29;
		r_z1__29 <=c_z1__29;
		r_z0__29 <=c_z0__29;
		r_mut__29 <=c_mut__29;
		
		//for 30
		r_x__30	<=c_x__30;
		r_y__30	<=c_y__30;
		r_z__30	<=c_z__30;
		r_ux__30	<=c_ux__30;
		r_uy__30	<=c_uy__30;
		r_uz__30	<=c_uz__30;
		r_sz__30	<=c_sz__30;
		r_sr__30	<=c_sr__30;
		r_sleftz__30	<=c_sleftz__30;
		r_sleftr__30	<=c_sleftr__30;
		r_weight__30	<=c_weight__30;
		r_layer__30	<=c_layer__30;
		r_dead__30	<=c_dead__30;
		r_hit__30	<=c_hit__30;
		r_diff__30 <=c_diff__30;
		r_dl_b__30 <=c_dl_b__30;
		r_numer__30 <=c_numer__30;
		r_z1__30 <=c_z1__30;
		r_z0__30 <=c_z0__30;
		r_mut__30 <=c_mut__30;
		
		//for 31
		r_x__31	<=c_x__31;
		r_y__31	<=c_y__31;
		r_z__31	<=c_z__31;
		r_ux__31	<=c_ux__31;
		r_uy__31	<=c_uy__31;
		r_uz__31	<=c_uz__31;
		r_sz__31	<=c_sz__31;
		r_sr__31	<=c_sr__31;
		r_sleftz__31	<=c_sleftz__31;
		r_sleftr__31	<=c_sleftr__31;
		r_weight__31	<=c_weight__31;
		r_layer__31	<=c_layer__31;
		r_dead__31	<=c_dead__31;
		r_hit__31	<=c_hit__31;
		r_diff__31 <=c_diff__31;
		r_dl_b__31 <=c_dl_b__31;
		r_numer__31 <=c_numer__31;
		r_z1__31 <=c_z1__31;
		r_z0__31 <=c_z0__31;
		r_mut__31 <=c_mut__31;
		
		//for 32
		r_x__32	<=c_x__32;
		r_y__32	<=c_y__32;
		r_z__32	<=c_z__32;
		r_ux__32	<=c_ux__32;
		r_uy__32	<=c_uy__32;
		r_uz__32	<=c_uz__32;
		r_sz__32	<=c_sz__32;
		r_sr__32	<=c_sr__32;
		r_sleftz__32	<=c_sleftz__32;
		r_sleftr__32	<=c_sleftr__32;
		r_weight__32	<=c_weight__32;
		r_layer__32	<=c_layer__32;
		r_dead__32	<=c_dead__32;
		r_hit__32	<=c_hit__32;
		r_diff__32 <=c_diff__32;
		r_dl_b__32 <=c_dl_b__32;
		r_numer__32 <=c_numer__32;
		r_z1__32 <=c_z1__32;
		r_z0__32 <=c_z0__32;
		r_mut__32 <=c_mut__32;
		
		//for 33
		r_x__33	<=c_x__33;
		r_y__33	<=c_y__33;
		r_z__33	<=c_z__33;
		r_ux__33	<=c_ux__33;
		r_uy__33	<=c_uy__33;
		r_uz__33	<=c_uz__33;
		r_sz__33	<=c_sz__33;
		r_sr__33	<=c_sr__33;
		r_sleftz__33	<=c_sleftz__33;
		r_sleftr__33	<=c_sleftr__33;
		r_weight__33	<=c_weight__33;
		r_layer__33	<=c_layer__33;
		r_dead__33	<=c_dead__33;
		r_hit__33	<=c_hit__33;
		r_diff__33 <=c_diff__33;
		r_dl_b__33 <=c_dl_b__33;
		r_numer__33 <=c_numer__33;
		r_z1__33 <=c_z1__33;
		r_z0__33 <=c_z0__33;
		r_mut__33 <=c_mut__33;
		
		//for 34
		r_x__34	<=c_x__34;
		r_y__34	<=c_y__34;
		r_z__34	<=c_z__34;
		r_ux__34	<=c_ux__34;
		r_uy__34	<=c_uy__34;
		r_uz__34	<=c_uz__34;
		r_sz__34	<=c_sz__34;
		r_sr__34	<=c_sr__34;
		r_sleftz__34	<=c_sleftz__34;
		r_sleftr__34	<=c_sleftr__34;
		r_weight__34	<=c_weight__34;
		r_layer__34	<=c_layer__34;
		r_dead__34	<=c_dead__34;
		r_hit__34	<=c_hit__34;
		r_diff__34 <=c_diff__34;
		r_dl_b__34 <=c_dl_b__34;
		r_numer__34 <=c_numer__34;
		r_z1__34 <=c_z1__34;
		r_z0__34 <=c_z0__34;
		r_mut__34 <=c_mut__34;
		
		//for 35
		r_x__35	<=c_x__35;
		r_y__35	<=c_y__35;
		r_z__35	<=c_z__35;
		r_ux__35	<=c_ux__35;
		r_uy__35	<=c_uy__35;
		r_uz__35	<=c_uz__35;
		r_sz__35	<=c_sz__35;
		r_sr__35	<=c_sr__35;
		r_sleftz__35	<=c_sleftz__35;
		r_sleftr__35	<=c_sleftr__35;
		r_weight__35	<=c_weight__35;
		r_layer__35	<=c_layer__35;
		r_dead__35	<=c_dead__35;
		r_hit__35	<=c_hit__35;
		r_diff__35 <=c_diff__35;
		r_dl_b__35 <=c_dl_b__35;
		r_numer__35 <=c_numer__35;
		r_z1__35 <=c_z1__35;
		r_z0__35 <=c_z0__35;
		r_mut__35 <=c_mut__35;
		
		//for 36
		r_x__36	<=c_x__36;
		r_y__36	<=c_y__36;
		r_z__36	<=c_z__36;
		r_ux__36	<=c_ux__36;
		r_uy__36	<=c_uy__36;
		r_uz__36	<=c_uz__36;
		r_sz__36	<=c_sz__36;
		r_sr__36	<=c_sr__36;
		r_sleftz__36	<=c_sleftz__36;
		r_sleftr__36	<=c_sleftr__36;
		r_weight__36	<=c_weight__36;
		r_layer__36	<=c_layer__36;
		r_dead__36	<=c_dead__36;
		r_hit__36	<=c_hit__36;
		r_diff__36 <=c_diff__36;
		r_dl_b__36 <=c_dl_b__36;
		r_numer__36 <=c_numer__36;
		r_z1__36 <=c_z1__36;
		r_z0__36 <=c_z0__36;
		r_mut__36 <=c_mut__36;
		
		//for 37
		r_x__37	<=c_x__37;
		r_y__37	<=c_y__37;
		r_z__37	<=c_z__37;
		r_ux__37	<=c_ux__37;
		r_uy__37	<=c_uy__37;
		r_uz__37	<=c_uz__37;
		r_sz__37	<=c_sz__37;
		r_sr__37	<=c_sr__37;
		r_sleftz__37	<=c_sleftz__37;
		r_sleftr__37	<=c_sleftr__37;
		r_weight__37	<=c_weight__37;
		r_layer__37	<=c_layer__37;
		r_dead__37	<=c_dead__37;
		r_hit__37	<=c_hit__37;
		r_diff__37 <=c_diff__37;
		r_dl_b__37 <=c_dl_b__37;
		r_numer__37 <=c_numer__37;
		r_z1__37 <=c_z1__37;
		r_z0__37 <=c_z0__37;
		r_mut__37 <=c_mut__37;
		
		//for 38
		r_x__38	<=c_x__38;
		r_y__38	<=c_y__38;
		r_z__38	<=c_z__38;
		r_ux__38	<=c_ux__38;
		r_uy__38	<=c_uy__38;
		r_uz__38	<=c_uz__38;
		r_sz__38	<=c_sz__38;
		r_sr__38	<=c_sr__38;
		r_sleftz__38	<=c_sleftz__38;
		r_sleftr__38	<=c_sleftr__38;
		r_weight__38	<=c_weight__38;
		r_layer__38	<=c_layer__38;
		r_dead__38	<=c_dead__38;
		r_hit__38	<=c_hit__38;
		r_diff__38 <=c_diff__38;
		r_dl_b__38 <=c_dl_b__38;
		r_numer__38 <=c_numer__38;
		r_z1__38 <=c_z1__38;
		r_z0__38 <=c_z0__38;
		r_mut__38 <=c_mut__38;
		
		//for 39
		r_x__39	<=c_x__39;
		r_y__39	<=c_y__39;
		r_z__39	<=c_z__39;
		r_ux__39	<=c_ux__39;
		r_uy__39	<=c_uy__39;
		r_uz__39	<=c_uz__39;
		r_sz__39	<=c_sz__39;
		r_sr__39	<=c_sr__39;
		r_sleftz__39	<=c_sleftz__39;
		r_sleftr__39	<=c_sleftr__39;
		r_weight__39	<=c_weight__39;
		r_layer__39	<=c_layer__39;
		r_dead__39	<=c_dead__39;
		r_hit__39	<=c_hit__39;
		r_diff__39 <=c_diff__39;
		r_dl_b__39 <=c_dl_b__39;
		r_numer__39 <=c_numer__39;
		r_z1__39 <=c_z1__39;
		r_z0__39 <=c_z0__39;
		r_mut__39 <=c_mut__39;
		
		//for 40
		r_x__40	<=c_x__40;
		r_y__40	<=c_y__40;
		r_z__40	<=c_z__40;
		r_ux__40	<=c_ux__40;
		r_uy__40	<=c_uy__40;
		r_uz__40	<=c_uz__40;
		r_sz__40	<=c_sz__40;
		r_sr__40	<=c_sr__40;
		r_sleftz__40	<=c_sleftz__40;
		r_sleftr__40	<=c_sleftr__40;
		r_weight__40	<=c_weight__40;
		r_layer__40	<=c_layer__40;
		r_dead__40	<=c_dead__40;
		r_hit__40	<=c_hit__40;
		r_diff__40 <=c_diff__40;
		r_dl_b__40 <=c_dl_b__40;
		r_numer__40 <=c_numer__40;
		r_z1__40 <=c_z1__40;
		r_z0__40 <=c_z0__40;
		r_mut__40 <=c_mut__40;
		
		//for 41
		r_x__41	<=c_x__41;
		r_y__41	<=c_y__41;
		r_z__41	<=c_z__41;
		r_ux__41	<=c_ux__41;
		r_uy__41	<=c_uy__41;
		r_uz__41	<=c_uz__41;
		r_sz__41	<=c_sz__41;
		r_sr__41	<=c_sr__41;
		r_sleftz__41	<=c_sleftz__41;
		r_sleftr__41	<=c_sleftr__41;
		r_weight__41	<=c_weight__41;
		r_layer__41	<=c_layer__41;
		r_dead__41	<=c_dead__41;
		r_hit__41	<=c_hit__41;
		r_diff__41 <=c_diff__41;
		r_dl_b__41 <=c_dl_b__41;
		r_numer__41 <=c_numer__41;
		r_z1__41 <=c_z1__41;
		r_z0__41 <=c_z0__41;
		r_mut__41 <=c_mut__41;
		
		//for 42
		r_x__42	<=c_x__42;
		r_y__42	<=c_y__42;
		r_z__42	<=c_z__42;
		r_ux__42	<=c_ux__42;
		r_uy__42	<=c_uy__42;
		r_uz__42	<=c_uz__42;
		r_sz__42	<=c_sz__42;
		r_sr__42	<=c_sr__42;
		r_sleftz__42	<=c_sleftz__42;
		r_sleftr__42	<=c_sleftr__42;
		r_weight__42	<=c_weight__42;
		r_layer__42	<=c_layer__42;
		r_dead__42	<=c_dead__42;
		r_hit__42	<=c_hit__42;
		r_diff__42 <=c_diff__42;
		r_dl_b__42 <=c_dl_b__42;
		r_numer__42 <=c_numer__42;
		r_z1__42 <=c_z1__42;
		r_z0__42 <=c_z0__42;
		r_mut__42 <=c_mut__42;
		
		//for 43
		r_x__43	<=c_x__43;
		r_y__43	<=c_y__43;
		r_z__43	<=c_z__43;
		r_ux__43	<=c_ux__43;
		r_uy__43	<=c_uy__43;
		r_uz__43	<=c_uz__43;
		r_sz__43	<=c_sz__43;
		r_sr__43	<=c_sr__43;
		r_sleftz__43	<=c_sleftz__43;
		r_sleftr__43	<=c_sleftr__43;
		r_weight__43	<=c_weight__43;
		r_layer__43	<=c_layer__43;
		r_dead__43	<=c_dead__43;
		r_hit__43	<=c_hit__43;
		r_diff__43 <=c_diff__43;
		r_dl_b__43 <=c_dl_b__43;
		r_numer__43 <=c_numer__43;
		r_z1__43 <=c_z1__43;
		r_z0__43 <=c_z0__43;
		r_mut__43 <=c_mut__43;
		
		//for 44
		r_x__44	<=c_x__44;
		r_y__44	<=c_y__44;
		r_z__44	<=c_z__44;
		r_ux__44	<=c_ux__44;
		r_uy__44	<=c_uy__44;
		r_uz__44	<=c_uz__44;
		r_sz__44	<=c_sz__44;
		r_sr__44	<=c_sr__44;
		r_sleftz__44	<=c_sleftz__44;
		r_sleftr__44	<=c_sleftr__44;
		r_weight__44	<=c_weight__44;
		r_layer__44	<=c_layer__44;
		r_dead__44	<=c_dead__44;
		r_hit__44	<=c_hit__44;
		r_diff__44 <=c_diff__44;
		r_dl_b__44 <=c_dl_b__44;
		r_numer__44 <=c_numer__44;
		r_z1__44 <=c_z1__44;
		r_z0__44 <=c_z0__44;
		r_mut__44 <=c_mut__44;
		
		//for 45
		r_x__45	<=c_x__45;
		r_y__45	<=c_y__45;
		r_z__45	<=c_z__45;
		r_ux__45	<=c_ux__45;
		r_uy__45	<=c_uy__45;
		r_uz__45	<=c_uz__45;
		r_sz__45	<=c_sz__45;
		r_sr__45	<=c_sr__45;
		r_sleftz__45	<=c_sleftz__45;
		r_sleftr__45	<=c_sleftr__45;
		r_weight__45	<=c_weight__45;
		r_layer__45	<=c_layer__45;
		r_dead__45	<=c_dead__45;
		r_hit__45	<=c_hit__45;
		r_diff__45 <=c_diff__45;
		r_dl_b__45 <=c_dl_b__45;
		r_numer__45 <=c_numer__45;
		r_z1__45 <=c_z1__45;
		r_z0__45 <=c_z0__45;
		r_mut__45 <=c_mut__45;
		
		//for 46
		r_x__46	<=c_x__46;
		r_y__46	<=c_y__46;
		r_z__46	<=c_z__46;
		r_ux__46	<=c_ux__46;
		r_uy__46	<=c_uy__46;
		r_uz__46	<=c_uz__46;
		r_sz__46	<=c_sz__46;
		r_sr__46	<=c_sr__46;
		r_sleftz__46	<=c_sleftz__46;
		r_sleftr__46	<=c_sleftr__46;
		r_weight__46	<=c_weight__46;
		r_layer__46	<=c_layer__46;
		r_dead__46	<=c_dead__46;
		r_hit__46	<=c_hit__46;
		r_diff__46 <=c_diff__46;
		r_dl_b__46 <=c_dl_b__46;
		r_numer__46 <=c_numer__46;
		r_z1__46 <=c_z1__46;
		r_z0__46 <=c_z0__46;
		r_mut__46 <=c_mut__46;
		
		//for 47
		r_x__47	<=c_x__47;
		r_y__47	<=c_y__47;
		r_z__47	<=c_z__47;
		r_ux__47	<=c_ux__47;
		r_uy__47	<=c_uy__47;
		r_uz__47	<=c_uz__47;
		r_sz__47	<=c_sz__47;
		r_sr__47	<=c_sr__47;
		r_sleftz__47	<=c_sleftz__47;
		r_sleftr__47	<=c_sleftr__47;
		r_weight__47	<=c_weight__47;
		r_layer__47	<=c_layer__47;
		r_dead__47	<=c_dead__47;
		r_hit__47	<=c_hit__47;
		r_diff__47 <=c_diff__47;
		r_dl_b__47 <=c_dl_b__47;
		r_numer__47 <=c_numer__47;
		r_z1__47 <=c_z1__47;
		r_z0__47 <=c_z0__47;
		r_mut__47 <=c_mut__47;
		
		//for 48
		r_x__48	<=c_x__48;
		r_y__48	<=c_y__48;
		r_z__48	<=c_z__48;
		r_ux__48	<=c_ux__48;
		r_uy__48	<=c_uy__48;
		r_uz__48	<=c_uz__48;
		r_sz__48	<=c_sz__48;
		r_sr__48	<=c_sr__48;
		r_sleftz__48	<=c_sleftz__48;
		r_sleftr__48	<=c_sleftr__48;
		r_weight__48	<=c_weight__48;
		r_layer__48	<=c_layer__48;
		r_dead__48	<=c_dead__48;
		r_hit__48	<=c_hit__48;
		r_diff__48 <=c_diff__48;
		r_dl_b__48 <=c_dl_b__48;
		r_numer__48 <=c_numer__48;
		r_z1__48 <=c_z1__48;
		r_z0__48 <=c_z0__48;
		r_mut__48 <=c_mut__48;
		
		//for 49
		r_x__49	<=c_x__49;
		r_y__49	<=c_y__49;
		r_z__49	<=c_z__49;
		r_ux__49	<=c_ux__49;
		r_uy__49	<=c_uy__49;
		r_uz__49	<=c_uz__49;
		r_sz__49	<=c_sz__49;
		r_sr__49	<=c_sr__49;
		r_sleftz__49	<=c_sleftz__49;
		r_sleftr__49	<=c_sleftr__49;
		r_weight__49	<=c_weight__49;
		r_layer__49	<=c_layer__49;
		r_dead__49	<=c_dead__49;
		r_hit__49	<=c_hit__49;
		r_diff__49 <=c_diff__49;
		r_dl_b__49 <=c_dl_b__49;
		r_numer__49 <=c_numer__49;
		r_z1__49 <=c_z1__49;
		r_z0__49 <=c_z0__49;
		r_mut__49 <=c_mut__49;
		
		//for 50
		r_x__50	<=c_x__50;
		r_y__50	<=c_y__50;
		r_z__50	<=c_z__50;
		r_ux__50	<=c_ux__50;
		r_uy__50	<=c_uy__50;
		r_uz__50	<=c_uz__50;
		r_sz__50	<=c_sz__50;
		r_sr__50	<=c_sr__50;
		r_sleftz__50	<=c_sleftz__50;
		r_sleftr__50	<=c_sleftr__50;
		r_weight__50	<=c_weight__50;
		r_layer__50	<=c_layer__50;
		r_dead__50	<=c_dead__50;
		r_hit__50	<=c_hit__50;
		r_diff__50 <=c_diff__50;
		r_dl_b__50 <=c_dl_b__50;
		r_numer__50 <=c_numer__50;
		r_z1__50 <=c_z1__50;
		r_z0__50 <=c_z0__50;
		r_mut__50 <=c_mut__50;
		
		//for 51
		r_x__51	<=c_x__51;
		r_y__51	<=c_y__51;
		r_z__51	<=c_z__51;
		r_ux__51	<=c_ux__51;
		r_uy__51	<=c_uy__51;
		r_uz__51	<=c_uz__51;
		r_sz__51	<=c_sz__51;
		r_sr__51	<=c_sr__51;
		r_sleftz__51	<=c_sleftz__51;
		r_sleftr__51	<=c_sleftr__51;
		r_weight__51	<=c_weight__51;
		r_layer__51	<=c_layer__51;
		r_dead__51	<=c_dead__51;
		r_hit__51	<=c_hit__51;
		r_diff__51 <=c_diff__51;
		r_dl_b__51 <=c_dl_b__51;
		r_numer__51 <=c_numer__51;
		r_z1__51 <=c_z1__51;
		r_z0__51 <=c_z0__51;
		r_mut__51 <=c_mut__51;
		
		//for 52
		r_x__52	<=c_x__52;
		r_y__52	<=c_y__52;
		r_z__52	<=c_z__52;
		r_ux__52	<=c_ux__52;
		r_uy__52	<=c_uy__52;
		r_uz__52	<=c_uz__52;
		r_sz__52	<=c_sz__52;
		r_sr__52	<=c_sr__52;
		r_sleftz__52	<=c_sleftz__52;
		r_sleftr__52	<=c_sleftr__52;
		r_weight__52	<=c_weight__52;
		r_layer__52	<=c_layer__52;
		r_dead__52	<=c_dead__52;
		r_hit__52	<=c_hit__52;
		r_diff__52 <=c_diff__52;
		r_dl_b__52 <=c_dl_b__52;
		r_numer__52 <=c_numer__52;
		r_z1__52 <=c_z1__52;
		r_z0__52 <=c_z0__52;
		r_mut__52 <=c_mut__52;
		
		//for 53
		r_x__53	<=c_x__53;
		r_y__53	<=c_y__53;
		r_z__53	<=c_z__53;
		r_ux__53	<=c_ux__53;
		r_uy__53	<=c_uy__53;
		r_uz__53	<=c_uz__53;
		r_sz__53	<=c_sz__53;
		r_sr__53	<=c_sr__53;
		r_sleftz__53	<=c_sleftz__53;
		r_sleftr__53	<=c_sleftr__53;
		r_weight__53	<=c_weight__53;
		r_layer__53	<=c_layer__53;
		r_dead__53	<=c_dead__53;
		r_hit__53	<=c_hit__53;
		r_diff__53 <=c_diff__53;
		r_dl_b__53 <=c_dl_b__53;
		r_numer__53 <=c_numer__53;
		r_z1__53 <=c_z1__53;
		r_z0__53 <=c_z0__53;
		r_mut__53 <=c_mut__53;
		
		//for 54
		r_x__54	<=c_x__54;
		r_y__54	<=c_y__54;
		r_z__54	<=c_z__54;
		r_ux__54	<=c_ux__54;
		r_uy__54	<=c_uy__54;
		r_uz__54	<=c_uz__54;
		r_sz__54	<=c_sz__54;
		r_sr__54	<=c_sr__54;
		r_sleftz__54	<=c_sleftz__54;
		r_sleftr__54	<=c_sleftr__54;
		r_weight__54	<=c_weight__54;
		r_layer__54	<=c_layer__54;
		r_dead__54	<=c_dead__54;
		r_hit__54	<=c_hit__54;
		r_diff__54 <=c_diff__54;
		r_dl_b__54 <=c_dl_b__54;
		r_numer__54 <=c_numer__54;
		r_z1__54 <=c_z1__54;
		r_z0__54 <=c_z0__54;
		r_mut__54 <=c_mut__54;
		
		//for 55
		r_x__55	<=c_x__55;
		r_y__55	<=c_y__55;
		r_z__55	<=c_z__55;
		r_ux__55	<=c_ux__55;
		r_uy__55	<=c_uy__55;
		r_uz__55	<=c_uz__55;
		r_sz__55	<=c_sz__55;
		r_sr__55	<=c_sr__55;
		r_sleftz__55	<=c_sleftz__55;
		r_sleftr__55	<=c_sleftr__55;
		r_weight__55	<=c_weight__55;
		r_layer__55	<=c_layer__55;
		r_dead__55	<=c_dead__55;
		r_hit__55	<=c_hit__55;
		r_diff__55 <=c_diff__55;
		r_dl_b__55 <=c_dl_b__55;
		r_numer__55 <=c_numer__55;
		r_z1__55 <=c_z1__55;
		r_z0__55 <=c_z0__55;
		r_mut__55 <=c_mut__55;
		
		//for 56
		r_x__56	<=c_x__56;
		r_y__56	<=c_y__56;
		r_z__56	<=c_z__56;
		r_ux__56	<=c_ux__56;
		r_uy__56	<=c_uy__56;
		r_uz__56	<=c_uz__56;
		r_sz__56	<=c_sz__56;
		r_sr__56	<=c_sr__56;
		r_sleftz__56	<=c_sleftz__56;
		r_sleftr__56	<=c_sleftr__56;
		r_weight__56	<=c_weight__56;
		r_layer__56	<=c_layer__56;
		r_dead__56	<=c_dead__56;
		r_hit__56	<=c_hit__56;
		r_diff__56 <=c_diff__56;
		r_dl_b__56 <=c_dl_b__56;
		r_numer__56 <=c_numer__56;
		r_z1__56 <=c_z1__56;
		r_z0__56 <=c_z0__56;
		r_mut__56 <=c_mut__56;
		
		//for 57
		r_x__57	<=c_x__57;
		r_y__57	<=c_y__57;
		r_z__57	<=c_z__57;
		r_ux__57	<=c_ux__57;
		r_uy__57	<=c_uy__57;
		r_uz__57	<=c_uz__57;
		r_sz__57	<=c_sz__57;
		r_sr__57	<=c_sr__57;
		r_sleftz__57	<=c_sleftz__57;
		r_sleftr__57	<=c_sleftr__57;
		r_weight__57	<=c_weight__57;
		r_layer__57	<=c_layer__57;
		r_dead__57	<=c_dead__57;
		r_hit__57	<=c_hit__57;
		r_diff__57 <=c_diff__57;
		r_dl_b__57 <=c_dl_b__57;
		r_numer__57 <=c_numer__57;
		r_z1__57 <=c_z1__57;
		r_z0__57 <=c_z0__57;
		r_mut__57 <=c_mut__57;
		
		//for 58
		r_x__58	<=c_x__58;
		r_y__58	<=c_y__58;
		r_z__58	<=c_z__58;
		r_ux__58	<=c_ux__58;
		r_uy__58	<=c_uy__58;
		r_uz__58	<=c_uz__58;
		r_sz__58	<=c_sz__58;
		r_sr__58	<=c_sr__58;
		r_sleftz__58	<=c_sleftz__58;
		r_sleftr__58	<=c_sleftr__58;
		r_weight__58	<=c_weight__58;
		r_layer__58	<=c_layer__58;
		r_dead__58	<=c_dead__58;
		r_hit__58	<=c_hit__58;
		r_diff__58 <=c_diff__58;
		r_dl_b__58 <=c_dl_b__58;
		r_numer__58 <=c_numer__58;
		r_z1__58 <=c_z1__58;
		r_z0__58 <=c_z0__58;
		r_mut__58 <=c_mut__58;
		
		//for 59
		r_x__59	<=c_x__59;
		r_y__59	<=c_y__59;
		r_z__59	<=c_z__59;
		r_ux__59	<=c_ux__59;
		r_uy__59	<=c_uy__59;
		r_uz__59	<=c_uz__59;
		r_sz__59	<=c_sz__59;
		r_sr__59	<=c_sr__59;
		r_sleftz__59	<=c_sleftz__59;
		r_sleftr__59	<=c_sleftr__59;
		r_weight__59	<=c_weight__59;
		r_layer__59	<=c_layer__59;
		r_dead__59	<=c_dead__59;
		r_hit__59	<=c_hit__59;
		r_diff__59 <=c_diff__59;
		r_dl_b__59 <=c_dl_b__59;
		r_numer__59 <=c_numer__59;
		r_z1__59 <=c_z1__59;
		r_z0__59 <=c_z0__59;
		r_mut__59 <=c_mut__59;
		
		end
	end
end

endmodule
module mult_signed_32_bc ( clock, dataa, datab, result);


	input clock;
	input [31:0] dataa;
	input [31:0] datab;
	output [63:0] result;
	reg [63:0] result;
	
	wire [63:0] prelim_result;
	
	
	wire [31:0] opa;
	wire [31:0] opb;
	wire [31:0] opa_comp;
	wire [31:0] opb_comp;
	
	assign opa_comp =  ((~dataa) + 32'b00000000000000000000000000000001);

	assign opb_comp =  ((~datab) + 32'b00000000000000000000000000000001);

	
	wire opa_is_neg;
	wire opb_is_neg;
	assign opa_is_neg = dataa[31];
	assign opb_is_neg = datab [31];
	assign opa = (opa_is_neg== 1'b1) ? opa_comp:dataa;
	assign opb = (opb_is_neg == 1'b1) ? opb_comp:datab;
	
	
	assign prelim_result = opa * opb ;
	wire sign;
	assign sign = dataa[31] ^ datab[31];
	
	wire [63:0] prelim_result_comp;
	wire [63:0] prelim_result_changed;
	wire [63:0] result_changed;
	assign result_changed = (sign==1'b1)? prelim_result_comp :prelim_result;
	assign prelim_result_comp =  ((~prelim_result) + 1);
	
	always @ (posedge clock)
	begin
	result <= result_changed;
	end
	
	endmodule
module signed_div_30 (clock , denom , numer, quotient, remain);

input clock;

input [31:0] denom;

input [63:0] numer;

output [63:0] quotient;

output [31:0] remain;

Div_64b div_replace (.clock(clock), .denom(denom), .numer(numer), .quotient(quotient), .remain(remain));

endmodule 

module Div_64b (clock, denom, numer, quotient, remain);
	input clock;
	input [63:0]numer;
	input [31:0]denom;
	output [63:0]quotient;
	reg [63:0]quotient;
	output [31:0]remain;
	reg [31:0]remain;
	
	wire [63:0]quotient_temp;
	wire [31:0]remain_temp;
	Div_64b_unsigned div_temp(.clock(clock), .denom_(denom), .numer_(numer), .quotient(quotient_temp), .remain(remain_temp));
	
	always @ (numer or denom or quotient_temp or remain_temp) begin
		if ( numer[63]^denom[31] ) begin // only one is negative
			quotient = -quotient_temp;
			remain = -remain_temp;
		end else begin
			quotient = quotient_temp;
			remain = remain_temp;
		end
	end 
	
endmodule
module Div_64b_unsigned (clock, denom_, numer_, quotient, remain);
	input clock;
	input [63:0]numer_;
	input [31:0]denom_;
	output [63:0]quotient;
	output [31:0]remain;

	reg [63:0]numer;
	reg [31:0]denom0;
	
	always @ (posedge clock) 
	begin
		numer <= numer_;
		denom0 <= denom_;
	end

///////////////////////////////////////////////////Unchanged starts here	
	reg [94:0]numer_temp_63; //need to add bits
	reg [94:0]numer_temp_62;
	reg [94:0]numer_temp_61;
	reg [94:0]numer_temp_60_d, numer_temp_60_q;
	reg [94:0]numer_temp_59;
	reg [94:0]numer_temp_58;
	reg [94:0]numer_temp_57_d, numer_temp_57_q;
	reg [94:0]numer_temp_56;
	reg [94:0]numer_temp_55;
	reg [94:0]numer_temp_54_d, numer_temp_54_q;
	reg [94:0]numer_temp_53;
	reg [94:0]numer_temp_52;
	reg [94:0]numer_temp_51_d, numer_temp_51_q;
	reg [94:0]numer_temp_50;
	reg [94:0]numer_temp_49;
	reg [94:0]numer_temp_48_d, numer_temp_48_q;
	reg [94:0]numer_temp_47;
	reg [94:0]numer_temp_46;
	reg [94:0]numer_temp_45_d, numer_temp_45_q;
	reg [94:0]numer_temp_44;
	reg [94:0]numer_temp_43;
	reg [94:0]numer_temp_42_d, numer_temp_42_q;
	reg [94:0]numer_temp_41;
	reg [94:0]numer_temp_40;
	reg [94:0]numer_temp_39_d, numer_temp_39_q;
	reg [94:0]numer_temp_38;
	reg [94:0]numer_temp_37;
	reg [94:0]numer_temp_36_d, numer_temp_36_q;
	reg [94:0]numer_temp_35;
	reg [94:0]numer_temp_34;
	reg [94:0]numer_temp_33_d, numer_temp_33_q;
	reg [94:0]numer_temp_32;
	reg [94:0]numer_temp_31;
	reg [94:0]numer_temp_30_d, numer_temp_30_q;
	reg [94:0]numer_temp_29;
	reg [94:0]numer_temp_28;
	reg [94:0]numer_temp_27_d, numer_temp_27_q;
	reg [94:0]numer_temp_26;
	reg [94:0]numer_temp_25;
	reg [94:0]numer_temp_24;
	reg [94:0]numer_temp_23_d, numer_temp_23_q;
	reg [94:0]numer_temp_22;
	reg [94:0]numer_temp_21;
	reg [94:0]numer_temp_20;
	reg [94:0]numer_temp_19_d, numer_temp_19_q;
	reg [94:0]numer_temp_18;
	reg [94:0]numer_temp_17;
	reg [94:0]numer_temp_16;
	reg [94:0]numer_temp_15_d, numer_temp_15_q;
	reg [94:0]numer_temp_14;
	reg [94:0]numer_temp_13;
	reg [94:0]numer_temp_12;
	reg [94:0]numer_temp_11_d, numer_temp_11_q;
	reg [94:0]numer_temp_10;
	reg [94:0]numer_temp_9;
	reg [94:0]numer_temp_8;
	reg [94:0]numer_temp_7_d, numer_temp_7_q;
	reg [94:0]numer_temp_6;
	reg [94:0]numer_temp_5;
	reg [94:0]numer_temp_4;
	reg [94:0]numer_temp_3_d, numer_temp_3_q;
	reg [94:0]numer_temp_2;
	reg [94:0]numer_temp_1_d, numer_temp_1_q;
	reg [94:0]numer_temp_0;
	reg [94:0]numer_temp;

		//The dummy pipeline (20 clock cycles)
	reg [63:0]quo0_d;
	reg [63:0]quo1_d;
	reg [63:0]quo2_d;
	reg [63:0]quo3_d;
	reg [63:0]quo4_d;
	reg [63:0]quo5_d;
	reg [63:0]quo6_d;
	reg [63:0]quo7_d;
	reg [63:0]quo8_d;
	reg [63:0]quo9_d;
	reg [63:0]quo10_d;
	reg [63:0]quo11_d;
	reg [63:0]quo12_d;
	reg [63:0]quo13_d;
	reg [63:0]quo14_d;
	reg [63:0]quo15_d;
	reg [63:0]quo16_d;
	reg [63:0]quo17_d;
	reg [63:0]quo18_d;
	reg [63:0]quo19_d;
	
	reg [63:0]quo0_q;
	reg [63:0]quo1_q;
	reg [63:0]quo2_q;
	reg [63:0]quo3_q;
	reg [63:0]quo4_q;
	reg [63:0]quo5_q;
	reg [63:0]quo6_q;
	reg [63:0]quo7_q;
	reg [63:0]quo8_q;
	reg [63:0]quo9_q;
	reg [63:0]quo10_q;
	reg [63:0]quo11_q;
	reg [63:0]quo12_q;
	reg [63:0]quo13_q;
	reg [63:0]quo14_q;
	reg [63:0]quo15_q;
	reg [63:0]quo16_q;
	reg [63:0]quo17_q;
	reg [63:0]quo18_q;
	
	reg [31:0]denom1;
	reg [31:0]denom2;
	reg [31:0]denom3;	
	reg [31:0]denom4;
	reg [31:0]denom5;	
	reg [31:0]denom6;
	reg [31:0]denom7;	
	reg [31:0]denom8;
	reg [31:0]denom9;	
	reg [31:0]denom10;
	reg [31:0]denom11;	
	reg [31:0]denom12;
	reg [31:0]denom13;	
	reg [31:0]denom14;
	reg [31:0]denom15;	
	reg [31:0]denom16;
	reg [31:0]denom17;	
	reg [31:0]denom18;
	reg [31:0]denom19;
	
	
	always @(numer or denom0) begin
		numer_temp_63 = {31'b0, numer};
		
		//quo0[63]
		if (numer_temp_63[94:63] >= denom0 ) begin
			quo0_d[63] = 1'b1;
			numer_temp_62 = {numer_temp_63[94:63] - denom0, numer_temp_63[62:0]};
		end else begin
			quo0_d[63] = 1'b0;
			numer_temp_62 = numer_temp_63;
		end
		
		//quo0[62]
		if (numer_temp_62[94:62] >= denom0 ) begin
			quo0_d[62] = 1'b1;
			numer_temp_61 = {numer_temp_62[94:62] - denom0, numer_temp_62[61:0]};
		end else begin
			quo0_d[62] = 1'b0;
           numer_temp_61 = numer_temp_62;
		end
		//quo0[61]
		if (numer_temp_61[94:61] >= denom0 ) begin
			quo0_d[61] = 1'b1;
			numer_temp_60_d = {numer_temp_61[94:61] - denom0, numer_temp_61[60:0]};
		end else begin
			quo0_d[61] = 1'b0;
           numer_temp_60_d = numer_temp_61;
		end
		quo0_d[60:0] = 61'b0;
	end
	
	always @ (posedge clock) begin
		quo0_q <= quo0_d;
		numer_temp_60_q <= numer_temp_60_d;
		denom1 <= denom0;
	end
		
	always @(numer_temp_60_q or denom1 or quo0_q) begin
		quo1_d[63:61] = quo0_q[63:61];
	
		//quo1_d[60]
		if (numer_temp_60_q[94:60] >= denom1 ) begin
			quo1_d[60] = 1'b1;
			numer_temp_59 = {numer_temp_60_q[94:60] - denom1, numer_temp_60_q[59:0]};
		end else begin
			quo1_d[60] = 1'b0;
           numer_temp_59 = numer_temp_60_q;
		end
		//quo1_d[59]
		if (numer_temp_59[94:59] >= denom1 ) begin
			quo1_d[59] = 1'b1;
			numer_temp_58 = {numer_temp_59[94:59] - denom1, numer_temp_59[58:0]};
		end else begin
			quo1_d[59] = 1'b0;
           numer_temp_58 = numer_temp_59;
		end
		//quo1_d[58]
		if (numer_temp_58[94:58] >= denom1 ) begin
			quo1_d[58] = 1'b1;
			numer_temp_57_d = {numer_temp_58[94:58] - denom1, numer_temp_58[57:0]};
		end else begin
			quo1_d[58] = 1'b0;
           numer_temp_57_d = numer_temp_58;
		end
		quo1_d[57:0] = 58'b0;
	end

	always @ (posedge clock) begin
		quo1_q <= quo1_d;
		numer_temp_57_q <= numer_temp_57_d;
		denom2 <= denom1;
	end
		
	always @ (numer_temp_57_q or denom2 or quo1_q) begin
		quo2_d[63:58] = quo1_q[63:58];
	
		//quo2_d[57]
		if (numer_temp_57_q[94:57] >= denom2 ) begin
			quo2_d[57] = 1'b1;
			numer_temp_56 = {numer_temp_57_q[94:57] - denom2, numer_temp_57_q[56:0]};
		end else begin
			quo2_d[57] = 1'b0;
           numer_temp_56 = numer_temp_57_q;
		end
		//quo2_d[56]
		if (numer_temp_56[94:56] >= denom2 ) begin
			quo2_d[56] = 1'b1;
			numer_temp_55 = {numer_temp_56[94:56] - denom2, numer_temp_56[55:0]};
		end else begin
			quo2_d[56] = 1'b0;
           numer_temp_55 = numer_temp_56;
		end
		//quo2_d[55]
		if (numer_temp_55[94:55] >= denom2 ) begin
			quo2_d[55] = 1'b1;
			numer_temp_54_d = {numer_temp_55[94:55] - denom2, numer_temp_55[54:0]};
		end else begin
			quo2_d[55] = 1'b0;
           numer_temp_54_d = numer_temp_55;
		end
		quo2_d[54:0] = 55'b0;
	end
	
	
	always @ (posedge clock) begin
		quo2_q <= quo2_d;
		numer_temp_54_q <= numer_temp_54_d;
		denom3 <= denom2;
	end
	
	always @ (numer_temp_54_q or denom3 or quo2_q) begin
		quo3_d[63:55] = quo2_q[63:55];
	
		//quo3_d[54]
		if (numer_temp_54_q[94:54] >= denom3 ) begin
			quo3_d[54] = 1'b1;
			numer_temp_53 = {numer_temp_54_q[94:54] - denom3, numer_temp_54_q[53:0]};
		end else begin
			quo3_d[54] = 1'b0;
           numer_temp_53 = numer_temp_54_q;
		end
		//quo3_d[53]
		if (numer_temp_53[94:53] >= denom3 ) begin
			quo3_d[53] = 1'b1;
			numer_temp_52 = {numer_temp_53[94:53] - denom3, numer_temp_53[52:0]};
		end else begin
			quo3_d[53] = 1'b0;
           numer_temp_52 = numer_temp_53;
		end
		//quo3_d[52]
		if (numer_temp_52[94:52] >= denom3 ) begin
			quo3_d[52] = 1'b1;
			numer_temp_51_d = {numer_temp_52[94:52] - denom3, numer_temp_52[51:0]};
		end else begin
			quo3_d[52] = 1'b0;
           numer_temp_51_d = numer_temp_52;
		end
		quo3_d[51:0] = 52'b0;
	end
		
	always @ (posedge clock) begin
		quo3_q <= quo3_d;
		numer_temp_51_q <= numer_temp_51_d;
		denom4 <= denom3;
	end
		
	always @ (numer_temp_51_q or denom4 or quo3_q) begin
		quo4_d[63:52] = quo3_q[63:52];
	
		//quo4[51]
		if (numer_temp_51_q[94:51] >= denom4 ) begin
			quo4_d[51] = 1'b1;
			numer_temp_50 = {numer_temp_51_q[94:51] - denom4, numer_temp_51_q[50:0]};
		end else begin
			quo4_d[51] = 1'b0;
           numer_temp_50 = numer_temp_51_q;
		end
		//quo4_d[50]
		if (numer_temp_50[94:50] >= denom4 ) begin
			quo4_d[50] = 1'b1;
			numer_temp_49 = {numer_temp_50[94:50] - denom4, numer_temp_50[49:0]};
		end else begin
			quo4_d[50] = 1'b0;
           numer_temp_49 = numer_temp_50;
		end
		//quo4_d[49]
		if (numer_temp_49[94:49] >= denom4 ) begin
			quo4_d[49] = 1'b1;
			numer_temp_48_d = {numer_temp_49[94:49] - denom4, numer_temp_49[48:0]};
		end else begin
			quo4_d[49] = 1'b0;
           numer_temp_48_d = numer_temp_49;
		end
		quo4_d[48:0] = 49'b0;
	end
		
	always @ (posedge clock) begin
		quo4_q <= quo4_d;
		numer_temp_48_q <= numer_temp_48_d;
		denom5 <= denom4;
	end
		
	always @ (numer_temp_48_q or denom5 or quo4_q) begin
		quo5_d[63:49] = quo4_q[63:49];

	//quo5_d[48]
		if (numer_temp_48_q[94:48] >= denom5 ) begin
			quo5_d[48] = 1'b1;
			numer_temp_47 = {numer_temp_48_q[94:48] - denom5, numer_temp_48_q[47:0]};
		end else begin
			quo5_d[48] = 1'b0;
           numer_temp_47 = numer_temp_48_q;
		end
		//quo5_d[47]
		if (numer_temp_47[94:47] >= denom5 ) begin
			quo5_d[47] = 1'b1;
			numer_temp_46 = {numer_temp_47[94:47] - denom5, numer_temp_47[46:0]};
		end else begin
			quo5_d[47] = 1'b0;
           numer_temp_46 = numer_temp_47;
		end
		//quo5_d[46]
		if (numer_temp_46[94:46] >= denom5 ) begin
			quo5_d[46] = 1'b1;
			numer_temp_45_d = {numer_temp_46[94:46] - denom5, numer_temp_46[45:0]};
		end else begin
			quo5_d[46] = 1'b0;
           numer_temp_45_d = numer_temp_46;
		end
		quo5_d[45:0] = 46'b0;
	end
		
	always @ (posedge clock) begin
		quo5_q <= quo5_d;
		numer_temp_45_q <= numer_temp_45_d;
		denom6 <= denom5;
	end
		
	always @ (numer_temp_45_q or denom6 or quo5_q) begin
		quo6_d[63:46] = quo5_q[63:46];
	
		//quo6_d[45]
		if (numer_temp_45_q[94:45] >= denom6 ) begin
			quo6_d[45] = 1'b1;
			numer_temp_44 = {numer_temp_45_q[94:45] - denom6, numer_temp_45_q[44:0]};
		end else begin
			quo6_d[45] = 1'b0;
           numer_temp_44 = numer_temp_45_q;
		end
		//quo6_d[44]
		if (numer_temp_44[94:44] >= denom6 ) begin
			quo6_d[44] = 1'b1;
			numer_temp_43 = {numer_temp_44[94:44] - denom6, numer_temp_44[43:0]};
		end else begin
			quo6_d[44] = 1'b0;
           numer_temp_43 = numer_temp_44;
		end
		//quo6_d[43]
		if (numer_temp_43[94:43] >= denom6 ) begin
			quo6_d[43] = 1'b1;
			numer_temp_42_d = {numer_temp_43[94:43] - denom6, numer_temp_43[42:0]};
		end else begin
			quo6_d[43] = 1'b0;
           numer_temp_42_d = numer_temp_43;
		end
		quo6_d[42:0] = 43'b0;
	end
	
	always @ (posedge clock) begin
		quo6_q<= quo6_d;
		numer_temp_42_q <= numer_temp_42_d;
		denom7 <= denom6;
	end
	
	always @ (numer_temp_42_q or denom7 or quo6_q) begin
		quo7_d[63:43] = quo6_q[63:43];
	
		//quo7_d[42]
		if (numer_temp_42_q[94:42] >= denom7 ) begin
			quo7_d[42] = 1'b1;
			numer_temp_41 = {numer_temp_42_q[94:42] - denom7, numer_temp_42_q[41:0]};
		end else begin
			quo7_d[42] = 1'b0;
           numer_temp_41 = numer_temp_42_q;
		end
		//quo7_d[41]
		if (numer_temp_41[94:41] >= denom7 ) begin
			quo7_d[41] = 1'b1;
			numer_temp_40 = {numer_temp_41[94:41] - denom7, numer_temp_41[40:0]};
		end else begin
			quo7_d[41] = 1'b0;
           numer_temp_40 = numer_temp_41;
		end
		//quo7_d[40]
		if (numer_temp_40[94:40] >= denom7 ) begin
			quo7_d[40] = 1'b1;
			numer_temp_39_d = {numer_temp_40[94:40] - denom7, numer_temp_40[39:0]};
		end else begin
			quo7_d[40] = 1'b0;
           numer_temp_39_d = numer_temp_40;
		end
		quo7_d[39:0] = 40'b0;
	end
		
	always @ (posedge clock) begin
		quo7_q <= quo7_d;
		numer_temp_39_q <= numer_temp_39_d;
		denom8 <= denom7;
	end
		
	always @ (numer_temp_39_q or denom8 or quo7_q) begin
		quo8_d[63:40] = quo7_q[63:40];
	
		//quo8[39]
		if (numer_temp_39_q[94:39] >= denom8 ) begin
			quo8_d[39] = 1'b1;
			numer_temp_38 = {numer_temp_39_q[94:39] - denom8, numer_temp_39_q[38:0]};
		end else begin
			quo8_d[39] = 1'b0;
           numer_temp_38 = numer_temp_39_q;
		end
		//quo8_d[38]
		if (numer_temp_38[94:38] >= denom8 ) begin
			quo8_d[38] = 1'b1;
			numer_temp_37 = {numer_temp_38[94:38] - denom8, numer_temp_38[37:0]};
		end else begin
			quo8_d[38] = 1'b0;
           numer_temp_37 = numer_temp_38;
		end
		//quo8_d[37]
		if (numer_temp_37[94:37] >= denom8 ) begin
			quo8_d[37] = 1'b1;
			numer_temp_36_d = {numer_temp_37[94:37] - denom8, numer_temp_37[36:0]};
		end else begin
			quo8_d[37] = 1'b0;
           numer_temp_36_d = numer_temp_37;
		end
		quo8_d[36:0] = 37'b0;
	end
		
	always @ (posedge clock) begin
		quo8_q <= quo8_d;
		numer_temp_36_q <= numer_temp_36_d;
		denom9 <= denom8;
	end
		
	always @ (numer_temp_36_q or denom9 or quo8_q) begin
		quo9_d[63:37] = quo8_q[63:37];
	
		//quo9[36]
		if (numer_temp_36_q[94:36] >= denom9 ) begin
			quo9_d[36] = 1'b1;
			numer_temp_35 = {numer_temp_36_q[94:36] - denom9, numer_temp_36_q[35:0]};
		end else begin
			quo9_d[36] = 1'b0;
           numer_temp_35 = numer_temp_36_q;
		end
		//quo9_d[35]
		if (numer_temp_35[94:35] >= denom9 ) begin
			quo9_d[35] = 1'b1;
			numer_temp_34 = {numer_temp_35[94:35] - denom9, numer_temp_35[34:0]};
		end else begin
			quo9_d[35] = 1'b0;
           numer_temp_34 = numer_temp_35;
		end
		//quo9_d[34]
		if (numer_temp_34[94:34] >= denom9 ) begin
			quo9_d[34] = 1'b1;
			numer_temp_33_d = {numer_temp_34[94:34] - denom9, numer_temp_34[33:0]};
		end else begin
			quo9_d[34] = 1'b0;
           numer_temp_33_d = numer_temp_34;
		end
		quo9_d[33:0] = 34'b0;
	end
		
	always @ (posedge clock) begin
		quo9_q <= quo9_d;
		numer_temp_33_q <= numer_temp_33_d;
		denom10 <= denom9;
	end
		
	always @ (numer_temp_33_q or denom10 or quo9_q) begin
		quo10_d[63:34] = quo9_q[63:34];
	
		//quo10_d[33]
		if (numer_temp_33_q[94:33] >= denom10 ) begin
			quo10_d[33] = 1'b1;
			numer_temp_32 = {numer_temp_33_q[94:33] - denom10, numer_temp_33_q[32:0]};
		end else begin
			quo10_d[33] = 1'b0;
           numer_temp_32 = numer_temp_33_q;
		end
		//quo10_d[32]
		if (numer_temp_32[94:32] >= denom10 ) begin
			quo10_d[32] = 1'b1;
			numer_temp_31 = {numer_temp_32[94:32] - denom10, numer_temp_32[31:0]};
		end else begin
			quo10_d[32] = 1'b0;
           numer_temp_31 = numer_temp_32;
		end
		//quo10_d[31]
		if (numer_temp_31[94:31] >= denom10 ) begin
			quo10_d[31] = 1'b1;
			numer_temp_30_d = {numer_temp_31[94:31] - denom10, numer_temp_31[30:0]};
		end else begin
			quo10_d[31] = 1'b0;
           numer_temp_30_d = numer_temp_31;
		end
		quo10_d[30:0] = 31'b0;
	end
	
	always @ (posedge clock) begin
		quo10_q <= quo10_d;
		numer_temp_30_q <= numer_temp_30_d;
		denom11 <= denom10;
	end
		
	always @ (numer_temp_30_q or denom11 or quo10_q) begin 
		quo11_d[63:31] = quo10_q[63:31];
	
		//quo11[30]
		if (numer_temp_30_q[94:30] >= denom11 ) begin
			quo11_d[30] = 1'b1;
			numer_temp_29 = {numer_temp_30_q[94:30] - denom11, numer_temp_30_q[29:0]};
		end else begin
			quo11_d[30] = 1'b0;
           numer_temp_29 = numer_temp_30_q;
		end
		//quo11_d[29]
		if (numer_temp_29[94:29] >= denom11 ) begin
			quo11_d[29] = 1'b1;
			numer_temp_28 = {numer_temp_29[94:29] - denom11, numer_temp_29[28:0]};
		end else begin
			quo11_d[29] = 1'b0;
           numer_temp_28 = numer_temp_29;
		end
		//quo11_d[28]
		if (numer_temp_28[94:28] >= denom11 ) begin
			quo11_d[28] = 1'b1;
			numer_temp_27_d = {numer_temp_28[94:28] - denom11, numer_temp_28[27:0]};
		end else begin
			quo11_d[28] = 1'b0;
           numer_temp_27_d = numer_temp_28;
		end
		quo11_d[27:0] = 28'b0;
	end
		
	always @ (posedge clock) begin
		quo11_q <= quo11_d;
		numer_temp_27_q <= numer_temp_27_d;
		denom12 <= denom11;
	end
	
	always @ (numer_temp_27_q or denom12 or quo11_q) begin
		quo12_d[63:28] = quo11_q[63:28];
	
		//quo12[27]
		if (numer_temp_27_q[94:27] >= denom12 ) begin
			quo12_d[27] = 1'b1;
			numer_temp_26 = {numer_temp_27_q[94:27] - denom12, numer_temp_27_q[26:0]};
		end else begin
			quo12_d[27] = 1'b0;
           numer_temp_26 = numer_temp_27_q;
		end
		//quo12_d[26]
		if (numer_temp_26[94:26] >= denom12 ) begin
			quo12_d[26] = 1'b1;
			numer_temp_25 = {numer_temp_26[94:26] - denom12, numer_temp_26[25:0]};
		end else begin
			quo12_d[26] = 1'b0;
           numer_temp_25 = numer_temp_26;
		end
		//quo12_d[25]
		if (numer_temp_25[94:25] >= denom12 ) begin
			quo12_d[25] = 1'b1;
			numer_temp_24 = {numer_temp_25[94:25] - denom12, numer_temp_25[24:0]};
		end else begin
			quo12_d[25] = 1'b0;
           numer_temp_24 = numer_temp_25;
		end
		//quo12_d[24]
		if (numer_temp_24[94:24] >= denom12 ) begin
			quo12_d[24] = 1'b1;
			numer_temp_23_d = {numer_temp_24[94:24] - denom12, numer_temp_24[23:0]};
		end else begin
			quo12_d[24] = 1'b0;
           numer_temp_23_d = numer_temp_24;
		end
		quo12_d[23:0] = 24'b0;
	end
		
	always @ (posedge clock) begin
		quo12_q <= quo12_d;
		numer_temp_23_q <= numer_temp_23_d;
		denom13 <= denom12;
	end
	
	always @ (numer_temp_23_q or denom13 or quo12_q) begin
		quo13_d[63:24] = quo12_q[63:24];
	
		//quo13_d[23]
		if (numer_temp_23_q[94:23] >= denom13 ) begin
			quo13_d[23] = 1'b1;
			numer_temp_22 = {numer_temp_23_q[94:23] - denom13, numer_temp_23_q[22:0]};
		end else begin
			quo13_d[23] = 1'b0;
           numer_temp_22 = numer_temp_23_q;
		end
		//quo13_d[22]
		if (numer_temp_22[94:22] >= denom13 ) begin
			quo13_d[22] = 1'b1;
			numer_temp_21 = {numer_temp_22[94:22] - denom13, numer_temp_22[21:0]};
		end else begin
			quo13_d[22] = 1'b0;
           numer_temp_21 = numer_temp_22;
		end
		//quo13_d[21]
		if (numer_temp_21[94:21] >= denom13 ) begin
			quo13_d[21] = 1'b1;
			numer_temp_20 = {numer_temp_21[94:21] - denom13, numer_temp_21[20:0]};
		end else begin
			quo13_d[21] = 1'b0;
           numer_temp_20 = numer_temp_21;
		end
		//quo13_d[20]
		if (numer_temp_20[94:20] >= denom13 ) begin
			quo13_d[20] = 1'b1;
			numer_temp_19_d = {numer_temp_20[94:20] - denom13, numer_temp_20[19:0]};
		end else begin
			quo13_d[20] = 1'b0;
           numer_temp_19_d = numer_temp_20;
		end
		quo13_d[19:0] = 20'b0;
	end
	
	always @ (posedge clock) begin
		quo13_q <= quo13_d;
		numer_temp_19_q <= numer_temp_19_d;
		denom14 <= denom13;
	end
		
	always @ (numer_temp_19_q or denom14 or quo13_q) begin
		quo14_d[63:20] = quo13_q[63:20];
	
		//quo14_d[19]
		if (numer_temp_19_q[94:19] >= denom14 ) begin
			quo14_d[19] = 1'b1;
			numer_temp_18 = {numer_temp_19_q[94:19] - denom14, numer_temp_19_q[18:0]};
		end else begin
			quo14_d[19] = 1'b0;
           numer_temp_18 = numer_temp_19_q;
		end
		//quo14_d[18]
		if (numer_temp_18[94:18] >= denom14 ) begin
			quo14_d[18] = 1'b1;
			numer_temp_17 = {numer_temp_18[94:18] - denom14, numer_temp_18[17:0]};
		end else begin
			quo14_d[18] = 1'b0;
           numer_temp_17 = numer_temp_18;
		end
		//quo14_d[17]
		if (numer_temp_17[94:17] >= denom14 ) begin
			quo14_d[17] = 1'b1;
			numer_temp_16 = {numer_temp_17[94:17] - denom14, numer_temp_17[16:0]};
		end else begin
			quo14_d[17] = 1'b0;
           numer_temp_16 = numer_temp_17;
		end
		//quo14_d[16]
		if (numer_temp_16[94:16] >= denom14 ) begin
			quo14_d[16] = 1'b1;
			numer_temp_15_d = {numer_temp_16[94:16] - denom14, numer_temp_16[15:0]};
		end else begin
			quo14_d[16] = 1'b0;
           numer_temp_15_d = numer_temp_16;
		end
		quo14_d[15:0] = 16'b0;
	end
		
	always @ (posedge clock) begin
		quo14_q <= quo14_d;
		numer_temp_15_q <= numer_temp_15_d;
		denom15 <= denom14;
	end
		
	always @ (numer_temp_15_q or denom15 or quo14_q) begin
		quo15_d[63:16] = quo14_q[63:16];
	
		//quo15_d[15]
		if (numer_temp_15_q[94:15] >= denom15 ) begin
			quo15_d[15] = 1'b1;
			numer_temp_14 = {numer_temp_15_q[94:15] - denom15, numer_temp_15_q[14:0]};
		end else begin
			quo15_d[15] = 1'b0;
           numer_temp_14 = numer_temp_15_q;
		end
		//quo15_d[14]
		if (numer_temp_14[94:14] >= denom15 ) begin
			quo15_d[14] = 1'b1;
			numer_temp_13 = {numer_temp_14[94:14] - denom15, numer_temp_14[13:0]};
		end else begin
			quo15_d[14] = 1'b0;
           numer_temp_13 = numer_temp_14;
		end
		//quo15_d[13]
		if (numer_temp_13[94:13] >= denom15 ) begin
			quo15_d[13] = 1'b1;
			numer_temp_12 = {numer_temp_13[94:13] - denom15, numer_temp_13[12:0]};
		end else begin
			quo15_d[13] = 1'b0;
           numer_temp_12 = numer_temp_13;
		end
		//quo15_d[12]
		if (numer_temp_12[94:12] >= denom15 ) begin
			quo15_d[12] = 1'b1;
			numer_temp_11_d = {numer_temp_12[94:12] - denom15, numer_temp_12[11:0]};
		end else begin
			quo15_d[12] = 1'b0;
           numer_temp_11_d = numer_temp_12;
		end
		quo15_d[11:0] = 12'b0;
	end
		
	always @ (posedge clock) begin
		quo15_q <= quo15_d;
		numer_temp_11_q <= numer_temp_11_d;
		denom16 <= denom15;
	end
		
	always @ (numer_temp_11_q or denom16 or quo15_q) begin
		quo16_d[63:12] = quo15_q[63:12];
	
		//quo16_d[11]
		if (numer_temp_11_q[94:11] >= denom16 ) begin
			quo16_d[11] = 1'b1;
			numer_temp_10 = {numer_temp_11_q[94:11] - denom16, numer_temp_11_q[10:0]};
		end else begin
			quo16_d[11] = 1'b0;
           numer_temp_10 = numer_temp_11_q;
		end
		//quo16_d[10]
		if (numer_temp_10[94:10] >= denom16 ) begin
			quo16_d[10] = 1'b1;
			numer_temp_9 = {numer_temp_10[94:10] - denom16, numer_temp_10[9:0]};
		end else begin
			quo16_d[10] = 1'b0;
           numer_temp_9 = numer_temp_10;
		end
		//quo16_d[9]
		if (numer_temp_9[94:9] >= denom16 ) begin
			quo16_d[9] = 1'b1;
			numer_temp_8 = {numer_temp_9[94:9] - denom16, numer_temp_9[8:0]};
		end else begin
			quo16_d[9] = 1'b0;
           numer_temp_8 = numer_temp_9;
		end
		//quo16_d[8]
		if (numer_temp_8[94:8] >= denom16 ) begin
			quo16_d[8] = 1'b1;
			numer_temp_7_d = {numer_temp_8[94:8] - denom16, numer_temp_8[7:0]};
		end else begin
			quo16_d[8] = 1'b0;
           numer_temp_7_d = numer_temp_8;
		end
		quo16_d[7:0] = 8'b0;
	end
	
	always @ (posedge clock) begin
		quo16_q <= quo16_d;
		numer_temp_7_q <= numer_temp_7_d;
		denom17 <= denom16;
	end
		
	always @ (numer_temp_7_q or denom17 or quo16_q) begin
		quo17_d[63:8] = quo16_q[63:8];
	
		//quo17_d[7]
		if (numer_temp_7_q[94:7] >= denom17 ) begin
			quo17_d[7] = 1'b1;
			numer_temp_6 = {numer_temp_7_q[94:7] - denom17, numer_temp_7_q[6:0]};
		end else begin
			quo17_d[7] = 1'b0;
           numer_temp_6 = numer_temp_7_q;
		end
		//quo17_d[6]
		if (numer_temp_6[94:6] >= denom17 ) begin
			quo17_d[6] = 1'b1;
			numer_temp_5 = {numer_temp_6[94:6] - denom17, numer_temp_6[5:0]};
		end else begin
			quo17_d[6] = 1'b0;
           numer_temp_5 = numer_temp_6;
		end
		//quo17_d[5]
		if (numer_temp_5[94:5] >= denom17 ) begin
			quo17_d[5] = 1'b1;
			numer_temp_4 = {numer_temp_5[94:5] - denom17, numer_temp_5[4:0]};
		end else begin
			quo17_d[5] = 1'b0;
           numer_temp_4 = numer_temp_5;
		end
		//quo17_d[4]
		if (numer_temp_4[94:4] >= denom17 ) begin
			quo17_d[4] = 1'b1;
			numer_temp_3_d = {numer_temp_4[94:4] - denom17, numer_temp_4[3:0]};
		end else begin
			quo17_d[4] = 1'b0;
           numer_temp_3_d = numer_temp_4;
		end
		quo17_d[3:0] = 4'b0;
	end
	
	always @ (posedge clock) begin
		quo17_q <= quo17_d;
		numer_temp_3_q <= numer_temp_3_d;
		denom18 <= denom17;
	end
		
	always @ (numer_temp_3_q or denom18 or quo17_q) begin
		quo18_d[63:4] = quo17_q[63:4];
		
		//quo18_d[3]
		if (numer_temp_3_q[94:3] >= denom18 ) begin
			quo18_d[3] = 1'b1;
			numer_temp_2 = {numer_temp_3_q[94:3] - denom18, numer_temp_3_q[2:0]};
		end else begin
			quo18_d[3] = 1'b0;
           numer_temp_2 = numer_temp_3_q;
		end
		//quo18_d[2]
		if (numer_temp_2[94:2] >= denom18 ) begin
			quo18_d[2] = 1'b1;
			numer_temp_1_d = {numer_temp_2[94:2] - denom18, numer_temp_2[1:0]};
		end else begin
			quo18_d[2] = 1'b0;
           numer_temp_1_d = numer_temp_2;
		end
		quo18_d[1:0] = 2'b0;
	end
		
	always @ (posedge clock) begin 
		quo18_q <= quo18_d;
		numer_temp_1_q <= numer_temp_1_d;
		denom19 <= denom18;
	end
		
	always @ (numer_temp_1_q or denom19 or quo18_q) begin
		quo19_d[63:2] = quo18_q[63:2];
		//quo19_d[1]
		if (numer_temp_1_q[94:1] >= denom19 ) begin
			quo19_d[1] = 1'b1;
			numer_temp_0 = {numer_temp_1_q[94:1] - denom19, numer_temp_1_q[0:0]};
		end else begin
			quo19_d[1] = 1'b0;
           numer_temp_0 = numer_temp_1_q;
	
		end
		//quo19_d[0]
		if (numer_temp_0[94:0] >= denom19 ) begin
			quo19_d[0] = 1'b1;
			numer_temp = numer_temp_0[94:0] - denom19;
		end else begin
			quo19_d[0] = 1'b0;
           numer_temp = numer_temp_0;
		end	
	end
	
	assign quotient = quo19_d;
	assign remain = numer_temp[31:0];

	
	
endmodule 



