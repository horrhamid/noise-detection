
`default_nettype none

module sb (min, med, max, _1, _2, _3);
	// Parameters
	parameter DATA_WIDTH = 8;

	// Outputs
	output wire [DATA_WIDTH - 1 : 0] min, med, max;

	// Inputs
	input wire [DATA_WIDTH - 1 : 0] _1, _2, _3;

	// Wires
	wire [DATA_WIDTH - 1 : 0]	max12, min12, med0;
	wire 					c0, c1 ,c2;

	// Instantiation of modules
	comparator	#(.DATA_WIDTH(DATA_WIDTH))	cmp0(c0, _1, _2),
								cmp1(c1, max12, med0),
								cmp2(c2, min12, _3);
	
	mux21		#(.W(DATA_WIDTH))			mux0(max12, _2, _1, c0),
								mux1(min12, _1, _2, c0),
								mux2(med0, _3, min12, c2),
								mux3(min, min12, _3, c2),
								mux4(max, med0, max12, c1),
								mux5(med, max12, med0, c1);
endmodule