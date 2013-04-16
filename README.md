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

Then open `samla-locking-clip.gcode` into OpenSCAD, read the comments and
adjust the variables at the beginning of the file, render it and export it.

The STLs in this repo generally serve as an example. You can print them if you
want, but at least the _logo_ and _text_ versions are meant to be edited first
;-)

Licence
-------

This thing is licenced under CC-BY-SA-NC 3.0 Unported.

// vim: set et ts=2 sw=2 tw=0:
