
module cr_div(rst, clk, addr, start, a, b, q, r, done);
parameter IDLE = 3'd1;
parameter RECIP = 3'd2;
parameter RECIP1 = 3'd3;
parameter DONE = 3'd4;
input rst;
input clk;
input [31:0] addr;
input start;
input [31:0] a;
input [31:0] b;
output [31:0] q;
output [31:0] r;
output done;

reg [2:0] state;
reg [31:0] bcache [0:63];		// 'b' is the cache tag
reg [31:0] recip_cache [0:63];	// cache of reciprocals
wire [63:0] prod = recip_cache[addr[7:2]] * a;
reg [31:0] q,r;
reg [7:0] cnt;
wire cnt_done = cnt==8'd0;
assign done = state==DONE;

wire b0 = b <= r;
wire [31:0] r1 = b0 ? r - b : r;

always @(posedge clk)
if (rst) begin
	state <= IDLE;
end
else begin
if (!cnt_done)
	cnt <= cnt - 8'd1;
case(state)
IDLE:
	if (start) begin
		// Note: we are calculating the inverse as a fraction less than one, so
		// we start by placing the dividend directly into the remainder field
		// rather than the quotient field as for a normal divide. We can save
		// 32 clock cycles this way. We know there would just be 32 leading
		// zeros because the fraction is less than one.
		q <= 32'd0;
		r <= 32'd1;
		if (b==1) begin
			q <= a;
			r <= 0;
			state <= DONE;
		end
		// Here is what speeds things up, if we find the reciprocal cached, the
		// quotient is returned right away after a multiply.
		else if (b==bcache[addr[7:2]]) begin
			q <= prod[63:32];
			state <= DONE;
		end
		else
			state <= RECIP;
		cnt <= 8'd33;
	end
// This state computes the reciprocal and caches it if the reciprocal isn't in
// the cache already.
RECIP:
	if (!cnt_done) begin
		q <= {q[30:0],b0};
		r <= {r1,q[31]};
	end
	else begin
		bcache[addr[7:2]] <= b;
		recip_cache[addr[7:2]] <= q;
		state <= RECIP1;
	end
// State to compute the quotient using the newly cached reciprocal.
RECIP1:
	begin
		q <= prod[63:32];
		state <= DONE;
	end
// Compute the remainder. You may not want to since it's a resource hog - it
// takes an additional multiply and subtract. The remainder is often easily
// calculated by program code rather than hardware.
DONE:
	begin
	$display("==========================");
	$display("a=%d,b=%d",a,b);
	$display("q=%d,r=%d",q,a - b * q);
	$display("rc[%h]=%d",addr[7:2],recip_cache[addr[7:2]]);
	$display("==========================");
	r <= a - b * q;
	state <= IDLE;
	end
endcase
end

endmodule
