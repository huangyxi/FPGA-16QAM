module demod_4ask (
	input wire clk_carrier,
	input wire clk_symbol, // fs/4
	input wire signed [7:0] filt_data,
	output wire [1:0] symbol
);
	`include "utils.sv"

	localparam N = 200;
	localparam  n = $clog2(N);

	bit [N-1:0] queue [1:0] = '{0,0};
	wire [n-1:0] count [1:0];

	reg [1:0] sym = 0;
	reg [1:0] m_symbol;
	assign symbol = m_symbol;

	always @(posedge clk_carrier) begin
		queue[1] = (queue[1] << 1) + (filt_data > 0);
		queue[0] = (queue[0] << 1) + (abs_8(filt_data) > 40);
		sym[1] = (count[1]>N/2) ? 1'b1 : 1'b0;
		sym[0] = (count[0]>N/2) ? 1'b1 : 1'b0;
	end

	always @(negedge clk_symbol) begin
		case (sym)
			2'b00: m_symbol = 1;
			2'b01: m_symbol = 0;
			2'b10: m_symbol = 2;
			2'b11: m_symbol = 3;
		endcase
	end

	count_1 #(.N(N)) count_4ask_1 (
		.data(queue[1]),
		.count(count[1])
	);

	count_1 #(.N(N)) count_4ask_0 (
		.data(queue[0]),
		.count(count[0])
	);

endmodule