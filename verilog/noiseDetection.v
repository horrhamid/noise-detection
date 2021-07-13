
`default_nettype none

module noiseDetection (noiseF, wCenter);
	// Parameters
	parameter DATA_WIDTH = 8, T1 = 0, T2 = 255;

	// Outputs
	output wire noiseF;
	
	//Inputs
	input wire [DATA_WIDTH - 1 : 0] wCenter;

	// Dataflow Description
	assign noiseF =	(wCenter <= T1) ? 1 :
				(wCenter >= T2) ? 1 : 0;
endmodule
