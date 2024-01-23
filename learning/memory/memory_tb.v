`timescale 1 ns / 10 ps

module memory_tb();

	wire 	[7:0]		r_data;
	
	reg					clk = 0;
	reg					w_en = 0;
	reg					r_en = 0;
	reg		[3:0]		w_addr;
	reg		[3:0]		r_addr;
	reg		[7:0]		w_data;
	integer i;
	
	localparam DURATION = 10000;
	
	always begin
		#41.67
		clk = ~clk;
	end
	
	memory #(
		.INIT_FILE("mem_init.txt")
	)uut(
		.clk(clk),
		.w_en(w_en),
		.r_en(r_en),
		.w_addr(w_addr),
		.r_addr(r_addr),
		.w_data(w_data),
		.r_data(r_data)
	);
	
	initial begin
		
		for(i = 0; i < 16; i = i+1) begin
			#(2*41.67)
			r_addr = i;
			r_en = 1;
			#(2*41.67)
			r_addr = 0;
			r_en = 0;
		end
		
		#(2*41.67)
		w_addr = 'hF;
		w_data = 'hA5;
		w_en = 1;
		#(2*41.67)
		w_addr = 0;
		w_data = 0;
		w_en = 0;
		
		#(2*41.67)
		r_addr = 'hF;
		r_en = 1;
		#(2*41.67)
		r_addr = 0;
		r_en = 0;
		
	end
	
	initial begin
		
		$dumpfile("memory_tb.vcd");
		$dumpvars(0,memory_tb);
		
		#(DURATION)
		
		$display("finished");
		$finish;
		
	end
	
endmodule