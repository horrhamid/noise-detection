
`default_nettype none

module sorter9 (min, med, max, _1, _2, _3, _4, _5, _6, _7, _8, _9);
	// Parameters
	parameter DATA_WIDTH = 8;

	// Outputs
	output wire [DATA_WIDTH - 1 : 0] min, med, max;

	// Inputs
	input wire [DATA_WIDTH - 1 : 0]  _1, _2, _3, _4, _5, _6, _7, _8, _9;

	// Wires
	wire [DATA_WIDTH - 1 : 0]	min0, med0, max0, min1, med1, max1, min2, med2, max2, min3, med3, min4, med4, max4, med5, max5, min6, max7;

	// Instantiation of modules
	sb	#(.DATA_WIDTH(DATA_WIDTH))	sb0(min0, med0, max0, _1, _2, _3),
							sb1(min1, med1, max1, _4, _5, _6),
							sb2(min2, med2, max2, _7, _8, _9),
							sb3(min3, med3, max , max0, max1, max2),
							sb4(min4, med4, max4, med0, med1, med2),
							sb5(min , med5, max5, min0, min1, min2),
							sb6(min6,	  ,	  , med3, min3, max4),
							sb7(	  ,	  , max7, min4, max5, med5),
							sb8(	  , med , 	  , min6, med4, max7);

endmodule
