module msm(
	
	input	clk,
	input	rst_btn,
	input	go_btn,
	
	output	reg	[0:3]	led,
	output	reg			done_sig
);

	localparam STATE_IDLE		= 2'd0;
	localparam STATE_COUNTING	= 2'd1;
	localparam STATE_DONE		= 2'd2;
	
	localparam MAX_CLK_COUNT	= 24'd1500000;
	localparam MAX_LED_COUNT	= 4'hf;
	
	wire rst;
	wire go;
	
	reg			div_clk;
	reg	[1:0]	state;
	reg	[23:0]	clk_count;
	
	assign go = ~go_btn;
	assign rst = ~rst_btn;
	
	always @ (posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			clk_count <= 24'b0;
		end else if (clk_count == MAX_CLK_COUNT) begin
			clk_count <= 24'b0;
			div_clk <= ~div_clk;
		end else begin
			clk_count <= clk_count+1;
		end
	end
	
	always @ (posedge div_clk or posedge rst) begin
		if (rst == 1'b1) begin
			state <= STATE_IDLE;
		end else begin
			case(state)
				STATE_IDLE: begin
					if(go == 1'b1) begin
						state <= STATE_COUNTING;
					end
				end
				STATE_COUNTING: begin
					if(led == MAX_LED_COUNT) begin
						state <= STATE_DONE;
					end
				end
				STATE_DONE: begin
					state <= STATE_IDLE;
				end
				default: state <= STATE_IDLE;
			endcase
		end
	end
	
	always @ (posedge div_clk or posedge rst) begin
		if (rst == 1'b1) begin
			led <= 4'd0;
		end else begin
			if(state == STATE_COUNTING) begin
				led <= led+1;
			end else begin
				led <= 4'd0;
			end
		end
	end
	
	always @ ( * ) begin
		if (state == STATE_DONE) begin
			done_sig = 1'b1;
		end else begin
			done_sig = 1'b0;
		end
	end
	
endmodule