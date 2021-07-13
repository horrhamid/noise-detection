
`default_nettype none

module mux21 (y, d1, d0, s);
	// Parameters
	parameter W = 8;
	
	// Outputs
	output wire [W - 1 : 0] y;

	// Inputs
	input wire [W - 1 : 0]	d1, d0;
	input wire s;

	// Dataflow Description of module
	assign y = s ? d1 : d0;
endmodule