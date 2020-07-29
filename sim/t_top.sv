`timescale 1 ps/ 1 ps
module t_top();
// constants
// general purpose registers
reg clk_carrier;
reg clk_signal;
reg signal_in;
// wires
wire [7:0] mod_out;
wire [1:0] sym_i;
wire [1:0] sym_q;
wire [7:0] mul_i;
wire [7:0] mul_q;
wire [7:0] filt_i;
wire [7:0] filt_q;
wire [4:0] count_num;
wire [1:0] sym_i_out;
wire [1:0] sym_q_out;
wire clk_symbol;
wire signal_out;

reg [6:0] addr = 0;
function rand2 (
	input [6:0] addr
);
	localparam reg [0:127] r = 128'b10101110110000111111011101110110011011001111111011010000010011101111010010000111011000010111110010011101100011001110010100000010;
	rand2 = r[addr];
endfunction

// assign statements (if any)
mod_top t_mt_2 (
// port map - connection between master ports and signals/registers
	.clk_carrier(clk_carrier),
	.clk_signal(clk_signal),
	.mod_out(mod_out),
	.signal(signal_in),
	.sym_i(sym_i),
	.sym_q(sym_q)
);

demod_top t_dt_2 (
// port map - connection between master ports and signals/registers
	.clk_carrier(clk_carrier),
	.clk_signal(clk_signal),
	.mod_out(mod_out),
	.mul_i(mul_i),
	.mul_q(mul_q),
	.filt_i(filt_i),
	.filt_q(filt_q),
	.count_num(count_num),
	.clk_symbol(clk_symbol),
	.sym_i(sym_i_out),
	.sym_q(sym_q_out),
	.signal(signal_out)
);

initial
begin
// #10000000 $stop;
end

// clk_carrier
always
begin
	clk_carrier = 1'b0;
	clk_carrier = #500 1'b1;
	#500;
end

// clk_signal
always
begin
	clk_signal = 1'b0;
	clk_signal = #25000 1'b1;
	#25000;
end

// signal
always
begin
	#10000;
	addr = addr + 1;
	signal_in = rand2(addr);
	#40000;
end
endmodule

