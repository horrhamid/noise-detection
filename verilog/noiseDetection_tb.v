
`default_nettype none

module noiseDetection_tb;
	// Wires
	wire noiseF;

	// Registers
	reg [7 : 0] wCenter;

	noiseDetection #(.DATA_WIDTH(8), .T1(0), .T2(255))	noiseDetection0(noiseF, wCenter);

	initial begin
		$monitor("wCenter = %d, noiseF = %b", wCenter, noiseF);
		#10 wCenter = 14;
		#10 wCenter = 0;
		#10 wCenter = 200;
		#10 wCenter = 100;
		#10 wCenter = 255;
		#10 wCenter = 0;
		#10 wCenter = 250;
		#10 wCenter = 255;
	end
endmodule
