
`default_nettype none

module sorter7 (min, med, max, _1, _2, _3, _4, _5, _6, _7);
	// Parameters
	parameter DATA_WIDTH = 8;

	// Outputs
	output wire [DATA_WIDTH - 1 : 0] min, med, max;

	// Inputs
	input wire [DATA_WIDTH - 1 : 0]  _1, _2, _3, _4, _5, _6, _7;

	// Wires
	wire [DATA_WIDTH - 1 : 0]	_11, _12, _13, _14, _15, _16, _17;
	wire [DATA_WIDTH - 1 : 0]	_21, _22, _23, _24, _25, _26, _27;
	wire [DATA_WIDTH - 1 : 0]	_31, _32, _33, _34, _35, _36, _37;
	wire [DATA_WIDTH - 1 : 0]	_41, _42, _43, _44, _45, _46, _47;
	wire [DATA_WIDTH - 1 : 0]	_51, _52, _53, _54, _55, _56, _57;
	wire [DATA_WIDTH - 1 : 0]	_61, _62, _63, _64, _65, _66, _67;
	wire [DATA_WIDTH - 1 : 0]	_71, _72, _73, _74, _75, _76, _77;

	// Dataflow of signals
	assign _21 = _11;
	assign _41 = _31;
	assign _61 = _51;
	assign _17 = _7;
	assign _37 = _27;
	assign _57 = _47;
	assign min = _67;

	// Instantiation of modules
	sorter2 #(.DATA_WIDTH(8))	
						sb11(_11, _12, _1, _2),
						sb12(_13, _14, _3, _4),
						sb13(_15, _16, _5, _6),
						
						sb21(_22, _23, _12, _13),
						sb22(_24, _25, _14, _15),
						sb23(_26, _27, _16, _17),

						sb31(_31, _32, _21, _22),
						sb32(_33, _34, _23, _24),
						sb33(_35, _36, _25, _26),

						sb41(_42, _43, _32, _33),
						sb42(_44, _45, _34, _35),
						sb43(_46, _47, _36, _37),

						sb51(_51, _52, _41, _42),
						sb52(_53, _54, _43, _44),
						sb53(_55, _56, _45, _46),

						sb61(_62, _63, _52, _53),
						sb62(_64, _65, _54, _55),
						sb63(_66, _67, _56, _57),

						sb71(max,  , _61, _62),
						sb72(  , med, _63, _64);

endmodule

