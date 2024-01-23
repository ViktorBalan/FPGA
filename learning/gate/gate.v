module gate (
	
	input	[2:0]	pmod,
	
	output 	[1:0]	led
	
);
	
	assign led[0] = ~(pmod[0] ^ pmod[1] ^ pmod[2]);
	assign led[1] = (~pmod[0] & (~pmod[1] | ~pmod[2])) | (~pmod[1] & ~pmod[2]);
	
	

endmodule