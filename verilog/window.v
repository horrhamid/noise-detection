
`default_nettype none

`include "PACK_ARRAY.v"

module window(pack_w , addrIn, windowF, dataIn, addrP, N, clk, rst);
	// Parameters
	parameter DATA_WIDTH = 8, ADDR_WIDTH = 8, WINDOW_N = 2;
	parameter WINDOW_W = 2 * WINDOW_N + 1;
	parameter WINDOW_S = WINDOW_W * WINDOW_W;

	// Outputs 
	output wire [199 : 0] 			pack_w;
	output reg [ADDR_WIDTH - 1 : 0] 	addrIn;
	output reg 					windowF;

	// Inputs
	input wire [DATA_WIDTH - 1 : 0] 	dataIn;
	input wire [ADDR_WIDTH - 1 : 0] 	addrP;
	input wire [15 : 0]			N;
	input wire 					clk, rst;

	// Registers
	reg [7 : 0] 				w [24 : 0];
	`PACK_ARRAY(8, 25, w, pack_w)

	// Wires
	wire [ADDR_WIDTH - 1 : 0] 		addrW;

	// Variables
	integer index, i, j;

	// Dataflow description 
	assign addrW = addrP + (i * N) + j;

	// Behavioral description of module
	always @(addrP) begin // Create new window
		windowF 	<= 0;
		i 		<= -WINDOW_N;
		j		<= -WINDOW_N;
		index		<= 0;
	end // always @(addrP)

	always @(posedge clk)
		if(rst) begin // Reset window
			// Reset w
			for (index = 0; index < 25; index = index + 1)
				w[index] = 0;
			windowF 	<= 1;
		end // if(rst)
		else if(~windowF) begin // Load window
			addrIn 	<= addrW;
			j		<= j + 1;
			if(j == WINDOW_N) begin
				j	<= -WINDOW_N;
				i	<= i + 1;
				// if (i == WINDOW_N + 1)
				// 	i <= -N
			end // if(j == WINDOW_W)
			@(negedge clk)
			#5
			w[index] 	<= dataIn;
			index 	<= index + 1;
			if (index == WINDOW_S)
				windowF = 1;
		end // if(~windowF)
endmodule
