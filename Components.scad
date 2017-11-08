// Components.scad -- various components for Stenokey

// Copyright © 2017, Mike Ady
// This file is part of the open source Stenokey project.
// This file is licensed under the Creative Commons Attribution-ShareAlike license.

// Credits:
//		The Wire module is based on a posting by Hypher  Feb 19, 2015;
//	3:42pm to forum.openscad.org.
//		The MaleHeader and Wire modules are a rework of Guv's "Pin 
//	Headers for OpenSCAD", published as Thingiverse thing:26474.
//	License:  Creative Commons Attribution-ShareAlike

$fn=100;						// nice arcs

DiodeDiameter=2.0;
DiodeLength=4.2;



// Insert -- Draw an M3 heat set insert (McMaster-Carr 94180A333)

module Insert()
{
	color("Goldenrod")
	{
		difference()
		{
			cylinder(d1=5.6,d2=4.8,h=6.4);	// upside down
			translate([0,0,-0.5])
				cylinder(d=3,h=8);
		}
	}
}


// LED -- Draw a 5 mm dome LED

module LED()
{
	LEDHeight=9.6;				// dimensions for LITEON LTL-307GLC
	LEDDiameter=5.0;
	LEDLipDiameter=5.85;
	LEDLipHeight=1.0;
	LEDLipOffset=1.0;
	LEDIndentRadius=1.5;
	LEDLeadLength=3.0;

	union()
	{
		color("LimeGreen",0.7)
		{
			translate([0,0,LEDHeight-LEDDiameter/2])
				sphere(d=LEDDiameter);
			cylinder(d=LEDDiameter,h=LEDHeight-LEDDiameter/2);
			difference()
			{
				hull()
				{
					translate([0,0,LEDLipOffset])
						cylinder(d=LEDLipDiameter,h=LEDLipHeight);
					cylinder(d=LEDDiameter,h=LEDLipOffset);
				}
				translate([-(LEDDiameter/2+LEDIndentRadius),0,-0.5])
					cylinder(r=LEDIndentRadius,h=LEDLipHeight+LEDLipOffset+1);
			}
		}
		color("Silver")
		{
			translate([1.27,0,0])
				cube([0.5,0.5,2*LEDLeadLength],center=true);
			translate([-1.27,0,0])
				cube([0.5,0.5,2*LEDLeadLength],center=true);
		}
	}
}


// RotarySwitch -- Draw a CTS 2200 series rotary switch

//RotarySwitch();

module RotarySwitch()
{
	union()
	{
		difference()
		{
			translate([0,0,3.7/2])
				cube([7.2,7.2,3.7], center=true);
			translate([0,0,3.7-1.0/2+1/2])
				cube([0.7,2.7,1.0+1], center=true);
			translate([0,0,3.5])
				difference()
				{
					cylinder(d=4.0,h=1.0);
					translate([0,0,-0.5])
						cylinder(d=3.5,h=2.0);
				}
		}
		for(row=[-1:2:1],col=[-1:1:1])
		{
			translate([col*2.54-0.25,row*7.62/2,-3.5])
				cube([0.5,0.15,4.5]);
			translate([col*2.54-0.5,row*7.62/2,0])
				cube([1.0,0.15,1.0]);
		}
	}		
}


// Axial -- Draw an axial resistor, diode, capacitor, etc.

module Axial
(
	BodyDiameter,				// body diameter
	BodyLength,					// body length
	WireDiameter,				// wire diameter
	Distance,					// distance between mounting holes 
	BendRadius,					// wire bend radius
	Depth,						// wire depth below cylinder body
	Color						// color of the cylinder body
)
{
	translate([0,0,BodyDiameter/2])
	{
		color(Color)
			rotate([0,90,0])
				cylinder(d=BodyDiameter,h=BodyLength,center=true);
		color("Silver")
		{
			translate([-Distance/2,0,0])
				rotate([180,0,0])
					Wire(r=BendRadius,d=WireDiameter,x=Distance/2,z=Depth+BodyDiameter/2.0);
			translate([Distance/2,0,0])
				rotate([180,0,180])
					Wire(r=BendRadius,d=WireDiameter,x=Distance/2,z=Depth+BodyDiameter/2.0);
		}
	}
}

// Wire -- Draw a wire with a 90 degree bend in the X-Z plane

module Wire
(
	r=2,					// bend radius
	d=1,					// wire diameter
	x=10,					// length along y axis
	z=10					// length along z axis
)
{
	detail=$fn;

	translate([0,0,r]) // vertical part
		cylinder(r=d/2, h=z-r, $fn=detail);
	translate([r,0,0])
		rotate([0,90,0])
			cylinder(r=d/2, h=x-r, $fn=detail);
    translate([0,0,r])
		rotate([90,0,0])
			translate([r,0,0])
				difference()
				{
					rotate_extrude($fn=60,convexity=4)
						translate([r,0])
							rotate([0,0,360/detail/2])
								circle(d/2,$fn=detail);
					translate([0,2*r,0])
						cube(4*r,true);
					translate([2*r,0,0])
						cube(4*r,true);
				}
}

