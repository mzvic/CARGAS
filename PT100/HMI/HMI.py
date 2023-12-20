#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import threading
from PyQt6 import uic, QtCore, QtWidgets
import pyqtgraph as pg
import numpy as np
import serial
import serial.tools.list_ports
import time
import csv
import pyvisa
import os
import telnetlib
from datetime import datetime

dateFormat = "%H:%M:%S"    #23:59:59
hourFormat = "%H%M%S"
filesDateFormat = "%d%m%y"              #31122022

#-------MeTODO DE INICIALIZACIoN----- -----------------------------------------
# Obtiene la ruta absoluta del directorio actual
script_directory = os.path.dirname(os.path.abspath(__file__))
ui_folder = r"/ui/SDC_STEP_POW.ui"
ui_dir = script_directory + ui_folder

BAUDRATE_CONF = 19200

class Interfaz(QtWidgets.QMainWindow):

    def __init__(self,parent=None):    
        super(Interfaz,self).__init__(parent)
        self.ui=uic.loadUi(ui_dir,self)
        self.contador_flag = 0

        self.setWindowTitle("HMI")
        _date = datetime.utcnow().strftime(filesDateFormat)
        _title_date = "nombre_" + _date
        self.ui.namefile_edit.setText(_title_date)
        self.ui.adq_btn.clicked.connect(self.modoADQ)
        
        self._adq = False
        self.PT100_T = 0
        self.PT100_V = 0

        #Layout donde se insertan la graficas
        self.layout1=self.ui.layout1
        self.layout2=self.ui.layout2
        
        #Se crea gráfica
        self.PlotWidget1=pg.PlotWidget(name="Plot1", title=u'Temperature')
        self.PlotWidget1.setLabel('bottom', 'Time')
        self.PlotWidget1.setLabel('left', '°C')
        self.PlotWidget1.setYRange(0,50)
        
        #Se crea gráfica
        self.PlotWidget2=pg.PlotWidget(name="Plot2", title=u'Voltage')
        self.PlotWidget2.setLabel('bottom', 'Time')
        self.PlotWidget2.setLabel('left', 'V')
        self.PlotWidget2.setYRange(0,5)

        #agregar widget a layout
        self.layout1.addWidget(self.PlotWidget1)
        self.layout2.addWidget(self.PlotWidget2)
        
        #Creacion vectores para graficas
        self.range = 60    #Tiempo del rango del grafico en minutos
        self.act = 500     #Tiempo de actualizacion del grafico en ms
        self.time = (1./60000)*self.act
        self.size_ = int((60000/self.act)*self.range+1)
        self.t =  np.linspace(-self.range,0,self.size_)
        self.t2 =  np.linspace(-self.range,0,self.size_)
        self.y_T1 = np.zeros(self.size_)
        self.y_T2 = np.zeros(self.size_)

        #Creacion de curva
        self.curve1 = pg.PlotCurveItem(self.t,
                                       self.y_T1,
                                       pen=pg.mkPen('b', width=1.0),
                                       name='Temperature_value',
                                       stepMode=False,
                                       fillLevel=None)
        
        self.curve2 = pg.PlotCurveItem(self.t2,
                                       self.y_T2,
                                       pen=pg.mkPen('b', width=1.0),
                                       name='Voltage_value',
                                       stepMode=False,
                                       fillLevel=None)
         
        #Se agregan las curvas a los graficos
        self.PlotWidget1.addItem(self.curve1)
        self.PlotWidget2.addItem(self.curve2)

        #CONF. INICIAL COMUNICACIoN SERIAL-------------------------------------
        self._fpga_connected = False # estado de conexion
        
        #BotoN conexion puerto serial
        self.ui.btnSerial.clicked.connect(self.conectar_FPGA)
        self.fpga_comms = serial.Serial()
        self.fpga_comms.baudrate = BAUDRATE_CONF
        self.fpga_comms.timeout = 1
        self.fpga_comms.interCharTimeout = 0.05

        #Variables de recepcion 
        self.rcv_a1 = 0
        self.rcv_a2 = 0
        self.rcv_b1 = 0
        self.rcv_b2 = 0
        self.rcv_c1 = 0
        self.rcv_c2 = 0
        self.rcv_d1 = 0
        self.rcv_d2 = 0
        self.rcv_e1 = 0
        self.rcv_e2 = 0
        self.rcv_f1 = 0
        self.rcv_f2 = 0
        self.rcv_g1 = 0
        self.rcv_g2 = 0
        self.rcv_h1 = 0
        self.rcv_h2 = 0
        self.rcv_i1 = 0
        self.rcv_i2 = 0
        self.rcv_j1 = 0
        self.rcv_j2 = 0
        self.rcv_k1 = 0
        self.rcv_k2 = 0
        self.rcv_l1 = 0
        self.rcv_l2 = 0
        self.rcv_m1 = 0
        self.rcv_m2 = 0  
        
        #Auxiliares para recepcion
        self.aux_a1 = 0
        self.aux_a2 = 0
        self.aux_b1 = 0
        self.aux_b2 = 0
        self.aux_c1 = 0
        self.aux_c2 = 0
        self.aux_d1 = 0
        self.aux_d2 = 0    
        self.aux_e1 = 0
        self.aux_e2 = 0
        self.aux_f1 = 0
        self.aux_f2 = 0
        self.aux_g1 = 0
        self.aux_g2 = 0
        self.aux_h1 = 0
        self.aux_h2 = 0   
        self.aux_i1 = 0
        self.aux_i2 = 0
        self.aux_j1 = 0
        self.aux_j2 = 0
        self.aux_k1 = 0
        self.aux_k2 = 0
        self.aux_l1 = 0
        self.aux_l2 = 0   
        self.aux_m1 = 0
        self.aux_m2 = 0   
                
        #CONF. INICIAL METODOS DE ACTUALIZACIoN--------------------------------
        self.in_01 = 0
        self.in_02 = 0
        self.in_03 = 0
        self.in_04 = 0
        self.in_05 = 0
        self.in_06 = 0
        self.in_07 = 0
        self.in_08 = 0
        self.in_09 = 0
        self.in_10 = 0
        self.in_11 = 0
        self.in_12 = 0
        self.in_13 = 0

        #Variables para adquisición
        self._init = 0
        self.sec_in = 0

        #Timers actualizacion
        self._timer0 = QtCore.QTimer(self)
        self._timer0.timeout.connect(self.udpateVisual)

        self._timer1 = QtCore.QTimer(self)
        self._timer1.timeout.connect(self.updateGraph)

        self._timer2 = QtCore.QTimer(self)
        self._timer2.timeout.connect(self.udpateADQ)
            
