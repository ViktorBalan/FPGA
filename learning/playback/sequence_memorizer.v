module sequence_memorizer(
	
	input				clk,
	input				rst_btn,
	input				main_btn,
	
	output	reg			led,
	output	reg	[3:0]	timer

);

	wire 		rst;
	wire		main;
	assign rst = ~rst_btn;
	assign main = ~main_btn;

	wire		div_out;
	reg			replay;
	reg			mem [15:0];

	clock_divider #(
		.MAX_COUNT(1500000)
	)div (
		.clk(clk),
		.rst(rst),
		.out(div_out)
	);
	
	always @ (posedge div_out or posedge rst) begin
		if(rst == 1'b1) begin
			led <= 1'b0;
		end else if(replay == 1'b0) begin
			mem[timer] <= main;
		end else begin
			led <= mem[timer];
		end
	end
	
	always @ (posedge div_out or posedge rst) begin
		if(rst == 1'b1) begin
			replay <= 1'b0;
		end else if (timer == 4'b1111) begin
			replay <= 1'b1;
		end
	end
	
	always @ (posedge div_out or posedge rst) begin
		if(rst == 1'b1) begin
			timer <= 4'b0000;
		end else begin
			timer <= timer+1;
		end
	end
	
endmodule