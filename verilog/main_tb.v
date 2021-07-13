
`default_nettype none

module main_tb;
	reg clk, rst;
	wire endF;

	main main0 (endF, clk, rst);

	// Clock signal
	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	// Reset Signal
	initial begin
			rst <= 1;
		#30	rst <= 0;
	end

	// End of simulation
	always @(posedge clk)
		if(endF) $stop;

endmodule
