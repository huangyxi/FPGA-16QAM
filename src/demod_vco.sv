module demod_vco (
	input wire clk,
	input wire v,
	output wire signed [7:0] cos,
	output wire signed [7:0] sin
);

	reg [2:0] count = 0;
	localparam reg signed [7:0] c_cos[0:7] = '{127, 91, 0, -91, -128, -91, 0, 91};
	localparam reg signed [7:0] c_sin[0:7] = '{0, 91, 127, 91, 0, -91, -128, -91};

	assign cos = c_cos[count + v];
	assign sin = c_sin[count + v];

	always @(posedge clk) begin
		count = count + 1'b1;
	end


endmodule