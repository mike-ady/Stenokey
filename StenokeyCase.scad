// StenokeyCase.scad -- keyboard case

// Copyright © 2017, Mike Ady
// This file is part of the open source Stenokey project.
// This file is licensed under the Creative Commons Attribution-ShareAlike license.

// The Stenokey keys and case are based on designs by Joshua Lifton.

include <StenokeyKeys.scad>
include <Components.scad>

$fn=100;						// nice arcs

PCBDimX=219.0;
PCBDimY=139.5;
PCBDimZ=1.6;
CaseExtra=3.5;					// extra X and Y dimensions of case on each side of PCB
DimX=PCBDimX+2.0*CaseExtra;		// outside dimension
KeyMatrixDimX=219.0;			// outside dimension
KeyMatrixDimY=111.9;			// outside dimension
KeyMatrixDimZ=4.5;				// 4.5 nominal per Matias prints
BaseDimZ=7.0;					// outside dimension
KeySwitchHeight=11.6;			// 11.6 nominal per Matias prints
TopDimZ=KeySwitchHeight+PCBDimZ;	// outside dimension

LipThickness=2.5;				// case lip thickness

CutoutX=15.5;					// 15.5 nominal per Matias prints
CutoutY=12.8;					// 12.8 nominal per Matias prints

SpacingX=19.0;					// distance from left edge of one cutout to left edge of next

VowelX0=82.75;					// offset from outside right edge to cutout right edge (backwards!)
VowelY0=20.6;					// offset from outside bottom edge to cutout bottom edge

ConsonantX0=16.25;				// offset from outside right edge to cutout right edge (backwards!)
ConsonantY0=45.6;				// offset from outside bottom edge to cutout bottom edge
ConsonantY1=68.85;				// offset from outside bottom edge to cutout bottom edge
ConsonantY2=89.1;				// offset from outside bottom edge to cutout bottom edge

FaceThickness=1.0;				// 1.1 nominal per Matias prints
WallThickness=1.2;
RibThickness=1.2;

//RibOffset=1.0;				// rib offset from bottom edge of cutouts

BaseRibY0=VowelY0+CutoutY/2.0;		// rib midline from bottom outside edge
BaseRibY1=ConsonantY0+CutoutY/2.0;	// rib midline from bottom outside edge
BaseRibY2=ConsonantY1+CutoutY/2.0;	// rib midline from bottom outside edge
BaseRibY3=ConsonantY2+CutoutY/2.0;	// rib midline from bottom outside edge

File="StenokeyCase.dxf";		// file path for layout drawings
LeftOpeningLayer="LeftOpening";	// layer for top key opening with left interface
RightOpeningLayer="RightOpening";	// layer for key opening with right interface
OutlineLayer="Outline";			// layer for top and base layout
PCBOutlineLayer="PCBOutline";	// layer for PCB layout
PCBLayer="PCB";					// layer for PCB layout
KeyMatrixLayer="Keymatrix";		// layer for key matrix layout

TopV1Layer="TopV1";				// layer for top layout
KeyMatrixV1Layer="KeymatrixV1";	// layer for key matrix layout
LeftOpeningV1Layer="LeftOpeningV1";	// layer for top left interface
RightOpeningV1Layer="RightOpeningV1";	// layer for top right interface


LowerRegisterX=[50.0,169.0,7.0,212.0,7.0,212.0,50.0,169.0];	// for base
LowerRegisterY=[7.0,7.0,40.0,40.0,109.5,109.5,132.5,132.5];
UpperRegisterX=[60.0,159.0,7.0,212.0,7.0,212.0,60.0,159.0];	// for key matrix
UpperRegisterY=[7.0,7.0,30.0,30.0,99.5,99.5,132.5,132.5];

InnerRegisterX=[60.0,159.0,7.0,212.0,7.0,212.0,60.0,159.0];
InnerRegisterY=[7.0,7.0,40.0,40.0,99.5,99.5,132.5,132.5];
OuterRegisterX=[50.0,169.0,7.0,212.0,7.0,212.0,50.0,169.0];
OuterRegisterY=[7.0,7.0,30.0,30.0,109.5,109.5,132.5,132.5];

RegisterPinDiameter=5.8;	// 6.0 plated hole
RegisterBaseDiameter=13.0;
PCBHoleDiameter=6.0;

BaseLipHeight=3.0;
TopLipHeight=7.6+PCBDimZ;

bShowAxial=false;			// show axial components (really slows down screen updates in preview mode)

ScrewDiameter=3.4;			// M3 (nominal 3.0 mm)
ScrewHeadZ=3.0;				// M3 pan head (nominal 2.4 mm)
ScrewHeadDiameter=6.0;		// M3 pan head (max 6 mm)
ScrewRecessDiameter=8.0;	// M3 pan head (max 6 mm)

KeyMatrixOffsetX=13.2;
KeyMatrixOffsetY=13.2;
SwitchElevation=7.1;		// 7.1 nominal per Matias prints (switch height above keymatrix)
SwitchExtension=3.8;		// 3.8 nominal per Matias prints (switch plunger height above switch body)

LeftLEDPosX=43.0;
LeftLEDPosY=119.75;
LeftResistorPosX=43.0;
LeftResistorPosY=126.75;
LeftProtocolSwitchPosX=62.0;
LeftProtocolSwitchPosY=119.75;
LeftBrightnessSwitchPosX=81.0;
LeftBrightnessSwitchPosY=119.75;

