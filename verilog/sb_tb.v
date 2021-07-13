
`default_nettype none

module sb_tb;
	reg [7 : 0] _1, _2, _3;
	wire [7 : 0] min, med, max;

	sb #(.DATA_WIDTH(8)) sb0(min, med, max, _1, _2, _3);

	initial begin
		_1 <= 0;
		_2 <= 0;
		_3 <= 0;
		$monitor("%d, %d, %d : min = %d, med = %d, max = %d", _1, _2, _3, min, med, max);
		#10
		_1 <= 200;
		#10
		_2 <= 255;
		#10
		_3 <= 220;
		#10
		_2 <= 100;
		#10
		_3 <= 10;
		#10
		_1 <= 1;
		#10
		_1 <= 145;
		_2 <= 145;
		_3 <= 145;
	end
endmodule
