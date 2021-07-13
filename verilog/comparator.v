
`default_nettype none

module comparator (y, a, b);
	// Parameters
	parameter DATA_WIDTH = 8;

	// Outputs
	output wire y;

	// Inputs
	input wire [DATA_WIDTH - 1 : 0] a, b;

	// Dataflow Description of module
	assign y = (b > a);
endmodule
