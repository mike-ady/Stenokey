How to use svg2mod to generate a logo module for Kicad

Converting vector graphics to a bitmap for conversion by Bitmap2Component 
results in an unacceptable loss of quality, no matter what the bitmap resolution.
SVG2MOD is more complicated than you might think, but the results are worth it.

1.  Download svg2mod.py from:

https://github.com/mtl/svg2mod

Put the entire contents of the svg2mod-master directory into its own directory; 
e.g C:\svg2mod

2.  Run Inkscape and open the layers panel.  If the layers panel is not
available, select Layers... from the Layer menu.  Create the layer or layers 
that you want the path(s) to end up on, for example "SilkS".  (Case is 
important.)

Inkscape layer name 	KiCad layer(s) 		KiCad legacy 	KiCad pretty
Cu 			F.Cu, B.Cu 		Yes	 	Yes
Adhes 			F.Adhes, B.Adhes 	Yes 		Yes
Paste 			F.Paste, B.Paste 	Yes 		Yes
SilkS 			F.SilkS, B.SilkS 	Yes 		Yes
Mask 			F.Mask, B.Mask 		Yes 		Yes
Dwgs.User 		Dwgs.User 		Yes 		--
Cmts.User 		Cmts.User 		Yes 		--
Eco1.User 		Eco1.User 		Yes 		--
Eco2.User 		Eco2.User 		Yes 		--
Edge.Cuts 		Edge.Cuts 		Yes 		Yes
Fab 			F.Fab, B.Fab 		-- 		Yes

3.  Select the desired layer.  Draw desired object or objects.  Convert 
non-path objects to paths.  For objects like rectangles, circles and text, 
select the object(s) then select "Object to Path" from the Path menu.  

Note:  Extra steps are required for any object that has holes in it.  

3a.  After converting text to a path, you may want to modify it to fix 
the kerning.  (Do this before fixing the holes in the letters!)  Select the 
text, then select Ungroup from the Object menu.  Then Ungroup a second time.  
Click on the "Edit Path by Nodes" button on the left, then click on a letter.  
Select the Arrow button on the left.  Select letters as necessary, and use 
the cursor keys to shift them around.

3b.  If you have text with holes in the letters, click on "Edit Path by Nodes" 
again.  For each letter with a hole in it:
	1. Click on the letter to select it.  
	2. Select Ungroup from the Object menu.  
	3. Select "Break Apart" from the Path menu.  
	4. Select Difference from the Path menu.  
Save the SVG file when you're done.

4.  Copy the SVG file to the c:\svg2mod directory, and enter a command like the
following:

svg2mod -i StenoKeyLogo.svg -p 0.1 --factor 0.8

5.  Copy the resulting kicad_mod file to your module library (pretty) directory.

