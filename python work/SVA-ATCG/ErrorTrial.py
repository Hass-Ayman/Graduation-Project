def DoFileGeneration (path):
        file=open(path +"/waves.do","w")
        file.write("vsim -voptargs=+acc work.memory_tb\n")
        file.write("add wave -position insertpoint  \ \n")
        file.write("sim:/mem_tb/clk \ \n")
        file.write("sim:/mem_tb/address \ \n")
        file.write("sim:/mem_tb/data \ \n")
        file.write("sim:/mem_tb/we \ \n")
        file.write("sim:/mem_tb/oe \ \n")
        file.write("sim:/mem_tb/cs \ \n")
        file.write("sim:/mem_tb/data_out\n")
        file.write("run\n")
if __name__ == '__main__':
    DoFileGeneration("D:/")
    
    