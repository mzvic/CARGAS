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

def concatenar(valor1, valor2):
    output = valor1[1:] + valor2[1:]
    output = bin(int.from_bytes(output, byteorder='big'))
    # bin to int
    output = int(output, 2)
    print(output)
    return output


def lectura():
    global arr
    rcv = comms.read(1)
    if rcv == b'\xc8': # 200
        rcv = comms.read(1) # valor siguiente a 200
        arr.append(rcv)
    elif rcv == b'\xc9': # 201
        rcv = comms.read(1) # valor siguiente a 201     
        arr.append(rcv)
    elif rcv == b'\xca': # 202
        arr = [] # vaciar array
            
    if len(arr) > 1: # si hay dos valores en el array
        print(arr)
        return concatenar(arr[0], arr[1])  
    
while True:
    lectura()
    