// Teensy2_0 -- Draw a Teensy 2.0 board

//Teensy2_0();
//translate([0,7.62,-5.5])
//	MaleHeader(length=8.5, upper=3.0, rows=1, cols=12);
//translate([0,-7.62,-5.5])
//	MaleHeader(length=8.5, upper=3.0, rows=1, cols=12);


module Teensy2_0()
{
	TeensyWidth=17.78;
	TeensyLength=30.48;
	TeensyDepth=1.6;
	TeensyPitch=2.54;
	TeensyHoleDiameter=0.9;
	TeensyButtonPosX=11.0;
	TeensyButtonPosY=0.7;
	TeensyUSBPosX=-TeensyLength/2.0-0.5;
	TeensyUSBPosY=0.0;
	
	union()
	{
		difference()
		{
			color("DarkGreen")
				translate([-TeensyLength/2.0,-TeensyWidth/2.0,0])
					cube([TeensyLength,TeensyWidth,TeensyDepth]);
			color("Silver")
			{
				for(i=[0:11])
				{
					translate([i*TeensyPitch-(TeensyLength-TeensyPitch)/2.0,3*TeensyPitch,-0.5])
						cylinder(d=TeensyHoleDiameter,h=TeensyDepth+1.0);
					translate([i*TeensyPitch-(TeensyLength-TeensyPitch)/2.0,-3*TeensyPitch,-0.5])
						cylinder(d=TeensyHoleDiameter,h=TeensyDepth+1.0);
				}
				for(i=[0:4])
				{
					translate([(TeensyLength-TeensyPitch)/2.0,i*TeensyPitch-(TeensyWidth-3*TeensyPitch)/2.0,-0.5])
						cylinder(d=TeensyHoleDiameter,h=TeensyDepth+1.0);
				}
				for(i=[0:1])
				{
					translate([(9*TeensyPitch-TeensyLength)/2.0,i*TeensyPitch*4-(TeensyWidth-3*TeensyPitch)/2.0,-0.5])
						cylinder(d=TeensyHoleDiameter,h=TeensyDepth+1.0);
				}
			}		
		}
		color("Silver")
		{
			translate([TeensyUSBPosX,TeensyUSBPosY,TeensyDepth])
				rotate([90,0,-90])
					import("USB_MiniB.stl");
			translate([TeensyButtonPosX,TeensyButtonPosY,TeensyDepth])
				rotate([90,0,-90])
					import("KMR2.stl");
		}
	}
}

// MaleHeader -- Draw a Row of Male Header Pins

// Header dimensions vary widely from manufacturer to manufacturer.
// The default dimensions were taken from some headers that I had lying around.

Pitch=2.54;				// distance between pins (e.g. center to center)
PinWidth=0.64;			// pin width
RetainerHeight=2.5;		// height of insulating pin retainer

// example

//MaleHeader(length=8.5,upper=3.0,rows=3,cols=2);

module MaleHeader
(
	length=11.4,		// total length of the pin
	upper=5.9,			// length of the pin above the retainer
	rows=12,			// number of rows
	cols=1				// number of columns
)
{
	union()
	{
		// generate the retainer
		
		color("dimgray")
		{
			translate([0,0,length-upper-RetainerHeight/2])
			{
				intersection()
				{
					for(row=[0:rows-1],col=[0:cols-1])
					{
						translate([-(cols-1)*Pitch/2+Pitch*col,-(rows-1)*Pitch/2+Pitch*row,0])
						{
							rotate([0,0,45])
								cube([Pitch*1.1,Pitch*1.1,RetainerHeight],center=true);
						}
					}
					cube([cols*Pitch,rows*Pitch,RetainerHeight],center=true);
				}
			}
		}
		
		// generate the pins
		
		color("silver")
		{
			for(row=[0:rows-1],col=[0:cols-1])
			{
				translate([-(cols-1)*Pitch/2+Pitch*col,-(rows-1)*Pitch/2+Pitch*row,0])
					Pin(length=length);
			}
		}
	}
}

// Pin -- Draw a Single Male Header Pin

// most real pins have square tips (pyramidal frustra)
// these ones have simple pyramids at their tips

module Pin
(
	width=0.64,				// pin width
	length=11.4				// pin length
)
{
	Points=[
		[0,0,0],
		[-0.5*width,-0.5*width,0.5*width],
		[-0.5*width,0.5*width,0.5*width],
		[0.5*width,0.5*width,0.5*width],
		[0.5*width,-0.5*width,0.5*width],
		[-0.5*width,-0.5*width,length-0.5*width],
		[-0.5*width,0.5*width,length-0.5*width],
		[0.5*width,0.5*width,length-0.5*width],
		[0.5*width,-0.5*width,length-0.5*width],
		[0,0,length]];
	Faces=[					// orient all faces counter clockwise
		[0,2,1],[0,3,2],[0,4,3],[0,1,4],
		[1,2,6,5],[2,3,7,6],[3,4,8,7],[4,1,5,8],
		[5,6,9],[6,7,9],[7,8,9],[8,5,9]
	];
	polyhedron(points=Points,faces=Faces);
}