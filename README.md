IKEA SAMLA locking clip
=======================

A clip to lock the IKEA SAMLA boxes so the lid does not fall off. Based on a
[previous work](https://stratum0.org/wiki/RepRap/Modelle#SAMLA-Hook) of
\_stew\_. The length can be adjusted, see the comments on the start of the
OpenSCAD script.

This thing includes three versions, each distributed on a different branch:

 * branch _master_ contains a plain clip without anything else,
 * branch _logo_ contains a version with a customizable logo (see https://github.com/rohieb/thing-logos)
 * branch _text_ contains a version with customizable text.

Instructions
------
First, choose the branch you want, and checkout the submodules:

 * `git submodule init && git submodule update`

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
