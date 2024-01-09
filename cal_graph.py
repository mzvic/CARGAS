"""
CALIBRATION PT100 / LAKESHORE
"""

import matplotlib.pyplot as plt
import numpy as np
data1 = np.genfromtxt('primera_toma.txt', delimiter=',')
data2=np.genfromtxt('segundatoma.txt', delimiter=',')
data3 = np.genfromtxt('terceratoma.txt', delimiter=',')

x1 = data1[:, 0] # pt100
y1 = data1[:, 1] # lakeshore
x2 = data2[:, 0] # pt100
y2 = data2[:, 1] # lakeshore
x3 = data3[:, 0] # pt100
y3 = data3[:, 1] # lakeshore


coef = np.polyfit(x1, y1, 2) # coeficientes
poly = np.poly1d(coef) # polinomio

coef = np.polyfit(x2, y2, 2) # coeficientes 
poly2 = np.poly1d(coef) # polinomio 

# max distance between datay and polyx
# lista = []
# for i in range(len(x)):
#     lista.append(abs(y[i] - poly(x[i])))

# print("±" + str(max(lista))+ "°C")
#plt.plot(x1, y1, color='green') # puntos
plt.plot(x1, poly(x1),color='yellow') # polinomio
#plt.plot(x2, y2, color='blue') # puntos
plt.plot(x2, poly2(x2),color='red') # polinomio

print(poly(2575))
plt.title('Polynomial Regression')
plt.xlabel('PT100')
plt.ylabel('LakeShore')
 
 
plt.show()