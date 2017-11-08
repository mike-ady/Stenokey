// StenokeyKeys.scad -- Generate keys for the StenoKey circuit board

// Copyright © 2017, Mike Ady
// This file is part of the open source Stenokey project.
// This file is licensed under the Creative Commons Attribution-ShareAlike license.

// This file was inspired by Jason Cemra's StenoToppers project.

// https://github.com/cemrajc/stenotoppers

//		StenoToppers provides 3D models of keycaps for NKRO keyboards 
// with Cherry MX switches.  The keycaps printed almost perfectly on 
// my 3D printer so I decided to try generating keys for a custom 
// steno keyboard.  The key shapes here were inspired by Joshua 
// Lifton's Stenosaurus project.  The dimensions have been 
// "metricized" with Joshua's numbers rounded to the nearest half 
// millimeter, more or less.  See:

// https://github.com/openstenoproject/stenosaurus

//		As with the Stenosaurus project, these keys are meant to be
// used with the Matias Quiet Linear key switches.  The Matias key
// switches have an ALPS style rectangular slot in the actuator.  See:

// http://matias.ca/switches/linear/

// How to use this code:

//		The workhorse module, Key, generates a single key, and can 
// be used to generate all of the different variations of keys.  
// There are "upper", "middle" and "lower" keyface shapes for the 
// consonant keys.  The "lower" keyface shapes are also used for
// vowels.  There are also "narrow", "wide" and "double wide" key 
// faces, with "left", "right" and "center" offsets for the wide
// keys.  Keys may also be generated with or without height 
// extensions.  
//		Several convenience modules are also provided for 
// generating combinations of multiple keys for printing, etc.
//		The variables below can be used to tweak some of the key 
// dimensions to better suit your 3D printer or your application.
// There is also a table of "Keyface Specifications" which should
// not be modified unless or until you've grasped the implications
// of making any changes.
//		Due to variations in print quality, it may be necessary 
// to modify the dimensions of the stem which fits into the ALPS 
// style key switches (see variables StemX and StemY below).  The 
// key stems should fit tightly into the slots in the key switch 
// to make sure that they won't fall out.  Printing at the nominal 
// dimensions with my printer, the stems would not fit into the 
// switches.  However, after a few swipes on each face of the stems 
// with a fingernail file, they fit perfectly.
//		While wide and double wide versions of the key faces have
// been made available, personally, I cannot recommend the wider 
// keys.
//		It is also possible to generate keys with extensions on 
// them.  Typically the extensions would be used to raise the
// consonant keys up above the vowel keys, to mimic a traditional
// manual stenotype machine.  I have tested extensions up to 10 
// mm, which is probably typical of a manual stenotype machine, 
// and they do function correctly.  However, I personally do not
// recommend using the height extensions either.

//		The module Hand can be used to generate keys for half 
// of the keyboard at a time.  (That's as many keys as will fit on 
// my tiny printer at one time when squeezed tightly together).  
// This module can be used to generate keys in the most commonly 
// used combinations.
//		The convenience modules FingerNarrow, FingerWideCenter, 
// FingerWideLeft, FingerWideRight and FingerDouble generate
// upper, middle and lower keys for each keyface variant.  The 
// module Vowels will generate a group of 4 vowel keys.
//		Of course the code can be modified or additional code can 
// be written to generate other combinations of keys.

// Printing advice:

