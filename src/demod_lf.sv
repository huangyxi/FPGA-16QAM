module demod_lf (clk, filt_i, filt_q, phase_shift, count_num);
	localparam N = 32;
	localparam  n = $clog2(N);
	input wire clk;
	input wire signed [7:0] filt_i;
	input wire signed [7:0] filt_q;
	output wire phase_shift;
	output wire [4:0] count_num;

	`include "utils.sv"

	bit phase = 0;
	reg [N-1:0] vec_queue_shift = 0;
	reg [n-1:0] count_delay = 1;
	bit is_shift = 0;
	reg do_delay = 0;
	assign phase_shift = phase;

	always @(posedge clk) begin
		is_shift = (abs_8(filt_i) < 10) & (abs_8(filt_q) > 20) | (abs_8(filt_q) < 10) & (abs_8(filt_i) > 20);
		vec_queue_shift = (vec_queue_shift << 1) + is_shift;
		if (~do_delay && count_num > 21) begin
			phase = ~phase;
			do_delay = 1'b1;
		end
		if (count_delay == 1'b0) begin
			do_delay = 1'b0;
			count_delay = 1'b1;
		end
		if (do_delay) begin
			count_delay = count_delay + 1'b1;
		end
	end

	count_1 #(.N(N)) count_lf (
		.data(vec_queue_shift),
		.count(count_num)
	);
endmodule