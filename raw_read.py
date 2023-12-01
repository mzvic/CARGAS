import serial
comms = serial.Serial()
comms.baudrate = 19200
comms.timeout = 1
comms.setPort("/dev/ttyUSB1")
comms.open()

while True:
    try:
        rcv = comms.read(1)        
        print(rcv)
    except KeyboardInterrupt:
        comms.close()
        break