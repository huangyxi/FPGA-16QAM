module freq_div #(
	parameter N = 16
) (
	input wire clk_orig,
	output wire clk_dived
);

	localparam n = N/2;
	reg [$clog2(n)-1:0] count = 0;
	reg x = 0;
	assign clk_dived = x;

	always @(posedge clk_orig) begin
		if (count < n - 1) begin
			count = count + 1'b1;
		end else begin
			x = ~x;
			count = 0;
		end
	end

endmodule