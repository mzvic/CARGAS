import serial
import re
import matplotlib.pyplot as plt
import time
from serial.tools import list_ports
import sys

arr = []
comms = serial.Serial()
comms.baudrate = 19200
comms.timeout = 1
comms.setPort("/dev/ttyUSB1")
comms.open()

fig, ax = plt.subplots()
x, y = [], []
line, = ax.plot(x, y)
plt.ion()
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
def handle_close(evt):
    # Cierra las comunicaciones y termina el programa
    comms.close()
    sys.exit()

# Conecta el evento de cierre de la ventana a la función handle_close
fig.canvas.mpl_connect('close_event', handle_close)
def F_FtoFF(msb,lsb):
    a = bin(msb)
    b = bin(lsb)
    c = str('00000000')
    l = 9-len(b)
    out = int(a[2:]+c[0:l]+b[2:],2)
    return out

def lectura():
    global arr
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
        print(arr, output, output*3.3/4095, output/2**6.00)
        graficar(output*3.3/4095)
        return output
plt.show()

while True:
   lectura()
    