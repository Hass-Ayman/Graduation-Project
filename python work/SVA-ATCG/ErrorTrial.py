import os
import subprocess
import sys
import shutil
import time

def simulate():
        source_directory=os.path.dirname(os.path.abspath(__file__))
        out_path="D:/Try"
        shutil.copy2(out_path+"/waves.do",source_directory)
        subprocess.run(["C:\questasim64_10.2c\win64\questasim.exe","-do","do waves.do"])
        os.remove(source_directory+"/waves.do")

if __name__ == '__main__':
    
    simulate()
    