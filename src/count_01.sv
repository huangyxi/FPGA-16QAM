module count_1 (data, count);
	parameter N = 32;
	localparam n = $clog2(N);
	input wire [N-1:0] data;
	output wire [n-1:0] count;

	wire [n-1:0] m_count [0:N-1];
	assign count = m_count[N-2];

	generate
		genvar i;
		assign m_count[0] = data[0] + data[1];
		for (i = 1; i < N - 1; i = i + 1) begin: gen_count_1
			assign m_count[i] = m_count[i-1] + data[i+1];
		end
	endgenerate

endmodule


module count_0 (data, count);
	parameter N = 8;
	localparam n = $clog2(N) - 1;
	input wire [N-1:0] data;
	output reg [n-1:0] count;

	reg [n-1:0] m_count [0:N-1] = '{(N){data[0]}};
	assign count = m_count[N-1];

	generate
		genvar i;
		for (i = 1; i < N; i = i + 1) begin: gen_count_0
			assign m_count[i] = m_count[i-1] + ~data[i];
		end
	endgenerate

endmodule
