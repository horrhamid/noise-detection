
`default_nettype none

module load (data, addr, dataCount, M, N, loadF, loadEn, clk, rst);
	// Parameters
	parameter ADDR_WIDTH = 8, DATA_WIDTH = 8, DEPTH = 256;

	// Outputs
	output reg [DATA_WIDTH - 1 : 0]	data;
	output reg [ADDR_WIDTH - 1 : 0]	addr;
	output reg [31 : 0] 			dataCount;
	output reg [15 : 0]				M, N;
	output reg						loadF;

	// Inputs
	input wire 						loadEn, clk, rst;

	// Variables
	integer imageFile;

	initial begin
		imageFile 	= $fopen ("../inputImage.hex", "r");
		$fscanf(imageFile, "M = %d N = %d\n", M, N);
	end

	always @(posedge clk)
		if(rst) begin
			data 		<= 0;
			addr 		<= 0;
			dataCount	<= 0;
			loadF 	<= 0;
		end // if(rst)
		else if(loadEn) begin
			if ($fscanf(imageFile , "%h\n", data) == -1) begin
							loadF <= 1;
			end // if(End of file)
			else begin
				@(negedge clk)
				#5
				addr 		<= addr + 1;
				dataCount	<= dataCount + 1;
			end // else
		end // else if(loadEn)

endmodule