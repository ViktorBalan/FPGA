module top(
	input CLK,
	input PIN_13,
	output led1,
	output led2,
	output led3
	);

wire[7:0] out;
reg[23:0] clk;
always @(posedge CLK)
	clk <= clk + 1;

cpu cpu0(
	.clk(clk[15]),
	.reset(~PIN_13),
	.out(out));

wire[6:0] seg_ones;
wire[6:0] seg_tens;
wire[6:0] seg_hundreds;
wire[11:0] bcd;

bin_to_bcd bin_to_bcd0(out, bcd);

seven_seg seven_seg_ones(
	.bcd(bcd[3:0]),
	.segments(seg_ones));

seven_seg seven_seg_tens(
	.bcd(bcd[7:4]),
	.segments(seg_tens));

seven_seg seven_seg_hundreds(
	.bcd(bcd[11:8]),
	.segments(seg_hundreds));

assign led1 = seg_ones[3];
assign led2 = seg_tens[3];
assign led3 = seg_hundreds[3];

endmodule

