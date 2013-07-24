IKEA SAMLA locking clip
=======================

A clip to lock the IKEA SAMLA boxes so the lid does not fall off. Based on a
[previous work](https://stratum0.org/wiki/RepRap/Modelle#SAMLA-Hook) of
\_stew\_. The length and other parameters can be adjusted.

This thing includes three versions, each implemented as a module in
`samla-locking-clip.scad`:

 * `ikea_samla_clip()` creates a plain clip without anything else,
 * `ikea_samla_clip_with_logo()` creates a version with a customizable logo
 * `ikea_samla_clip_with_text()` creates a version with customizable text.

Currently, the clip only fits for the smallest SAMLA boxes with 5l/1gal,
11l/3gal or 22l/6gal. Other sizes are in development, see the
`feature/bigboxes` branch.

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

Licence
-------

This thing is licenced under CC-BY-SA-NC 3.0 Unported. For a full list of the
licensing terms, see [https://creativecommons.org/licenses/by-nc-sa/3.0/deed](https://creativecommons.org/licenses/by-nc-sa/3.0/deed).

// vim: set et ts=2 sw=2 tw=0:
