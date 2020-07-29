function reg signed [7:0] qss_mul (
	input signed [7:0] q1,
	input signed [7:0] q2
);
	automatic reg signed [14:0] m_q = q1 * q2;
	return m_q[14:7];
endfunction

function reg signed [7:0] qsu_mul (
	input signed [7:0] q1,
	input unsigned [7:0] q2
);
	automatic reg signed [15:0] m_q = q1 * q2;
	return m_q[15:8];
endfunction

function reg signed [7:0] qsus_muladd (
	input signed [7:0] q1,
	input unsigned [7:0] q2,
	input signed [7:0] q3
);
	automatic reg signed [15:0] m_q = q1 * q2;
	return m_q[15:8] + q3;
endfunction

function reg signed [7:0] abs_8 (
	input signed [7:0] x
);
	return x > 0 ? x : -x;
endfunction