module demod_mul (
	input wire clk,
	input wire signed [7:0] signal,
	input wire signed [7:0] cos,
	input wire signed [7:0] sin,
	output reg signed [7:0] out_i,
	output reg signed [7:0] out_q
);
	`include "utils.sv"

	always @(posedge clk) begin
		out_i <= qss_mul(signal, cos);
		out_q <= qss_mul(signal, sin);
	end

endmodule