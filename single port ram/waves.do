vsim -voptargs=+acc work.mem_tb
add wave -position insertpoint  \
sim:/mem_tb/data \
sim:/mem_tb/clk \
sim:/mem_tb/we \
sim:/mem_tb/address \
sim:/mem_tb/data_out
run