use <obiscad/bevel.scad>

// wall thickness
_thickness = 2;
// length of the clip
_length = 10; // z axis

// do not change anything below this line.
in_width = 20.5; // y axis
in_height = 12.5; // x axis
in_hook_length = 7; // length of hooks
in_hook_offset = 4; // offset of inside upward hook
in_big_radius = 6;
in_small_radius = 1;
eps = 0.01;

$fn=50;

// in bevel connectors
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

difference() {
	// outer rim
	translate([-_thickness, -_thickness, 0])
		cube([in_height+2*_thickness, in_width+2*_thickness, _length]);
	bevel(co1e, co1n, l=_length+1, cr=in_big_radius+_thickness, cres=$fn/4);
	bevel(co2e, co2n, l=_length+1, cr=in_small_radius+_thickness, cres=$fn/4);
	bevel(co3e, co3n, l=_length+1, cr=in_small_radius+_thickness, cres=$fn/4);
	bevel(co4e, co4n, l=_length+1, cr=in_small_radius+_thickness, cres=$fn/4);

	// inner rim
	difference() {
		cube([in_height, in_width, _length+1]);
		bevel(ci1e, ci1n, l=_length+1, cr=in_big_radius, cres=$fn/4);
		bevel(ci2e, ci2n, l=_length+1, cr=in_small_radius, cres=$fn/4);
		bevel(ci3e, ci3n, l=_length+1, cr=in_small_radius, cres=$fn/4);
		bevel(ci4e, ci4n, l=_length+1, cr=in_small_radius, cres=$fn/4);

		// inner, upward hook
		difference() {
			translate([in_height-in_hook_length+_thickness, in_hook_offset, 0])
				cube([in_hook_length-_thickness, _thickness, _length]);
		}
	}

	// shorten the hooks
	translate([in_hook_length, in_hook_offset+_thickness, 0])
		cube([in_height, in_width, _length+1]);
}

// vim: set sw=4 ts=4 noet:
