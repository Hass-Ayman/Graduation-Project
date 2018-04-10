import random
class Testcases():
	def WriteOrRead(self,we,cs,oe,data,width,txt):
		txt.write('        we <= '+we+';\n        cs <= '+cs+';\n        oe <= '+oe+';\n')
		txt.write('        for(int j=0;j<31;j++) begin\n')
		txt.write('            @(negedge clk)\n')
		txt.write('            address<=address+1;\n')
		if we == '1' and data == '$urandom(j)%':
			txt.write('            data_out='+data+width+';\n')
		if we == '1' and data == "'1" :
			txt.write("            data_out='1;\n")
		if data == 'zeros':
			txt.write("            data_out='0;\n")
		txt.write('        end\n')
		txt.write('        #10;\n')
	
	
	def WriteAndRead(self,cs,data,width,txt):
	    txt.write('        for(int j=0;j<31;j++) begin\n')
	    txt.write('            @(negedge clk)\n')
	    txt.write('            we <= 1;\n            cs <=' + cs +';\n            oe <=0;\n')
	    txt.write('            address<=address+1;\n')
	    if data == '$urandom(j)%':
	        txt.write('            data_out= '+data+width+';\n')
	    if data == "'1":
	        txt.write("            data_out= '1;\n")
	    if data == 'zeros':
	        txt.write("            data_out= '0;\n")
	    txt.write('            ##2 we <= 0;\n            cs <='+cs+';\n            oe <=1;\n')
	    txt.write('            ##2;\n')
	    txt.write('        end\n')
	    txt.write('        #10;\n')

	
	def GenerateTestcases(self,parameters,rtl_ports,assertions_ports,ass_path,out_path):
	    file = open(ass_path, "r")
	    tmpfile = open ("assertions-temp.sv",'w')
	    for line in file:
	        line = line.replace(assertions_ports[0], rtl_ports[0])
	        line = line.replace(assertions_ports[2], rtl_ports[2])
	        line = line.replace(assertions_ports[3], rtl_ports[3])
	        line = line.replace(assertions_ports[1], rtl_ports[1])
	        line = line.replace(assertions_ports[5], rtl_ports[5])
	        line = line.replace(assertions_ports[4], rtl_ports[4])
	        tmpfile.write(line)
	    tmpfile.close() 
	       
	    line_temp=[]
	    with open("assertions-temp.sv","r") as in_file:
	        for line in in_file:
	            line_temp.append(line.rstrip('\n'))
	    in_file.close()  
	    
	    text = open(out_path+"/testbench.sv", "a",1)
	    text.write('    initial begin\n')
	    
	    try:
	        for m in line_temp:
	            if ('assert' in m )and ('module' not in m):
	                var = []
	                word = m.split()
	                for n in word:
	                    if n == 'assert':
	                        continue
	                    if n == 'property':
	                        continue
	                    if rtl_ports[2] in n:
	                        var.append(rtl_ports[2])
	                    if rtl_ports[3] in n:
	                        var.append(rtl_ports[3])
	                    if rtl_ports[1] in n:
	                        var.append(rtl_ports[1])
	                    if rtl_ports[5] in n:
	                        var.append(rtl_ports[5])
	                    if rtl_ports[4] in n:
	                        var.append(rtl_ports[4])
	                    if n == '|->' :
	                        var.append('|->')
	                    if n == '|=>' :
	                        var.append('|=>')
	                    if ('$' or ';') in n :
	                        break
	                length=len(var)
	                ind=0
	                while(ind<length):
	                    if '|->' in var :
	                        if var[ind] == 'we' and (('cs' and 'oe')in var ) :
	                            x = 1
	                            while (x >= 0):
	                                y = 1
	                                while (y >= 0):
	                                    z = 1
	                                    while (z >= 0):
	                                        if ( (y or z) == -1):
	                                            z=z-1
	                                            break
	                                        else:
	                                        	text.write("			address<={};##1;\n".format(int(parameters[1]*0)))
	                                        	self.WriteOrRead(str(x), str(y), str(z), '$urandom(j)%',str(2**(parameters[0])-1), text)
	                                        	text.write("			address<={};##1;\n".format(int(parameters[1]*0.2)))
	                                        	self.WriteOrRead(str(x), str(y), str(z),"'1",str(parameters[0]), text)
	                                        	text.write("			address<={};##1;\n".format(int(parameters[1]*0.4)))
	                                        	self.WriteOrRead(str(x), str(y), str(z),'$urandom(j)%',str(2**(parameters[0])-1), text)
	                                        	text.write("			address<={};##1;\n".format(int(parameters[1]*0.6)))
	                                        	self.WriteOrRead(str(x), str(y), str(z),'zeros',str(parameters[0]), text)
	                                        	text.write("			address<={};##1;\n".format(int(parameters[1]*0.8)))
	                                        	self.WriteOrRead(str(x), str(y), str(z),'$urandom(j)%',str(2**(parameters[0])-1), text)
	                                        	z = z - 1
	                                    y = y - 1
	                                x = x - 1
	                                h=1
	                                while(h>=0):
	                                    if ( (h ) == -1):
	                                        h = h - 1
	                                        break
	                                    else:
	                                    	text.write("			address<={};##1;\n".format(int(parameters[1]*0.1)))
	                                    	self.WriteAndRead(str(h),'zeros', str(parameters[0]),text)
	                                    	text.write("			address<={};##1;\n".format(int(parameters[1]*0.3)))
	                                    	self.WriteAndRead(str(h), "'1", str(parameters[0]),text)
	                                    	text.write("			address<={};##1;\n".format(int(parameters[1]*0.5)))
	                                    	self.WriteAndRead(str(h),'$urandom(j)%',str(2**(parameters[0])-1),text)
	                                    	h = h - 1
	                        if var[ind] == 'address':
	                            x=0
	                            while(x<50):
	                                address= hex(random.getrandbits(parameters[2]))
	                                data= hex(random.getrandbits(parameters[0]))
	                                dat=str(str(parameters[0])+"'h"+str(data.partition('x')[2]))
	                                add=str(str(parameters[2])+"'h"+str(address.partition('x')[2]))
	                                text.write('        we <= 1;\n')
	                                text.write('        cs <= 1;\n')
	                                text.write('        oe <= 0;\n')
	                                text.write('        @(negedge clk)\n')
	                                text.write('        address <= ' + add + ';\n')
	                                text.write('        assign data_out= '+ dat+' ;\n')
	                                text.write('        ##3 we <= 0;\n')
	                                text.write('        cs <= 1;\n')
	                                text.write('        oe <= 1;\n')
	                                text.write('        ##2;\n')
	                                x = x+1
	
	                    ind=ind+1
	                        
	            if 'endmodule' in m :
	                text.write('        $finish;\n')
	                text.write('   end;\n\n')
	                text.close()
	                
	    except StopIteration:
	        pass

