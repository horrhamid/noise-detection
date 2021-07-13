
`default_nettype none

module sorter2 (max, min, _1, _2);
	// Parameters
	parameter DATA_WIDTH = 8;

	// Outputs
	output wire [DATA_WIDTH - 1 : 0] min, max;

	// Inputs
	input wire [DATA_WIDTH - 1 : 0] _1, _2;

	// Dataflow description on module
	assign min = (_1 <= _2) ? _1 : _2;
	assign max = (_1 >  _2) ? _1 : _2;
endmodule