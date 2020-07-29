function reg [3:0] code (
	input [3:0] signal
);
	localparam reg [3:0] CODE_MAT [0:15] = '{
		10, 11, 13, 14,
		9, 8, 12, 15,
		7, 4, 0, 1,
		6, 5, 3, 2
	};
	return CODE_MAT[signal];
endfunction


function reg [3:0] i_code (
	input [3:0] signal
);
	localparam reg [3:0] I_CODE_MAT [0:15] = '{
		10, 11, 15, 14,
		9, 13, 12, 8,
		5, 4, 0, 1,
		6, 2, 3, 7
	};
	return I_CODE_MAT[signal];
endfunction