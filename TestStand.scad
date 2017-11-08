// TestStand.scad -- Test Stand for Matias Key Switches

// Copyright © 2017, Mike Ady
// This file is part of the open source Stenokey project.
// This file is licensed under the Creative Commons Attribution-ShareAlike license.

$fn=100;

DimX=35.5;					// outside dimension
DimY=32.8;					// outside dimension
DimZ=12.0;					// outside dimension

CutoutX=15.5;				// 15.5 nominal per Matias prints
CutoutY=12.8;				// 12.8 nominal per Matias prints

KeyX=10.0;					// cutout offset, from outside left edge
KeyY=10.0;					// cutout offset, from outside bottom edge

FaceThickness=1.0;			// 1.1 nominal per Matias prints
WallThickness=1.2;

difference()
{
	cube([DimX,DimY,DimZ]);
	translate([WallThickness,WallThickness,FaceThickness])
		cube([DimX-2.0*WallThickness,DimY-2.0*WallThickness,DimZ]);
	
	translate([KeyX,KeyY,-FaceThickness])
		cube([CutoutX,CutoutY,3.0*FaceThickness]);
}