//		I am by no means a 3D printing guru, so I can only tell you 
// what works for me.  I have a Turnigy "Fabrikator II mini" printer 
// with a 0.4 mm nozzle.  This printer has a heated bed and a 
// cooling fan.  The bed is covered with a matte finish black plastic 
// that Hobbyking says  is polyetherimide, (though it seems to be too 
// soft to be polyetherimide).  In any case, the prints do stick to 
// the surface rather fiercely when printed with a bed temperature 
// above the plastic limit of the material.
//		Elephant foot may be an issue with this print.  My printer 
// originally had a problem with "elephant foot"  to the point of 
// causing the extruder to stall repeatedly while printing the first 
// 3 or 4 layers.  After some careful measurements with an indicator, 
// the problem was resolved by writing a post processor that lifts up 
// all layers but the first one by 0.6 mm.
//		I am using Repetier software with the Cura slicing engine. 
// I printed the keys using Hobbyking PLA at 210 C, and a bed
// temperature of 50 or 60 C, with full fan after the first layer.  
// The recommended print speed on this printer is just 30 mm/s, so 
// that temperature is quite high, though I do get good layer 
// adhesion.  The keys were printed directly on the bed with only 
// a skirt.
//		I printed the keys with a 0.2 mm layer height, a 0.8 mm 
// (double shell) wall, and 0.8 mm solid infill top and bottom.  
// I used 50% infill elsewhere, which fills more like 70 or 80% on 
// my printer.  
//		I recommend that you avoid printing just one key at a time
// to allow the layers sufficient time to cool while printing the 
// key stems.  A minimum of 3 or 4 keys seems to work well with
// sufficient cooling.
//		After printing, allow the bed to cool below the plastic 
// limit of the material to avoid warping or bending the keys 
// while trying to remove them from the bed.  It can be especially
// challenging to remove the keys when they've been printed 
// without extensions.  I used an adjustable wrench (a.k.a. 
// a Crescent wrench in the US, or a Monkey wrench elsewhere) to 
// "twist" the keys off of the bed of my printer.  You may want to
// avoid placing keys too closely together, to give yourself room 
// to get a tool between the keys to release them from the bed.
//		As mentioned above, I used a fingernail file to adjust the
// dimensions of the key stems to fit the key switches.  A 
// fingernail file is also good for quickly removing any blemishes 
// around the outside edges of the keyfaces.  With any plastic bed 
// surface, there will always be nicks and scrapes that may affect 
// the top surface of the keys.  I used "150 grit/P180/80 micron" 
// sandpaper to quickly remove surface blemishes on any of the 
// keys that had them.  Of course a finer sandpaper could be used 
// instead.


$fn=100;						// generate nice arcs

KeyFile="StenokeyKeys.dxf";		// file path to keyface outlines
KeySkirtThickness=1.6;
KeyFaceThickness=1.0;
KeySkirtHeight=3.0;				// includes KeyFaceThickness
StemX=4.5;						// 4.5 nominally per Matias prints
StemY=2.2;						// 2.2 nominally per Matias prints
StemZ=4.0;						// 5.2 maximum as measured
ExtensionX=8.0;
ExtensionY=5.0;
ExtensionZ=10.0;				// extension height
SparThickness=1.6;
SparHeight=2.0;					// must not be greater than KeySkirtHeight-KeyFaceThickness

// Keyface Specifications (width, height, layer)

Lower=[14,20,"lower"];
LowerWide=[17.5,20,"lower-wide"];
LowerDouble=[21,20,"lower-double"];
Middle=[14,23.5,"middle"];
MiddleWide=[17.5,23.5,"middle-wide"];
MiddleDouble=[21,23.5,"middle-double"];
Upper=[14,14,"upper"];
UpperWide=[17.5,14,"upper-wide"];
UpperDouble=[21,14,"upper-double"];

// Generate STL files ---------------------------------------------

// Key groups:

//FingerNarrow();
//FingerNarrow(Extension=true);
//FingerWideLeft();
//FingerWideLeft(Extension=true);
//FingerWideRight();
//FingerWideRight(Extension=true);
//FingerWideCenter();
//FingerWideCenter(Extension=true);
//FingerDouble();
//FingerDouble(Extension=true);
//Vowels();

// Single Keys:

//Key(KeyFace=Lower);		// KeyLowerNarrow
//Key(KeyFace=Middle);		// KeyMiddleNarrow
//Key(KeyFace=Upper);		// KeyUpperNarrow
//Key(KeyFace=Lower, Extension=true);		// KeyLowerNarrowExtended
//Key(KeyFace=Middle, Extension=true);		// KeyMiddleNarrowExtended
//Key(KeyFace=Upper, Extension=true);		// KeyUpperNarrowExtended

//Key(KeyFace=LowerWide);		// KeyLowerWideCenter
//Key(KeyFace=MiddleWide);		// KeyMiddleWideCenter
//Key(KeyFace=UpperWide);		// KeyUpperWideCenter
//Key(KeyFace=LowerWide, Extension=true);		// KeyLowerWideCenterExtended
//Key(KeyFace=MiddleWide, Extension=true);		// KeyMiddleWideCenterExtended
//Key(KeyFace=UpperWide, Extension=true);		// KeyUpperWideCenterExtended

