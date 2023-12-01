import serial
import re
import matplotlib.pyplot as plt
import time
from serial.tools import list_ports
import sys


comms = serial.Serial()
comms.baudrate = 19200
comms.timeout = 1
comms.setPort("/dev/ttyUSB1")
comms.open()

fecha = time.strftime("%d/%m/%y %H:%M:%S")

# Inicializar la figura y el eje
fig, ax = plt.subplots()
x, y = [], []
line, = ax.plot(x, y)
plt.ion()  # Activa el modo interactivo
 # Muestra la ventana


def find_beetwen(valor):
    result = re.search(str(b'(.*)'), str(valor)) # caga con b"'"
    output = result.group(1)
    return output

def validacion_conversion(valor):

    special_characters = {
        b'\n': '00001010',
        b'\r': '00001101',
        b'\t': '00001001',
        b"'": '00100111',
        b'\\': '01011100',
    }
    if valor in special_characters:
        return special_characters[valor]
    
    elif r"\x" in str(valor): # caso hex
        valor = str(valor)[4:6]
        valor = int(valor, 16)
        valor = bin(valor)[2:]
        valor = valor.zfill(7)
        return valor
        
    else: # caso ascii
        valor = format(ord(str(find_beetwen(valor))), "x")
        valor = int(valor, 16)
        valor = bin(valor)[2:]
        valor = valor.zfill(7)
        return valor

def concatenar(valor1, valor2):
    bin1 = bin(valor1)[2:].zfill(7)

    # Convert valor2 to an integer
    valor2_int = int.from_bytes(valor2, byteorder='big') 

    bin2 = bin(valor2_int)[2:].zfill(7)
    
    bin1 = bin1[1:]
    bin2 = bin2[1:]
    
    concatenated_bin = bin1 + bin2

    decimal_value = int(concatenated_bin, 2)
    
    return decimal_value


arr2 = [] # esta variable se va ocupar para compararla con arr, en el caso que sea mucho más mayor que arr, entonces arr no se va a graficar

def lectura():
    global arr
    global arr2
    rcv = comms.read(1)
    if rcv == b'\xc8': # 200
        rcv = int(comms.read(1)[0]) # valor siguiente a 200
        arr.append(rcv)
    elif rcv == b'\xc9': # 201
        rrcv = int(comms.read(1)[0]) # valor siguiente a 201     
        arr.append(rcv)
    elif rcv == b'\xca': # 202
        arr2 = arr.copy()
        arr = [] # vaciar array
            
    if len(arr) > 1: # si hay dos valores en el array
        return concatenar(arr[0], arr[1])  

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

arr = []
temp = [] #para evitar saltos bruscos
def main(valor):
    global arr
    if valor:
        #if len(temp) > 1:
         #   if abs(valor - temp[-1]) > 100:
          #      valor = temp[-1]
        #temp.append(valor)
        if valor > 4095 or valor < 0 or valor == 1319 or valor == 1064 or valor == 3853 or valor == 3676 or valor == 3594:
            pass
        else:
            print("voltaje: {}, bits: {}, {}".format(valor*3.3/4095, valor, arr))
            graficar(valor*3.3/4095)

safe_fecha = fecha.replace('/', '-').replace(':', '-')

def main_datos(valor):
    global fecha
    global safe_fecha
    if valor:
        print(valor)
        graficar(valor)
        with open(str(safe_fecha), "a+") as f:
            f.write("{},{}".format(valor*3.3/4095, valor) + "\n")

datos_opcion = input("Guardar datos? (y/n): ")
plt.show()
#seleccionar puerto
# puertos = []
# for puerto in list(serial.tools.list_ports.comports()):
#     puertos.append(puerto.device)

# select_puerto = input("Puertos disponibles: {}".format(puertos))
# comms.setPort(puertos[select_puerto])
while True:
    try:
        if datos_opcion == "y":
            main_datos(lectura())
        else:

            main(lectura())

        
            
    except KeyboardInterrupt:
        plt.close()
        comms.close()
        break