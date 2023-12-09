from lakeshore import Model336, Model336HeaterResistance, Model336HeaterOutputUnits, Model336InputChannel, \
                      Model336InputSensorUnits, Model336Polarity, Model336HeaterRange, Model336HeaterVoltageRange, \
                      Model336HeaterOutputMode

# Connect to the first available Model 336 temperature controller over USB with a baud rate of 57600
my_model_336 = Model336(com_port="/dev/ttyUSB0", timeout=10)

# Obtain the output percentage of output 1 and print it to the console
heater_one_output = my_model_336.get_heater_output(1)
print("Output 1: " + str(heater_one_output))

# Obtain the output percentage of output 3 and print it to the console
heater_three_output = my_model_336.get_analog_output_percentage(3)
print("Output 3: " + str(heater_three_output))