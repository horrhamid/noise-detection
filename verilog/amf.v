
`default_nettype none

`include "PACK_ARRAY.v"

`define WINDOW_N	2

module amf(dataOut, addrOut, addrIn, filterF, dataIn, M, N, filterEn, clk, rst);

	// Parameter
	parameter DATA_WIDTH = 8, ADDR_WIDTH = 8, WINDOW_N = 2, T1 = 0, T2 = 255;
	parameter WINDOW_W = 2 * WINDOW_N + 1; 		// Window's width : W = 2n + 1
	parameter WINDOW_S = WINDOW_W * WINDOW_W; 	// Window's Size : S = W * W
	parameter WINDOW_BITS = WINDOW_S * DATA_WIDTH;	// Window's Bits : BITS = S * DATA_WIDTH
	parameter WINDOW_CENTER = WINDOW_S / 2; 		// Window's Center Pixel Location : CENTER = S / 2

	// Outputs
	output wire	[DATA_WIDTH - 1 : 0] 	dataOut;
	output reg	[ADDR_WIDTH - 1 : 0] 	addrOut;
	output wire							filterF;
	output wire [ADDR_WIDTH - 1 : 0]	addrIn;
	// Inputs
	input wire [DATA_WIDTH - 1 : 0] 	dataIn;
	input wire [15 : 0] 				M, N;
	input wire					 		filterEn, clk, rst;

	// Registers
	
	// Wires
	wire [ADDR_WIDTH - 1 : 0]	addrP;
	wire [WINDOW_BITS - 1 : 0]	pack_w, pack_wBuffer;
	wire [DATA_WIDTH - 1 : 0]	wCenter, min3, med3, max3, min5, med5, max5, f;
	wire						nextPixel, windowF, lastPixelF, WBT, noiseF;
	

	// Instantiation of modules
	slider	 		#(.ADDR_WIDTH(ADDR_WIDTH))														slider0(addrP, lastPixelF, nextPixel, M, N , clk, rst);
	window 			#(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH), .WINDOW_N(`WINDOW_N))		window0(pack_w, addrIn, windowF, dataIn, addrP, N, clk, rst);
	windowBuffer	#(.WINDOW_BITS(WINDOW_BITS), .DATA_WIDTH(DATA_WIDTH), .CENTER(WINDOW_CENTER))	windowBuffer0(pack_wBuffer, wCenter,  pack_w, WBT);
	noiseDetection	#(.DATA_WIDTH(DATA_WIDTH), .T1(T1), .T2(T2))									noiseDetection0(noiseF, wCenter);
	median			#(.WINDOW_BITS(WINDOW_BITS), .WINDOW_S(WINDOW_S), .DATA_WIDTH(DATA_WIDTH))		median0(min3, med3, max3, min5, med5, max5, pack_wBuffer);
	adaptive	 	#(.DATA_WIDTH(DATA_WIDTH))														adaptive0(f, min3, med3, max3, min5, med5, max5, wCenter);
	outputSelection	#(.DATA_WIDTH(DATA_WIDTH))														outputSelection0(dataOut, wCenter, f , noiseF);

	// Dataflow Description
	assign nextPixel = filterEn & windowF;
	assign WBT = lastPixelF | windowF;
	assign filterF = lastPixelF;

	// Behavioral Description
	always @(posedge nextPixel)
			addrOut = addrP;
endmodule
