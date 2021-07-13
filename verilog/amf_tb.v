
`default_nettype none

module amf_tb;
	// Registers
	reg 			filterEn, clk, rst;
	reg [7 : 0] 	sram0 [255 : 0];
	reg [7 : 0]		sram1[255 : 0];
	reg [15 : 0]	M,N;
	reg [7 : 0]		dataIn;
	// Wires
	wire [7 : 0] dataOut;
	wire [7 : 0] addrOut, addrIn;
	wire filterF;

	// Instantiation of amf module
	amf #(.DATA_WIDTH(8), .ADDR_WIDTH(8))	amf0(dataOut, addrOut, addrIn, filterF, dataIn, M, N, filterEn, clk, rst);

	// Load SRAM 0 (input data)
	integer index;
	initial
		for (index = 0; index <256; index = index + 1)
			sram0[index] = index;

	
	initial begin
		clk = 0;
		M = 15;
		N = 15;
		forever #10 clk = ~clk;
	end

	initial begin
		rst = 1;
		filterEn = 0;
		#30
		rst = 0;
		filterEn = 1;
		@(posedge filterF)
		#10
		@(posedge clk)
		$stop;
	end

	always @(negedge clk) fork
		dataIn = sram0[addrIn];
		sram1[addrOut] = dataOut;
	join
endmodule
