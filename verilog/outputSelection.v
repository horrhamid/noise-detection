
`default_nettype none

module outputSelection(out, _0, _1, noiseF);
	// Parameters
	parameter DATA_WIDTH = 8;

	// Outputs
	output wire [DATA_WIDTH - 1 : 0] 	out;

	// Inputs
	input wire [DATA_WIDTH - 1 : 0] 	_0, _1;
	input wire 					noiseF;

	// Dataflow description of module
	assign out = noiseF ? _1 : _0;
endmodule