#//////////////////////////////////////////////////////////////////////////////

    def modoADQ(self):
        if self._adq:
            self._adq = False  # Modo adq off
            self.ui.adq_btn.setText('ADQ on')
            self.adqfile.close()
            self._timer2.stop()
        else:
            self.nombreArchivo = self.ui.namefile_edit.text()
            folder_files = os.listdir(script_directory)
            for files in folder_files:
                name,extension = os.path.splitext(files)
                if extension == ".csv":
                    if name == self.nombreArchivo:
                        hour_ = datetime.now().strftime(hourFormat)
                        self.nombreArchivo = self.nombreArchivo +"_"+hour_
            
            self.adqfile = open(self.nombreArchivo+'.csv', 'w')
            fieldnames = ['Hour','Time','T','V']
            self.writer2 = csv.DictWriter(self.adqfile, fieldnames=fieldnames)
            self.writer2.writeheader()
            self._adq = True  # Modo adq on
            self.ui.adq_btn.setText('ADQ off')
            self._init = 1
            self._timer2.start(200)
           
    #MeTODOS DE ACTUALIZACIoN------------------------------------------------
    def udpateVisual(self):
        self.ui.T_label_2.setText("%.2f" % self.PT100_T)
        self.ui.V_label_4.setText("%.2f" % self.PT100_V)
        
    def udpateGraphT(self):
        self.t += self.time
        self.dato1 = self.PT100_T
        self.y_T1[:-1] = self.y_T1[1:]
        self.y_T1[-1] = self.dato1
        self.curve1.setData(self.t,self.y_T1)
        if (self.ui.adjustX.isChecked()):
            _xaxis = len(self.t) - int(len(self.t)/10)
            self.PlotWidget1.setXRange(self.t[_xaxis],self.t[-1])
    
    def udpateGraphV(self):
        self.t2 += self.time
        self.dato2 = self.PT100_V
        self.y_T2[:-1] = self.y_T2[1:]
        self.y_T2[-1] = self.dato2
        self.curve2.setData(self.t2,self.y_T2)
        if (self.ui.adjustX_2.isChecked()):
            print("True")
            _xaxis = len(self.t2) - int(len(self.t2)/10)
            self.PlotWidget1.setXRange(self.t2[_xaxis],self.t2[-1])

    def updateGraph(self):
        self.udpateGraphT()
        self.udpateGraphV()
            
    def udpateADQ(self):
        if (self._adq ):
            self.hour_date = datetime.now().strftime(dateFormat)
            if (self._init == 1):
                self.sec_in = time.time()
                self._init = 0
            self.T = time.time() - self.sec_in
            self.writer2.writerow({'Hour': self.hour_date,
                                'Time':"%.3f" % self.T,
                                'T':"%.5f" % self.PT100_T,
                                'V': "%.5f" % self.PT100_V})

    def conectar_FPGA(self):
        if self._fpga_connected:
            try:
                time.sleep( 0.05 ) # Evita que el thread genere una excepción
                print("Cerrando conexión con FPGA")
                self._fpga_connected = False
                self.fpga_comms.close()
            except Exception as e:
                print(f"Error: {e}")
            else:
                print(f"Estado de conexión con FPGA: {self._fpga_connected}")
                self.ui.btnSerial.setText('Connect')
                self._timer0.stop()
        else:
            try:

                self.COMname = str(self.ui.nameCOM_edit.text())
                self.fpga_comms.setPort(self.COMname)
                print(f"Conectando con FPGA en puerto: {self.COMname}")
                self.fpga_comms.open()
            except Exception as e:
                print(f"Error: {e}")
                print("Reiniciando conexión.")
                self.fpga_comms.close()
            else:
                self._fpga_connected = True
                threading.Thread(target=self.udpateRcv).start()
                self.ui.btnSerial.setText('Disconnect')
                print(f"Estado de conexión con FPGA: {self._fpga_connected}")
                self._timer0.start(500)
                self._timer1.start(100)

    def select_ports_input_gui():
        comms = serial.Serial()
        comms.baudrate = 19200
        comms.timeout = 1
        ports = serial.tools.list_ports.comports()
        output = []
        for port in ports:
            output.append(port.device)
        return output

        
   #MeTODOS DE TRANSMISIoN-----------------------------------------------------
    def enviarValor(self,pinout,data):
        if(pinout > 0 and pinout < 21):
            self.bytes_ = data
            self.byte_2, self.byte_1, self.byte_0 = FFtoF_F_F(self.bytes_)
            flag = pinout + 149
            self.send_1 = bytes([flag])
            self.send_2 = bytes([self.byte_0])
            self.send_3 = bytes([self.byte_1])
            self.send_4 = bytes([self.byte_2])
            if self._fpga_connected:
                self.fpga_comms.write(self.send_1)
                time.sleep(0.002)
                self.fpga_comms.write(self.send_2)
                time.sleep(0.002)
                self.fpga_comms.write(self.send_3)
                time.sleep(0.002)
                self.fpga_comms.write(self.send_4)
        else:
            print("Pin invalido. Debe estar entre 1 y 20")
        
   #MeTODOS DE RECEPCIoN-------------------------------------------------------        
    def udpateRcv(self):
        while (self._fpga_connected):
           self.rcv = self.fpga_comms.read(1)
           self.udpateData()

    def udpateData(self):
        char_rcv = chr(self.rcv[0])
        unicode_rcv = ord(char_rcv)
        if ord(self.rcv) == 200: #and self.init == 1:
            self.aux_a1 = 1
        if unicode_rcv != 200 and self.aux_a1 == 1:
            self.rcv_a1 = unicode_rcv
            self.aux_a1 = 0
        if unicode_rcv == 201:
            self.aux_a2 = 1
        if unicode_rcv != 201 and self.aux_a2 == 1:
            self.rcv_a2 = unicode_rcv
            self.aux_a2 = 0
            self.in_01 = F_FtoFF(self.rcv_a1,self.rcv_a2)
        if unicode_rcv == 202:
            self.aux_b1 = 1
        if unicode_rcv != 202 and self.aux_b1 == 1:
            self.rcv_b1 = unicode_rcv
            self.aux_b1 = 0
        if unicode_rcv == 203:
            self.aux_b2 = 1
        if unicode_rcv != 203 and self.aux_b2 == 1:
            self.rcv_b2 = unicode_rcv
            self.aux_b2 = 0
            self.in_02 = F_FtoFF(self.rcv_b1,self.rcv_b2)
        if unicode_rcv == 204:
            self.aux_c1 = 1
        if unicode_rcv != 204 and self.aux_c1 == 1:
            self.rcv_c1 = unicode_rcv
            self.aux_c1 = 0
        if unicode_rcv == 205:
            self.aux_c2 = 1
        if unicode_rcv != 205 and self.aux_c2 == 1:
            self.rcv_c2 = unicode_rcv
            self.aux_c2 = 0
            self.in_03 = F_FtoFF(self.rcv_c1,self.rcv_c2)
        if unicode_rcv == 206:
            self.aux_d1 = 1
        if unicode_rcv != 206 and self.aux_d1 == 1:
            self.rcv_d1 = unicode_rcv
            self.aux_d1 = 0
        if unicode_rcv == 207:
            self.aux_d2 = 1
        if unicode_rcv != 207 and self.aux_d2 == 1:
            self.rcv_d2 = unicode_rcv
            self.aux_d2 = 0
            self.in_04 = F_FtoFF(self.rcv_d1,self.rcv_d2)
        if ord(self.rcv) == 208: #and self.init == 1:
            self.aux_e1 = 1
        if unicode_rcv != 208 and self.aux_e1 == 1:
            self.rcv_e1 = unicode_rcv
            self.aux_e1 = 0
        if unicode_rcv == 209:
            self.aux_e2 = 1
        if unicode_rcv != 209 and self.aux_e2 == 1:
            self.rcv_e2 = unicode_rcv
            self.aux_e2 = 0
            self.in_05 = F_FtoFF(self.rcv_e1,self.rcv_e2)
        if unicode_rcv == 210:
            self.aux_f1 = 1
        if unicode_rcv != 210 and self.aux_f1 == 1:
            self.rcv_f1 = unicode_rcv
            self.aux_f1 = 0
        if unicode_rcv == 211:
            self.aux_f2 = 1
        if unicode_rcv != 211 and self.aux_f2 == 1:
            self.rcv_f2 = unicode_rcv
            self.aux_f2 = 0
            self.in_06 = F_FtoFF(self.rcv_f1,self.rcv_f2)
        if unicode_rcv == 212:
            self.aux_g1 = 1
        if unicode_rcv != 212 and self.aux_g1 == 1:
            self.rcv_g1 = unicode_rcv
            self.aux_g1 = 0
        if unicode_rcv == 213:
            self.aux_g2 = 1
        if unicode_rcv != 213 and self.aux_g2 == 1:
            self.rcv_g2 = unicode_rcv
            self.aux_g2 = 0
            self.in_07 = F_FtoFF(self.rcv_g1,self.rcv_g2)
        if unicode_rcv == 214:
            self.aux_h1 = 1
        if unicode_rcv != 214 and self.aux_h1 == 1:
            self.rcv_h1 = unicode_rcv
            self.aux_h1 = 0
        if unicode_rcv == 215:
            self.aux_h2 = 1
        if unicode_rcv != 215 and self.aux_h2 == 1:
            self.rcv_h2 = unicode_rcv
            self.aux_h2 = 0
            self.in_08 = F_FtoFF(self.rcv_h1,self.rcv_h2)
        if unicode_rcv == 216:
            self.aux_i1 = 1
        if unicode_rcv != 216 and self.aux_i1 == 1:
            self.rcv_i1 = unicode_rcv
            self.aux_i1 = 0
        if unicode_rcv == 217:
            self.aux_i2 = 1
        if unicode_rcv != 217 and self.aux_i2 == 1:
            self.rcv_i2 = unicode_rcv
            self.aux_i2 = 0
            self.in_09 = F_FtoFF(self.rcv_i1,self.rcv_i2)
        if ord(self.rcv) == 218: #and self.init == 1:
            self.aux_j1 = 1
        if unicode_rcv != 218 and self.aux_j1 == 1:
            self.rcv_j1 = unicode_rcv
            self.aux_j1 = 0
        if unicode_rcv == 219:
            self.aux_j2 = 1
        if unicode_rcv != 219 and self.aux_j2 == 1:
            self.rcv_j2 = unicode_rcv
            self.aux_j2 = 0
            self.in_10 = F_FtoFF(self.rcv_j1,self.rcv_j2)
        if unicode_rcv == 220:
            self.aux_k1 = 1
        if unicode_rcv != 220 and self.aux_k1 == 1:
            self.rcv_k1 = unicode_rcv
            self.aux_k1 = 0
        if unicode_rcv == 221:
            self.aux_k2 = 1
        if unicode_rcv != 221 and self.aux_k2 == 1:
            self.rcv_k2 = unicode_rcv
            self.aux_k2 = 0
            self.in_11 = F_FtoFF(self.rcv_k1,self.rcv_k2)
        if unicode_rcv == 222:
            self.aux_l1 = 1
        if unicode_rcv != 222 and self.aux_l1 == 1:
            self.rcv_l1 = unicode_rcv
            self.aux_l1 = 0
        if unicode_rcv == 223:
            self.aux_l2 = 1
        if unicode_rcv != 223 and self.aux_l2 == 1:
            self.rcv_l2 = unicode_rcv
            self.aux_l2 = 0
            self.in_12 = F_FtoFF(self.rcv_l1,self.rcv_l2)
        if unicode_rcv == 224:
            self.aux_m1 = 1
        if unicode_rcv != 224 and self.aux_m1 == 1:
            self.rcv_m1 = unicode_rcv
            self.aux_m1 = 0
        if unicode_rcv == 225:
            self.aux_m2 = 1
        if unicode_rcv != 225 and self.aux_m2 == 1:
            self.rcv_m2 = unicode_rcv
            self.aux_m2 = 0
            self.in_13 = F_FtoFF(self.rcv_m1,self.rcv_m2)
        
        #Temperature:
        self.PT100_T = self.in_01/2**6.00
        #print(self.PT100_T)
        
        #Convertion to Voltage
        self.PT100_V = (self.in_01*3.3/4095)
        print(self.PT100_V)

