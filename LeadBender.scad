// LeadBender.scad -- Lead bender jig for 1/8 watt resistors and small signal diodes

// Copyright © 2017, Mike Ady
// This file is part of the open source Stenokey project.
// This file is licensed under the Creative Commons Attribution-ShareAlike license.

$fn=100;					// nice arcs

color("Silver")
	LeadBender();

module LeadBender()
{
	difference()
	{
		union()
		{
			// bending post

			translate([0.75,1,0])
				cylinder(r=1.0,h=5.0);
			translate([-0.25,0,0])
				cube([1,10,5]);
			translate([-0.25,1,0])
				cube([2,9,5]);

			// bending post
	
			translate([6.75,1,0])
				cylinder(r=1.0,h=5.0);
			translate([6.75,0,0])
				cube([1,10,5]);
			translate([5.75,1,0])
				cube([2,9,5]);

			difference()
			{
				// back plate

				translate([-0.5,-20,0])
					cube([8.5,30,3]);

				// recess for component
	
				translate([1.25,-1.5,1.5])
					cube([5.0,12,2]);
			}
		}
	
		// recesses for thumb grip

		for(i=[0:3])
		{
			translate([1.0,-5.5-4*i,2.0])
				cube([5.5,2,2]);
		}

		// shave off sides

		translate([-1.0,-20.5,-0.5])
			cube([1,31,6]);
		translate([7.5,-20.5,-0.5])
			cube([1,31,6]);
	}
}