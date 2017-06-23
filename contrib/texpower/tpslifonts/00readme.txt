======================================================================

			  Package tpslifonts
		     Configure presentation fonts

			  alpha version (v0.6)
	    This readme file last changed on July 27, 2004

  Author: Stephan Lehmke <mailto:Stephan.Lehmke@cs.uni-dortmund.de>
	  Lehrstuhl Informatik I
	  Universität Dortmund
	  Dortmund, Germany

======================================================================

Contents:
=========

00readme.txt
        This file.

01install.txt
        Installation instructions.

Makefile
        Builds documentation and unpacks dtx-file. 
        (Only useful on Unix-like systems.)

tpslifonts.dtx
        Documented TeX source for the tpslifonts package.
        
tpslifonts.ins
        Docstrip batchfile that generates the tpslifonts package.

slifontsexample.tex
        An documented example.

Overview:
=========

Beamer and overhead presentations are often viewed under peculiar
circumstances. Especially for presentations which are projected
directly `out of the computer', low power of the beamer, low
resolution and an abundance of colors can lead to severe readability
problems.

It is therefore of utmost importance to optimize font selection as
much as possible towards readability.

The package tpslifonts offers a couple of `harmonising' combinations
of text and math fonts from the (distant) relatives of computer modern
fonts, with a couple of extras for optimising readability.

The package offers the following features:

 1) Text fonts from computer modern roman, computer modern sans serif,
    SliTeX computer modern sans serif, computer modern bright, or
    concrete roman.

 2) Support for OT1 and T1 font encoding.

 3) Math fonts from computer modern math, computer modern bright math,
    or Euler fonts. 

 4) Support of additional symbol fonts like AMS symbols or
    doublestroke.

 5) All fonts configured for `smooth scaling' (like in the type1cm
    package).

 6) Avoiding fonts not freely available in Type 1 format.

 7) Careful design size selection for optimum readability.

For some of the options to yield satisfying results, it is neccessary
to install additional (free) Type1 fonts on your system.

There's no intention to support other font families like the typical
``psnfss'' PostScript fonts, as they usually don't come in different
design sizes, making the effort of tuning them for viewing futile. If
you wish to use such a font, load it with the usual packages.

tpslifonts is part of the TeXPower bundle, residing at 

http://texpower.sourceforge.net/

but is completely independent and can be used without texpower without
problems. The example document slifontsexample.tex can also be
compiled without TeXPower installed.

