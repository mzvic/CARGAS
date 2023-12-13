"""
CALIBRATION PT100 / LAKESHORE

POINTS TAKEN:{
PT100: LAKESHORE
//24.7: 21.5
//25.1: 21.645
17.25: 0.7
25.1: 20.7
30.1: 32.0
30.5: 33.3
42.0: 63.0
68.0: 66.5
74.0: 71.8

}
"""


from sklearn.linear_model import LinearRegression
lin = LinearRegression()
import numpy as np

data=np.genfromtxt('1.txt', delimiter=',')

x = data[:, 0].reshape(-1, 1)
y = data[:, 1].reshape(-1, 1)

print(x)
lin.fit(x, y)

from sklearn.preprocessing import PolynomialFeatures

poly = PolynomialFeatures(degree=1)

X_poly = poly.fit_transform(x)
poly.fit(X_poly, y)
lin2 = LinearRegression()
lin2.fit(X_poly, y)

import matplotlib.pyplot as plt



plt.scatter(x, y, color='blue')
 
plt.plot(x, lin2.predict(poly.fit_transform(x)),
         color='red')

plt.title('Polynomial Regression')
plt.xlabel('PT100')
plt.ylabel('LakeShore')
 
 
plt.show()