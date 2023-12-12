# -*- coding: utf-8 -*-
"""
Created on Mon Jan 13 16:34:45 2020

@author: CePIA_Instr
"""

#!/usr/bin/python
# -*- coding: utf-8 -*-
 
from cx_Freeze import setup, Executable
 
setup(
 name="HMI_SDC_CLL",
 version="0.1",
 descriptiom="Interfaz gráfica cargas de calibracion LLAMA - CePIA",
 executables = [Executable("HMI_SDC_CLL.py")],
 )