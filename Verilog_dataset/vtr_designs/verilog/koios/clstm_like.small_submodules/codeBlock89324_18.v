`define SIMULATION_MEMORY

module codeBlock89324_18 (
	input clk,
	input reset,
	input next_in,
	input [17:0] X0_in,
	output [17:0] Y0,
	input [17:0] X1_in,
	output [17:0] Y1,
	input [17:0] X2_in,
	output [17:0] Y2,
	input [17:0] X3_in,
	output [17:0] Y3,
	input [17:0] X4_in,
	output [17:0] Y4,
	input [17:0] X5_in,
	output [17:0] Y5,
	input [17:0] X6_in,
	output [17:0] Y6,
	input [17:0] X7_in,
	output [17:0] Y7,
	input [17:0] X8_in,
	output [17:0] Y8,
	input [17:0] X9_in,
	output [17:0] Y9,
	input [17:0] X10_in,
	output [17:0] Y10,
	input [17:0] X11_in,
	output [17:0] Y11,
	input [17:0] X12_in,
	output [17:0] Y12,
	input [17:0] X13_in,
	output [17:0] Y13,
	input [17:0] X14_in,
	output [17:0] Y14,
	input [17:0] X15_in,
	output [17:0] Y15,
	input [17:0] X16_in,
	output [17:0] Y16,
	input [17:0] X17_in,
	output [17:0] Y17,
	input [17:0] X18_in,
	output [17:0] Y18,
	input [17:0] X19_in,
	output [17:0] Y19,
	input [17:0] X20_in,
	output [17:0] Y20,
	input [17:0] X21_in,
	output [17:0] Y21,
	input [17:0] X22_in,
	output [17:0] Y22,
	input [17:0] X23_in,
	output [17:0] Y23,
	input [17:0] X24_in,
	output [17:0] Y24,
	input [17:0] X25_in,
	output [17:0] Y25,
	input [17:0] X26_in,
	output [17:0] Y26,
	input [17:0] X27_in,
	output [17:0] Y27,
	input [17:0] X28_in,
	output [17:0] Y28,
	input [17:0] X29_in,
	output [17:0] Y29,
	input [17:0] X30_in,
	output [17:0] Y30,
	input [17:0] X31_in,
	output [17:0] Y31,
	output next_out
);

reg next;
reg [17:0] X0;
reg [17:0] X1;
reg [17:0] X2;
reg [17:0] X3;
reg [17:0] X4;
reg [17:0] X5;
reg [17:0] X6;
reg [17:0] X7;
reg [17:0] X8;
reg [17:0] X9;
reg [17:0] X10;
reg [17:0] X11;
reg [17:0] X12;
reg [17:0] X13;
reg [17:0] X14;
reg [17:0] X15;
reg [17:0] X16;
reg [17:0] X17;
reg [17:0] X18;
reg [17:0] X19;
reg [17:0] X20;
reg [17:0] X21;
reg [17:0] X22;
reg [17:0] X23;
reg [17:0] X24;
reg [17:0] X25;
reg [17:0] X26;
reg [17:0] X27;
reg [17:0] X28;
reg [17:0] X29;
reg [17:0] X30;
reg [17:0] X31;

shiftRegFIFO_2_1 shiftRegFIFO_2_1_inst (
	.X(next),
	.Y(next_out),
	.reset(reset),
	.clk(clk)
);

wire  [17:0] a65;
 		wire  [17:0] a66;
 		wire  [17:0] a67;
 		wire  [17:0] a68;
 		wire  [17:0] a73;
 		wire  [17:0] a74;
 		wire  [17:0] a75;
 		wire  [17:0] a76;
 		wire  [17:0] a81;
 		wire  [17:0] a82;
 		wire  [17:0] a83;
 		wire  [17:0] a84;
 		wire  [17:0] a89;
 		wire  [17:0] a90;
 		wire  [17:0] a91;
 		wire  [17:0] a92;
 		wire  [17:0] a97;
 		wire  [17:0] a98;
 		wire  [17:0] a99;
 		wire  [17:0] a100;
 		wire  [17:0] a105;
 		wire  [17:0] a106;
 		wire  [17:0] a107;
 		wire  [17:0] a108;
 		wire  [17:0] a113;
 		wire  [17:0] a114;
 		wire  [17:0] a115;
 		wire  [17:0] a116;
 		wire  [17:0] a121;
 		wire  [17:0] a122;
 		wire  [17:0] a123;
 		wire  [17:0] a124;
 		wire  [17:0] t402;
 		wire  [17:0] t403;
 		wire  [17:0] t404;
 		wire  [17:0] t405;
 		wire  [17:0] t406;
 		wire  [17:0] t407;
 		wire  [17:0] t408;
 		wire  [17:0] t409;
 		wire  [17:0] t418;
 		wire  [17:0] t419;
 		wire  [17:0] t420;
 		wire  [17:0] t421;
 		wire  [17:0] t422;
 		wire  [17:0] t423;
 		wire  [17:0] t424;
 		wire  [17:0] t425;
 		wire  [17:0] t434;
 		wire  [17:0] t435;
 		wire  [17:0] t436;
 		wire  [17:0] t437;
 		wire  [17:0] t438;
 		wire  [17:0] t439;
 		wire  [17:0] t440;
 		wire  [17:0] t441;
 		wire  [17:0] t450;
 		wire  [17:0] t451;
 		wire  [17:0] t452;
 		wire  [17:0] t453;
 		wire  [17:0] t454;
 		wire  [17:0] t455;
 		wire  [17:0] t456;
 		wire  [17:0] t457;
 		wire  [17:0] t410;
 		wire  [17:0] t411;
 		wire  [17:0] t412;
 		wire  [17:0] t413;
 		wire  [17:0] t414;
 		wire  [17:0] t415;
 		wire  [17:0] t416;
 		wire  [17:0] t417;
 		wire  [17:0] t426;
 		wire  [17:0] t427;
 		wire  [17:0] t428;
 		wire  [17:0] t429;
 		wire  [17:0] t430;
 		wire  [17:0] t431;
 		wire  [17:0] t432;
 		wire  [17:0] t433;
 		wire  [17:0] t442;
 		wire  [17:0] t443;
 		wire  [17:0] t444;
 		wire  [17:0] t445;
 		wire  [17:0] t446;
 		wire  [17:0] t447;
 		wire  [17:0] t448;
 		wire  [17:0] t449;
 		wire  [17:0] t458;
 		wire  [17:0] t459;
 		wire  [17:0] t460;
 		wire  [17:0] t461;
 		wire  [17:0] t462;
 		wire  [17:0] t463;
 		wire  [17:0] t464;
 		wire  [17:0] t465;
assign a65 = X0;
 		assign a66 = X16;
 		assign a67 = X1;
 		assign a68 = X17;
 		assign a73 = X8;
 		assign a74 = X24;
 		assign a75 = X9;
 		assign a76 = X25;
 		assign a81 = X2;
 		assign a82 = X18;
 		assign a83 = X3;
 		assign a84 = X19;
 		assign a89 = X10;
 		assign a90 = X26;
 		assign a91 = X11;
 		assign a92 = X27;
 		assign a97 = X4;
 		assign a98 = X20;
 		assign a99 = X5;
 		assign a100 = X21;
 		assign a105 = X12;
 		assign a106 = X28;
 		assign a107 = X13;
 		assign a108 = X29;
 		assign a113 = X6;
 		assign a114 = X22;
 		assign a115 = X7;
 		assign a116 = X23;
 		assign a121 = X14;
 		assign a122 = X30;
 		assign a123 = X15;
 		assign a124 = X31;
 		assign Y0 = t410;
 		assign Y1 = t411;
 		assign Y16 = t412;
 		assign Y17 = t413;
 		assign Y8 = t414;
 		assign Y9 = t415;
 		assign Y24 = t416;
 		assign Y25 = t417;
 		assign Y2 = t426;
 		assign Y3 = t427;
 		assign Y18 = t428;
 		assign Y19 = t429;
 		assign Y10 = t430;
 		assign Y11 = t431;
 		assign Y26 = t432;
 		assign Y27 = t433;
 		assign Y4 = t442;
 		assign Y5 = t443;
 		assign Y20 = t444;
 		assign Y21 = t445;
 		assign Y12 = t446;
 		assign Y13 = t447;
 		assign Y28 = t448;
 		assign Y29 = t449;
 		assign Y6 = t458;
 		assign Y7 = t459;
 		assign Y22 = t460;
 		assign Y23 = t461;
 		assign Y14 = t462;
 		assign Y15 = t463;
 		assign Y30 = t464;
 		assign Y31 = t465;

addfxp_18_1 add89336(.a(a65), .b(a66), .clk(clk), .q(t402));
 		addfxp_18_1 add89351(.a(a67), .b(a68), .clk(clk), .q(t403));
 		subfxp_18_1 sub89366(.a(a65), .b(a66), .clk(clk), .q(t404));
 		subfxp_18_1 sub89381(.a(a67), .b(a68), .clk(clk), .q(t405));
 		addfxp_18_1 add89396(.a(a73), .b(a74), .clk(clk), .q(t406));
 		addfxp_18_1 add89411(.a(a75), .b(a76), .clk(clk), .q(t407));
 		subfxp_18_1 sub89426(.a(a73), .b(a74), .clk(clk), .q(t408));
 		subfxp_18_1 sub89441(.a(a75), .b(a76), .clk(clk), .q(t409));
 		addfxp_18_1 add89544(.a(a81), .b(a82), .clk(clk), .q(t418));
 		addfxp_18_1 add89559(.a(a83), .b(a84), .clk(clk), .q(t419));
 		subfxp_18_1 sub89574(.a(a81), .b(a82), .clk(clk), .q(t420));
 		subfxp_18_1 sub89589(.a(a83), .b(a84), .clk(clk), .q(t421));
 		addfxp_18_1 add89604(.a(a89), .b(a90), .clk(clk), .q(t422));
 		addfxp_18_1 add89619(.a(a91), .b(a92), .clk(clk), .q(t423));
 		subfxp_18_1 sub89634(.a(a89), .b(a90), .clk(clk), .q(t424));
 		subfxp_18_1 sub89649(.a(a91), .b(a92), .clk(clk), .q(t425));
 		addfxp_18_1 add89752(.a(a97), .b(a98), .clk(clk), .q(t434));
 		addfxp_18_1 add89767(.a(a99), .b(a100), .clk(clk), .q(t435));
 		subfxp_18_1 sub89782(.a(a97), .b(a98), .clk(clk), .q(t436));
		subfxp_18_1 sub89797(.a(a99), .b(a100), .clk(clk), .q(t437));
 		addfxp_18_1 add89812(.a(a105), .b(a106), .clk(clk), .q(t438));
 		addfxp_18_1 add89827(.a(a107), .b(a108), .clk(clk), .q(t439));
 		subfxp_18_1 sub89842(.a(a105), .b(a106), .clk(clk), .q(t440));
 		subfxp_18_1 sub89857(.a(a107), .b(a108), .clk(clk), .q(t441));
 		addfxp_18_1 add89960(.a(a113), .b(a114), .clk(clk), .q(t450));
 		addfxp_18_1 add89975(.a(a115), .b(a116), .clk(clk), .q(t451));
 		subfxp_18_1 sub89990(.a(a113), .b(a114), .clk(clk), .q(t452));
 		subfxp_18_1 sub90005(.a(a115), .b(a116), .clk(clk), .q(t453));
 		addfxp_18_1 add90020(.a(a121), .b(a122), .clk(clk), .q(t454));
 		addfxp_18_1 add90035(.a(a123), .b(a124), .clk(clk), .q(t455));
 		subfxp_18_1 sub90050(.a(a121), .b(a122), .clk(clk), .q(t456));
 		subfxp_18_1 sub90065(.a(a123), .b(a124), .clk(clk), .q(t457));
 		addfxp_18_1 add89448(.a(t402), .b(t406), .clk(clk), .q(t410));
 		addfxp_18_1 add89455(.a(t403), .b(t407), .clk(clk), .q(t411));
 		subfxp_18_1 sub89462(.a(t402), .b(t406), .clk(clk), .q(t412));
 		subfxp_18_1 sub89469(.a(t403), .b(t407), .clk(clk), .q(t413));
 		addfxp_18_1 add89492(.a(t404), .b(t409), .clk(clk), .q(t414));
 		subfxp_18_1 sub89499(.a(t405), .b(t408), .clk(clk), .q(t415));
 		subfxp_18_1 sub89506(.a(t404), .b(t409), .clk(clk), .q(t416));
 		addfxp_18_1 add89513(.a(t405), .b(t408), .clk(clk), .q(t417));
 		addfxp_18_1 add89656(.a(t418), .b(t422), .clk(clk), .q(t426));
 		addfxp_18_1 add89663(.a(t419), .b(t423), .clk(clk), .q(t427));
 		subfxp_18_1 sub89670(.a(t418), .b(t422), .clk(clk), .q(t428));
 		subfxp_18_1 sub89677(.a(t419), .b(t423), .clk(clk), .q(t429));
 		addfxp_18_1 add89700(.a(t420), .b(t425), .clk(clk), .q(t430));
 		subfxp_18_1 sub89707(.a(t421), .b(t424), .clk(clk), .q(t431));
 		subfxp_18_1 sub89714(.a(t420), .b(t425), .clk(clk), .q(t432));
 		addfxp_18_1 add89721(.a(t421), .b(t424), .clk(clk), .q(t433));
 		addfxp_18_1 add89864(.a(t434), .b(t438), .clk(clk), .q(t442));
 		addfxp_18_1 add89871(.a(t435), .b(t439), .clk(clk), .q(t443));
 		subfxp_18_1 sub89878(.a(t434), .b(t438), .clk(clk), .q(t444));
 		subfxp_18_1 sub89885(.a(t435), .b(t439), .clk(clk), .q(t445));
 		addfxp_18_1 add89908(.a(t436), .b(t441), .clk(clk), .q(t446));
 		subfxp_18_1 sub89915(.a(t437), .b(t440), .clk(clk), .q(t447));
 		subfxp_18_1 sub89922(.a(t436), .b(t441), .clk(clk), .q(t448));
 		addfxp_18_1 add89929(.a(t437), .b(t440), .clk(clk), .q(t449));
 		addfxp_18_1 add90072(.a(t450), .b(t454), .clk(clk), .q(t458));
 		addfxp_18_1 add90079(.a(t451), .b(t455), .clk(clk), .q(t459));
 		subfxp_18_1 sub90086(.a(t450), .b(t454), .clk(clk), .q(t460));
 		subfxp_18_1 sub90093(.a(t451), .b(t455), .clk(clk), .q(t461));
 		addfxp_18_1 add90116(.a(t452), .b(t457), .clk(clk), .q(t462));
 		subfxp_18_1 sub90123(.a(t453), .b(t456), .clk(clk), .q(t463));
 		subfxp_18_1 sub90130(.a(t452), .b(t457), .clk(clk), .q(t464));
 		addfxp_18_1 add90137(.a(t453), .b(t456), .clk(clk), .q(t465));

always @(posedge clk) begin
	if (reset == 1) begin
		next <= 1'b0;
	end else begin
		X0 <= X0_in;
		X1 <= X1_in;
		X2 <= X2_in;
		X3 <= X3_in;
		X4 <= X4_in;
		X5 <= X5_in;
		X6 <= X6_in;
		X7 <= X7_in;
		X8 <= X8_in;
		X9 <= X9_in;
		X10 <= X10_in;
		X11 <= X11_in;
		X12 <= X12_in;
		X13 <= X13_in;
		X14 <= X14_in;
		X15 <= X15_in;
		X16 <= X16_in;
		X17 <= X17_in;
		X18 <= X18_in;
		X19 <= X19_in;
		X20 <= X20_in;
		X21 <= X21_in;
		X22 <= X22_in;
		X23 <= X23_in;
		X24 <= X24_in;
		X25 <= X25_in;
		X26 <= X26_in;
		X27 <= X27_in;
		X28 <= X28_in;
		X29 <= X29_in;
		X30 <= X30_in;
		X31 <= X31_in;
		next <= next_in;
	end
end

endmodule

module addfxp_18_1 (
	input [17:0] a,
	input [17:0] b,
	input clk,
	output [17:0] q
);

reg [17:0] res_0;
assign q = res_0;

always @(posedge clk) begin
	res_0 <= a + b;
end

endmodule

module shiftRegFIFO_2_1 (
	input [0:0] X,
	output [0:0] Y,
	input reset,
	input clk
);

reg [0:0] mem_0;
reg [0:0] mem_1;
assign Y = mem_1;

always @ (posedge clk) begin
	if (reset) begin
		mem_0 <= 0;
		mem_1 <= 0;
	end else begin
		mem_1 <= mem_0;
		mem_0 <= X;
	end
end

endmodule

module subfxp_18_1 (
	input [17:0] a,
	input [17:0] b,
	input clk,
	output [17:0] q
);

reg [17:0] res_0;
assign q = res_0;

always @(posedge clk) begin
	res_0 <= a + b;
end

endmodule









