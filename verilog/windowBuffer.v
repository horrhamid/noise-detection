
`default_nettype none

module windowBuffer (out, wCenter, in, windowF);
	// Parameters
	parameter WINDOW_BITS = 200, DATA_WIDTH = 8, CENTER = 12;
	// Outputs
	output reg [WINDOW_BITS - 1 : 0] 		out;
	output reg [DATA_WIDTH - 1 : 0]	wCenter;
	// Inputs
	input wire [WINDOW_BITS - 1 : 0] in;
	input wire windowF;

	// Behavioral Description of module
	always @(posedge windowF) begin
		out = in;
		wCenter = in[(DATA_WIDTH * CENTER + (DATA_WIDTH - 1)) : (DATA_WIDTH * CENTER)];
	end
endmodule