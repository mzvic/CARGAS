import sys
import serial
from serial.tools import list_ports
import numpy as np
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QLabel, QComboBox, QListWidget, QCheckBox
from PyQt6.QtGui import QFont
from PyQt6.QtCore import Qt, QTimer
import pyqtgraph as pg

def select_ports_input_gui():
    comms = serial.Serial()
    comms.baudrate = 19200
    comms.timeout = 1
    ports = serial.tools.list_ports.comports()
    output = []
    for port in ports:
        output.append(port.device)
    return output


def predict(valor):
    data = np.genfromtxt('data_calibration.txt', delimiter=',')

    x = data[:, 0] # pt100
    y = data[:, 1] # lakeshore

    coef = np.polyfit(x, y, 9) # coeficientes 
    poly = np.poly1d(coef) # polinomio
    return poly(valor)
def F_FtoFF(msb,lsb):
    a = bin(msb)
    b = bin(lsb)
    c = str('00000000')
    l = 9-len(b)
    out = int(a[2:]+c[0:l]+b[2:],2)
    return out
def lectura():
    global arr, last_time, comms
    rcv = comms.read(1)
    
    if rcv == b'\xc8': # 200
        rcv = comms.read(1) # valor siguiente a 200
        char_rcv = chr(rcv[0])
        unicode_rcv = ord(char_rcv)
        arr.append(unicode_rcv)

    elif rcv == b'\xc9': # 201
        rcv = comms.read(1) # valor siguiente a 201  
        char_rcv = chr(rcv[0])
        unicode_rcv = ord(char_rcv)   
        arr.append(unicode_rcv)

    elif rcv == b'\xca': # 202
        arr = [] # vaciar array
            
    if len(arr) > 1: # si hay dos valores en el array
        output = F_FtoFF(arr[0], arr[1])
        return output
    else:
        return None
def start_btn(port):
    comms = serial.Serial()
    comms.baudrate = 19200
    comms.timeout = 1
    comms.port = port
    comms.open()
    
class DataPlotterWidget(QWidget):
    def __init__(self):
        super().__init__()

        self.plot_widget = pg.PlotWidget()
        self.plot_widget.setTitle("Data Plot")
        self.plot_data_item = self.plot_widget.plot(pen='b')

        layouth = QHBoxLayout()
        self.check_save_data = QCheckBox("Save Data")
        self.average = QCheckBox("Average")
        self.serial_port_combobox = QComboBox()
        self.serial_port_combobox.addItems(select_ports_input_gui())
        self.save_data_button = QPushButton("Start")
        self.save_data_button.clicked.connect(lambda: start_btn(self.serial_port_combobox.currentText()))
        self.save_data_button.setCheckable(True)


        layouth.addWidget(self.check_save_data)
        layouth.addWidget(self.average)
        layouth.addWidget(self.serial_port_combobox)
        layouth.addWidget(self.save_data_button)


        layout = QVBoxLayout()
        layout.addWidget(self.plot_widget)
        layout.addLayout(layouth)

        self.setLayout(layout)

    def update_plot(self, x_data, y_data):
        self.plot_data_item.setData(x_data, y_data)



class DataSelectionWidget(QWidget):
    def __init__(self):
        super().__init__()

        self.saved_data_label = QLabel("Select Saved Data:")
        self.saved_data_list = QListWidget()
        self.plot_saved_data_button = QPushButton("Plot Selected Data")

        layout = QVBoxLayout()
        layout.addWidget(self.saved_data_label)
        layout.addWidget(self.saved_data_list)
        layout.addWidget(self.plot_saved_data_button)
        self.setLayout(layout)

class DataPrintWidget(QWidget):
    def __init__(self):
        super().__init__()

        self.data_label = QLabel("Data:")
        self.data_label.setFont(QFont("Arial", 12))
        self.data_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

        self.layout = QVBoxLayout()
        self.layout.addWidget(self.data_label)
        self.setLayout(self.layout)

class MainWindow(QWidget):
    def __init__(self):
        super().__init__()

        self.data_plotter_widget = DataPlotterWidget()
        self.data_selection_widget = DataSelectionWidget()
        self.data_print_widget = DataPrintWidget()

        self.layout = QHBoxLayout()
        self.layout.addWidget(self.data_plotter_widget)
        self.layout.addWidget(self.data_selection_widget)
        self.setLayout(self.layout)

        self.setup_ui()

    def setup_ui(self):
        self.setWindowTitle("Serial Data Reader")
        self.setGeometry(100, 100, 800, 400)



if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())
