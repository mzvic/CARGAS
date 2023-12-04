import serial
import re
import matplotlib.pyplot as plt
import time
from serial.tools import list_ports
from datetime import datetime
import sys

datetime_safe = datetime.now().isoformat()

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

opt = input('1. Lectura\n2. Lectura y guardar\n')

def graficar(valor):
    y.append(valor)
    x.append(len(y))
    line.set_xdata(x)
    line.set_ydata(y)
    
    ax.set_xlim(0, len(x))
    ax.set_ylim(min(y), max(y))
    
    plt.draw()
    plt.pause(0.01)


def handle_close(evt):
    comms.close()
    sys.exit()

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
        print(output, output*3.3/4095, output/2**6.00)
        graficar(output*3.3/4095)
        if opt == '2':
            with open(f'./datos/{datetime_safe}.txt', 'a+') as f:
                try:
                    f.write(f'{output},{output*3.3/4095},{output/2**6.00}\n')
                except KeyboardInterrupt:
                    f.close()
                    sys.exit()
        return output, output*3.3/4095, output/2**6.00

plt.show()
while True:
    lectura()