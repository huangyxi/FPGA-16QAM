module demod_lpf (clk, in, out);
	input wire clk;
	input wire signed [7:0] in;
	output wire signed [7:0] out;

	`include "utils.sv"

	localparam reg [3:0] N = 8;
	localparam D_N = $clog2(N+1); // 4
	localparam reg [D_N-1:0] F_N = -1'b1; // 2N-1
	localparam reg signed [7:0] b [0:N] = '{
		16,46,74,95,102,95,74,46,16
		// 8,23,37,47,51,47,37,23,8
		// 4,11,19,24,26,24,19,11,4
	};

	reg [(D_N-1):0] addr = 0;
	reg signed [7:0] cache [0:F_N] = '{(F_N+1){0}};
	reg signed [15:0] pipeline [0:N] = '{(N+1){0}};
	assign out = pipeline[N][15:8];

	always @(posedge clk) begin
		cache[addr] = in;
		for (reg [(D_N-1):0] i = N; i > 0; i = i - 1'b1) begin
			pipeline[i] = cache[addr+N-i] * b[i] + pipeline[i-1];
		end
		pipeline[0] = cache[addr] * b[0];
		// t_out <= pipeline[N];
		addr <= addr==1'b0 ? F_N : addr - 1'b1;
	end

endmodule