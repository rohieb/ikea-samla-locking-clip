/**
 * Examples on how to use the ikea_samla_clip() module
 * Copyright (C) 2013 Roland Hieber <rohieb+ikeasamlaclip@rohieb.name>
 *
 * This file includes some examples on how to use the SAMLA clip module.
 * You can comment out one example and render it, or just use the examples to
 * learn how you can customize the clip to your own needs.
 *
 * The contents of this file are licenced under CC-BY-NC-SA 3.0 Unported.
 * See https://creativecommons.org/licenses/by-nc-sa/3.0/deed for the
 * licensing terms.
 */

use <samla-locking-clip.scad>

// one default clip with length of 40mm
// this example creates the file example-40mm.stl
ikea_samla_clip();

// one clip with a different length of 30mm
//ikea_samla_clip(length=30mm);

// clip with a default logo and default length
// this example creates the file example-40mm-logo-stratum0-lowres.stl
//ikea_samla_clip_with_logo();

// clip with different length and logo
//ikea_samla_clip_with_logo(length=30, logo="thing-logos/pesthoernchen.dxf");

// clip with a default text and default length
// this example creates the file example-40mm-text-stuff.stl
//ikea_samla_clip_with_text();

// clip with different length, text and font
//ikea_samla_clip_with_text(length=30, text="my box", font="Letters.dxf",
//	fontsize=12/2);

// vim: set sw=2 ts=2 noet:
