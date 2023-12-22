# CARGAS

This repository contains Python scripts designed for the CARGAS LLAMA Project. The main.py script provides real-time monitoring and plotting of temperature data from a PT100 sensor connected to a FPGA with an ADC1 Module. 
graph.py provides the analysis of historical temperature data stored in a file.

# Usage (Laboratory's Settings)

## main.py
Connect the FPGA to the pc and run the script with:
```
python3 main.py
```
The script will prompt you for two options:
    
    - Save data (`opt_save`): Enter 'y' to save data, or 'n' to skip saving.
    - Average data (`opt_avg`): Enter 'y' to plot the average data, or 'n' to plot raw data.
The script will continuously read data from the FPGA and display real-time plots. If saving is enabled, data will be appended to a file named with the time when you execute the script.

 To stop the script and close the plot, press `Ctrl+C` in the terminal where the script is running.
 > **Note:** Make sure to change the **comms.setPort()** argument to your port where the FPGA is connected. /dev/ttyUSB1 is the default for linux.
 ## graph.py
 Ensure that your temperature data is stored in a CSV file with three columns 
  ```
 BITS,VOLTAGE,TEMPERATURE 
  ```
 Then run the script with:
 ```
python3 graph.py path/to/your/datafile.txt
```
 Replace  *path/to/your/datafile.txt*  with the path to your actual file.
 The script will analyze the temperature data and generate a plot displaying the temperature readings over time.
 Statistical information will be included in the legend of the plot, providing details such as **mean temperature**, **coefficient of variation**, **number of samples**, **number of peaks**, and **temperature range**.
 > **Note:** To change the threshold of the peaks, change the **line 19** in the code with the values that you prefer.

## FPGA
Make sure to connect the ADC1 Module in the top JD connector. The FPGA contains in their memory the code to provide the data from a A0 data connected to de ADC1.

# Dependencies

- main.py requires matplotlib pyserial numpy (pip3 install matplotlib pyserial numpy)
- graph.py requires matplotlib numpy (pip3 install matplotlib numpy)
