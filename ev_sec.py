import serial
import matplotlib.pyplot as plt
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

def F_FtoFF(msb,lsb):
    a = bin(msb)
    b = bin(lsb)
    c = str('00000000')
    l = 9-len(b)
    out = int(a[2:]+c[0:l]+b[2:],2)
    return out

import time

accumulated_data = []
last_time = time.time()

def lectura():
    global arr, accumulated_data, data_count, last_time
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
        accumulated_data.append(output)

        if time.time() - last_time >= 1: # ha pasado un segundo

            average_output = sum(accumulated_data) / len(accumulated_data)

            print(average_output, average_output*3.3/4095, average_output/2**6.00)
            #graficar(average_output/2**6.00)
            if opt == '2':
                with open(f'./datos/{datetime_safe}.txt', 'a+') as f:
                    try:
                        f.write(f'{average_output},{average_output*3.3/4095},{average_output/2**6.00}\n')
                    except KeyboardInterrupt:
                        f.close()
                        sys.exit()
            accumulated_data = []
            last_time = time.time()

        return output, output*3.3/4095, output/2**6.00

plt.show()
while True:
    lectura()