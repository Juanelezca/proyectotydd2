onerror {quit -f}
vlib work
vlog -work work control_tiempo.vo
vlog -work work control_tiempo.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.control_tiempo_vlg_vec_tst
vcd file -direction control_tiempo.msim.vcd
vcd add -internal control_tiempo_vlg_vec_tst/*
vcd add -internal control_tiempo_vlg_vec_tst/i1/*
add wave /*
run -all
