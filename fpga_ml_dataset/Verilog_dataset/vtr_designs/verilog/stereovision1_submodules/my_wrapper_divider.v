
module my_wrapper_divider(rst, clk, data_in_a, data_in_b, data_out);
	parameter INPUT_WIDTH_A = 5'b10000;
	parameter INPUT_WIDTH_B = 5'b10001;
	parameter OUTPUT_WIDTH = 4'b1000;

	parameter S1 = 2'b00;
	parameter S2 = 2'b01;
	parameter S3 = 2'b10;
	parameter S4 = 2'b11;

	input rst;
	input clk;
	input [INPUT_WIDTH_A-1:0]data_in_a;
	input [INPUT_WIDTH_B-1:0]data_in_b;
	output [OUTPUT_WIDTH-1:0]data_out;
	wire [OUTPUT_WIDTH-1:0]data_out;

	wire [OUTPUT_WIDTH-1:0]Remainder;

	reg start, LA, EB;
	wire Done;
	reg[1:0] y, Y;

	my_divider my_divider_inst(clk, rst, start, LA, EB, data_in_a, data_in_b, Remainder, data_out, Done);

	always @(posedge clk)
	begin
		if (rst == 0)
			y <= S1;
		else
			y <= Y;
	end

	always @(y)
	begin
		case (y)
			S1 :
			begin	
				LA = 0;
				EB = 0;
				start = 0;
				Y = S2;
			end
			S2 : 
			begin
				LA = 1;
				EB = 1;
				start = 0;
				Y = S3;
			end
			S3 : 
			begin
				LA = 0;
				EB = 0;
				start = 1;
				Y = S4;
			end
			S4 : 
			begin
				LA = 0;
				EB = 0;
				start = 0;
				if (Done == 1'b1)
				begin
					Y = S1;
				end
				else
				begin
					Y = S4;
				end
			end
		endcase
	end
endmodule
module my_divider(clk, rst, start, LA, EB, data_in_a, data_in_b, Remainder, data_out, Done);

	parameter INPUT_WIDTH_A = 5'b10000;
	parameter INPUT_WIDTH_B = 5'b10001;
	parameter OUTPUT_WIDTH = 4'b1000;
	parameter LOGN = 3'b100;

	parameter S1 = 2'b00;
	parameter S2 = 2'b01;
	parameter S3 = 2'b10;

	input clk;
	input [INPUT_WIDTH_A-1:0]data_in_a;
	input [INPUT_WIDTH_B-1:0]data_in_b;
	input rst;
	input start;
	input LA;
	input EB;
	output [OUTPUT_WIDTH-1:0]data_out;
	wire [OUTPUT_WIDTH-1:0]data_out;
	output [OUTPUT_WIDTH-1:0]Remainder;
	reg [OUTPUT_WIDTH-1:0]Remainder;
	output Done;
	reg Done;

	wire Cout, zero;
	wire [INPUT_WIDTH_A-1:0] Sum;
	reg [1:0] y, Y;
	reg [LOGN-1:0] Count;
	reg EA, Rsel, LR, ER, ER0, LC, EC;
	reg [INPUT_WIDTH_B-1:0] RegB;
	reg [INPUT_WIDTH_A-1:0] DataA;
	reg ff0;

	always @(start or y or zero)
	begin
		case(y)
			S1:
			begin
				if (start == 0)
					Y = S1;
				else
					Y = S2;
			end
			S2:
			begin
				if (zero == 0)
					Y = S2;
				else
					Y = S3;
			end
			S3:
			begin
				if (start == 1)
					Y = S3;
				else
					Y = S1;
			end
			default:
			begin
				Y = 2'b00;
			end
		endcase
	end

	always @(posedge clk)
	begin
		if (rst == 0)
			y <= S1;
		else
			y <= Y;
	end

	always @(y or start or Cout or zero)
	begin
		case (y)
			S1:
			begin
				LC = 1;
				ER = 1;
				EC = 0;
				Rsel = 0;
				Done = 0;
				if (start == 0)
				begin
					LR = 1;
					ER0 = 1;
					EA = 0;
				end	
				else
				begin
					LR = 0; 
					EA = 1;
					ER0 = 1;
				end
			end
			S2:
			begin
				LC = 0;
				ER = 1;
				Rsel = 1;	
				Done = 0;
				ER0 = 1;
				EA = 1;
				if (Cout)
					LR = 1;
				else
					LR = 0;
				if (zero == 0)
					EC = 1;
				else
					EC = 0;
			end
			S3:
			begin
				Done = 1;
				LR = 0;
				LC = 0;
				ER = 0;
				EC = 0;
				Rsel = 0;
				ER0 = 0;
				EA = 0;
			end
			default:
			begin
				Done = 0;
				LR = 0;
				LC = 0;
				ER = 0;
				EC = 0;
				Rsel = 0;
				ER0 = 0;
				EA = 0;
			end
		endcase
	end	

	always @(posedge clk)
	begin
		if (rst == 1)
		begin
			RegB <= 0;
			Remainder <= 0;
			DataA <= 0;
			ff0 <= 0;
			Count <= 0;
		end	
		else
		begin
			if (EB == 1)
			begin
				RegB <= data_in_b;
			end
			else
			begin
				RegB <= RegB;
			end

			if (LR == 1)
			begin
				Remainder <= Rsel ? Sum : 0;
			end
			else if (ER == 1)
			begin
				Remainder <= (Remainder << 1) | ff0;
			end
			else
			begin
				Remainder <= Remainder;
			end

			if (LA == 1)
			begin
				DataA <= data_in_a;
			end
			else if (EA == 1)
			begin
				DataA <= (DataA << 1) | Cout;
			end
			else
			begin
				DataA <= DataA;
			end

			if (ER0 == 1)
			begin
				ff0 <=  DataA[INPUT_WIDTH_A-1];
			end
			else
			begin
				ff0 <= 0;
			end

			if (LC == 1)
			begin
				Count <= 0;
			end
			else if (EC == 1)
			begin
				Count <= Count + 1;
			end
			else
			begin
				Count <= Count;
			end
		end
	end	

	assign zero = (Count == 0);
	assign Sum = {Remainder, ff0} + (~RegB + 1);
	assign Cout = Sum[INPUT_WIDTH_A-1:0];
	assign data_out = DataA; 

endmodule
