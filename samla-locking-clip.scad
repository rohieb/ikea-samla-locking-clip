use <obiscad/obiscad/bevel.scad>
use <obiscad/obiscad/attach.scad>

// wall thickness
_thickness = 2;
// length of the clip
_length = 40; // z axis

// do not change anything below this line.
in_width = 19; // y axis
in_height = 12.5; // x axis
out_hook_length = 7; // length of outer hook segment
in_hook_length = out_hook_length-_thickness; // length of inner hook segment
in_hook_offset = 4; // offset of inner hook segment on the y axis
in_big_radius = 7;
in_small_radius = 1;

$fn=50;

// inside bevel connectors
ci1e = [[0,0,_length/2], [0,0,1], 0];
ci1n = [ci1e[0], [-1,-1,0], 0];
*connector(ci1e);
*connector(ci1n);
ci2e = [[0,in_width,_length/2], [0,0,1], 0];
ci2n = [ci2e[0], [-1,1,0], 0];
*connector(ci2e);
*connector(ci2n);
ci3e = [[in_height,0,_length/2], [0,0,1], 0];
ci3n = [ci3e[0],[1,-1,0],0];
*connector(ci3e);
*connector(ci3n);
ci4e = [[in_height,in_hook_offset,_length/2], [0,0,1], 0];
ci4n = [ci4e[0], [1,1,0], 0];
*connector(ci4e);
*connector(ci4n);

// outside bevel connectors
co1e = [[-_thickness,-_thickness,_length/2], [0,0,1], 0];
co1n = ci1n;
*connector(co1e);
*connector(co1n);
co2e = [[-_thickness,in_width+_thickness,_length/2], [0,0,1], 0];
co2n = ci2n;
*connector(co2e);
*connector(co2n);
co3e = [[in_height+_thickness,-_thickness,_length/2], [0,0,1], 0];
co3n = ci3n;
*connector(co3e);
*connector(co3n);
co4e = [[in_height+_thickness,in_hook_offset+_thickness,_length/2], [0,0,1], 0];
co4n = ci4n;
*connector(co4e);
*connector(co4n);

// bevel connectors for hole in inner hook
cihhle = [[in_height-in_hook_length/2,in_hook_offset+_thickness/2,_length/5],
	[0,1,0], 0];
cihhln = [cihhle[0], [1,0,-1], 0];
*connector(cihhle);
*connector(cihhln);
cihhue = [[cihhle[0][0],cihhle[0][1],4*_length/5], [0,1,0], 0];
cihhun = [cihhue[0], [1,0,1], 0];
*connector(cihhue);
*connector(cihhun);

module ikea_samla_clip() {
	difference() {
		// outer edge
		translate([-_thickness, -_thickness, 0])
			cube([in_height+2*_thickness, in_width+2*_thickness, _length]);
		bevel(co1e, co1n, l=_length+1, cr=in_big_radius+_thickness, cres=$fn/4);
		bevel(co2e, co2n, l=_length+1, cr=in_small_radius+_thickness, cres=$fn/4);
		bevel(co3e, co3n, l=_length+1, cr=in_small_radius+_thickness, cres=$fn/4);
		bevel(co4e, co4n, l=_length+1, cr=in_small_radius+_thickness, cres=$fn/4);

		// inner edge
		difference() {
			cube([in_height, in_width, _length+1]);
			bevel(ci1e, ci1n, l=_length+1, cr=in_big_radius, cres=$fn/4);
			bevel(ci2e, ci2n, l=_length+1, cr=in_small_radius, cres=$fn/4);
			bevel(ci3e, ci3n, l=_length+1, cr=in_small_radius, cres=$fn/4);
			bevel(ci4e, ci4n, l=_length+1, cr=in_small_radius, cres=$fn/4);

			// inner, upward hook
			difference() {
				translate([in_height-in_hook_length, in_hook_offset, 0])
					cube([in_hook_length, _thickness, _length]);
			}
		}

		// shorten the outer hook
		translate([out_hook_length, in_hook_offset+_thickness, 0])
			cube([in_height, in_width, _length+1]);

		// add a hole in the inner hook for the cross ribs under the boxes' rim
		if(_length >= 40) {
			difference() {
				translate([in_height-in_hook_length, in_hook_offset, _length/5])
					cube([in_hook_length/2, _thickness, _length/5*3]);
				bevel(cihhle, cihhln, l=_thickness, cr=in_hook_length/2, cres=0);
				bevel(cihhue, cihhun, l=_thickness, cr=in_hook_length/2, cres=0);
			}
		}
	}
}

ikea_samla_clip();

// vim: set sw=2 ts=2 noet:
