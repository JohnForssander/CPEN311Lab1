onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MyDivider_Tb/inclk
add wave -noupdate /MyDivider_Tb/outclk
add wave -noupdate /MyDivider_Tb/MyDivider/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26 ps} 0} {{Cursor 2} {460 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1050 ps}
