import serial
import matplotlib.pyplot as plt

# Specify the serial port and baud rate
port = '/dev/ttyACM0'  # Replace with your Arduino's serial port
baud_rate = 9600  # Replace with your Arduino's baud rate

# Create a serial object
arduino = serial.Serial(port, baud_rate)
def conv(x):
    return (382/1645)*x-78851/1645
# Read data from Arduino

# Inicializar la figura y el eje
fig, ax = plt.subplots()
x, y = [], []
line, = ax.plot(x, y)
plt.ion()  # Activa el modo interactivo
 # Muestra la ventana
def graficar(valor):
    y.append(valor)
    x.append(len(y))
    line.set_xdata(x)
    line.set_ydata(y)
    
    # Ajusta los límites del gráfico
    ax.set_xlim(0, len(x))
    ax.set_ylim(min(y), max(y))
    
    # Dibuja el gráfico
    plt.draw()
    plt.pause(0.01)
plt.show()
import time
while True:
    data = arduino.readline().decode('utf-8', errors='ignore').strip()
    print(data, conv(float(data)))
    graficar(conv(float(data)))

