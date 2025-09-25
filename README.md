IKEA SAMLA locking clip
=======================

A clip to lock the IKEA SAMLA boxes so the lid does not fall off. Based on a
[previous work](https://stratum0.org/wiki/RepRap/Modelle#SAMLA-Hook) by
\_stew\_. The length and other parameters can be adjusted.

This thing includes three versions, each implemented as a module in
`samla-locking-clip.scad`:

 * `ikea_samla_clip()` creates a plain clip without anything else,
 * `ikea_samla_clip_with_logo()` creates a version with a customizable logo
 * `ikea_samla_clip_with_text()` creates a version with customizable text.

The clip only fits for the smallest SAMLA boxes of size 5l/1gal, 11l/3gal or
22l/6gal. Sizes for larger boxes are sold by IKEA directly.

Instructions
------
After cloning this repo, first init and update the submodules:

 * `git submodule init && git submodule update`

This fetches all needed dependencies:

 * Obijuan/obiscad, used for beveling edges
 * rohieb/Write.scad, a mirror of Write.scad by HarlanDMii, used for writing
   text in OpenSCAD
 * rohieb/thing-logos, a collection of logos in DXF format

The clip itself resides as a module in `samla-locking-clip.scad`, and should be
well-documented. The file `example.scad` contains some examples on how to use
this module in OpenSCAD. You can simply render one of the provided examples by
un-commenting it (removing the `//` at the beginning of the line, be sure to
comment the other examples by prefixing the lines with `//`), or just use the
examples for customising your own version of the clip.

The STLs in this repo generally serve as an example. You can print them if you
want, but at least the _logo_ and _text_ versions are meant to be edited first
;-)

### Printing
Prints good with any layer height. If you have a logo or text, they can of
course benefit from smaller layer heights. Also no need for infill, just print
multiple perimeters. For example, with my 0.35 mm nozzle, 3 perimeters are
enough to fill the whole body of the clip and make it strong, but still with
enough clippyness.

### Post-Printing
Put the lid on your box, clip the clip on from the bottom, turning it inwards
to the top. If the clip is too tight or too lose for your box, you can heat it
slighty with a lighter, torch, blow-dryer or heat gun, clip it to your box,
then form it by hand so it fits tightly, and let it cool.

Licence
-------

This thing is licenced under CC-BY-SA-NC 3.0 Unported. For a full list of the
licensing terms, see [https://creativecommons.org/licenses/by-nc-sa/3.0/deed](https://creativecommons.org/licenses/by-nc-sa/3.0/deed).

// vim: set et ts=2 sw=2 tw=0:
