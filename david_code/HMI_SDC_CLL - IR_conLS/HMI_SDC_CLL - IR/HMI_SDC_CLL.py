 #!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
----------------------------------------------------------------------------
(C) 2020 Edited by Jonas (daarroyo@udec.cl)
Centro Para la Instrumentación Astronómica
Universidad de Concepción
----------------------------------------------------------------------------
"""

import sys
import threading
from PyQt4 import QtGui, uic, QtCore
import pyqtgraph as pg
import numpy as np
import serial
import time
import csv
import telnetlib

#-------MÉTODO DE INICIALIZACIÓN----- -----------------------------------------

# Clase heredada de QMainWindow (Constructor de ventanas)
class Interfaz(QtGui.QMainWindow):
    #Método constructor de la clase
    def __init__(self,parent=None):
        #Iniciar el objeto QMainWindow        
        super(Interfaz,self).__init__(parent)
        #Cargar la configuración del archivo .ui en el objeto
        self.ui=uic.loadUi("HMI_SDC_CLL.ui",self)

        #CONF. INICIAL FIJA DE LA VENTANA--------------------------------------
        self.setWindowTitle("Cargas CePIA - Prueba IR")
        
        self.ui.label_2.lower()
        self.ui.label_6.lower()
        self.ui.label_7.lower()
        
        #CONF. INICIAL METODOS DE EVENTOS--------------------------------------
        
        #Modos
        self._sp = 0
        self._tempSend = False
        self._load = 1 # Carga 1
        self._csv = False  # CSV off
        self._adq = False  # ADQ off 
        self._adq2 = False  # ADQ off 
        self._config = False # Modo config inactivo
        
        self.ctrl_load1 = 0
        self.ctrl_load2 = 0
        self.ctrl_load3 = 0
        
        self.sens_load1 = 0
        self.sens_load2 = 0
        self.sens_load3 = 0
        
        #BOTONES DE ENVÍO PARA TRANSMISIÓN
        #Activación de método por botón Set point
        self.ui.sp_btn.clicked.connect(self.enviarSetpoint)

        self.ui.stop_btn.clicked.connect(self.modoSTOP)
        self.ui.stop_btn.setCheckable(True)

        self.ui.adq_btn.clicked.connect(self.ADQ)###################modoADQ)
        
        #CONF. INICIAL METODOS DE ACTUALIZACIÓN--------------------------------
        self.SP = 0
        self.PV = 0
        self.PV1= 1
        self.PV2= 0
        self.PV3= 0
        self.CV = 0

        #CONF. INICIAL TENDENCIAS----------------------------------------------
        #CREACIÓN DE GRÁFICAS
        #Layout donde se insertan la gráficas
        self.layout1=self.ui.layout1
        self.layout2=self.ui.layout2
        
        #Se crean dos gráficos
        self.PlotWidget1=pg.PlotWidget(name="Plot1", title=u'Gráfica de respuesta del sistema de control')
        self.PlotWidget2=pg.PlotWidget(name="Plot2", title=u'Gráfica de la acción de control')
        
        #Configuración
#        pg.setConfigOption('background', 'w')      # Conf. color de fondo                                              
#        pg.setConfigOption('foreground', 'k')      # Conf. color de ejes
#        
        self.PlotWidget1.setLabel('bottom', 'Tiempo', 'min')
        self.PlotWidget1.setLabel('left', 'Temperatura', '°C')
        self.PlotWidget1.setYRange(0,120)
        
        self.PlotWidget2.setLabel('bottom', 'Tiempo', 'min')
        self.PlotWidget2.setLabel('left', 'Duty cicle', '%')
        self.PlotWidget2.setYRange(0,100)
        
        #Esta linea agrega el widget a un layout
        self.layout1.addWidget(self.PlotWidget1)
        self.layout2.addWidget(self.PlotWidget2)
        
        #Creacion vectores para gráficas
        self.range = 60   #Tiempo del rango del gráfico en minutos
        self.act = 500     #Tiempo de actualización del gráfico en ms
        self.time = (1./60000)*self.act        
        self.size = (60000/self.act)*self.range+1
        self.t =  np.linspace(-self.range,0,self.size)
        self.y_T1 = np.zeros(self.size)
        self.SP_T = np.zeros(self.size)
        self.CV_T = np.zeros(self.size)
                
        
        #Creación de curvas
        self.curve1 = pg.PlotCurveItem(self.t, self.y_T1, pen=pg.mkPen('b', width=1.0),
                                       name='Proc_value',stepMode=False,fillLevel=None)
        self.curve2 = pg.PlotCurveItem(self.t, self.SP_T, pen=pg.mkPen('g', width=1.0), 
                                       name='Set_point',stepMode=False,fillLevel=None)
        self.curve3 = pg.PlotCurveItem(self.t, self.CV_T, pen=pg.mkPen('r', width=1.0), 
                                       name='Ctrl_value',stepMode=False,fillLevel=None)
                      
        #Se agregan las curvas a los gráficos
        self.PlotWidget1.addItem(self.curve1)
        self.PlotWidget1.addItem(self.curve2)
        self.PlotWidget2.addItem(self.curve3)
        
        #CONF. INICIAL COMUNICACIÓN SERIAL-------------------------------------
        self._conectado = False # estado de conexion
        
        #BotoN conexión puerto serial
        self.ui.btnSerial.clicked.connect(self.conectar) 
        
        self.comms = serial.Serial()
        self.comms.setBaudrate(19200)
        self.comms.setTimeout(1)       
        self.comms.setInterCharTimeout(0.05)
    

        #Variables de recepción 
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
        
        
        #Auxiliares para recepción
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
        
        #CONF. CONEXIÓN CON LAKESHORE POR TELNET
        self.ip='152.74.113.35'
        self.port = '7777'
        
        #CONF. INICIAL METODOS DE ACTUALIZACIÓN--------------------------------
#        self.PV1= 1
#        self.PV3= 0
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
        
        #Variables para adquisición (en milisegundos los periodos)
        self.send_time = 115.5 # f = 450.2Hz .. bytes = 52  # T_send = 0.115504s
        self.tm = 800 # 15.625ms //////////////////////////////////////////// frecuencia 1.25Hz
        self.cont_adq = 0
        self.max_adq = round(self.tm/self.send_time)
        self.cont_data = 0
        self.max_data = 10 #4000
        self._init = 0
        self.sec_in = 0
        
        self.contSP = 0
        self.contSP_max = 5
        self.SP_init = 0
        self.delta_SP = 2
        self._init = 0
            
        #TIMERS----------------------------------------------------------------
        #Timers de envío 
        self._timer0 = QtCore.QTimer(self)
        self._timer0.setInterval(1000)
        
        self._timer1 = QtCore.QTimer(self)
        self._timer1.setInterval(1000) 
        
        #Timers actualización
        self._timer2 = QtCore.QTimer(self)
        self._timer2.setInterval(1)
#        self._timer2.timeout.connect(self.udpateRcv)
        
        self._timer3 = QtCore.QTimer(self)
        self._timer3.setInterval(self.act)
        self._timer3.timeout.connect(self.udpateGraph)
    
        
        
        
#-------MÉTODOS MODIFICACIÓN DE VENTANA ---------------------------------------   
  
      #MÉTODOS DE EVENTOS------------------------------------------------------
        
    def enviarSetpoint(self):
        if(self._sp == 0) :
            self._tempSend = False
            time.sleep( 0.02 )
            self._sp = 70
            self.pidCTRL()
            time.sleep( 0.02 )
            self.SP = float(70)
            self.v01 = float2fix(self.SP)
            self.enviarValor01()
            self.ui.sp_btn.setText('OFF')
            time.sleep( 0.02 )
            self._tempSend = True
        else:
            self._tempSend = False
            time.sleep( 0.002 )
            self._sp = 0
            self.offCTRL()
            time.sleep( 0.002 )
            self.SP = float(0)
            self.v01 = float2fix(self.SP)
            self.enviarValor01()
            self.ui.sp_btn.setText('SP 70')
            time.sleep( 0.02 )
            self._tempSend = True
        
    def offCTRL(self):    
        self.ctrl_load1 = 0
        self.modeCTRL()
            
    def pidCTRL(self):    
        self.ctrl_load1 = 2
        self.modeCTRL()
   
    def modeCTRL(self):     
        self.v13 = self.ctrl_load1 
        self.enviarValor13()

    def modoSTOP(self):
        self._tempSend = False
        if (self.ui.stop_btn.isChecked()):
            self.v15 = 1
            self.enviarValor15()
            self.offCTRL()
#            self.ui.ctrl_btn.enabledChange(False)
        else:
            self.v15 = 0
            self.enviarValor15()
        self._tempSend = True
        
    def modoCONFIG(self):
        if self._config:
            self._config = 0
            self.v16 = 0
            self.enviarValor16()
        else:
            self._config = 1
            self.v16 = 1
            self.enviarValor16()
                
    def modoADQ(self):
        self._tempSend = False
        if self._adq:
            self._adq = False  # Modo adq off
            time.sleep( 0.002 )
            self.SP = float(0)
            self.v01 = float2fix(self.SP)
            self.enviarValor01()
            self.ui.adq_btn.setText('ADQ ON')
            self.cont_data = 0
            self.cont_adq = 0
            self.offCTRL()
            self.adqfile.close()
            
        else:
            # Iniciación CSV
            self.SP = float(self.SP_init)
            self.v01 = float2fix(self.SP)
            self.enviarValor01()
            self.adqfile = open('dataIR_'+time.ctime()[-4:]+time.ctime()[4:7]+time.ctime()[8:10]+'_'+time.ctime()[11:13]+' '+time.ctime()[14:16]+'.csv', 'w')
            fieldnames = ['T','PV','SP']
            self.writer2 = csv.DictWriter(self.adqfile, fieldnames=fieldnames)
            self.writer2.writeheader()
            self._adq = True  # Modo adq on
            self.ui.adq_btn.setText('ADQ OFF')
            self._init = 1
        self._tempSend = True
        
    def ADQ(self):
        if self._adq2:
            self._adq2 = False  # Modo adq off
            self.ui.adq_btn.setText('ADQ ON')
            self.cont_adq = 0
            self.adqfile.close()
            
        else:
            # Iniciación CSV
            self.adqfile = open('dataIR_'+time.ctime()[-4:]+time.ctime()[4:7]+time.ctime()[8:10]+'_'+time.ctime()[11:13]+' '+time.ctime()[14:16]+'.csv', 'w')
            fieldnames = ['t','t_sec','Tamb','PV1','PV2','PV3','SP','PV_prom']
            self.writer2 = csv.DictWriter(self.adqfile, fieldnames=fieldnames)
            self.writer2.writeheader()
            self._adq2 = True  # Modo adq on
            self.ui.adq_btn.setText('ADQ OFF')
            self._init = 1
           
      #MÉTODOS DE ACTUALIZACIÓN------------------------------------------------
  
    def udpateVisual(self):
        self.ui.Thermo_1.setValue(self.PV_1)  
        self.ui.Thermo_2.setValue(self.PV_2)
        self.ui.Thermo_3.setValue(self.PV_3)
        
        self.ui.temp1.setText("%.3f" % self.PV_1)
        self.ui.temp2.setText("%.3f" % self.PV_2)
        self.ui.temp3.setText("%.3f" % self.PV_3)
        
        self.ui.val4.setText("%.3f" % self.val_4)
        self.ui.val5.setText("%.3f" % self.val_5)
        self.ui.val6.setText("%.3f" % self.val_6)
        self.ui.val7.setText("%.3f" % self.val_7)
        self.ui.val8.setText("%.3f" % self.val_8)
        
        self.ui.tamb_disp.setText("%.3f" % self.T_amb)
        
        self.ui.setpoint_disp1.setText("%.1f" % self.SP)
        self.ui.setpoint_disp2.setText("%.1f" % self.SP)
        
        self.ui.ctrlvalue_disp.setText("%.1f" % self.CV)
        
        self.ui.procvalue_disp.setText("%.3f" % self.PV)
        
        
    def udpateGraph1(self):
#        self.PlotWidget1.setYRange(0,120)    VER

        self.dato1 = self.PV
        self.dato2 = self.SP
        
        self.y_T1[:-1] = self.y_T1[1:]
        self.y_T1[-1] = self.dato1
        
        self.SP_T[:-1] = self.SP_T[1:]
        self.SP_T[-1] = self.dato2
        
        self.curve1.setData(self.t,self.y_T1)
        self.curve2.setData(self.t,self.SP_T)        
#        self.soft1 = True

        
    def udpateGraph2(self):
        
        self.PlotWidget2.setYRange(0,100)
        self.dato3 = self.CV
        
        self.CV_T[:-1] = self.CV_T[1:]
        self.CV_T[-1] = self.dato3
        
        self.curve3.setData(self.t,self.CV_T)      
#        self.soft1 = Tru


    def udpateADQ(self):
        if (self._adq ):
            if self.cont_adq == 0:
                if self.cont_data == self.max_data:
                    if self.contSP == self.contSP_max:
                        self.contSP = 0
                        self.modoADQ()
                        return
                    self._tempSend = False
                    self.SP += self.delta_SP
                    self.contSP += 1
                    self.v01 = float2fix(self.SP)
                    self.enviarValor01()
                    self._tempSend = True
                    self.cont_data = 0
                self.writer2.writerow({'T':"%s" % self.T, 'PV':"%.3f" % self.PV, 'SP':"%.3f" % self.SP})
                self.cont_adq += 1
                self.cont_data += 1

            elif self.cont_adq == self.max_adq-1:
                self.cont_adq = 0
            else:
                self.cont_adq += 1
                
    def udpateADQ2(self):
        if (self._adq2):
            if self.cont_adq == 0:
                self.writer2.writerow({'t':"%s" % self.T, 't_sec':"%.3f" % self.T_sec, 'Tamb':"%.3f" % self.T_amb, 'PV1':"%.3f" % self.PV1, 'PV2':"%.3f" % self.PV2, 'PV3':"%.3f" % self.PV3, 'SP':"%.3f" % self.SP, 'PV_prom':"%.3f" % self.PV})
                self.cont_adq += 1

            elif self.cont_adq == self.max_adq-1:
                self.cont_adq = 0
            else:
                self.cont_adq += 1

    def udpateGraph(self):
        self.t += self.time
#        self.PV2 = self.t[self.size-1]
#        if (self.PV2 >= 59):
#            self.conectar()
        self.udpateGraph1()
        self.udpateGraph2()
        self.udpateVisual()
        
#------------------------------------------------------------------------------ 
        
#-------MÉTODOS DE COMUNICACIÓN SERIAL-----------------------------------------
    #MÉTODO DE ACTUALIZACIÓN DE LA CONEXIÓN -----------------------------------
    def act_conex(self):
        self.comms.close()
        self.comms.open()
        
   #MÉTODO DE CONEXIÓN---------------------------------------------------------
    def conectar(self):
        self._tempSend = False
        if self._conectado:         
            self.offCTRL()
            self._conectado = False
            time.sleep( 0.05 ) # Evita que el thread genere una excepción
            self.comms.close()
            self.ui.btnSerial.setText('Conectar')
            self._timer2.stop()
            self._timer3.stop()
            

        else:
            self.comms.setPort("COM24")
            self.ls = telnetlib.Telnet(self.ip,self.port)
            self.comms.open()
            self._conectado = True 
            
            threading.Thread(target=self.udpateRcv).start()
            threading.Thread(target=self.udpateLakeshore).start()
            
            self._config = 1
            self.modoCONFIG()
            
            self._config = 1  # Se envía dos veces lo mismo por la primera conexión
            self.modoCONFIG()
#            self.ser = SerialReader(self.comms)
#            self.ser.received.connect(self.udpateData())
            self.ui.btnSerial.setText('Desconectar')
            self._conectado = True 
            self._timer2.start()
            self._timer3.start()  
        self._tempSend = True
            
            
   #MÉTODOS DE TRANSMISIÓN-----------------------------------------------------        
    def enviarValor01(self):

        # CONVERSIÓN
        self.gg = self.v01
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(150))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor02(self):

        # CONVERSIÓN
        self.gg = self.v02
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(151))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor03(self):

        # CONVERSIÓN
        self.gg = self.v03
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(152))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor04(self):

        # CONVERSIÓN
        self.gg = self.v04
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(153))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor05(self):

        # CONVERSIÓN
        self.gg = self.v05
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(154))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor06(self):

        # CONVERSIÓN
        self.gg = self.v06
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(155))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor07(self):

        # CONVERSIÓN
        self.gg = self.v07
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(156))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor08(self):

        # CONVERSIÓN
        self.gg = self.v08
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(157))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor09(self):

        # CONVERSIÓN
        self.gg = self.v09
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(158))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor10(self):

        # CONVERSIÓN
        self.gg = self.v10
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(159))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor11(self):

        # CONVERSIÓN
        self.gg = self.v11
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(160))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor12(self):

        # CONVERSIÓN
        self.gg = self.v12
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(161))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor13(self):

        # CONVERSIÓN
        self.gg = self.v13
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(162))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor14(self):

        # CONVERSIÓN
        self.gg = self.v14
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(163))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor15(self):

        # CONVERSIÓN
        self.gg = self.v15
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(164))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor16(self):

        # CONVERSIÓN
        self.gg = self.v16
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(165))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor17(self):

        # CONVERSIÓN
        self.gg = self.v17
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(166))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor18(self):

        # CONVERSIÓN
        self.gg = self.v18
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(167))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor19(self):

        # CONVERSIÓN
        self.gg = self.v19
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(168))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
           
    def enviarValor20(self):

        # CONVERSIÓN
        self.gg = self.v20
        
        self.gg_3, self.gg_2, self.gg_1 = FFtoF_F_F(self.gg)
        
        if self._conectado:
           self.comms.write('%c'%(169))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_1))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_2))
           time.sleep( 0.002 )
           self.comms.write('%c'%(self.gg_3)) 
        
   #MÉTODOS DE RECEPCIÓN-------------------------------------------------------
    
        
    def udpateRcv(self):
        while (self._conectado):
           self.rcv = self.comms.read(1)
#           self.file1 = open("Data_1.txt","a")
#           self.file1.write(str(ord(self.rcv))+" \n")
#           self.file1.close()
           self.udpateData()
#           self.comms.flushInput()
           
    def udpateLakeshore(self):
        while (self._conectado):
            # LAKESHORE MEDIDA
           self.ls.write('CRDG? A \r\n')
           self.PV1 = float(self.ls.read_until("\n",2)[1:-2])
           
           self.ls.write('CRDG? B \r\n')
           self.PV2 = float(self.ls.read_until("\n",2)[1:-2])
           
           self.ls.write('CRDG? C \r\n')
           self.PV3 = float(self.ls.read_until("\n",2)[1:-2])
           
           self.ls.write('CRDG? D \r\n')
           self.T_amb = float(self.ls.read_until("\n",2)[1:-2])
           
           self.sendTLakeshore()
           if (self.PV1 > 72 or self.PV2 > 72 or self.PV3 > 72):
               self.offCTRL()

    def sendTLakeshore(self):
        if (self._tempSend):
            time.sleep( 1 )
            self.v18 = float2fix2(self.PV1) 
            self.enviarValor18()
            time.sleep( 0.02 )
            self.v19 = float2fix2(self.PV2) 
            self.enviarValor19()
            time.sleep( 0.02 )
            self.v20 = float2fix2(self.PV3) 
            self.enviarValor20()
   
           
   
    def udpateData(self):
           
           if ord(self.rcv) == 200: #and self.init == 1:
               self.aux_a1 = 1;
           if ord(self.rcv[0]) != 200 and self.aux_a1 == 1:
               self.rcv_a1 = ord(self.rcv[0])
               self.aux_a1 = 0;
           if ord(self.rcv[0]) == 201:
               self.aux_a2 = 1;
           if ord(self.rcv[0]) != 201 and self.aux_a2 == 1:
               self.rcv_a2 = ord(self.rcv[0])
               self.aux_a2 = 0;
               self.in_01 = F_FtoFF(self.rcv_a1,self.rcv_a2)

               
           if ord(self.rcv[0]) == 202:
               self.aux_b1 = 1;
           if ord(self.rcv[0]) != 202 and self.aux_b1 == 1:
               self.rcv_b1 = ord(self.rcv[0])
               self.aux_b1 = 0;
           if ord(self.rcv[0]) == 203:
               self.aux_b2 = 1;
           if ord(self.rcv[0]) != 203 and self.aux_b2 == 1:
               self.rcv_b2 = ord(self.rcv[0])
               self.aux_b2 = 0;
               self.in_02 = F_FtoFF(self.rcv_b1,self.rcv_b2)

 
           if ord(self.rcv[0]) == 204:
               self.aux_c1 = 1;
           if ord(self.rcv[0]) != 204 and self.aux_c1 == 1:
               self.rcv_c1 = ord(self.rcv[0])
               self.aux_c1 = 0;
           if ord(self.rcv[0]) == 205:
               self.aux_c2 = 1;
           if ord(self.rcv[0]) != 205 and self.aux_c2 == 1:
               self.rcv_c2 = ord(self.rcv[0])
               self.aux_c2 = 0;
               self.in_03 = F_FtoFF(self.rcv_c1,self.rcv_c2)
               
           
           if ord(self.rcv[0]) == 206:
               self.aux_d1 = 1;
           if ord(self.rcv[0]) != 206 and self.aux_d1 == 1:
               self.rcv_d1 = ord(self.rcv[0])
               self.aux_d1 = 0;
           if ord(self.rcv[0]) == 207:
               self.aux_d2 = 1;
           if ord(self.rcv[0]) != 207 and self.aux_d2 == 1:
               self.rcv_d2 = ord(self.rcv[0])
               self.aux_d2 = 0;
               self.in_04 = F_FtoFF(self.rcv_d1,self.rcv_d2)

               
           if ord(self.rcv) == 208: #and self.init == 1:
               self.aux_e1 = 1;
           if ord(self.rcv[0]) != 208 and self.aux_e1 == 1:
               self.rcv_e1 = ord(self.rcv[0])
               self.aux_e1 = 0;
           if ord(self.rcv[0]) == 209:
               self.aux_e2 = 1;
           if ord(self.rcv[0]) != 209 and self.aux_e2 == 1:
               self.rcv_e2 = ord(self.rcv[0])
               self.aux_e2 = 0;
               self.in_05 = F_FtoFF(self.rcv_e1,self.rcv_e2)

               
           if ord(self.rcv[0]) == 210:
               self.aux_f1 = 1;
           if ord(self.rcv[0]) != 210 and self.aux_f1 == 1:
               self.rcv_f1 = ord(self.rcv[0])
               self.aux_f1 = 0;
           if ord(self.rcv[0]) == 211:
               self.aux_f2 = 1;
           if ord(self.rcv[0]) != 211 and self.aux_f2 == 1:
               self.rcv_f2 = ord(self.rcv[0])
               self.aux_f2 = 0;
               self.in_06 = F_FtoFF(self.rcv_f1,self.rcv_f2)

 
           if ord(self.rcv[0]) == 212:
               self.aux_g1 = 1;
           if ord(self.rcv[0]) != 212 and self.aux_g1 == 1:
               self.rcv_g1 = ord(self.rcv[0])
               self.aux_g1 = 0;
           if ord(self.rcv[0]) == 213:
               self.aux_g2 = 1;
           if ord(self.rcv[0]) != 213 and self.aux_g2 == 1:
               self.rcv_g2 = ord(self.rcv[0])
               self.aux_g2 = 0;
               self.in_07 = F_FtoFF(self.rcv_g1,self.rcv_g2)
               
           
           if ord(self.rcv[0]) == 214:
               self.aux_h1 = 1;
           if ord(self.rcv[0]) != 214 and self.aux_h1 == 1:
               self.rcv_h1 = ord(self.rcv[0])
               self.aux_h1 = 0;
           if ord(self.rcv[0]) == 215:
               self.aux_h2 = 1;
           if ord(self.rcv[0]) != 215 and self.aux_h2 == 1:
               self.rcv_h2 = ord(self.rcv[0])
               self.aux_h2 = 0;
               self.in_08 = F_FtoFF(self.rcv_h1,self.rcv_h2)
               
               
           if ord(self.rcv[0]) == 216:
               self.aux_i1 = 1;
           if ord(self.rcv[0]) != 216 and self.aux_i1 == 1:
               self.rcv_i1 = ord(self.rcv[0])
               self.aux_i1 = 0;
           if ord(self.rcv[0]) == 217:
               self.aux_i2 = 1;
           if ord(self.rcv[0]) != 217 and self.aux_i2 == 1:
               self.rcv_i2 = ord(self.rcv[0])
               self.aux_i2 = 0;
               self.in_09 = F_FtoFF(self.rcv_i1,self.rcv_i2)
               
               
           if ord(self.rcv) == 218: #and self.init == 1:
               self.aux_j1 = 1;
           if ord(self.rcv[0]) != 218 and self.aux_j1 == 1:
               self.rcv_j1 = ord(self.rcv[0])
               self.aux_j1 = 0;
           if ord(self.rcv[0]) == 219:
               self.aux_j2 = 1;
           if ord(self.rcv[0]) != 219 and self.aux_j2 == 1:
               self.rcv_j2 = ord(self.rcv[0])
               self.aux_j2 = 0;
               self.in_10 = F_FtoFF(self.rcv_j1,self.rcv_j2)

               
           if ord(self.rcv[0]) == 220:
               self.aux_k1 = 1;
           if ord(self.rcv[0]) != 220 and self.aux_k1 == 1:
               self.rcv_k1 = ord(self.rcv[0])
               self.aux_k1 = 0;
           if ord(self.rcv[0]) == 221:
               self.aux_k2 = 1;
           if ord(self.rcv[0]) != 221 and self.aux_k2 == 1:
               self.rcv_k2 = ord(self.rcv[0])
               self.aux_k2 = 0;
               self.in_11 = F_FtoFF(self.rcv_k1,self.rcv_k2)

 
           if ord(self.rcv[0]) == 222:
               self.aux_l1 = 1;
           if ord(self.rcv[0]) != 222 and self.aux_l1 == 1:
               self.rcv_l1 = ord(self.rcv[0])
               self.aux_l1 = 0;
           if ord(self.rcv[0]) == 223:
               self.aux_l2 = 1;
           if ord(self.rcv[0]) != 223 and self.aux_l2 == 1:
               self.rcv_l2 = ord(self.rcv[0])
               self.aux_l2 = 0;
               self.in_12 = F_FtoFF(self.rcv_l1,self.rcv_l2)
               
           
           if ord(self.rcv[0]) == 224:
               self.aux_m1 = 1;
           if ord(self.rcv[0]) != 224 and self.aux_m1 == 1:
               self.rcv_m1 = ord(self.rcv[0])
               self.aux_m1 = 0;
           if ord(self.rcv[0]) == 225:
               self.aux_m2 = 1;
           if ord(self.rcv[0]) != 225 and self.aux_m2 == 1:
               self.rcv_m2 = ord(self.rcv[0])
               self.aux_m2 = 0;
               self.in_13 = F_FtoFF(self.rcv_m1,self.rcv_m2)
               if (self._init == 1):
                   self.sec_in = time.time()
                   self._init = 0
               self.T_sec = time.time() - self.sec_in
               self.T = time.ctime()
               self.udpateADQ()
               self.udpateADQ2()
            
           #CONVERSIÓN ------------------------------------------------------> MODIFICAR!!!!!
           self.PV11 = self.in_01/2**6.000
           self.PV12 = self.in_02/2**6.000
           self.PV13 = self.in_03/2**6.000
           
           self.val_4 = self.in_04/2**6.000
           self.val_5 = self.in_05/2**6.000
           self.val_6 = self.in_06/2**6.000
           self.val_7 = self.in_07
           self.val_8 = self.in_08

           self.PV = mean3(self.PV11, self.PV12, self.PV13) 
           self.PV_1 = self.PV11
           self.PV_2 = self.PV12
           self.PV_3 = self.PV13
           
           self.CV = self.in_10/10.0
           
           if (self.in_13 == 1):
               self.ui.stop_btn.setChecked(True)
               self.modoSTOP()
           
                  
#------------------------------------------------------------------------------
                                                       
#----------FUNCIONES-----------------------------------------------------------
# Función promedio 3 valores
def mean3(val1, val2, val3):
    prom = (val1 + val2 + val3)/3
    
    return prom

#Función para convertir de flotante a punto fijo-------------------------------
#Parámetros
width = 21
precision = 10

def float2fix(val):
    integer = abs(int(val * 2 ** precision))
#    if val < 0:
#        integer = 2 ** (width - 1) + integer 
    return integer

precision2 = 14

def float2fix2(val):
    integer = abs(int(val * 2 ** precision2))
#    if val < 0:
#        integer = 2 ** (width - 1) + integer 
    return integer

#Función desconcatenadora 7 bits ----------------------------------------------
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

#Función de concatenación 7 bits-----------------------------------------------
def F_FtoFF(msb,lsb):
    a = bin(msb)
    b = bin(lsb)
    c = str('00000000')
    
    l = 9-len(b)    
    
    out = int(a[2:]+c[0:l]+b[2:],2)
    return out

#Función de conversión de valor digital a temperatura--------------------------
#Parámetros
V = 5
V_ref = 3.3
alpha = 3.85e-3
bit_res = 4096 - 1 
gain = 301
r = 200
R0 = 100
R1 = 220

def FFtoT1(val): #Divisor de voltaje
    try:
        res_V = V_ref/bit_res
        Vg_o = val*res_V
        Rt = (R1*Vg_o)/(V_ref-Vg_o)
        t_o = (Rt-R0)/(R0*alpha)
    except:
        t_o = 0
        print "Error división por cero"
#    Vs_o = Vg_o/gain
#    t_o = -(Vs_o*r**2+2*Vs_o*r+Vs_o)/(alpha*Vs_o-V*r*alpha+r*alpha*Vs_o)
    return t_o
    
def FFtoT2(val): # PW + amp. inst. 
    try:
        res_V = V_ref/bit_res
        Vg_o = val*res_V
        Vs_o = Vg_o/gain
        t_o = -(Vs_o*r**2+2*Vs_o*r+Vs_o)/(alpha*Vs_o-V*r*alpha+r*alpha*Vs_o)
    except:
        t_o = 0
        print "Error división por cero"

    return t_o
    
    
#--EJECUCIÓN-------------------------------------------------------------------
#Solo se ejecuta si se ejecuta el programa como principal      
if __name__ == '__main__':  
    #Instancia para iniciar una aplicación
    app = QtGui.QApplication(sys.argv)  #Pasar argumentos argv
    #Crear un objeto de la clase
    main_window = Interfaz()
    #Mostrar la ventana
    main_window.show()
    #Ejecutar la aplicación
    app.exec_()
#------------------------------------------------------------------------------