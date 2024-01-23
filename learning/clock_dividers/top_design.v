module top_design(
	input			clk,
	input			rst_btn,
	
	output	[1:0]	led
);
	
	wire rst;
	
	assign rst = ~rst_btn;
	
	clock_divider  #(
		.COUNT_WIDTH(32),
		.MAX_COUNT(1500000-1)
	) div_1 (
		.clk(clk),
		.rst(rst),
		.out(led[0])
	);
	
	clock_divider div_2 (
		.clk(clk),
		.rst(rst),
		.out(led[1])
	);
	
endmodule