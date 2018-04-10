import math

class ConfigParameters():
    
    def extract_param(self,size): #Extracting Memory Parameters
        param=[]
        param.append(int(8))
        for ch in size:
            if ch=="M":
                size=size.split("M")
                param.append(int(size[0])*1024*1024)
                addr=int(math.log2(1024*1024*int(size[0])))
                param.append(addr)
            elif ch=="G":
                size=size.split("G")
                param.append(int(size[0])*1024*1024*1024)
                addr=int(math.log2(1024*1024*1024*int(size[0])))  
                param.append(addr)
        return param
    
    def extract_ass_module(self,path): #Extracting Assertions Module Name
        with open (path) as openfile:
            for line in openfile:
                if(line.startswith("module")):
                    start=line.index("module") + len("module")+1
                    end=line.index("(",start)
                    return line[start:end]
            