class DOFile ():
    
    def DoFileGeneration (self,path):
        
        file=open(path +"/waves.do","w")
        file.write("cd {}\n".format(path))
        file.write("project new {} Memory_Project\n".format(path))
        file.write("vlib work\n")
        file.write("vlog *.v\n")
        file.write("vlog *.sv\n")
        file.write("vsim -voptargs=+acc work.memory_tb\n")
        file.write("add wave * \n")
        file.write("run -all")