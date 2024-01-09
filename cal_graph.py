"""
CALIBRATION PT100 / LAKESHORE
"""

import matplotlib.pyplot as plt
import numpy as np
data1 = np.genfromtxt('A.txt', delimiter=',')
data2=np.genfromtxt('B.txt', delimiter=',')

x1 = data1[:, 0] # pt100
y1 = data1[:, 1] # lakeshore
x2 = data2[:, 0] # pt100
y2 = data2[:, 1] # lakeshore


coef = np.polyfit(x1, y1, 2) # coeficientes
poly = np.poly1d(coef) # polinomio

coef = np.polyfit(x2, y2, 2) # coeficientes 
poly2 = np.poly1d(coef) # polinomio 

lista = []
for i in range(len(x1)):
    lista.append(abs(y1[i] - poly(x1[i])))

print("Puerto A: ±" + str(max(lista))+ "°C")
lista = []
for i in range(len(x1)):
    lista.append(abs(y2[i] - poly2(x2[i])))

print("Puerto B: ±" + str(max(lista))+ "°C")


# print("±" + str(max(lista))+ "°C")
plt.plot(x1, poly(x1),color='green') # polinomio
plt.plot(x2, poly2(x2),color='red') # polinomio

plt.title('Polynomial Regression')
plt.xlabel('PT100')
plt.ylabel('LakeShore')
 
 
plt.show()