#Funcion desconcatenadora 7 bits ----------------------------------------------
def FFtoF_F_F(val):
    if val > 127 and val <= 16383:
        c = bin(val)
        c_3 = int(c[len(c)-7:],2)
        c_2 = int(c[2:len(c)-7],2)
        c_1 = 0
    elif val > 16383:
        c = bin(val)
        c_3 = int(c[len(c)-7:],2)
        c_2 = int(c[len(c)-14:len(c)-7],2)
        c_1 = int(c[2:len(c)-14],2)
    else:
        c_3 = val
        c_2 = 0
        c_1 = 0
    return c_3, c_2, c_1

#Funcion de concatenacion 7 bits-----------------------------------------------
def F_FtoFF(msb,lsb):
    a = bin(msb)
    b = bin(lsb)
    c = str('00000000')
    l = 9-len(b)
    out = int(a[2:]+c[0:l]+b[2:],2)
    return out

def bits_to_temp(bits):
    temp_converted = bits
    return temp_converted

def find_COM_devices():
    puertos_COM = list(serial.tools.list_ports.comports())
    if not puertos_COM:
        print("No devices connected")
    else:
        print("COM devices:")
        for puerto in puertos_COM:
            if str(puerto.manufacturer) == "FTDI":
                print(f"Name: {puerto.name},Description: {puerto.description}, ID: {puerto.manufacturer}")

#--EJECUCIoN-------------------------------------------------------------------
#Solo se ejecuta si se ejecuta el programa como principal      
if __name__ == '__main__':

    find_COM_devices()
    #Instancia para iniciar una aplicacion
    app = QtWidgets.QApplication(sys.argv)  #Pasar argumentos argv
    #Crear un objeto de la clase
    main_window = Interfaz()
    #Mostrar la ventana
    main_window.show()
    #Ejecutar la aplicacion
    app.exec()
#------------------------------------------------------------------------------