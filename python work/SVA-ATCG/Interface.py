import sys
import os
import subprocess
from MainWindow import Ui_MainWindow
from SubWindow import Ui_SubWindow
from StartupConfig import ConfigParameters
from PyQt5 import QtWidgets
from TestbenchTemplate import TemplateGeneration
from BindfileGeneration import BindingFile
from DofileGeneration import DOFile
import shutil
import winsound

class MainWindow(QtWidgets.QMainWindow,Ui_MainWindow,ConfigParameters,TemplateGeneration,BindingFile,DOFile):
    def __init__(self):
        QtWidgets.QMainWindow.__init__(self)
        self.setupUi(self)
        self.bro_rtl.clicked.connect(self.rtl_browse)
        self.bro_ass.clicked.connect(self.ass_browse)
        self.bro_out.clicked.connect(self.out_browse)
        self.gen.clicked.connect(self.generate)
        self.sim.clicked.connect(self.simulate)
        self.exit.clicked.connect(self.close_all)

    def rtl_browse(self):
        fileName= str(QtWidgets.QFileDialog.getOpenFileName(self,"Select File", "", "Verilog Files (*.v*)"))
        path=fileName.split("'")
        self.rtl_path.setText('{}'.format(path[1]))
        
    def ass_browse(self):
        fileName= str(QtWidgets.QFileDialog.getOpenFileName(self,"Select File", "", "Systemverilog Files (*.sv*)"))
        path=fileName.split("'")
        self.ass_path.setText('{}'.format(path[1]))
        
    def out_browse(self):
        path= str(QtWidgets.QFileDialog.getExistingDirectory(self))
        self.out_path.setText('{}'.format(path))
    
    def generate(self):
        parameters=self.extract_param(self.size.currentText())
        
        rtl_ports=[]
        rtl_ports.append(self.clk_rtl.text())
        rtl_ports.append(self.add_rtl.text())
        rtl_ports.append(self.data_rtl.text())
        rtl_ports.append(self.we_rtl.text())
        rtl_ports.append(self.oe_rtl.text())
        rtl_ports.append(self.cs_rtl.text())

        assertions_ports=[]
        assertions_ports.append(self.clk_ass.text())
        assertions_ports.append(self.add_ass.text())
        assertions_ports.append(self.data_ass.text())
        assertions_ports.append(self.we_ass.text())
        assertions_ports.append(self.oe_ass.text())
        assertions_ports.append(self.cs_ass.text())
        
        rtl_path=self.rtl_path.text()
        ass_path=self.ass_path.text()
        out_path=self.out_path.text()
        
        rtl_mod_name=self.mod_rtl.text()
        ass_mod_name=self.extract_ass_module(ass_path)
        
        shutil.copy2(ass_path,out_path)
        shutil.copy2(rtl_path,out_path)
        self.BindingFileGeneration(out_path,assertions_ports,rtl_ports,ass_mod_name,"binding_module")
        self.DoFileGeneration(out_path)
        self.testbenchgeneration(out_path,parameters,rtl_mod_name,rtl_ports,"binding_module",assertions_ports,ass_path)
        self.open_done_window()
        
    def open_done_window(self):
        self.window=QtWidgets.QMainWindow()
        self.ui=Ui_SubWindow()
        self.ui.setupUi(self.window)
        self.window.show()
        winsound.PlaySound("*", winsound.SND_ALIAS)
        
    def simulate(self):
        source_directory=os.path.dirname(os.path.abspath(__file__))
        out_path=self.out_path.text()
        shutil.copy2(out_path+"/waves.do",source_directory)
        subprocess.Popen(["C:\questasim64_10.2c\win64\questasim.exe","-do","waves.do"])
    
    def close_all(self):
        source_directory=os.path.dirname(os.path.abspath(__file__))
        try:
            os.remove(source_directory+"/waves.do")
        except OSError:
            pass
        try:
            os.remove(source_directory+"/transcript")
        except OSError:
            pass
        try:
            os.remove(source_directory+"/assertions-temp.sv")
        except OSError:
            pass
        self.close()
        
if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = MainWindow()
    MainWindow.show()
    sys.exit(app.exec_())