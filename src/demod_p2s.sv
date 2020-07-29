module demod_p2s (
	input wire clk_symbol,
	input wire clk_signal,
	input wire [1:0] sym_i,
	input wire [1:0] sym_q,
	output wire signal
);
	`include "code.sv"

	reg [1:0] count = 0;
	reg [1:0] addr = 0;
	bit [3:0] coded [0:3] = '{4{0}};
	reg m_signal = 0;
	reg [3:0] cc = 0;
	assign signal = m_signal;
	wire [3:0] symbols = {sym_i, sym_q};

	always @(posedge clk_symbol) begin
		coded[addr+1'b1] = code(symbols);
	end

	always @(posedge clk_signal) begin
		count = count + 1'b1;
		if (count == 0) begin
			cc = coded[addr+1'b1] - coded[addr];
			addr = addr + 1'b1;
		end
		m_signal = cc[count];
	end

endmodule