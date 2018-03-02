class DOFile ():
    
    def DoFileGeneration (self,path,rtl_ports):
        
        clk_rtl=rtl_ports[0]
        address_rtl=rtl_ports[1]
        data_rtl=rtl_ports[2]
        we_rtl=rtl_ports[3]
        oe_rtl=rtl_ports[4]
        cs_rtl=rtl_ports[5]
        
        file=open(path +"/waves.do","w")
        file.write("cd {}\n".format(path))
        file.write("vlib work\n")
        file.write("vlog *.v\n")
        file.write("vlog *.sv\n")
        file.write("vsim -voptargs=+acc work.memory_tb\n")
        file.write("add wave -position insertpoint  \ \n")
        file.write("sim:/memory_tb/{} \ \n".format(clk_rtl))
        file.write("sim:/memory_tb/{} \ \n".format(address_rtl))
        file.write("sim:/memory_tb/{} \ \n".format(data_rtl))
        file.write("sim:/memory_tb/{} \ \n".format(we_rtl))
        file.write("sim:/memory_tb/{} \ \n".format(oe_rtl))
        file.write("sim:/memory_tb/{} \ \n".format(cs_rtl))
        file.write("sim:/memory_tb/data_out\n")
        file.write("run\n")
        file.write("run 100us")