RightLEDPosX=176.0;
RightLEDPosY=119.75;
RightResistorPosX=176.0;
RightResistorPosY=126.75;
RightProtocolSwitchPosX=157.0;
RightProtocolSwitchPosY=119.75;
RightBrightnessSwitchPosX=138.0;
RightBrightnessSwitchPosY=119.75;

LeftResistorLeadX=47.0;
LeftResistorLeadY=126.75;
RightResistorLeadX=172.0;
RightResistorLeadY=126.5;

DiodeOffsetX=3.0;				// diode position with respect to key switch
DiodeOffsetY=8.5;

LeftTeensyPosX=15.25;
RightTeensyPosX=203.75;
TeensyPosY=123.5;

LeftResetHolePosX=192.5;		// right and left are reversed on top!
LeftResetHolePosY=124.5;
RightResetHolePosX=26.5;
RightResetHolePosY=122.5;
ResetHoleDiameter=3.0;

D33PosX=95.0;					// rotary switch decoding diodes
D33PosY=123.0;
D34PosX=95.0;
D34PosY=116.0;
D35PosX=109.0;
D35PosY=123.0;

D38PosX=109.0;
D38PosY=116.0;
D39PosX=123.0;
D39PosY=123.0;
D40PosX=123.0;
D40PosY=116.0;

InsertHeight=6.4;
InsertD1=4.7;
InsertD2=6.0;

// Generate models -----------------------------------

bInterfaceLeft=true;		// put LED and rotary switches on the left
bTeensyLeft=false;			// put Teensy on the left

//Top();
//KeyMatrix();
//Base();
StenoKey();

//TopV1();
//KeyMatrixV1();
//BaseV1();
//StenoKeyV1();

// StenoKey -- draw the assembly of all parts

module StenoKey()
{

	// generate the top

	color("gray")
		translate([DimX,0,TopDimZ+BaseDimZ])
			rotate([0,180,0])
				Top();

	if(bInterfaceLeft)
	{
		// draw the LED
	
		translate([LeftLEDPosX+CaseExtra,LeftLEDPosY+CaseExtra,BaseDimZ+PCBDimZ])
			LED();

		// draw the resistor
	
		if(bShowAxial)
		{
			translate([LeftResistorPosX+CaseExtra,LeftResistorPosY+CaseExtra,BaseDimZ+PCBDimZ])
				Axial(BodyDiameter=1.9,BodyLength=3.9,WireDiameter=0.5,Distance=8.0,BendRadius=0.9,Depth=3.0,Color="PaleGoldenrod");
		}

		// draw the protocol switch

		translate([LeftProtocolSwitchPosX+CaseExtra,LeftProtocolSwitchPosY+CaseExtra,BaseDimZ+PCBDimZ])
			color("Silver")
				RotarySwitch();
		
		// draw the brightness switch

		translate([LeftBrightnessSwitchPosX+CaseExtra,LeftBrightnessSwitchPosY+CaseExtra,BaseDimZ+PCBDimZ])
			color("Silver")
				RotarySwitch();
	}
	else
	{
		// draw the LED

		translate([RightLEDPosX+CaseExtra,RightLEDPosY+CaseExtra,BaseDimZ+PCBDimZ])
			LED();

		// draw the resistor
	
		if(bShowAxial)
		{
			translate([RightResistorPosX+CaseExtra,RightResistorPosY+CaseExtra,BaseDimZ+PCBDimZ])
				Axial(BodyDiameter=1.9,BodyLength=3.9,WireDiameter=0.5,Distance=8.0,BendRadius=0.9,Depth=3.0,Color="PaleGoldenrod");
		}

		// draw the protocol switch

		translate([RightProtocolSwitchPosX+CaseExtra,RightProtocolSwitchPosY+CaseExtra,BaseDimZ+PCBDimZ])
			color("Silver")
				RotarySwitch();
		
		// draw the brightness switch

		translate([RightBrightnessSwitchPosX+CaseExtra,RightBrightnessSwitchPosY+CaseExtra,BaseDimZ+PCBDimZ])
			color("Silver")
				RotarySwitch();
	}

	// draw the teensy
	
	translate([(bTeensyLeft?LeftTeensyPosX:RightTeensyPosX)+CaseExtra,TeensyPosY+CaseExtra,BaseDimZ+PCBDimZ])
	{
		translate([0,7.62,-3.0])
			MaleHeader(length=8.5, upper=3.0, rows=1, cols=12);
		translate([0,-7.62,-3.0])
			MaleHeader(length=8.5, upper=3.0, rows=1, cols=12);
		translate([0,0,2.5])
		{
			if(bTeensyLeft)
			{
//				rotate([0,0,0])
					Teensy2_0();
			}
			else
			{
				rotate([0,0,180])
					Teensy2_0();
			}
		}
	}

