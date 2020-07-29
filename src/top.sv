module qam (
	clk_mod_carrier,
	clk_mod_signal,
	signal_in,
	clk_demod_carrier,
	clk_demod_signal,
	signal_out,
	clk_symbol_out,
	filt_i,
	filt_q,
	mul_i,
	mul_q,
	pll_count_num,
	sym_i_in,
	sym_i_out,
	sym_q_in,
	sym_q_out
);
input wire clk_mod_carrier;
input wire clk_mod_signal;
input wire signal_in;
input wire clk_demod_carrier;
input wire clk_demod_signal;
output wire signal_out;
output wire clk_symbol_out;
output wire [7:0] filt_i;
output wire [7:0] filt_q;
output wire [7:0] mul_i;
output wire [7:0] mul_q;
output wire [4:0] pll_count_num;
output wire [1:0] sym_i_in;
output wire [1:0] sym_i_out;
output wire [1:0] sym_q_in;
output wire [1:0] sym_q_out;

wire [7:0] SYNTHESIZED_WIRE_0;

mod_top mod_top (
	.clk_carrier(clk_mod_carrier),
	.clk_signal(clk_mod_signal),
	.signal(signal_in),
	.mod_out(SYNTHESIZED_WIRE_0),
	.sym_i(sym_i_in),
	.sym_q(sym_q_in)
);

demod_top demod_top (
	.clk_carrier(clk_demod_carrier),
	.clk_signal(clk_demod_signal),
	.mod_out(SYNTHESIZED_WIRE_0),
	.clk_symbol(clk_symbol_out),
	.signal(signal_out),
	.count_num(pll_count_num),
	.filt_i(filt_i),
	.filt_q(filt_q),
	.mul_i(mul_i),
	.mul_q(mul_q),
	.sym_i(sym_i_out),
	.sym_q(sym_q_out)
);

endmodule
