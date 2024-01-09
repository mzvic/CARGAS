import telnetlib
import time
import serial
import serial.tools.list_ports 
import matplotlib.pyplot as plt
from datetime import datetime
import sys
import numpy as np

datetime_safe = datetime.now().isoformat().replace(':', '_')
arr = []
def predict(valor):
    data = np.genfromtxt('data_calibration.txt', delimiter=',')

    x = data[:, 0] # pt100
    y = data[:, 1] # lakeshore

    coef = np.polyfit(x, y, 9) # coeficientes 
    poly = np.poly1d(coef) # polinomio
    return poly(valor)
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
# Dirección IP y puerto
host = '169.254.47.121'
port = '7777'


def temp_to_c(input):
    return round(float(input) - 273.15,2)

def F_FtoFF(msb,lsb):
    a = bin(msb)
    b = bin(lsb)
    c = str('00000000')
    l = 9-len(b)
    out = int(a[2:]+c[0:l]+b[2:],2)
    return out

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
        
        return output
        
    else:
        return None
    

try:
    tn = telnetlib.Telnet(host, port)
    print("Conexión exitosa con el instrumento")

    tn.write(b"*IDN?\n") #LEER ID del instrumento.
    response = tn.read_until(b"\n", timeout=2).decode('ascii')
    print("Identificación del instrumento:", response)

    #Leer la temperatura actual del canal A
    while (True):
        lectura_fpga = lectura()
        if lectura_fpga != None:
            tn.write(b"KRDG? A\n")
            ch_A = tn.read_until(b"\n", timeout=2).decode('ascii')

            chac = temp_to_c(ch_A)
            chac_fpga = predict(lectura_fpga)
            print(chac_fpga, chac)

except Exception as e:
    print("Error de comunicación:", e)
except KeyboardInterrupt:
    print("Interrupción de teclado")
    tn.close()
    comms.close()
finally:
    tn.close()
    comms.close()