//Key(KeyFace=LowerWide, XOffset=-(LowerWide[0]-Lower[0])/2.0);		// KeyLowerWideLeft
//Key(KeyFace=MiddleWide, XOffset=-(LowerWide[0]-Lower[0])/2.0);	// KeyMiddleWideLeft
//Key(KeyFace=UpperWide, XOffset=-(LowerWide[0]-Lower[0])/2.0);		// KeyUpperWideLeft
//Key(KeyFace=LowerWide, XOffset=-(LowerWide[0]-Lower[0])/2.0, Extension=true);		// KeyLowerWideLeftExtended
//Key(KeyFace=MiddleWide, XOffset=-(LowerWide[0]-Lower[0])/2.0, Extension=true);	// KeyMiddleWideLeftExtended
//Key(KeyFace=UpperWide, XOffset=-(LowerWide[0]-Lower[0])/2.0, Extension=true);		// KeyUpperWideLeftExtended

//Key(KeyFace=LowerWide, XOffset=(LowerWide[0]-Lower[0])/2.0);		// KeyLowerWideRight
//Key(KeyFace=MiddleWide, XOffset=(LowerWide[0]-Lower[0])/2.0);		// KeyMiddleWideRight
//Key(KeyFace=UpperWide, XOffset=(LowerWide[0]-Lower[0])/2.0);		// KeyUpperWideRight
//Key(KeyFace=LowerWide, XOffset=(LowerWide[0]-Lower[0])/2.0, Extension=true);		// KeyLowerWideRightExtended
//Key(KeyFace=MiddleWide, XOffset=(LowerWide[0]-Lower[0])/2.0, Extension=true);		// KeyMiddleWideRightExtended
//Key(KeyFace=UpperWide, XOffset=(LowerWide[0]-Lower[0])/2.0, Extension=true);		// KeyUpperWideRightExtended

//Key(KeyFace=LowerDouble);		// KeyLowerDouble
//Key(KeyFace=MiddleDouble);	// KeyMiddleDouble
//Key(KeyFace=UpperDouble);		// KeyUpperDouble
//Key(KeyFace=LowerDouble, Extension=true);		// KeyLowerDoubleExtended
//Key(KeyFace=MiddleDouble, Extension=true);	// KeyMiddleDoubleExtended
//Key(KeyFace=UpperDouble, Extension=true);		// KeyUpperDoubleExtended


// ----------------------------------------------------------------

// Key -- Generate a key.
// KeyFace specifies the key outline.  See the Keyface Specification 
// table above.
// XOffset is used to generate the left, right and centered variants of 
// the wide keyfaces.  The left variant is wider on the left, while the 
// right variant is wider on the right.
// Extension selects tall or short variants of the keys.  The tall
// variant has an extension added between the stem and key body.  The
// actual extension length is specified by the ExtensionZ variable 
// above.

module Key(KeyFace, XOffset=0, Extension=false)
{
	union()
	{
		// keyface
		
		linear_extrude(height=KeyFaceThickness, convexity=2)
			import(file=KeyFile, layer=KeyFace[2]);

		// key skirt
		
		linear_extrude(height=KeySkirtHeight, convexity=4)
		{
			difference()
			{
				import(file=KeyFile, layer=KeyFace[2]);
				offset(delta=-KeySkirtThickness, convexity=2)
					import(file=KeyFile, layer=KeyFace[2]);
			}
		}

		// X-axis spar

		translate([-(KeyFace[0]-KeySkirtThickness)/2.0,-SparThickness/2.0,0])
			cube([KeyFace[0]-KeySkirtThickness,SparThickness,KeyFaceThickness+SparHeight]);

		// Y-axis spar

		translate([-SparThickness/2.0+XOffset,-(KeyFace[1]-KeySkirtThickness)/2.0,0])
			cube([SparThickness,KeyFace[1]-KeySkirtThickness,KeyFaceThickness+SparHeight]);

		// extension

		if(Extension)
		{
			translate([-ExtensionX/2.0+XOffset,-ExtensionY/2.0,0])
				cube([ExtensionX,ExtensionY,ExtensionZ+KeySkirtHeight]);
		}
		
		// stem

		translate([-StemX/2.0+XOffset,-StemY/2.0,0])
			cube([StemX,StemY,StemZ+(Extension?ExtensionZ:0)+KeySkirtHeight]);
	}
}

module FingerNarrow(Extension=false)
{
	translate([Lower[0]/2.0,Lower[1]/2.0,0])
		Key(KeyFace=Lower, Extension=Extension);
	translate([Middle[0]/2.0,Lower[1]+Middle[1]/2.0+1.0,0])
		Key(KeyFace=Middle, Extension=Extension);
	translate([Upper[0]/2.0,Lower[1]+Middle[1]+Upper[1]/2.0+2.0,0])
		Key(KeyFace=Upper, Extension=Extension);
}

module FingerWideCenter(Extension=false)
{
	translate([LowerWide[0]/2.0,LowerWide[1]/2.0,0])
		Key(KeyFace=LowerWide, Extension=Extension);
	translate([MiddleWide[0]/2.0,LowerWide[1]+MiddleWide[1]/2.0+1.0,0])
		Key(KeyFace=MiddleWide, Extension=Extension);
	translate([UpperWide[0]/2.0,LowerWide[1]+MiddleWide[1]+UpperWide[1]/2.0+2.0,0])
		Key(KeyFace=UpperWide, Extension=Extension);
}

module FingerWideLeft(Extension=false)
{
	translate([LowerWide[0]/2.0,LowerWide[1]/2.0,0])
		Key(KeyFace=LowerWide, XOffset=-(LowerWide[0]-Lower[0])/2.0, Extension=Extension);
	translate([MiddleWide[0]/2.0,LowerWide[1]+MiddleWide[1]/2.0+1.0,0])
		Key(KeyFace=MiddleWide, XOffset=-(LowerWide[0]-Lower[0])/2.0, Extension=Extension);
	translate([UpperWide[0]/2.0,LowerWide[1]+MiddleWide[1]+UpperWide[1]/2.0+2.0,0])
		Key(KeyFace=UpperWide, XOffset=-(LowerWide[0]-Lower[0])/2.0, Extension=Extension);
}

module FingerWideRight(Extension=false)
{
	translate([LowerWide[0]/2.0,LowerWide[1]/2.0,0])
		Key(KeyFace=LowerWide, XOffset=(LowerWide[0]-Lower[0])/2.0, Extension=Extension);
	translate([MiddleWide[0]/2.0,LowerWide[1]+MiddleWide[1]/2.0+1.0,0])
		Key(KeyFace=MiddleWide, XOffset=(LowerWide[0]-Lower[0])/2.0, Extension=Extension);
	translate([UpperWide[0]/2.0,LowerWide[1]+MiddleWide[1]+UpperWide[1]/2.0+2.0,0])
		Key(KeyFace=UpperWide, XOffset=(LowerWide[0]-Lower[0])/2.0, Extension=Extension);
}

module FingerDouble(Extension=false)
{
	translate([LowerDouble[0]/2.0,LowerDouble[1]/2.0,0])
		Key(KeyFace=LowerDouble, Extension=Extension);
	translate([MiddleDouble[0]/2.0,LowerDouble[1]+MiddleDouble[1]/2.0+1.0,0])
		Key(KeyFace=MiddleDouble, Extension=Extension);
	translate([UpperDouble[0]/2.0,LowerDouble[1]+MiddleDouble[1]+UpperDouble[1]/2.0+2.0,0])
		Key(KeyFace=UpperDouble, Extension=Extension);
}

module Vowels(Extension=false)
{
	translate([Lower[0]/2.0+1.0,Lower[1]/2.0,0])
		Key(Lower, Extension=false);
	translate([Lower[0]/2.0+1.0,3.0*Lower[1]/2.0+1.0,0])
		Key(Lower, Extension=false);
	translate([Lower[0]/2.0+1.0,5.0*Lower[1]/2.0+2.0,0])
		Key(Lower, Extension=false);
	translate([Lower[0]/2.0+1.0,7.0*Lower[1]/2.0+3.0,0])
		Key(Lower, Extension=false);
}

