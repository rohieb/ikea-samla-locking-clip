/**
 * A locking clip for IKEA SAMLA boxes.
 * Copyright (C) 2013 Roland Hieber <rohieb+ikeasamlaclip@rohieb.name>
 * The contents of this file are licensed under CC-BY-NC-SA 3.0 Unported.
 * See https://creativecommons.org/licenses/by-nc-sa/3.0/deed for the
 * terms of the license.
 */

use <obiscad/obiscad/bevel.scad>
use <obiscad/obiscad/attach.scad>

$fn=50;

/**
 * A locking clip for IKEA SAMLA boxes.
 * Parameters:
 * length: Length of the clip. Default is 40 mm.
 */
module ikea_samla_clip(length=40) {
	thickness = 2; // wall thickness
	in_width = 19; // inside dimension on y axis
	in_height = 12.5; // inside dimension on x axis
	out_hooklength = 7; // length of outer hook segment
	in_hooklength = out_hooklength-thickness; // length of inner hook segment
	in_hook_offset = 4; // offset of inner hook segment on the y axis
	in_big_radius = 7; // radius of the big beveled edge
	in_small_radius = 1; // radius of the small beveled edges

	// inside bevel connectors
	ci1e = [[0,0,length/2], [0,0,1], 0];
	ci1n = [ci1e[0], [-1,-1,0], 0];
	*connector(ci1e);
	*connector(ci1n);
	ci2e = [[0,in_width,length/2], [0,0,1], 0];
	ci2n = [ci2e[0], [-1,1,0], 0];
	*connector(ci2e);
	*connector(ci2n);
	ci3e = [[in_height,0,length/2], [0,0,1], 0];
	ci3n = [ci3e[0],[1,-1,0],0];
	*connector(ci3e);
	*connector(ci3n);
	ci4e = [[in_height,in_hook_offset,length/2], [0,0,1], 0];
	ci4n = [ci4e[0], [1,1,0], 0];
	*connector(ci4e);
	*connector(ci4n);

	// outside bevel connectors
	co1e = [[-thickness,-thickness,length/2], [0,0,1], 0];
	co1n = ci1n;
	*connector(co1e);
	*connector(co1n);
	co2e = [[-thickness,in_width+thickness,length/2], [0,0,1], 0];
	co2n = ci2n;
	*connector(co2e);
	*connector(co2n);
	co3e = [[in_height+thickness,-thickness,length/2], [0,0,1], 0];
	co3n = ci3n;
	*connector(co3e);
	*connector(co3n);
	co4e = [[in_height+thickness,in_hook_offset+thickness,length/2], [0,0,1], 0];
	co4n = ci4n;
	*connector(co4e);
	*connector(co4n);

	// bevel connectors for hole in inner hook
	cihhle = [[in_height-in_hooklength/2,in_hook_offset+thickness/2,length/5],
		[0,1,0], 0];
	cihhln = [cihhle[0], [1,0,-1], 0];
	*connector(cihhle);
	*connector(cihhln);
	cihhue = [[cihhle[0][0],cihhle[0][1],4*length/5], [0,1,0], 0];
	cihhun = [cihhue[0], [1,0,1], 0];
	*connector(cihhue);
	*connector(cihhun);

	difference() {
		// outer edge
		translate([-thickness, -thickness, 0])
			cube([in_height+2*thickness, in_width+2*thickness, length]);
		bevel(co1e, co1n, l=length+1, cr=in_big_radius+thickness, cres=$fn/4);
		bevel(co2e, co2n, l=length+1, cr=in_small_radius+thickness, cres=$fn/4);
		bevel(co3e, co3n, l=length+1, cr=in_small_radius+thickness, cres=$fn/4);
		bevel(co4e, co4n, l=length+1, cr=in_small_radius+thickness, cres=$fn/4);

		// inner edge
		difference() {
			cube([in_height, in_width, length+1]);
			bevel(ci1e, ci1n, l=length+1, cr=in_big_radius, cres=$fn/4);
			bevel(ci2e, ci2n, l=length+1, cr=in_small_radius, cres=$fn/4);
			bevel(ci3e, ci3n, l=length+1, cr=in_small_radius, cres=$fn/4);
			bevel(ci4e, ci4n, l=length+1, cr=in_small_radius, cres=$fn/4);

			// inner, upward hook
			difference() {
				translate([in_height-in_hooklength, in_hook_offset, 0])
					cube([in_hooklength, thickness, length]);
			}
		}

		// shorten the outer hook
		translate([out_hooklength, in_hook_offset+thickness, 0])
			cube([in_height, in_width, length+1]);

		// add a hole in the inner hook for the cross ribs under the boxes' rim
		if(length >= 40) {
			difference() {
				translate([in_height-in_hooklength, in_hook_offset, length/5])
					cube([in_hooklength/2, thickness, length/5*3]);
				bevel(cihhle, cihhln, l=thickness, cr=in_hooklength/2, cres=0);
				bevel(cihhue, cihhun, l=thickness, cr=in_hooklength/2, cres=0);
			}
		}
	}
}

// instantiate one default clip
ikea_samla_clip();

// Example: instantiate one clip with a different length
// ikea_samla_clip(length=30mm);

// vim: set sw=2 ts=2 noet:
