class DOFile ():
    
    def DoFileGeneration (self,path):
        file=open(path +"/waves.do","w")
        file.write("vsim -voptargs=+acc work.memory_tb\n")
        file.write("add wave -position insertpoint  \ \n")
        file.write("sim:/memory_tb/clk \ \n")
        file.write("sim:/memory_tb/address \ \n")
        file.write("sim:/memory_tb/data \ \n")
        file.write("sim:/memory_tb/we \ \n")
        file.write("sim:/memory_tb/oe \ \n")
        file.write("sim:/memory_tb/cs \ \n")
        file.write("sim:/memory_tb/data_out\n")
        file.write("run")