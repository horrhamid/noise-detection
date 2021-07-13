
`default_nettype none

module slider(addrP, lastPixelF, trig, M , N, clk, rst);
	// Parameters
	parameter ADDR_WIDTH = 8, WINDOW_N = 2;

	// Outputs
	output reg [ADDR_WIDTH - 1 : 0] 	addrP;
	output reg					lastPixelF;
	
	// Inputs
	input wire 			trig, clk, rst;
	input wire [15 : 0] 	M, N;
	
	// Registers
	reg [15 : 0]	i, j;
	reg 			lastPixel;
	always @(posedge rst) begin
		i		<= WINDOW_N;
		j		<= WINDOW_N;
		lastPixelF	<= 0;
		lastPixel	<= 0;
	end // always @(posedge rst)

	always @(posedge trig) begin
		#5
		addrP <= i * N + j;
		if(lastPixel)
			lastPixelF = 1;
		j <= j + 1;
		if(j == N - WINDOW_N - 1) begin
			j <= WINDOW_N;
			i <= i + 1;
			if(i == M - WINDOW_N - 1)
				lastPixel <= 1;
		end // f(j == N)
	end // always @(posedge trig)
endmodule
