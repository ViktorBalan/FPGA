`timescale 1 ns / 10 ps

module divider_tb();

	wire 	out;
	
	reg		clk		= 0;
	reg		rst		= 0;
	
	localparam 	DURATION		= 10000;
	
	always begin
		
		#41.667
		
		clk = ~clk;
		
	end
	
	clock_divider #(
		.COUNT_WIDTH(4),
		.MAX_COUNT(6-1)
	) uut (
		.clk(clk),
		.rst(rst),
		.out(out)
	);
	
	initial begin
		#10
		rst = 1'b1;
		#1
		rst = 1'b0;
	end
	
	initial begin
		$dumpfile("divider_tb.vcd");
		$dumpvars(0, divider_tb);
		
		#(DURATION)
		$display("Finished!");
		$finish;
	end
	
endmodule