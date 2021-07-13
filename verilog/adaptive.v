
`default_nettype none

module adaptive (out, min3, med3, max3, min5, med5, max5, wCenter);
	// Parameters
	parameter DATA_WIDTH = 8;

	// Outputs
	output wire [DATA_WIDTH - 1 : 0] out;

	// Inputs 
	input wire [DATA_WIDTH - 1 : 0] min3, med3, max3, min5, med5, max5, wCenter;

	// Wires
	wire ws;
	wire [DATA_WIDTH - 1 : 0] out3, out5;

	// Dataflow description of module

	// Select Window Size (ws = 1 : 5x5, ws = 0 : 3x3)
	assign ws = ((min3 == med3)) || (med3 == max3) ? 1 : 0;

	// 3x3 Window
	assign out3 = ((wCenter == min3) || (wCenter == max3)) ? med3 : wCenter;

	// 5x5 Window
	assign out5 = ((wCenter == min5) || (wCenter == max5)) ? med5 : wCenter;

	// Output Selection
	assign out = ws ? out5 : out3;
endmodule