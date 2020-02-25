# Stenokey Build Instructions

Copyright © 2017, 2020, Mike Ady  
This file is part of the open source Stenokey project.  
This file is licensed under the Creative Commons Attribution-ShareAlike license.

**Warning:**  Please follow all instructions in order.  It may be almost impossible to recover if you attempt to put things together in the wrong order.  

Once the plastic parts have been printed, you should be able to build the Stenokey in an afternoon or an evening.  However, take your time.  If you get tired or worse, cranky, set things aside and complete the project at another time when your outlook is better.

1.  Bill of materials (see Stenokey.xls for part numbers and ordering information):

	40 small signal diodes  
	1 5 mm dome LED  
	1 510 ohm, 1/8 watt resistor  
	34 Matias quiet linear key switches  
	2 16-position rotary DIP switches  
	1 Teensy 2.0 module  
	1 Stenokey circuit board  
	1 USB A to USB mini-B cable  
	8 M3 heat set inserts  
	8 M3 x 12 mm pan head machine screws  

	You will also need the following items:

	Soldering iron with a fine tip  
Solder (rosin core recommended)  
Liquid soldering flux (recommended)  
Nippers (a.k.a. side cutters) or wire cutters  
Sharp knife for scraping plastic  
Fingernail file for cleaning up edges of plastic  
Cyanoacrylate glue (may not be necessary)  
Drill with 1/4" and 1/8" drill bits (may not be necessary)  
Sandpaper for cleaning up the surfaces of the keys (may not be necessary)  
99% Isopropyl Alcohol (optional)  
Electronics prototype board (for soldering pins to Teensy)  
Electrical multimeter (recommended)  
Needle nose pliers (may not be necessary)  
Paper towel (optional)  
Safety glasses (required)  
Phillips head screwdriver for M3 screws    

2.  Print the Stenokey key tops, case top, key matrix and case base, or have someone print them for you.  See the notes in the StenokeyKeys.scad and StenokeyCase.scad files for information on printing these components.  

	You have options in terms of which side of the Stenokey that the USB cable will plug into, and in terms of which side the three interface holes (the power LED and the two rotary switches) will be on.  You also have several options when printing the key tops.  

	Clean up the printed parts as necessary; make them pretty.

3.  Check to make sure that the circuit board fits down onto the 
pegs that stick out of the top of the Stenokey base.  You should end up with the top surface of all 8 pegs almost flush with the top surface of the circuit board.  If you cannot get the circuit board to fit, you may need to chase (i.e. drill out) any tight holes on the circuit board with a 1/4" drill bit.

	Once you've checked the fit of the circuit board, remove it from the base.

	Check to make sure that an M3 screw will fit into each screw hole in the base.  A screw should slide easily into each hole.  If any of the holes are tight, chase them with a 1/8" drill bit. 

4.  Check the fit of the key switches in the key matrix.  They should fit snugly so that they won't fall out when you turn everything over while building the Stenokey.

	Be sure to insert the bottom of the key switches through the top surface of the key matrix.  (The bottoms of the key switches have pins protruding from them.  The top surface of the key matrix is flat; it has no ribs.)

	If any of the key switches are loose, you might consider using a drop of cyanoacrylate glue to glue each loose switch in place.  Be sure that each switch is fully seated before you glue it.  Use glue sparingly.  The Matias key switches are not sealed, and if glue wicks into a switch, it will ruin the switch.

	If any of the key switches won't fit at all, DO NOT FORCE the switches, use a sharp knife to scrape a few times along each side of the key switch hole.  Repeat as necessary until a switch can be pressed into place.  Repeat as necessary for the remaining switches and mount all of the switches in their holes.  

	Be sure to orient the switches so that the pins that stick out of the bottom of each switch are oriented towards (i.e. are closer to) the top edge of the key matrix (i.e. the edge that is opposite from the 4 vowel keys).  Make sure that all key switch pins are not bent and are sticking straight out from the bottoms of the switches.

	Check the fit of the key matrix on the top of the circuit board.  Each pin should fit down into its corresponding hole in the circuit board.  Be careful to avoid bending any pins.  If some of the pins won't come through the board, don't force them to fit; separate the key matrix from the circuit board, straighten any bent pins and try again.  Remove the key matrix from the board when you are done.

5.  Check to make sure that the Teensy is working.  Connect the Teensy to your computer using the USB mini-B cable.  The LED on the Teensy should start blinking.  (Each Teensy is shipped preprogrammed with a blink program.)  Disconnect the Teensy.

