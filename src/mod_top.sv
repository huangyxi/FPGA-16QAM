module mod_top (
	input wire clk_carrier,
	input wire clk_signal,
	input wire signal,
	output wire signed [7:0] mod_out,
	output wire [1:0] sym_i,
	output wire [1:0] sym_q
);
	`include "utils.sv"

	wire signed [7:0] mod_cos;
	wire signed [7:0] mod_sin;
	wire signed [7:0] mul_i;
	wire signed [7:0] mul_q;
	assign mod_out = mul_i + mul_q;

	carrier_gen carrier_gen (
		.clk(clk_carrier),
		.cos(mod_cos),
		.sin(mod_sin)
	);

	mod_s2p mod_s2p (
		.clk(clk_signal),
		.signal(signal),
		.sym_i(sym_i),
		.sym_q(sym_q)
	);

	mod_mul mod_mul_i (
		.clk(clk_carrier),
		.symbol(sym_i),
		.carrier(mod_cos),
		.out(mul_i)
	);

	mod_mul mod_mul_q (
		.clk(clk_carrier),
		.symbol(sym_q),
		.carrier(mod_sin),
		.out(mul_q)
	);

endmodule