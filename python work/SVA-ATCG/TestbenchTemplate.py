
class TemplateGeneration():
    
    def testbenchgeneration(self,path,parameters,rtl_module,rtl_ports,bindfile_module):
        
        clk=rtl_ports[0]
        address=rtl_ports[1]
        data=rtl_ports[2]
        we=rtl_ports[3]
        oe=rtl_ports[4]
        cs=rtl_ports[5]
        
        datawidth=parameters[0]
        ramdepth=parameters[1]
        addresswidth=parameters[2]
        
        file=open(path +"/testbench.sv","w")
        file.write("`timescale 1ns/1p\n")
        file.write("`define data_width ({})\n".format(datawidth))
        file.write("`define ram_depth ({})\n".format(ramdepth))
        file.write("`define address_width ({})\n\n".format(addresswidth))
        file.write("module memory_tb();\n\n")
        file.write("    reg {};\n".format(clk))
        file.write("    reg[`address_width-1:0] {};\n".format(address))        
        file.write("    wire[`data_width-1:0] {};\n".format(data))
        file.write("    reg {};\n".format(we))
        file.write("    reg {};\n".format(oe))
        file.write("    reg {};\n".format(cs))
        file.write("    reg[`data_width-1:0] data_out;\n\n")
        file.write("    {} bindass();\n\n".format(bindfile_module))
        file.write("    {} inst(.{}({}), .{}({}), .{}({}), .{}({}), .{}({}), .{}({});\n\n".format(rtl_module,clk,clk,address,address,data,data,we,we,oe,oe,cs,cs))
        file.write("    initial begin\n")
        file.write("        {} <= 0;\n".format(clk))
        file.write("        {} <= 0;\n".format(address))
        file.write("        {} <= 0;\n".format(we))
        file.write("        {} <= 0;\n".format(oe))
        file.write("        {} <= 0;\n".format(cs))
        file.write("        #5;\n")
        file.write("    end\n\n")
        file.write("    always\n")
        file.write("        #5  {} =  ! {};\n\n".format(clk,clk))
        file.write("    assign data = ({} && {} && !{}) ? data_out : {}'bz;\n\n".format(cs,we,oe,datawidth))
        
        file.write("endmodule")