"""
TO DO: Measure 5 points with the lakeshore and compare with the output of
the FPGA after the amplifier. Do a regression with those values.

Current points{
0.6 = 209
20.5 = 294
31.6 = 342
34.7 = 355
77 = 538
}
"""
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression

# Datos
datos_c = [0.6, 20.5, 31.6, 34.7, 77]
datos_bits = [209, 294, 342, 355, 538]

# Reshape para que sea una matriz de una sola columna
x = np.array(datos_bits).reshape((-1, 1))
y = np.array(datos_c)

# Transformación polinómica de segundo grado
poly = PolynomialFeatures(degree=2)
x_poly = poly.fit_transform(x)

# Modelo de regresión lineal con términos polinómicos
model = LinearRegression().fit(x_poly, y)

# Predicciones
y_pred = model.predict(x_poly)

print(model.predict(poly.fit_transform([[209]])))
print(model.predict(poly.fit_transform([[209]])))
print(model.predict(poly.fit_transform([[209]])))
print(model.predict(poly.fit_transform([[294]])))

# # Ordenar los datos para una mejor visualización del gráfico
# order = np.argsort(x.flatten())
# x_sorted = x[order]
# y_pred_sorted = y_pred[order]

# Graficar los datos y la línea de regresión polinómica
plt.scatter(x, y, color='blue', label='Datos')
plt.plot(x, y_pred, color='red', linewidth=2, label='Regresión Polinómica')
plt.title('Regresión Polinómica (grado 2)')
plt.xlabel('Datos bits')
plt.ylabel('Datos c')
plt.legend()
plt.show()

