module seven_seg(
	input wire[3:0] bcd,
	output wire[6:0] segments
);

assign segments =
	//              ABCDEFG
	(bcd == 0) ? 7'b1111110 :
	(bcd == 1) ? 7'b0110000 :
	(bcd == 2) ? 7'b1101101 :
	(bcd == 3) ? 7'b1111001 :
	(bcd == 4) ? 7'b0110011 :
	(bcd == 5) ? 7'b1011011 :
	(bcd == 6) ? 7'b1011111 :
	(bcd == 7) ? 7'b1110000 :
	(bcd == 8) ? 7'b1111111 :
	(bcd == 9) ? 7'b1110011 :
	7'b0000000;

endmodule

