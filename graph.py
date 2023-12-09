import matplotlib.pyplot as plt
import os
import numpy as np

for i in range(len(os.listdir('./datos'))):
    print(str(i) + '. ' + os.listdir('./datos')[i])
choice = input("Selecciona número: ")

#data = np.genfromtxt('./datos/{}'.format(os.listdir('./datos')[int(choice)]), delimiter=',')

"""
BITS, VOLTAGE, TEMPERATURE

"""
def graph_stadistic(data):
    data = np.genfromtxt(data, delimiter=',')
    column = data[:, 2]

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
    plt.plot([], [], ' ', label= "±" + str(max(data[:, 2]) - min(data[:, 2])) + '°C')

    plt.legend()

    plt.show()

if __name__ == "__main__":
    graph_stadistic('./datos/{}'.format(os.listdir('./datos')[int(choice)]))