import numpy as np
import matplotlib.pyplot as plt
import os

for i in range(len(os.listdir('./datos'))):
    print(str(i) + '. ' + os.listdir('./datos')[i])
choice = input("Selecciona número: ")

data = np.genfromtxt('./datos/{}'.format(os.listdir('./datos')[int(choice)]), delimiter=',')

dt = 1/10**6

data_fft = np.fft.fft(data[:, 2]/3.3)
freq = np.fft.fftfreq(len(data[:, 2]), dt)

data_fft = 10*np.log10(data_fft)

plt.plot(freq, data_fft)
plt.xlabel('Frecuencia')
plt.ylabel('Amplitud')
plt.show()
