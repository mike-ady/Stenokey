# The Stenokey User's Manual

Copyright © 2017, Mike Ady  
This file is part of the open source Stenokey project.  
This file is licensed under the Creative Commons Attribution-ShareAlike license.

The Stenokey keyboard emulates a stenographic machine.  It works much like any USB keyboard on a desktop PC.  It connects to any desktop or laptop PC through a USB port using a USB A to USB mini-B cable.  You will need to install the open source Plover program or other commercial stenography software on your PC to use the Stenokey.

## Configuring Stenokey

The Stenokey has two rotary switches which can be used to configure the keyboard.  If the rotary switches have been installed on the left side of the keyboard, then the protocol switch is on the left and the brightness switch for the power LED is on the right.  (These switches are in the opposite order if they have been installed on the right side of the keyboard.)  

To change the settings on the board, you will need a flat head jeweler's screwdriver or perhaps an eyeglass repair or sewing machine screwdriver with a blade that is no more than 2.5 mm (0.1") wide.  

There are 5 steno protocols available, numbered 0 through 4:

0  Diagnostic (displays the row and column of each pressed key)  
1  NKRO Keyboard  
2  Gemini PR  
3  TX Bolt  
4  Procat  

There are 8 power LED brightnesses, from 0 through 7.  The LED is off in position 0, and fully on in position 7.

On both switches, switch position 0 is at the 9 o'clock position and the numbers increase with each detente as the switch is turned clockwise.

Select one of non-diagnostic protocols before continuing.  All of the non-diagnostic protocols work equally well with Plover, though you may want to select a specific protocol if you have commercial software that you want to use instead of, or in addition to Plover.  

In general, NKRO keyboard mode is not recommended, since choosing it will cause Plover to intercept and translate keystrokes on both the Stenokey and the PC's own keyboard.  All of the other protocols use the USB serial interface, and they allow you to use the Stenokey in addition to your PC's keyboard without having to enable and disable Plover to switch between keyboards.

At the time of writing, there was an issue with Plover's support for numeric keystrokes on NKRO keyboards.  This problem was corrected in version 4.0.0.dev3.  Any later stable release should also have this fix.  

[The diagnostic protocol also uses the USB serial interface but it is not supported by Plover.  You shouldn't need to use the diagnostic protocol, but if you do want to use it for troubleshooting, you will need a serial monitor program to view the output.  You can install the Arduino software on your PC for that purpose.  See the Stenokey Programming and Testing Manual for further information.]

## Plover Software Installation

If you built the Stenokey keyboard yourself, then you will likely 
already have Plover installed on your PC and you can skip this 
section.  There is also no need to install Plover if you plan to use commercial stenography software exclusively.

To install Plover, open an Internet browser on your PC then open the following web page:

[http://github.com/openstenoproject/plover/wiki/Installation-Guide](http://github.com/openstenoproject/plover/wiki/Installation-Guide) 

Follow the instructions on that page and download the "latest stable version" for your operating system.  Follow the instructions specific to your operating system to install the software.  

On Windows, you may need to run Plover "As Administrator" to get it to work properly.  

## Configuring Plover

Connect the Stenokey to a USB port on your PC if you haven't done so already.  Open Plover, click on the Configure button then select the Machine tab on the dialog that opens.  Click on the "Machine:" drop down listbox and select the protocol that you configured the Stenokey for.  

If you have configured the Stenokey for NKRO Keyboard mode, select "Keyboard" as the machine type then click on OK to dismiss the dialog box.

All of the other protocols use the USB serial interface and you will need to select a serial port for Plover to connect to.  Click on the Scan button to scan for available serial ports on your PC.  If more than one serial port appears in the "Port" drop down listbox and you aren't sure which one is associated with the Stenokey, unplug the Stenokey and click on the Scan button in Plover again.  One serial port should disappear and that should be the Stenokey's port.

Use the defaults for the rest of the settings on the Machine tab and click on OK to dismiss the dialog box.  

## Using the Stenokey

Select the Enable radio button in Plover to activate it.  Open a text editor or word processor and start typing on the Stenokey.  Plover will intercept your keystrokes on the Stenokey and translate them into syllables, words and phrases in your document.  

In Keyboard mode, Plover will also intercept the keystrokes on your PC or laptop keyboard (but only the ones that it recognizes) and translate them too.  Disable Plover output when you want to use your regular keyboard without Plover interfering.

## What Next?

If you already know some steno, you likely know what you want to do next.  If you're a total newbie to steno, the Steno Tutor program by Emanuele Caruso is highly recommended.  Steno Tutor will present you with repetitive exercises to help you to learn the steno keyboard layout and to learn how to chord. 

Steno Tutor is open source and you can download it from here:

[https://github.com/caru/StenoTutor](https://github.com/caru/StenoTutor)

Follow the instructions on that page to install the package and run it.  

The documentation for Steno Tutor is somewhat sparse.  To change settings, you will need to edit the "session.properties" file with a text editor.  That file is found in the data sub directory of the Steno Tutor program, (specific to your operating system).  

Steno Tutor will not proceed unless you have entered exactly the word that it is waiting for.  Use the asterisk key (on the Stenokey) to delete incorrect entries.  (The Backspace key on your regular keyboard can be used to delete words one character at a time, but that is less useful.)  

Use the Tab key on your regular keyboard to pause Steno Tutor.  (You can also stroke "TA*B" on the Stenokey to the same effect.)  Once Steno Tutor is paused, striking any key on the Stenokey will release Steno Tutor's timer again.

Steno Tutor expects words to be typed in lower case.  If you find that characters are appearing in upper case, use the Caps Lock key on your regular keyboard to toggle the case.  You may need to strike the Caps Lock key twice for it to take effect.

In addition to Steno Tutor, you will probably need to learn more about steno practice and theory.  The "Learn Plover!" book is available on line in paperback at Amazon.com.  You can also view it for free on line here:

[https://sites.google.com/site/ploverdoc/home](https://sites.google.com/site/ploverdoc/home)

Exercises to go with the book (which work similarly to Steno Tutor) are available here:

[http://www.tranklements.com/PloverLearn/](http://www.tranklements.com/PloverLearn/)