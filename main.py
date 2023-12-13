import serial
import matplotlib.pyplot as plt
from datetime import datetime
import sys
import numpy as np

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
opt2 = input('1. Promediar\n2. No promediar\n')

def modelo():
    global lin2, poly
    from sklearn.linear_model import LinearRegression
    lin = LinearRegression()
    
    data=np.genfromtxt('1.txt', delimiter=',')

    x = data[:, 0].reshape(-1, 1)
    y = data[:, 1].reshape(-1, 1)

    lin.fit(x, y)

    from sklearn.preprocessing import PolynomialFeatures
    
    poly = PolynomialFeatures(degree=4)
    X_poly = poly.fit_transform(x)
    
    poly.fit(X_poly, y)
    lin2 = LinearRegression()
    lin2.fit(X_poly, y)

modelo()
def predict(x):
    global lin2, poly
    return lin2.predict(poly.fit_transform([[x]]))[0][0]

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
        if opt2 == '1':
            if time.time() - last_time >= 0.2: # ha pasado un segundo

                average_output = sum(accumulated_data) / len(accumulated_data)
                post_avg = predict(average_output)

                print(average_output, datetime.now().strftime("%H:%M:%S"), post_avg, average_output*3.3/4095)
                graficar(post_avg)

                if opt == '2':
                    with open(f'./datos/{datetime_safe}.txt', 'a+') as f:
                        def handle_close(evt):
                            f.close()
                            comms.close()
                            plt.close()
                            sys.exit()
                        fig.canvas.mpl_connect('close_event', handle_close)
                        try:
                            f.write(f'{datetime.now().strftime("%H:%M:%S")},{average_output*3.3/4095},{post_avg}\n')
                        except KeyboardInterrupt:
                            f.close()
                            plt.close()
                            sys.exit()


                accumulated_data = []
                last_time = time.time()
        else:
            post_avg = predict(output)
            print(output, datetime.now().strftime("%H:%M:%S"), post_avg, output*3.3/4095)
            graficar(post_avg)
            if opt == '2':
                with open(f'./datos/{datetime_safe}.txt', 'a+') as f:
                    def handle_close(evt):
                        f.close()
                        comms.close()
                        plt.close()
                        sys.exit()
                    fig.canvas.mpl_connect('close_event', handle_close)
                    try:
                        f.write(f'{datetime.now().strftime("%H:%M:%S")},{output*3.3/4095},{post_avg}\n')
                    except KeyboardInterrupt:
                        f.close()
                        plt.close()
                        sys.exit()

plt.show()
while True:
    lectura()