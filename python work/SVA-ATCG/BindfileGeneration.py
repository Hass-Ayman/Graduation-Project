
class BindingFile ():
    
    def BindingFileGeneration (self,path,assertions_ports,assertions_module,bindfile_module):
        file=open(path +"/bindfile.sv","w")
        file.write("module {};\n".format(bindfile_module))
        file.write("bind memory_tb {} U_assert (\n".format(assertions_module))
        file.write(".{} (clk),\n".format(assertions_ports[0]))
        file.write(".{} (address)\n".format(assertions_ports[1]))
        file.write(".{} (data),\n".format(assertions_ports[2]))
        file.write(".{} (we),\n".format(assertions_ports[3]))
        file.write(".{} (oe),\n".format(assertions_ports[4]))
        file.write(".{} (cs),\n".format(assertions_ports[5]))
        file.write(");\n") 
        file.write("endmodule")
