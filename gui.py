import sys
import serial
from serial.tools import list_ports
import numpy as np
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QLabel, QComboBox, QListWidget, QCheckBox
from PyQt6.QtGui import QFont
from PyQt6.QtCore import Qt, QTimer
import pyqtgraph as pg

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

        self.serial_data_reader = SerialDataReader("")  # Replace with your serial port

        self.setup_ui()

    def setup_ui(self):
        self.setWindowTitle("Serial Data Reader")
        self.setGeometry(100, 100, 800, 400)

        # Populate serial port combobox with available ports
          # Assuming Linux, adjust for your platform

        # Connect signals and slots
        self.data_selection_widget.plot_saved_data_button.clicked.connect(self.plot_saved_data)
        self.data_plotter_widget.plot_widget.plotItem.getViewBox().sigRangeChanged.connect(self.update_plot_range)

        # Open the serial port
        if self.serial_data_reader.open_serial_port():
            self.start_reading_data()

    def start_reading_data(self):
        def read_data():
            data = self.serial_data_reader.read_data()
            if data:
                data_values = list(map(float, data.split(',')))
                self.data_plotter_widget.update_plot(list(range(len(data_values))), data_values)

        timer = QTimer(self)
        timer.timeout.connect(read_data)
        timer.start(100)  # Read data every 100 milliseconds

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
