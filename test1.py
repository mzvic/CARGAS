import serial.tools.list_ports

def select_ports():
    comms = serial.Serial()
    comms.baudrate = 19200
    comms.timeout = 1
    ports = serial.tools.list_ports.comports()
    c = 1
    for i in ports:
        print("{}. {}".format(c,i))
        c += 1
    choice = int(input('Choose a port: '))
    comms.port = ports[choice-1].device
    comms.open()

select_ports()