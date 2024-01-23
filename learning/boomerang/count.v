module count # (
	parameter						COUNT_WIDTH	= 24,
	parameter	[COUNT_WIDTH-1:0]	MAX_COUNT	= 1500000,
	parameter						LED_COUNT	= 4,
	parameter						LEDS_BEGIN	= 4'b0000,
	parameter						LEDS_END	= 4'b1111,
	parameter						LEDS_STEP	= 4'b0001
)(
	
	input	clk,
	input	rst,
	input	go,
	
	output	reg	[LED_COUNT-1:0]	led,
	output	reg					done
	
);

	localparam	STATE_IDLE		= 2'd0;
	localparam	STATE_COUNT		= 2'd1;
	localparam	STATE_DONE		= 2'd2;
	
	reg		[1:0]			state;
	reg		[COUNT_WIDTH:0]	clock_count;
	reg						div;
	
	//div clock
	always @ (posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			clock_count <= 0;
			div <= 0;
		end else if (clock_count == MAX_COUNT) begin
			clock_count <= 0;
			div <= ~div;
		end else begin
			clock_count <= clock_count + 1;
		end
	end
	
	//manage states and leds
	always @ (posedge div or posedge rst) begin
		if (rst == 1'b1) begin
			state <= STATE_IDLE;
			led <= LEDS_BEGIN;
			
		end else begin
			case(state)
				STATE_IDLE: begin
					if (go == 1'b1) begin
						state <= STATE_COUNT;
					end
				end
				STATE_COUNT: begin
					if (led == LEDS_END) begin
						state <= STATE_DONE;
					end else begin
						led <= led+LEDS_STEP;
					end
				end
				STATE_DONE: begin
					;
				end
				default: begin
					state <= STATE_IDLE;
				end
			endcase
		end
	end
	
	/*
	//manage leds
	always @ (posedge div or posedge rst) begin
		if (rst == 1'b1) begin
			led <= LEDS_BEGIN;
		end else if(state == STATE_COUNT) begin
			led <= led+LEDS_STEP;
		end
	end
	*/
	
	//manage done
	always @ ( * ) begin
		if (state == STATE_DONE) begin
			done <= 1'b1;
		end else begin
			done <= 1'b0;
		end
	end
	
endmodule