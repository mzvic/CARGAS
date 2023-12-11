"""
CALIBRATION PT100 / LAKESHORE

POINTS TAKEN:{
PT100: LAKESHORE


3236: 87.00
1524: 15
1159: 0.550
}
"""


from sklearn.linear_model import LinearRegression
lin = LinearRegression()

x = [[1158],[2058],[3203]]
y = [[0.51],[36],[80]]
lin.fit(x, y)

from sklearn.preprocessing import PolynomialFeatures

poly = PolynomialFeatures(degree=4)
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