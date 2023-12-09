import sys
from PyQt6.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget, QPushButton, QComboBox, QGraphicsView, QGraphicsScene
from PyQt6.QtCore import Qt, QTimer
from datetime import datetime
import serial
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures

class PlotView(QGraphicsView):
    def __init__(self):
        super().__init__()

        self.setScene(QGraphicsScene(self))
        self.setSceneRect(0, 0, 400, 200)

    def clear(self):
        self.scene().clear()

    def add_point(self, x, y):
        self.scene().addEllipse(x - 2, y - 2, 4, 4)

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.datetime_safe = datetime.now().isoformat()

        self.arr = []
        self.comms = None
        self.lin2, self.poly = None, None
        self.average_output, self.post_avg = 0, 0

        self.create_ui()

        self.model()

    def create_ui(self):
        central_widget = QWidget()
        layout = QVBoxLayout()

        self.plot_view = PlotView()
        layout.addWidget(self.plot_view)

        open_button = QPushButton("Abrir Puerto")
        open_button.clicked.connect(self.open_port)
        layout.addWidget(open_button)

        close_button = QPushButton("Cerrar Puerto")
        close_button.clicked.connect(self.close_port)
        layout.addWidget(close_button)

        start_button = QPushButton("Iniciar Lectura")
        start_button.clicked.connect(self.start_reading)
        layout.addWidget(start_button)

        self.opt_combobox = QComboBox()
        self.opt_combobox.addItems(["1. Lectura", "2. Lectura y guardar"])
        layout.addWidget(self.opt_combobox)

        central_widget.setLayout(layout)
        self.setCentralWidget(central_widget)

        self.timer = QTimer(self)
        self.timer.timeout.connect(self.update_plot)

    def model(self):
        lin = LinearRegression()

        x = [[17.25], [25.1], [30.1], [30.5], [42.0], [68], [74.0]]
        y = [[0.7], [20.7], [32.0], [33.3], [63.0], [66.5], [71.8]]
        lin.fit(x, y)

        self.poly = PolynomialFeatures(degree=4)
        X_poly = self.poly.fit_transform(x)

        self.poly.fit(X_poly, y)
        self.lin2 = LinearRegression()
        self.lin2.fit(X_poly, y)

    def predict(self, x):
        return self.lin2.predict(self.poly.fit_transform([[x]]))[0][0]

    def add_point_to_plot(self, x, y):
        self.plot_view.add_point(x, y)

    def F_FtoFF(self, msb, lsb):
        a = bin(msb)
        b = bin(lsb)
        c = str('00000000')
        l = 9 - len(b)
        out = int(a[2:] + c[0:l] + b[2:], 2)
        return out

    def process_data(self, rcv):
        if rcv == b'\xc8':
            rcv = self.comms.read(1)
            char_rcv = chr(rcv[0])
            unicode_rcv = ord(char_rcv)
            self.arr.append(unicode_rcv)

        elif rcv == b'\xc9':
            rcv = self.comms.read(1)
            char_rcv = chr(rcv[0])
            unicode_rcv = ord(char_rcv)
            self.arr.append(unicode_rcv)

        elif rcv == b'\xca':
            self.arr = []

        if len(self.arr) > 1:
            output = self.F_FtoFF(self.arr[0], self.arr[1])
            self.accumulated_data.append(output)

            if datetime.now().timestamp() - self.last_time >= 0.2:
                self.handle_data()

    def handle_data(self):
        if len(self.accumulated_data) > 0:
            self.average_output = sum(self.accumulated_data) / len(self.accumulated_data)
            self.post_avg = self.predict(self.average_output / 2 ** 6.00)

            print(datetime.now().strftime("%H:%M:%S"), self.post_avg, self.average_output * 3.3 / 4095)

            if self.opt_combobox.currentText() == '2':
                with open(f'./datos/{self.datetime_safe}.txt', 'a+') as f:
                    f.write(f'{datetime.now().strftime("%H:%M:%S")},{self.average_output * 3.3 / 4095},{self.post_avg}\n')
                    f.flush()

            self.add_point_to_plot(self.last_x, self.average_output)

        self.accumulated_data = []
        self.last_time = datetime.now().timestamp()

    def lectura(self):
        rcv = self.comms.read(1)
        self.process_data(rcv)

    def open_port(self):
        port_name = "/dev/ttyUSB1"  # Adjust the port name as needed
        self.comms = serial.Serial(port_name, baudrate=19200, timeout=1)
        print(f"Puerto {port_name} abierto.")

    def close_port(self):
        if self.comms and self.comms.is_open:
            self.comms.close()
            print("Puerto cerrado.")

    def start_reading(self):
        opt = self.opt_combobox.currentText()
        if not self.comms or not self.comms.is_open:
            print("Por favor, abre el puerto antes de iniciar la lectura.")
            return

        if opt == '2':
            with open(f'./datos/{self.datetime_safe}.txt', 'a+') as f:
                f.write(f'{datetime.now().strftime("%H:%M:%S")},')
        self.accumulated_data = []
        self.last_time = datetime.now().timestamp()
        self.last_x = 0
        self.timer.start(10)  # Adjust the interval as needed

    def update_plot(self):
        self.lectura()
        self.handle_data()
        self.last_x += 1


if __name__ == "__main__":
    app = QApplication(sys.argv)
    mainWin = MainWindow()
    mainWin.show()
    sys.exit(app.exec())