	if(bShowAxial)
	{
		// draw the rotary switch diodes

		translate([D33PosX+CaseExtra,D33PosY+CaseExtra,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
		translate([D34PosX+CaseExtra,D34PosY+CaseExtra,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
		translate([D35PosX+CaseExtra,D35PosY+CaseExtra,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");

		translate([D38PosX+CaseExtra,D38PosY+CaseExtra,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
		translate([D39PosX+CaseExtra,D39PosY+CaseExtra,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
		translate([D40PosX+CaseExtra,D40PosY+CaseExtra,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
	}

	// place the Matias key switches and the key tops

	for(i=[0:3])
	{
		translate([DimX-(VowelX0+CutoutX/2+CaseExtra+i*SpacingX),
			VowelY0+CutoutY/2+CaseExtra,
			KeyMatrixDimZ+BaseDimZ+PCBDimZ+SwitchElevation])
		{
			color("Silver", alpha=0.2)
				rotate([180,0,90])
					import(file="Matias_Switch.stl");
			color("DimGray")
				translate([0,0,SwitchExtension+KeySkirtHeight])
					rotate([0,180,0])
						Key(KeyFace=Lower);
			if(bShowAxial)
			{
				translate([DiodeOffsetX,DiodeOffsetY,-KeyMatrixDimZ-SwitchElevation])
					Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
			}
		}
	}
	for(i=[0:9])
	{
		translate([DimX-(ConsonantX0+CutoutX/2+CaseExtra+i*SpacingX),
			ConsonantY0+CutoutY/2+CaseExtra,
			KeyMatrixDimZ+BaseDimZ+PCBDimZ+SwitchElevation])
		{
			color("Silver", alpha=0.2)
				rotate([180,0,90])
					import(file="Matias_Switch.stl");
			color("DimGray")
				translate([0,0,SwitchExtension+KeySkirtHeight])
					rotate([0,180,0])
						Key(KeyFace=Lower);
			if(bShowAxial)
			{
				translate([DiodeOffsetX,DiodeOffsetY,-KeyMatrixDimZ-SwitchElevation])
					Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
			}
		}
		translate([DimX-(ConsonantX0+CutoutX/2+CaseExtra+i*SpacingX),
			ConsonantY1+CutoutY/2+CaseExtra,
			KeyMatrixDimZ+BaseDimZ+PCBDimZ+SwitchElevation])
		{
			color("Silver", alpha=0.2)
				rotate([180,0,90])
					import(file="Matias_Switch.stl");
			color("DimGray")
				translate([0,0,SwitchExtension+KeySkirtHeight])
					rotate([0,180,0])
						Key(KeyFace=Middle);
			if(bShowAxial)
			{
				translate([DiodeOffsetX,DiodeOffsetY,-KeyMatrixDimZ-SwitchElevation])
					Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
			}
		}
		translate([DimX-(ConsonantX0+CutoutX/2+CaseExtra+i*SpacingX),
			ConsonantY2+CutoutY/2+CaseExtra,
			KeyMatrixDimZ+BaseDimZ+PCBDimZ+SwitchElevation])
		{
			color("Silver", alpha=0.2)
				rotate([180,0,90])
					import(file="Matias_Switch.stl");
			color("DimGray")
				translate([0,0,SwitchExtension+KeySkirtHeight])
					rotate([0,180,0])
						Key(KeyFace=Upper);
			if(bShowAxial)
			{
				translate([DiodeOffsetX,DiodeOffsetY,-KeyMatrixDimZ-SwitchElevation])
					Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
			}
		}
	}

	// generate the key matrix plate, PCB and base

	color("Gray")
		translate([KeyMatrixDimX+CaseExtra,CaseExtra,KeyMatrixDimZ+BaseDimZ+PCBDimZ])
			rotate([0,180,0])
				KeyMatrix();

	PCB();
	color("Silver")
		Base();

	// generate the screws and heat set inserts

	for(i=[0:7])
	{
		translate([InnerRegisterX[i]+CaseExtra,InnerRegisterY[i]+CaseExtra,0])
		{
			color("Silver")
				translate([0,0,ScrewHeadZ])
					rotate([0,-90,0])
						import(file="M3x12PanHead.stl");
			translate([0,0,BaseDimZ+PCBDimZ])
				Insert();
		}
	}
}

module Top()
{
	difference(convexity=12)
	{
		union()
		{
			// generate the outer shell
			
			difference()
			{
				TopOuterHull();
				TopInnerHull();
			}

			// generate the outer lip

			translate([0,0,TopDimZ-Separation-1.0])
				OuterLip();

			// generate the lip around the keys (cut out later)

			translate([DimX-CaseExtra,CaseExtra,0])
				mirror([1,0,0])
					linear_extrude(height=TopDimZ-KeyMatrixDimZ-PCBDimZ)
						offset(delta=WallThickness)
						{
							if(bInterfaceLeft)
								import(file=File,layer=LeftOpeningLayer);
							else
								import(file=File,layer=RightOpeningLayer);
						}
							

			// generate skirt for USB cutout (cut out later)

			intersection()
			{
				if(bTeensyLeft)
					translate([DimX-10,114.5-1.5+CaseExtra,0])
						cube([10,18+3,TopDimZ-PCBDimZ]);
				else
					translate([0,114.5-1.5+CaseExtra,0])
						cube([10,18+3,TopDimZ-PCBDimZ]);
				TopOuterHull();
			}

			// generate the support pads

			for(i=[0:7])
			{
				translate([InnerRegisterX[i]+CaseExtra,InnerRegisterY[i]+CaseExtra,0])
				{
					cylinder(r=RegisterBaseDiameter/2.0,h=TopDimZ-PCBDimZ);
				}
			}
		}
		
		// cut out lip around the keys and the interface holes
		
		translate([DimX-CaseExtra,CaseExtra,-0.5])
			mirror([1,0,0])
				linear_extrude(height=TopDimZ-KeyMatrixDimZ+1)
				{
					if(bInterfaceLeft)
						import(file=File,layer=LeftOpeningLayer);
					else
						import(file=File,layer=RightOpeningLayer);
				}
				
		// cut out skirt for USB cutout

		if(bTeensyLeft)
			translate([DimX-11,114.5-0.5+CaseExtra,WallThickness])
				cube([12,18+1,TopDimZ]);
		else
			translate([-0.5,114.5-0.5+CaseExtra,WallThickness])
				cube([12,18+1,TopDimZ]);

		// subtract recesses for M3 heat set inserts
	
		D2=InsertD2+(InsertD2-InsertD1)/(InsertHeight);
		for(i=[0:7])
		{
			translate([InnerRegisterX[i]+CaseExtra,InnerRegisterY[i]+CaseExtra,WallThickness])
			{
				cylinder(d=InsertD1,h=TopDimZ);
				translate([0,-0,TopDimZ-InsertHeight])
					cylinder(d1=InsertD1,d2=D2,h=InsertHeight+1);
			}
		}
		
		// subtract reset hole
		
		if(bTeensyLeft)
		{
			translate([LeftResetHolePosX+CaseExtra,LeftResetHolePosY+CaseExtra,-0.5])
				cylinder(d=ResetHoleDiameter,h=WallThickness+1.0);
		}
		else
		{
			translate([RightResetHolePosX+CaseExtra,RightResetHolePosY+CaseExtra,-0.5])
				cylinder(d=ResetHoleDiameter,h=WallThickness+1.0);
		}
	}
}

module TopOuterHull()
{
	hull()
	{
		linear_extrude(height=1)
			offset(delta=-(TopDimZ-TopLipHeight))
				import(file=File, layer=OutlineLayer);
		translate([0,0,TopDimZ-TopLipHeight])
			linear_extrude(height=TopLipHeight-Separation)
				import(file=File, layer=OutlineLayer);
	}	
}

module TopInnerHull()
{
	translate([0,0,WallThickness])
	{
		hull()
		{
			linear_extrude(height=1)
				offset(delta=-(TopDimZ-TopLipHeight)-WallThickness*tan(22.5))
					import(file=File, layer=OutlineLayer);
			translate([0,0,TopDimZ-TopLipHeight-LipThickness+WallThickness*tan(22.5)])
				linear_extrude(height=TopLipHeight+LipThickness)
					offset(delta=-LipThickness)
						import(file=File, layer=OutlineLayer);
		}	
	}
}

Separation=2.0;						// separation between top and base (without inner/outer lips)
ThinLipHeight=1.5;					// thin lip around case
ThinLipSeparation=0.5;				// separation between inner and outer lips
ThinLipThickness=1.0;				// inner and outer lip thickness

module OuterLip()
{
	linear_extrude(height=ThinLipHeight+1)
		difference()
		{
			import(file=File, layer=OutlineLayer);
			offset(delta=-ThinLipThickness)
				import(file=File, layer=OutlineLayer);
		}
}

module KeyMatrix()
{
	difference(convexity=22)
	{
		union()
		{
			linear_extrude(height=FaceThickness, convexity=2)
				import(file=File, layer=KeyMatrixLayer);

			linear_extrude(height=KeyMatrixDimZ, convexity=8)
			{
				difference()
				{
					import(file=File, layer=KeyMatrixLayer);
					offset(delta=-WallThickness, convexity=4)
						import(file=File, layer=KeyMatrixLayer);
				}
			}

			intersection()
			{
				union(convexity=8)
				{
					translate([WallThickness/2.0,KeyMatrixRibY0-RibThickness/2.0,FaceThickness/2.0])
						cube([KeyMatrixDimX-WallThickness,RibThickness,KeyMatrixDimZ-FaceThickness/2.0]);
					translate([WallThickness/2.0,KeyMatrixRibY1-RibThickness/2.0,FaceThickness/2.0])
						cube([KeyMatrixDimX-WallThickness,RibThickness,KeyMatrixDimZ-FaceThickness/2.0]);
					translate([WallThickness/2.0,KeyMatrixRibY2-RibThickness/2.0,FaceThickness/2.0])
						cube([KeyMatrixDimX-WallThickness,RibThickness,KeyMatrixDimZ-FaceThickness/2.0]);
					translate([WallThickness/2.0,KeyMatrixRibY3-RibThickness/2.0,FaceThickness/2.0])
						cube([KeyMatrixDimX-WallThickness,RibThickness,KeyMatrixDimZ-FaceThickness/2.0]);
				}
				linear_extrude(height=KeyMatrixDimZ, convexity=4)
					import(file=File, layer=KeyMatrixLayer);
			}					
			
		}
		
		for(i=[0:3])
		{
			translate([VowelX0+i*SpacingX,VowelY0,-FaceThickness])
				cube([CutoutX,CutoutY,3.0*FaceThickness]);
		}
		
		for(i=[0:9])
		{
			translate([ConsonantX0+i*SpacingX,ConsonantY0,-FaceThickness])
				cube([CutoutX,CutoutY,3.0*FaceThickness]);
			translate([ConsonantX0+i*SpacingX,ConsonantY1,-FaceThickness])
				cube([CutoutX,CutoutY,3.0*FaceThickness]);
			translate([ConsonantX0+i*SpacingX,ConsonantY2,-FaceThickness])
				cube([CutoutX,CutoutY,3.0*FaceThickness]);
		}
	}
}

module PCB()
{
	color("DarkGreen",convexity=42)
	{
		translate([PCBDimX+CaseExtra,PCBDimY+CaseExtra,PCBDimZ+BaseDimZ])
			rotate([180,90,0])
				import(file="PCB.stl");
	}
}

module Base()
{
	difference(convexity=12)
	{
		union()
		{
			// generate base hull
			
			difference()
			{
				BaseOuterHull();
				BaseInnerHull();
			}
			
			// generate inner hull lip
			
			translate([0,0,BaseDimZ-1])
				InnerLip();

			intersection()
			{
				union()
				{
					// generate keyboard support ribs

					translate([WallThickness/2.0,BaseRibY0-RibThickness/2.0+CaseExtra,WallThickness/2.0])
						cube([DimX-WallThickness,RibThickness,BaseDimZ-WallThickness/2.0]);
					translate([WallThickness/2.0,BaseRibY1-RibThickness/2.0+CaseExtra,WallThickness/2.0])
						cube([DimX-WallThickness,RibThickness,BaseDimZ-WallThickness/2.0]);
					translate([WallThickness/2.0,BaseRibY2-RibThickness/2.0+CaseExtra,WallThickness/2.0])
						cube([DimX-WallThickness,RibThickness,BaseDimZ-WallThickness/2.0]);
					translate([WallThickness/2.0,BaseRibY3-RibThickness/2.0+CaseExtra,WallThickness/2.0])
						cube([DimX-WallThickness,RibThickness,BaseDimZ-WallThickness/2.0]);
				}
				BaseOuterHull();	// clean up ribs and pads
			}

			// generate the registration pins and support pads

			for(i=[0:7])
			{
				translate([InnerRegisterX[i]+CaseExtra,InnerRegisterY[i]+CaseExtra,0])
				{
					cylinder(r=RegisterBaseDiameter/2.0,h=BaseDimZ);
					cylinder(r=RegisterPinDiameter/2.0,h=BaseDimZ+PCBDimZ);
				}
			}
		}
		
		// subtract lip for USB cutout

		if(bTeensyLeft)
			translate([-1.0,114.5-2.5+CaseExtra,BaseDimZ])
				cube([CaseExtra+1.5,18+5,10]);
		else
			translate([DimX-CaseExtra-0.5,114.5-2.5+CaseExtra,BaseDimZ])
				cube([CaseExtra+1.5,18+5,10]);

		// subtract recesses and holes for M3 pan head screws
	
		for(i=[0:7])
		{
			translate([InnerRegisterX[i]+CaseExtra,InnerRegisterY[i]+CaseExtra,-0.5])
			{
				cylinder(r=ScrewDiameter/2.0,h=BaseDimZ+PCBDimZ+1);
				hull()
				{
					cylinder(r=ScrewHeadDiameter/2.0,h=ScrewHeadZ+0.5);
					cylinder(r=ScrewRecessDiameter/2.0,h=ScrewHeadZ-(ScrewRecessDiameter-ScrewHeadDiameter)/2+0.5);
				}
			}
		}
	}
}


module BaseOuterHull()
{
	difference()
	{
		// generate the hull
		
		hull()
		{
			linear_extrude(height=1)
				offset(delta=-(BaseDimZ-BaseLipHeight), convexity=4)
					import(file=File, layer=OutlineLayer);
			translate([0,0,BaseDimZ-BaseLipHeight])
				linear_extrude(height=BaseLipHeight)
					import(file=File, layer=OutlineLayer);
		}
	}
}


module BaseInnerHull()
{
	translate([0,0,WallThickness])
	{
		hull()
		{
			translate([0,0,BaseDimZ-BaseLipHeight-LipThickness+WallThickness*(tan(22.5))])
				linear_extrude(height=BaseLipHeight+10)
					offset(delta=-LipThickness)
						import(file=File, layer=OutlineLayer);
			linear_extrude(height=1)
				offset(delta=-(BaseDimZ-BaseLipHeight)-WallThickness*tan(22.5))
					import(file=File, layer=OutlineLayer);
		}	
	}
}


module InnerLip()
{
	linear_extrude(height=ThinLipHeight+1.0)
		difference()
		{
			offset(delta=-(LipThickness-ThinLipThickness))
				import(file=File, layer=OutlineLayer);
			offset(delta=-LipThickness)
				import(file=File, layer=OutlineLayer);
		}
}


// V1 ---------------------------------------------------------------

// This is the prototype version of the covers for the Stenokey keyboard.  
// Originally there was only the key matrix.  The top and base covers 
// were added later.  All parts were glued directly to the PCB using Amazing 
// Goop.  (Contact cement could be used instead.)

RibOffset=1.0;				// rib offset from bottom edge of cutouts

KeyMatrixRibY0=VowelY0-RibOffset-RibThickness/2.0;	// rib midline from bottom outside edge
KeyMatrixRibY1=ConsonantY0-RibOffset-RibThickness/2.0;	// rib midline from bottom outside edge
KeyMatrixRibY2=ConsonantY1-RibOffset-RibThickness/2.0;	// rib midline from bottom outside edge
KeyMatrixRibY3=ConsonantY2-RibOffset-RibThickness/2.0;	// rib midline from bottom outside edge

module StenoKeyV1()
{

	// generate the top

	color("gray")
		translate([PCBDimX,0,KeySwitchHeight+BaseDimZ+PCBDimZ])
			rotate([0,180,0])
				TopV1();

	if(bInterfaceLeft)
	{
		// draw the LED
	
		translate([LeftLEDPosX,LeftLEDPosY,BaseDimZ+PCBDimZ])
			LED();
	
		// draw the protocol switch

		translate([LeftProtocolSwitchPosX,LeftProtocolSwitchPosY,BaseDimZ+PCBDimZ])
		{
			color("Silver")
				RotarySwitch();
		}
		
		// draw the brightness switch

		translate([LeftBrightnessSwitchPosX,LeftBrightnessSwitchPosY,BaseDimZ+PCBDimZ])
		{
			color("Silver")
			{
				RotarySwitch();
			}
		}
	}
	else
	{
		// draw the LED
	
		translate([RightLEDPosX,RightLEDPosY,BaseDimZ+PCBDimZ])
			LED();
	
		// draw the protocol switch

		translate([RightProtocolSwitchPosX,RightProtocolSwitchPosY,BaseDimZ+PCBDimZ])
		{
			color("Silver")
				RotarySwitch();
		}
		
		// draw the brightness switch

		translate([RightBrightnessSwitchPosX,RightBrightnessSwitchPosY,BaseDimZ+PCBDimZ])
		{
			color("Silver")
			{
				RotarySwitch();
			}
		}
	}

	// draw the teensy
	
	translate([(bTeensyLeft?LeftTeensyPosX:RightTeensyPosX),TeensyPosY,BaseDimZ+PCBDimZ])
	{
		translate([0,7.62,-3.0])
			MaleHeader(length=8.5, upper=3.0, rows=1, cols=12);
		translate([0,-7.62,-3.0])
			MaleHeader(length=8.5, upper=3.0, rows=1, cols=12);
		translate([0,0,2.5])
		{
			if(bTeensyLeft)
			{
//				rotate([0,0,0])
					Teensy2_0();
			}
			else
			{
				rotate([0,0,180])
					Teensy2_0();
			}
		}
	}

	if(bShowAxial)
	{
		// draw the resistor
	
		if(bInterfaceLeft)
		{
			translate([LeftResistorPosX,LeftResistorPosY,BaseDimZ+PCBDimZ])
				Axial(BodyDiameter=1.9,BodyLength=3.9,WireDiameter=0.5,Distance=8.0,BendRadius=0.9,Depth=3.0,Color="PaleGoldenrod");
		}
		else
		{
			translate([RightResistorPosX,RightResistorPosY,BaseDimZ+PCBDimZ])
				Axial(BodyDiameter=1.9,BodyLength=3.9,WireDiameter=0.5,Distance=8.0,BendRadius=0.9,Depth=3.0,Color="PaleGoldenrod");
		}
			
		// draw the rotary switch diodes

		translate([D33PosX,D33PosY,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
		translate([D34PosX,D34PosY,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
		translate([D35PosX,D35PosY,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");

		translate([D38PosX,D38PosY,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
		translate([D39PosX,D39PosY,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
		translate([D40PosX,D40PosY,BaseDimZ+PCBDimZ])
			Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");

	}

	// place the Matias key switches and the key tops

	for(i=[0:3])
	{
		translate([PCBDimX-(VowelX0+CutoutX/2+i*SpacingX),
			VowelY0+CutoutY/2,
			KeyMatrixDimZ+BaseDimZ+PCBDimZ+SwitchElevation])
		{
			color("Silver", alpha=0.2)
				rotate([180,0,90])
					import(file="Matias_Switch.stl");
			color("DimGray")
				translate([0,0,SwitchExtension+KeySkirtHeight])
					rotate([0,180,0])
						Key(KeyFace=Lower);
			if(bShowAxial)
			{
				translate([DiodeOffsetX,DiodeOffsetY,-KeyMatrixDimZ-SwitchElevation])
					Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
			}
		}
	}
	for(i=[0:9])
	{
		translate([PCBDimX-(ConsonantX0+CutoutX/2+i*SpacingX),
			ConsonantY0+CutoutY/2,
			KeyMatrixDimZ+BaseDimZ+PCBDimZ+SwitchElevation])
		{
			color("Silver", alpha=0.2)
				rotate([180,0,90])
					import(file="Matias_Switch.stl");
			color("DimGray")
				translate([0,0,SwitchExtension+KeySkirtHeight])
					rotate([0,180,0])
						Key(KeyFace=Lower);
			if(bShowAxial)
			{
				translate([DiodeOffsetX,DiodeOffsetY,-KeyMatrixDimZ-SwitchElevation])
					Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
			}
		}
		translate([PCBDimX-(ConsonantX0+CutoutX/2+i*SpacingX),
			ConsonantY1+CutoutY/2,
			KeyMatrixDimZ+BaseDimZ+PCBDimZ+SwitchElevation])
		{
			color("Silver", alpha=0.2)
				rotate([180,0,90])
					import(file="Matias_Switch.stl");
			color("DimGray")
				translate([0,0,SwitchExtension+KeySkirtHeight])
					rotate([0,180,0])
						Key(KeyFace=Middle);
			if(bShowAxial)
			{
				translate([DiodeOffsetX,DiodeOffsetY,-KeyMatrixDimZ-SwitchElevation])
					Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
			}
		}
		translate([PCBDimX-(ConsonantX0+CutoutX/2+i*SpacingX),
			ConsonantY2+CutoutY/2,
			KeyMatrixDimZ+BaseDimZ+PCBDimZ+SwitchElevation])
		{
			color("Silver", alpha=0.2)
				rotate([180,0,90])
					import(file="Matias_Switch.stl");
			color("DimGray")
				translate([0,0,SwitchExtension+KeySkirtHeight])
					rotate([0,180,0])
						Key(KeyFace=Upper);
			if(bShowAxial)
			{
				translate([DiodeOffsetX,DiodeOffsetY,-KeyMatrixDimZ-SwitchElevation])
					Axial(BodyDiameter=2,BodyLength=4.2,WireDiameter=0.5,Distance=8.0,BendRadius=1.0,Depth=3.0,Color="Gray");
			}
		}
	}

	color("Gray")
		translate([KeyMatrixDimX,0,KeyMatrixDimZ+BaseDimZ+PCBDimZ])
			rotate([0,180,0])
				KeyMatrixV1();
	PCBV1();

	color("Silver")
		BaseV1();

}

//TopV1();

module TopV1()
{
	union()
	{
		difference(convexity=12)
		{
			intersection()
			{
				union()
				{
					// generate the outer shell
					
					difference()
					{
						TopOuterHullV1();
						TopInnerHullV1();
					}

					// generate the lip around the interface holes (cut out later)

					translate([PCBDimX,0,0])
						mirror([1,0,0])
							linear_extrude(height=KeySwitchHeight-KeyMatrixDimZ)
								offset(delta=WallThickness)
									if(bInterfaceLeft)
										import(file=File,layer=LeftOpeningV1Layer);
									else
										import(file=File,layer=RightOpeningV1Layer);

					// generate skirt for USB cutout (cut out later)

					if(bTeensyLeft)
						translate([PCBDimX-10,114.5-1.5,0])
							cube([10,18+3,KeySwitchHeight]);
					else
						translate([0,114.5-1.5,0])
							cube([10,18+3,KeySwitchHeight]);

					// generate the support pads and pins

					for(i=[6:7])
					{
						translate([InnerRegisterX[i],InnerRegisterY[i],0])
							cylinder(r=RegisterBaseDiameter/2.0,h=KeySwitchHeight);
					}
				}
				TopOuterHullV1();			// clean up pads
			}
			
			// cut out the interface holes
			
			translate([PCBDimX,0,-0.5])
				mirror([1,0,0])
					linear_extrude(height=KeySwitchHeight-KeyMatrixDimZ+1)
						if(bInterfaceLeft)
							import(file=File,layer=LeftOpeningV1Layer);
						else
							import(file=File,layer=RightOpeningV1Layer);

			// cut out skirt for USB cutout

			if(bTeensyLeft)
				translate([PCBDimX-11,114.5-0.5,WallThickness])
					cube([12,18+1,KeySwitchHeight]);
			else
				translate([-0.5,114.5-0.5,WallThickness])
					cube([12,18+1,KeySwitchHeight]);

			// subtract reset hole
			
			if(bTeensyLeft)
			{
				translate([LeftResetHolePosX,LeftResetHolePosY,-0.5])
					cylinder(d=ResetHoleDiameter,h=WallThickness+1.0);
			}
			else
			{
				translate([RightResetHolePosX,RightResetHolePosY,-0.5])
					cylinder(d=ResetHoleDiameter,h=WallThickness+1.0);
			}
		}
		
		// generate the support pads and pins

		for(i=[6:7])
		{
			translate([InnerRegisterX[i],InnerRegisterY[i],0])
				cylinder(r=RegisterPinDiameter/2.0,h=KeySwitchHeight+PCBDimZ);
		}

	}
}

module TopOuterHullV1()
{
	linear_extrude(height=KeySwitchHeight)
		import(file=File, layer=TopV1Layer);
}

module TopInnerHullV1()
{
	translate([0,0,WallThickness])
		linear_extrude(height=KeySwitchHeight)
			offset(delta=-WallThickness)
				import(file=File, layer=TopV1Layer);
}


module KeyMatrixV1()
{
	difference()
	{
		union()
		{
			linear_extrude(height=FaceThickness, convexity=2)
				import(file=File, layer=KeyMatrixV1Layer);

			linear_extrude(height=KeyMatrixDimZ, convexity=4)
			{
				difference()
				{
					import(file=File, layer=KeyMatrixV1Layer);
					offset(delta=-WallThickness, convexity=4)
						import(file=File, layer=KeyMatrixV1Layer);
				}
			}

			translate([WallThickness/2.0,KeyMatrixRibY0-RibThickness/2.0,FaceThickness/2.0])
				cube([KeyMatrixDimX-WallThickness,RibThickness,KeyMatrixDimZ-FaceThickness/2.0]);
			translate([WallThickness/2.0,KeyMatrixRibY1-RibThickness/2.0,FaceThickness/2.0])
				cube([KeyMatrixDimX-WallThickness,RibThickness,KeyMatrixDimZ-FaceThickness/2.0]);
			translate([WallThickness/2.0,KeyMatrixRibY2-RibThickness/2.0,FaceThickness/2.0])
				cube([KeyMatrixDimX-WallThickness,RibThickness,KeyMatrixDimZ-FaceThickness/2.0]);
			translate([WallThickness/2.0,KeyMatrixRibY3-RibThickness/2.0,FaceThickness/2.0])
				cube([KeyMatrixDimX-WallThickness,RibThickness,KeyMatrixDimZ-FaceThickness/2.0]);
			
			for(i=[0:5])
			{
				translate([UpperRegisterX[i],UpperRegisterY[i],0])
				{
					cylinder(r=RegisterBaseDiameter/2.0,h=KeyMatrixDimZ);
					cylinder(r=RegisterPinDiameter/2.0,h=KeyMatrixDimZ+PCBDimZ);
				}
			}
			
		}
		
		for(i=[0:3])
		{
			translate([VowelX0+i*SpacingX,VowelY0,-FaceThickness])
				cube([CutoutX,CutoutY,3.0*FaceThickness]);
		}
		
		for(i=[0:9])
		{
			translate([ConsonantX0+i*SpacingX,ConsonantY0,-FaceThickness])
				cube([CutoutX,CutoutY,3.0*FaceThickness]);
			translate([ConsonantX0+i*SpacingX,ConsonantY1,-FaceThickness])
				cube([CutoutX,CutoutY,3.0*FaceThickness]);
			translate([ConsonantX0+i*SpacingX,ConsonantY2,-FaceThickness])
				cube([CutoutX,CutoutY,3.0*FaceThickness]);
		}
	}
}


module PCBV1()
{
	color("DarkGreen",convexity=42)
	{
		translate([PCBDimX,PCBDimY,PCBDimZ+BaseDimZ])
			rotate([180,90,0])
				import(file="PCB.stl");
	}
}


module BaseV1()
{
	difference()
	{
		union()
		{
			// generate base hull
			
			difference()
			{
				BaseOuterHullV1();
				BaseInnerHullV1();
			}
			intersection()
			{
				union()
				{
					// generate keyboard support ribs

					translate([WallThickness/2.0,BaseRibY0-RibThickness/2.0,FaceThickness/2.0])
						cube([PCBDimX-WallThickness,RibThickness,BaseDimZ-FaceThickness/2.0]);
					translate([WallThickness/2.0,BaseRibY1-RibThickness/2.0,FaceThickness/2.0])
						cube([PCBDimX-WallThickness,RibThickness,BaseDimZ-FaceThickness/2.0]);
					translate([WallThickness/2.0,BaseRibY2-RibThickness/2.0,FaceThickness/2.0])
						cube([PCBDimX-WallThickness,RibThickness,BaseDimZ-FaceThickness/2.0]);
					translate([WallThickness/2.0,BaseRibY3-RibThickness/2.0,FaceThickness/2.0])
						cube([PCBDimX-WallThickness,RibThickness,BaseDimZ-FaceThickness/2.0]);
					
					// generate the PCB support pads
					
					for(i=[0:7])
					{
						translate([LowerRegisterX[i],LowerRegisterY[i],0])
							cylinder(r=RegisterBaseDiameter/2.0,h=BaseDimZ);
					}
				}
				
				// clean up things sticking out the bottom
				
				BaseOuterHullV1();
			}
			
			// generate the registration pins
			
			for(i=[0:7])
			{
				translate([LowerRegisterX[i],LowerRegisterY[i],0])
					cylinder(r=RegisterPinDiameter/2.0,h=BaseDimZ+PCBDimZ);
			}
		}

		// subract recesses from support pads for resistor leads
		
		if(bInterfaceLeft)
		{
			translate([LeftResistorLeadX,LeftResistorLeadY,BaseDimZ])
				sphere(r=1.5);
		}
		else
		{
			translate([RightResistorLeadX,RightResistorLeadY,BaseDimZ])
				sphere(r=1.5);
		}

		// subract recesses from support pads for teensy leads
		
		if(bTeensyLeft)
		{
			translate([1.27,TeensyPosY+7.62,BaseDimZ])
				sphere(r=1.5);
			for(i=[0:4])
			{
				translate([1.27+i*2.54,TeensyPosY-7.62,BaseDimZ])
					sphere(r=1.5);
			}		
		}
		else		
		{
			translate([PCBDimX-1.27,TeensyPosY+7.62,BaseDimZ])
				sphere(r=1.5);
			for(i=[0:4])
			{
				translate([PCBDimX-(1.27+i*2.54),TeensyPosY-7.62,BaseDimZ])
					sphere(r=1.5);
			}		
		}
		
	}
}


module BaseOuterHullV1()
{
	hull()
	{
		linear_extrude(height=1)
			offset(delta=-(BaseDimZ-BaseLipHeight), convexity=4)
				import(file=File, layer=PCBOutlineLayer);
		translate([0,0,BaseDimZ-BaseLipHeight])
			linear_extrude(height=BaseLipHeight)
				import(file=File, layer=PCBOutlineLayer);
	}	
}

module BaseInnerHullV1()
{
	translate([0,0,WallThickness])
	{
		hull()
		{
			linear_extrude(height=1)
				offset(delta=-(BaseDimZ-BaseLipHeight)-WallThickness*tan(22.5))
					import(file=File, layer=PCBOutlineLayer);
			translate([0,0,BaseDimZ-BaseLipHeight-WallThickness+WallThickness*tan(22.5)])
				linear_extrude(height=BaseLipHeight)
					offset(delta=-WallThickness)
						import(file=File, layer=PCBOutlineLayer);
		}	
	}
}

