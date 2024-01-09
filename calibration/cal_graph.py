"""
CALIBRATION PT100 / LAKESHORE
"""
import matplotlib.pyplot as plt
import numpy as np
tomas = ["A_L1_SM2.txt", "A_L2_SM1.txt", 
         "B_L1_SM2.txt", "B_L2_SM1.txt"]

def calculo(toma):
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

for i in tomas:
    calculo(i)
    print("")