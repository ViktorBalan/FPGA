module counter(
	
	input				pmod,
	input				clk,
	
	output	reg	[3:0]	led
);

	wire rst;
	wire inc;
	
	reg 	[23:0]		counter;
	
	assign inc = ~clk;
	assign rst = ~pmod;
	
	always @ (posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			led <= 4'b0;
			counter <= 24'b0;
		end else if (counter == 24'd12000000) begin
			led <= led + 1'b1;
			counter <= 24'b0;
		end else begin
			counter <= counter+1;
		end
	end
	
endmodule