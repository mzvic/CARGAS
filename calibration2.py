"""
CALIBRATION PT100 / LAKESHORE
"""

import matplotlib.pyplot as plt
import numpy as np

data=np.genfromtxt('primera-toma.txt', delimiter=',')

x = data[:, 0] # pt100
y = data[:, 1] # lakeshore

coef = np.polyfit(x, y, 2) # coeficientes 
poly = np.poly1d(coef) # polinomio 

# predict
predict = poly(4095)
print(predict)

plt.plot(x, y, color='blue') # puntos
plt.plot(x, poly(x),color='red') # polinomio


plt.title('Polynomial Regression')
plt.xlabel('PT100')
plt.ylabel('LakeShore')
 
 
plt.show()