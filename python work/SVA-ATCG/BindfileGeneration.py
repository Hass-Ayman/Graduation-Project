
class BindingFile ():
    
    def BindingFileGeneration (self,path,assertions_ports,rtl_ports,assertions_module,bindfile_module):
        
        clk_ass=assertions_ports[0]
        address_ass=assertions_ports[1]
        data_ass=assertions_ports[2]
        we_ass=assertions_ports[3]
        oe_ass=assertions_ports[4]
        cs_ass=assertions_ports[5]
        
        clk_rtl=rtl_ports[0]
        address_rtl=rtl_ports[1]
        data_rtl=rtl_ports[2]
        we_rtl=rtl_ports[3]
        oe_rtl=rtl_ports[4]
        cs_rtl=rtl_ports[5]
        
        file=open(path +"/bindfile.sv","w")
        file.write("module {};\n".format(bindfile_module))
        file.write("bind memory_tb {} U_assert (\n".format(assertions_module))
        file.write(".{} ({}),\n".format(clk_ass,clk_rtl))
        file.write(".{} ({}),\n".format(address_ass,address_rtl))
        file.write(".{} ({}),\n".format(data_ass,data_rtl))
        file.write(".{} ({}),\n".format(we_ass,we_rtl))
        file.write(".{} ({}),\n".format(oe_ass,oe_rtl))
        file.write(".{} ({})\n".format(cs_ass,cs_rtl))
        file.write(");\n") 
        file.write("endmodule")
