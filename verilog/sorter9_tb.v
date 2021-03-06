
`default_nettype none

module sorter9_tb;
	reg [7 : 0] _1, _2, _3, _4, _5, _6, _7, _8, _9;
	wire [7 : 0] min, med, max;

	sorter9 #(.DATA_WIDTH(8))	sorter0(min, med, max, _1, _2, _3, _4, _5, _6, _7, _8, _9);

	initial begin
		_1 <= 0;
		_2 <= 0;
		_3 <= 0;
		_4 <= 0;
		_5 <= 0;
		_6 <= 0;
		_7 <= 0;
		_8 <= 0;
		_9 <= 0;
		$monitor("%d, %d, %d, %d, %d, %d, %d, %d, %d : min = %d, med = %d, max = %d", _1, _2, _3, _4, _5, _6, _7, _8, _9, min, med, max);
		#10
		_1 <= 10;
		#10
		_2 <= 30;
		#10
		_3 <= 20;
		#10
		_4 <= 50;
		#10
		_5 <= 44;
		#10
		_6 <= 100;
		#10
		_7 <= 70;
		#10
		_8 <= 250;
		#10
		_9 <= 8;
		#10
		_4 <= 200;
		#10
		_7 <= 150;
		#10
		_2 <= 0;
		#10
		_1 <= 10;
		#10
		_3 <= 254;
		#10
		_6 <= 255;
		#10
		_2 <= 138;
		#10
		_8 <= 46;
		#10
		_1 <= 100;
		_2 <= 20;
		_3 <= 19;
		_4 <= 65;
		_5 <= 70;
		_6 <= 150;
		_7 <= 252;
		_8 <= 100;
		_9 <= 101;

	end

endmodule
