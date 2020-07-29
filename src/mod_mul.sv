module mod_mul (
	input wire clk,
	input wire [1:0] symbol,
	input wire signed [7:0] carrier,
	output reg signed [7:0] out
);
	`include "utils.sv"

	always @(posedge clk) begin
		case (symbol)
			0: out <= qss_mul(carrier, -7'b1000000); // -1/2
			1: out <= qss_mul(carrier, -7'b0010101); // -1/6
			2: out <= qss_mul(carrier, 7'b0010101); // 1/6
			3: out <= qss_mul(carrier, 7'b1000000); // 1/2
			default:;
		endcase
	end

endmodule