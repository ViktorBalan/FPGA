module top(
	
	input	go_btn,
	input	clk,
	input	rst_btn,
	
	output	[0:3]	leds,
	output			green
	
);

	wire go;
	wire rst;
	
	assign go = ~go_btn;
	assign rst = ~rst_btn;
	
	wire [3:0]	out1;
	wire [3:0]	out2;
	assign leds = out1 & out2;
	
	wire done;

	
	count counter1 (
		.go(go),
		.clk(clk),
		.rst(rst),
		.led(out1),
		.done(done)
	);
	
	
	count #(
		.LEDS_STEP(4'b1111),
		.LEDS_BEGIN(4'b1111),
		.LEDS_END(4'b0000)
	) counter2 (
		.go(done),
		.clk(clk),
		.rst(rst),
		.led(out2),
		.done(rst)
	);

endmodule