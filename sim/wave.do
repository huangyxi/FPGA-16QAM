onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_top/clk_carrier
add wave -noupdate /t_top/clk_signal
add wave -noupdate /t_top/signal_in
add wave -noupdate /t_top/signal_out
add wave -noupdate -format Analog-Step -height 74 -max 90.0 -min -92.0 -radix decimal /t_top/mod_out
add wave -noupdate /t_top/sym_i
add wave -noupdate /t_top/sym_q
add wave -noupdate /t_top/sym_i_out
add wave -noupdate /t_top/sym_q_out
add wave -noupdate -format Analog-Step -height 74 -max 65.0 -min -66.0 -radix decimal /t_top/mul_i
add wave -noupdate -format Analog-Step -height 74 -max 65.0 -min -92.0 -radix decimal /t_top/mul_q
add wave -noupdate -format Analog-Step -height 74 -max 77.0 -min -78.0 -radix decimal /t_top/filt_i
add wave -noupdate -format Analog-Step -height 74 -max 90.0 -min -103.0 -radix decimal /t_top/filt_q
add wave -noupdate -format Analog-Step -height 74 -max 29.0 -radix unsigned /t_top/count_num
add wave -noupdate /t_top/clk_symbol
TreeUpdate [SetDefaultTree]
quietly wave cursor active 1
configure wave -namecolwidth 191
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 us} {5 us}
