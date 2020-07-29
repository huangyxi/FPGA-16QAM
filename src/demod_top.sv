module demod_top (
	input wire clk_carrier,
	input wire clk_signal,
	input wire signed [7:0] mod_out,
	output wire signed [7:0] mul_i,
	output wire signed [7:0] mul_q,
	output wire signed [7:0] filt_i,
	output wire signed [7:0] filt_q,
	output wire [4:0] count_num,
	output wire clk_symbol,
	output wire [1:0] sym_i,
	output wire [1:0] sym_q,
	output wire signal
);

	wire signed [7:0] carrier_cos;
	wire signed [7:0] carrier_sin;
	wire phase_shift;

	demod_vco demod_vco (
		.clk(clk_carrier),
		.v(phase_shift),
		.cos(carrier_cos),
		.sin(carrier_sin)
	);

	demod_mul demod_mul (
		.clk(clk_carrier),
		.signal(mod_out),
		.cos(carrier_cos),
		.sin(carrier_sin),
		.out_i(mul_i),
		.out_q(mul_q)
	);

	demod_lpf demod_lpf_i (
		.clk(clk_carrier),
		.in(mul_i),
		.out(filt_i)
	);

	demod_lpf demod_lpf_q (
		.clk(clk_carrier),
		.in(mul_q),
		.out(filt_q)
	);

	demod_lf demod_lf (
		.clk(clk_carrier),
		.filt_i(filt_i),
		.filt_q(filt_q),
		.phase_shift(phase_shift),
		.count_num(count_num)
	);

	demod_4ask demod_4ask_i (
		.clk_carrier(clk_carrier),
		.clk_symbol(clk_symbol),
		.filt_data(filt_i),
		.symbol(sym_i)
	);

	demod_4ask demod_4ask_q (
		.clk_carrier(clk_carrier),
		.clk_symbol(clk_symbol),
		.filt_data(filt_q),
		.symbol(sym_q)
	);

	demod_p2s demod_p2s (
		.clk_symbol(clk_symbol),
		.clk_signal(clk_signal),
		.sym_i(sym_i),
		.sym_q(sym_q),
		.signal(signal)
	);

	freq_div #(.N(2)) sig2sym (
		.clk_orig(clk_signal),
		.clk_dived(clk_symbol)
	);

endmodule