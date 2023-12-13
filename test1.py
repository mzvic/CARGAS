import serial.tools.list_ports

def select_ports():
    comms = serial.Serial()
    comms.baudrate = 19200
    comms.timeout = 1
    ports = serial.tools.list_ports.comports()
    output = []
    for port in ports:
        output.append(port.device)
    return output


print(select_ports())