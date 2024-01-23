module debouncer(
	input		clk,
	input		btn,
	input		rst,
	
	output	reg	led

);

	wire toggle;
	wire irst;
	
	assign toggle = ~btn;
	assign irst = ~rst;

	localparam STATE_WAITING	= 1'b0;
	localparam STATE_COOLDOWN	= 1'b1;
	
	reg						state;
	
	
	always @ (posedge clk or posedge irst) begin
		if (irst == 1'b1) begin
			state <= STATE_WAITING;
			led <= 1'b0;
		end else begin
			case (state)
				STATE_WAITING: begin
					if (toggle == 1'b1) begin
						state <= STATE_COOLDOWN;
						led <= ~led;
					end
				end
				STATE_COOLDOWN: begin
					if (toggle == 1'b0) begin
						state <= STATE_WAITING;
					end
				end
				default: begin
					state <= STATE_WAITING;
				end
			endcase
		end
	end
	
endmodule