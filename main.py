import serial
import serial.tools.list_ports
import matplotlib.pyplot as plt
from datetime import datetime
import numpy as np
import sys
import time

datetime_safe = datetime.now().isoformat()

def F_FtoFF(msb,lsb):
    a = bin(msb)
    b = bin(lsb)
    c = str('00000000')
    l = 9-len(b)
    out = int(a[2:]+c[0:l]+b[2:],2)
    return out

def select_ports_input():
    comms = serial.Serial()
    comms.baudrate = 19200
    comms.timeout = 1
    ports = serial.tools.list_ports.comports()
    c = 1
    for i in ports:
        print("{}. {}".format(c,i))
        c += 1
    choice = int(input('Choose a port: '))
    comms.port = ports[choice-1].device
    comms.open()
    return comms
    

def predict(valor):
    data = np.genfromtxt('data_calibration.txt', delimiter=',')

    x = data[:, 0] # pt100
    y = data[:, 1] # lakeshore

    coef = np.polyfit(x, y, 9) # coeficientes 
    poly = np.poly1d(coef) # polinomio
    return poly(valor)

arr = []
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

def escritura(valor):
    with open(f'./datos/{datetime_safe}.txt', 'a+') as f:
        try:
            f.write(f'{datetime.now().strftime("%H:%M:%S")},{predict(valor)},{valor*3.3/4095}\n')
        except KeyboardInterrupt:
            f.close()
            sys.exit()

accumulated_data = []
last_time = time.time()
def lectura_promediada():
    global arr, accumulated_data, last_time
    comms = select_ports_input()
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
        if time.time() - last_time >= 0.2: # ha pasado un segundo
            average_output = sum(accumulated_data) / len(accumulated_data)
            print(average_output, datetime.now().strftime("%H:%M:%S"), average_output*3.3/4095)
            #escritura(average_output)
            accumulated_data = []
            last_time = time.time()


fig, ax = plt.subplots()
x, y = [], []
line, = ax.plot(x, y)
plt.ion()

def graficar(valor):
    y.append(valor)
    x.append(len(y))
    line.set_xdata(x)
    line.set_ydata(y)
    
    ax.set_xlim(0, len(x))
    ax.set_ylim(min(y), max(y))
    
    plt.draw()
    plt.pause(0.01)

comms = select_ports_input()
plt.show()

# while True:
#     lectura_fpga = lectura()
#     if lectura_fpga != None:
#         escritura(lectura_fpga)
#         graficar(predict(lectura_fpga))