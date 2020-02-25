# Stenokey Case Readme

Copyright © 2017, 2020, Mike Ady  
This file is part of the open source Stenokey project.  
This file is licensed under the Creative Commons Attribution-ShareAlike license.

DO NOT PRINT ALL OF THE FILES IN THIS DIRECTORY!

The Stenokey case consists of a top, a base and a key matrix.  
The case encloses the Stenokey circuit board.  The base is 
affixed to the top by means of 8 M3 machine screws and 8 heat 
set inserts.  The purpose of the key matrix is to support and 
align the key switches.  

The case top is available in 4 variants, which allow for the 
USB cable to be plugged in from the left or the right, and for 
the interface elements (two options switches and a power LED) 
to be placed on the left or the right.  Only one of the 4 case 
top variants need be printed, and the Stenokey circuit board 
must be populated with components to match the particular 
variant that is chosen.  

The case base is available in 2 variants.  The location of the 
interface components has no effect on the shape of the base so 
there are only variants which place the USB cable on the left 
or right.  Only one of the case base variants need be printed,
and it must match the case top variant chosen. 

## Print Instructions

The Stenokey case parts were printed successfully under the 
following conditions:

Nozzle:  0.4 mm  
Layer:  0.2 mm  
Filament:  PLA, modified  
Extruder:  Follow filament manufacturer's temperature recommendation.  
Heated bed: 50° to 60° C  
Interior:  50% infill  
Exterior: 100% infill, 0.8 mm thick (4 layers) top and bottom, 
double shell (0.8 mm)  
No Raft

Allow the bed to cool below the filament's glass temperature before 
removing parts to avoid bending and ruining the parts. 

## Directory Contents

- "BaseUSBLeft.stl" -- This file contains the case base 
variant with the Teensy micro controller (and USB cable) on 
the left.

- "BaseUSBRight.stl" -- This file contains the case base 
variant with the Teensy micro controller (and USB cable) on 
the right.

- "KeyMatrix.stl" -- This file contains the key support matrix.

- "TopIntLeftUSBLeft.stl" -- This file contains the case top 
variant which places both the interface elements and the 
Teensy micro controller (and USB cable) on the left.

- "TopIntRightUSBLeft.stl" -- This file contains the case top 
variant which places the interface elements on the right and 
the Teensy micro controller (and USB cable) on the left.

- "TopIntLeftUSBRight.stl" -- This file contains the case top 
variant which places the interface elements on the left and 
the Teensy micro controller (and USB cable) on the right.

- "TopIntRightUSBRight.stl" -- This file contains the case top 
variant which places both the interface elements and the 
Teensy micro controller (and USB cable) on the right.

- "LeadBender.stl" -- This file contains a simple lead bending 
jig which can be used to quickly bend the leads on the small 
axial components used on the Stenokey circuit board.
