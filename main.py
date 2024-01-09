import serial
import serial.tools.list_ports 
import matplotlib.pyplot as plt
from datetime import datetime
import sys
import numpy as np

datetime_safe = datetime.now().isoformat().replace(':', '_')
arr = []
def select_ports_input():
    global comms
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
select_ports_input()
fig, ax = plt.subplots()
x, y = [], []
line, = ax.plot(x, y)
plt.ion()

opt_save = input('Save? (y/n) ')
opt_avg = input('Average? (y/n) ')
opt_port = input('Port? (a/b) ').upper()
def predict(valor):
    if opt_port == 'A':
        data = np.genfromtxt('a.txt', delimiter=',')
    elif opt_port == 'B':
        data = np.genfromtxt('B_L2_SM1.txt', delimiter=',')

    x = data[:, 0] # pt100
    y = data[:, 1] # lakeshore

    coef = np.polyfit(x, y, 2) # coeficientes 
    poly = np.poly1d(coef) # polinomio
    return poly(valor)

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
        if opt_avg == 'y':
            if time.time() - last_time >= 0.2: # ha pasado un segundo

                average_output = sum(accumulated_data) / len(accumulated_data)
                post_avg = predict(average_output)

                print(average_output, datetime.now().strftime("%H:%M:%S"), post_avg, average_output*3.3/4095)
                graficar(post_avg)

                if opt_save == 'y':
                    guardar(average_output*3.3/4095, post_avg)

                accumulated_data = []
                last_time = time.time()
        else:
            post_avg = predict(output)
            print(output, datetime.now().strftime("%H:%M:%S"), post_avg, output*3.3/4095)
            graficar(post_avg)
            if opt_save == 'y':
                guardar(output*3.3/4095, post_avg)

def guardar(valor, valor2):
    with open(f'{datetime_safe}.txt', 'a+') as f:

        try:
            f.write(f'{datetime.now().strftime("%H:%M:%S")},{valor},{valor2}\n')
        except KeyboardInterrupt:
            f.close()
            plt.close()
            sys.exit()

plt.show()
while True:
    lectura()