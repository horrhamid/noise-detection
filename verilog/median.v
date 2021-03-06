
`default_nettype none

`include "PACK_ARRAY.v"

module median(min3, med3, max3, min5, med5, max5, pack_wBuffer);
	// Parameters
	parameter WINDOW_BITS = 200, WINDOW_S = 25, DATA_WIDTH = 8;

	// Outputs
	output wire [DATA_WIDTH - 1 : 0] min3, med3, max3, min5, med5, max5;

	// Inputs
	input wire [WINDOW_BITS - 1 : 0] pack_wBuffer;
	
	// Wires
	wire [DATA_WIDTH - 1 : 0]	wBuffer [WINDOW_S - 1 : 0];
	`UNPACK_ARRAY(DATA_WIDTH, WINDOW_S, wBuffer, pack_wBuffer)
	wire [DATA_WIDTH - 1 : 0] minU, medU, maxU, minD, medD, maxD;
	
	// Instantiation of modules
	sorter9 #(.DATA_WIDTH(DATA_WIDTH))	sorterU(minU, medU, maxU, wBuffer[0], wBuffer[1], wBuffer[2], wBuffer[3], wBuffer[4], wBuffer[5], wBuffer[9], wBuffer[10], wBuffer[14]),
										sorterC(min3, med3, max3, wBuffer[6], wBuffer[7], wBuffer[8], wBuffer[11], wBuffer[12], wBuffer[13], wBuffer[16], wBuffer[17], wBuffer[18]),
										sorterM(min5, med5, max5, minU, medU, maxU, min3, med3, max3, minD, medD, maxD);
	
	sorter7 #(.DATA_WIDTH(DATA_WIDTH))	sorterD(minD, medD, maxD, wBuffer[15], wBuffer[19], wBuffer[20], wBuffer[21], wBuffer[22], wBuffer[23], wBuffer[24]);

endmodule