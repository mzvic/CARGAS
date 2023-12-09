import sys
import serial
from serial.tools import list_ports
import numpy as np
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QLabel, QComboBox, QListWidget, QCheckBox
from PyQt6.QtGui import QFont
from PyQt6.QtCore import Qt, QTimer
import pyqtgraph as pg
import main1
import time
accumulated_data = []
last_time = time.time()
arr = []

class SerialDataReader:
    def __init__(self, port):
        self.port = port
        self.ser = None

    def open_serial_port(self):
        try:
            self.ser = serial.Serial(self.port, baudrate=9600)
            return True
        except serial.SerialException as e:
            print(f"Error opening serial port: {e}")
            return False

    def read_data(self):
        if self.ser:
            return self.ser.readline().decode().strip()
        return None

class DataPlotterWidget(QWidget):
    def __init__(self):
        super().__init__()

        self.plot_widget = pg.PlotWidget()
        self.plot_widget.setTitle("Data Plot")
        self.plot_data_item = self.plot_widget.plot(pen='b')

        layouth = QHBoxLayout()
        self.check_save_data = QCheckBox("Save Data")
        self.serial_port_combobox = QComboBox()
        self.save_data_button = QPushButton("Start")
        self.save_data_button.setCheckable(True)


        layouth.addWidget(self.check_save_data)
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


class MainWindow(QWidget):
    def __init__(self):
        super().__init__()

        self.data_plotter_widget = DataPlotterWidget()
        self.data_selection_widget = DataSelectionWidget()

        self.layout = QHBoxLayout()
        self.layout.addWidget(self.data_plotter_widget)
        self.layout.addWidget(self.data_selection_widget)
        self.setLayout(self.layout)

        self.serial_data_reader = SerialDataReader("")  # Replace with your serial port

        self.setup_ui()

    def setup_ui(self):
        self.setWindowTitle("Serial Data Reader")
        self.setGeometry(100, 100, 800, 400)
        # Open the serial port
        

    def start_reading_data(self):
        def read_data():
            data = self.serial_data_reader.read_data()
            if data:
                main1.proccess_data(data)


    def save_data(self):
        # Add code to save data to a file or database
        pass

    def plot_saved_data(self):
        # Add code to load and plot selected saved data
        pass

    def update_plot_range(self, vb, range):
        # Add code to handle plot range changes if needed
        pass

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())