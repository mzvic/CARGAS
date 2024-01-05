import matplotlib.pyplot as plt
import os
import numpy as np
import sys

#data = np.genfromtxt('./datos/{}'.format(os.listdir('./datos')[int(choice)]), delimiter=',')

"""
BITS, TEMPERATURE

"""
def graph_stadistic(data):
    data = np.genfromtxt(data, delimiter=',')
    column = data[:, 1]

    mean = np.mean(column)
    peaks = []
    for i in column:
        if i > mean + 0.4 or i < mean - 0.4:
            peaks.append(i)

    plt.plot(column)

    plt.xlabel('N° de muestra')
    plt.ylabel('Temp')

    #plt.ylim(-20, 80)
    coefficient_of_variation = (np.std(column) / np.mean(column)) * 100


    plt.plot([], [], ' ', label='Media de la temperatura: ' + str(np.mean(column)) + '°C')
    plt.plot([], [], ' ', label='Coeficiente de variación: ' + str(coefficient_of_variation) + '%')
    plt.plot([], [], ' ', label="Número de Muestras: " + str(len(column)) + " Número de peaks: " + str(len(peaks)))
    plt.plot([], [], ' ', label= "±" + str(max(data[:, 1]) - min(data[:, 1])) + '°C')

    plt.legend()

    plt.show()

if len(sys.argv) > 1:
    graph_stadistic(sys.argv[1])

else:
    print("Usage: python graph.py <file>")