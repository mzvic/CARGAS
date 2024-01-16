"""
CALIBRATION PT100 / LAKESHORE
"""
import numpy as np
tomas = ["A_L1_SM2.txt", "A_L2_SM1.txt", 
         "B_L1_SM2.txt", "B_L2_SM1.txt"]

def calculo(toma):
    global x1, y1, poly
    print("Toma: " + toma)
    data1 = np.genfromtxt(toma, delimiter=',')
    x1 = data1[:, 0] # pt100
    y1 = data1[:, 1] # lakeshore
    suma = 0

    coef = np.polyfit(x1, y1, 2) # coeficientes
    poly = np.poly1d(coef) # polinomio

    lista = []
    for i in range(len(x1)):
        lista.append(abs(y1[i] - poly(x1[i])))
    print("Max Err Abs: ±" + str(max(lista))+ "°C")

    for i in lista:
        sqr = i**2
        suma = sqr + suma
    rms = np.sqrt(suma/len(lista))
    print("RMS: ±" + str(rms) + "°C")
    
    suma = 0
    promedio = np.mean(lista)
    for i in lista:
        suma = (i-promedio)**2 + suma
    std = np.sqrt(suma/len(lista))
    print("STD: ±" + str(std) + "°C")


import matplotlib.pyplot as plt
figure, axis = plt.subplots(2, 2) 

for i in range(len(tomas)):
    calculo(tomas[i])
    axis[i//2, i%2].plot(x1, y1, 'o', label='Datos Lakeshore', markersize=2)
    axis[i//2, i%2].plot(x1, poly(x1), 'r', label='Polinomio Generado')
    axis[i//2, i%2].legend()
    axis[i//2, i%2].set_title(tomas[i])
    axis[i//2, i%2].set_xlabel("Bits PT100")
    axis[i//2, i%2].set_ylabel("Temperatura Lakeshore")

plt.show()




# plt.plot(x1, y1, 'o', label='Original data', markersize=2)
# plt.plot(x1, poly(x1), 'r', label='Fitted line')
# plt.legend()
# plt.show()