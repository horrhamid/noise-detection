
`default_nettype none

module sram (dataOut, dataIn, addr, wr, clk, rst);
	// Parameters
	parameter ADDR_WIDTH = 8, DATA_WIDTH = 8, DEPTH = 256;
	
	// I/Os
	output reg [DATA_WIDTH - 1 : 0] dataOut;
	input wire [DATA_WIDTH - 1 : 0] dataIn;
	input wire [ADDR_WIDTH - 1 : 0] addr;
	input wire wr, clk, rst;

	// Internal Registers
	reg [DATA_WIDTH - 1 : 0] mem [DEPTH - 1 : 0];

	// Module Behavioral Description
	always @(negedge clk)
		if(wr) mem[addr] <= dataIn;
		else dataOut <= mem[addr];

	integer index;
	always @(posedge rst)
		for (index = 0; index < DEPTH; index = index + 1)
			mem[index] <= 0;
endmodule