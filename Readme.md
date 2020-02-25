# Stenokey

Stenographic keyboard

Stenokey is an open source do it yourself stenographic keyboard project.  It is aimed 
at makers with some electronics experience (soldering) and who own a 3D printer 
or who have a friend with a 3D printer.

![Documentation/Stenokey.png](Documentation/Stenokey.png)

Stenokey connects to any desktop or laptop PC that has a USB port.  It is meant 
to work with the Open Steno Project's Plover software, which runs on Linux, Mac and 
Windows.

This project consists of four main parts:

- The OpenSCAD source code for all of the 3D printed plastic parts is in the main 
directory.  Printer ready .STL files for the key tops are in the Key\_Print\_Files 
directory.  The .STL files for the case are in the Case\_Print\_Files directory.  

- The bill of materials (BOM) for populating the circuit board is in the main 
directory.  The PCB design files are in the PCB directory.

- The Arduino based firmware is in the Firmware directory.

- Documentation for the project, including build instructions, programming and testing 
instructions and a user manual are all in the Documentation Directory.