6.  Solder the Teensy onto its headers.  The headers are provided as a longer strip of snappable header pins.  Break off two headers of 12 pins each.  It may be helpful to use needle nose pliers to grasp the retainer on the pin next to where you want to break the strip.  Then bend the strip, with your fingers close to the pliers, until it breaks.

	Watch the video and follow the instructions on the following web page to ensure that you solder the header pins correctly.

	[https://www.pjrc.com/soldering-pins-on-to-your-teensy/](https://www.pjrc.com/soldering-pins-on-to-your-teensy/)

	If you have liquid flux, use it, but use it sparingly.  There is seldom enough flux provided in the core of rosin core solder to solder header pins, and the extra flux will help to guarantee that you get a good solder joint every time.

	Note that while the Stenokey circuit board has additional holes matching the Teensy footprint, only pins adjacent to the long edges of the Teensy are actually used; there is no need to place pins in the remaining holes.

7.  READ through this step completely before proceeding.  DO NOT solder any of the key switches until after you have completely tested the circuit board (in step 8).  

	In this step, you will solder all components except the key switches to the circuit board.  Components must be mounted through the top of the board and must be soldered from the back side of the board.  Be sure to orient all components correctly.  

	Each diode has a black bar on it, marking the cathode.  The bar must match up with the white bar shown on the circuit board.  You can save time bending the leads of the resistor and diodes by using a lead bending jig.  Various such jigs are available for printing on Thingiverse, or you can print the file LeadBender.stl that is included with this project.  That jig is sized specifically for the axial components and the 8 mm lead spacing used on the Stenokey circuit board.  

	Because there are so many diodes to solder to the circuit board, it is easy to make a mistake and place some of the diodes on the board backwards.  The diodes are normally supplied in a band with tape on each end.  If you cut the tips of the leads on the cathode side to remove them from the tape, but pull the leads from the tape on anode side, you will end up with diodes that have shorter leads on their cathodes.  The differing lead lengths will make it easier to make sure that you have oriented the diodes correctly when you are pushing the leads through the circuit board. 

	The LED in the BOM has one shorter lead and an indent on the lip around the molding which mark the cathode.  Match that lead up with the line to the left of the circle on the circuit board.  (Note that this scheme for marking the cathode on an LED is not universal.  If you have substituted some other LED for the one in the BOM, then you can use the continuity/diode test feature on a multimeter to check the polarity of the LED, if you are unsure which lead is the cathode.  The meter should show a reading of about 1.8 V when the cathode is connected to the negative (black) lead of the meter.)

	The Teensy must be installed with its USB connector facing the adjacent edge of the circuit board.  Be sure to solder the Teensy to the side of the board that you chose when you printed the Stenokey cover.  Don't get confused by looking at the top cover when it is lying on its top surface.  Flip it right side up, or mate it to the base to avoid confusion.

	Make sure that each component is pressed firmly against the top surface of the board before applying solder from the bottom, otherwise you will end up with tilted components and it will be hard to straighten them out later.  While pressing on the body of the axial components from the top of the board, you can splay the leads of the resistor or diodes to 45 degrees.  That will hold them in place while you solder.

	Do not attempt to place a large number of the axial components before soldering them.  That will likely only cause you trouble.  Place a few or perhaps as many as a half dozen components at a time, then solder them and trim their leads.  Repeat until you have soldered the resistor and all of the diodes.  

	It is easier to correct soldering errors on components that have just two pins.  When soldering a component with additional pins, it helps to solder a single pin in one corner of the component first.  Once you have done that, make sure that the component is still seated properly.  If not, reheat the pin or lead and reseat the component.  Then solder a single pin in the opposite corner of the component next.  Once again, check to make sure that the component is still seated properly.  Correct as necessary before proceding.  Once you are happy with the seating of the component, check the orientation of the component one last time, then solder the remaining pins.

	The rotary switches must be installed with the number '0' on the dial oriented towards the left of the circuit board.

	If you have printed the version of the cover with the interface holes on the left, place the LED in slot D41, the resistor in slot R1 and the rotary switches in slots SW37 and SW38 on the left.  Leave the slots D42, R2, SW35 and SW36 empty.  

	Alternatively, if you have printed the version of the top cover with the interface holes on the right, place the LED in slot D42, the resistor in slot R2 and the rotary switches in slots SW35 and SW36 on the right.  Leave the slots D41, R1, SW37 and SW38 empty.  

	After soldering some of the components, the leads will likely get in the way.  Use side cutters to trim the ends of leads which protrude from the solder on the bottom of the board.  Be sure to use safety glasses when nipping off leads or pins, they can fly into your eyes causing an abrasion or worse.  Always choose safety over a trip to the hospital.  

	When you are done soldering all components on the circuit board, be sure to trim any remaining leads or pins.  No pin or lead should protrude more than a millimeter from the bottom of the circuit board.

8.  Check your work before continuing.  The easiest mistake to make is to install a diode backwards and while that won't cause any permanent damage, Stenokey will not work correctly, and that may just ruin your day.  Make sure that the black bar on all diodes is on the left.  Make sure that the indent on the rim on the LED is also on the left.  Make sure that the rotary switches are also oriented with their zero positions to the left. 

	Run through the "Programming and Testing the Stenokey Circuit Board" procedure as described in the file Stenokey_Test.pdf before continuing with building the Stenokey.  You must make sure that the Stenokey is operational before soldering down the key switches.

9.  It is generally safe to leave rosin based flux on a circuit board.  However, if you have used a more aggressive flux, clean the board according to the manufacturer's recommendation.  If you wish to clean up the board and you've used rosin based flux on it, you can use 99% isopropyl alcohol and and old tooth brush.  It can take several minutes to dissolve and remove hardened flux.  Wipe off dissolved flux with a paper towel, before it rehardens.

	Alcohol is a flammable liquid.  Use at your own risk.  Only use in a well ventilated area away from heaters, lights and open flame.  Most commercial flux removers are also flammable.  Be sure to follow the manufacturer's instructions if you use a flux remover.

	While removing flux from the bottom of the board, don't forget the Teensy on the top of the board.  It is important to remove the flux from the Teensy before soldering on the key switches, rather than after.

	Be careful to avoid getting alcohol or flux remover near the rotary switches on the top side of the circuit board.  The alcohol can wick into the switches and flux residue can gum up the works, ruining the switches.  

10.  Fit the key matrix to the circuit board then solder the key switches to the board.  Solder starting in the middle of the matrix and working outward.  It is important to make sure that each key switch is flat against the circuit board, or you will end up with a non-level bed of keys and the Stenokey case will not fit properly.  Because the key matrix and circuit board are quite flexible, you should apply pressure forcing each key switch against the board as you solder its pins.

	Once you have soldered all of the key switches to the board, connect the USB cable and check you work.  Make sure that each and every key switch works correctly.  Depending on the state that you left things in when testing before, your key presses will appear either in the Arduino Serial Monitor or the Plover Paper Tape display.  If any of the key switches is not registering key presses, it is most likely a cold solder joint or an unsoldered joint on the key switch that is the culprit.  Refer to the troubleshooting tips in the Stenokey testing document for assistance.  Remove the USB cable once you have finished testing.

11.  Once you have tested all of the key switches, you can remove the flux from the back of the board.  Be sure to use alcohol or flux remover sparingly to avoid having it migrate to the top of the board.  The Matias key switches are not sealed.  As with the rotary switches, alcohol or flux remover can wick into the key switches and flux residue can get into the switches and ruin them.  

12.  Using a hot soldering iron, insert the 8 heat set inserts into the holes in the pads on the top cover.  Push each insert down into its hole, until its top surface is flush with the top of its pad, or just slightly below.  Use gentle force and push straight down with the soldering iron, so that the inserts don't end up skewed.  

	If some plastic oozes up while inserting the heat set inserts, wait until the molten plastic has hardened, but is still warm (about a minute).  Then slice off the excess plastic with a sharp knife.  The plastic cuts most easily when it is warm, but not soft.  If you need to push an insert deeper or right a slightly off skew insert, you shouldn't have any trouble.  The inserts are quite forgiving as long as you use gentle force.  

13.  Mount the circuit board onto the pegs on the base of the case.  Fit the top cover to the base then screw in the 8 M3 screws to affix the cover to the base.  Do not over tighten the screws.  Insert the key tops into the key switches.  At this point, the Stenokey is complete.  Plug in the USB cable and the Stenokey is ready to use. 

14.  (Optional)  As seen in pictures of the Stenokey, a logo has been affixed to the case.  The logo was cut from standard sign making adhesive vinyl film using a craft cutter, Cricut Explore.  The file StenoKeyLogo.svg (in the main distribution directory) was imported into Cricut Design Space, and resized there.  The recommended size is approximately 75 mm x 6 mm.  (The object height can be set to 1/4", resulting in a width of just under 3".)     

	The logo will need to be transferred to transfer tape and it will need to be weeded before applying the logo to the Stenokey body.  These techniques are beyond the scope of this document, however there are numerous short tutorials on weeding, reverse weeding and applying vinyl labels, which are available on YouTube and other sites on the Internet.  