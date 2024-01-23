module counter(
	
	input		[2:1]	pmod,
	
	output	reg	[3:0]	led
);

	wire rst;
	wire clk;
	
	assign clk = ~pmod[1];
	assign rst = ~pmod[2];
	
	always @ (posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			led <= 4'b0;
		end else begin
			led <= led + 1'b1;
		end
	end
	
endmodule