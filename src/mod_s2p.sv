module mod_s2p (
	input wire clk,
	input wire signal,
	output wire [1:0] sym_i,
	output wire [1:0] sym_q
);
	`include "code.sv"

	reg [1:0] count = 0;
	reg addr = 0;
	reg [3:0] signal_cache = 0;
	reg [3:0] coded [0:1] = '{0, 0};
	reg [3:0] cc;
	assign sym_i = coded[addr][3:2];
	assign sym_q = coded[addr][1:0];

	always @(posedge clk) begin
		signal_cache[count] = signal;
		count = count + 1'b1;
		if (count == 2'b00) begin
			cc = code(coded[addr]);
			coded[~addr] = i_code(cc + signal_cache);
			addr = ~addr;
		end
	end

endmodule