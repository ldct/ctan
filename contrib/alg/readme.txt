File: readme.txt (for the alg package).

Copyright (c) 1995, 1999, 2003 Staffan Ulfberg

This program can redistributed and/or modified under the terms of the
LaTeX Project Public License Distributed from CTAN archives in
directory macros/latex/base/lppl.txt; either version 1 of the License,
or (at your option) any later version.


Description
===========

This package defines two environments for typesetting algorithms in
LaTeX2e.  Lines are automatically numbered and can be referenced,
the means for easy indentation is provided, and algorithms can be made
floating bodies if desired.


Installation
============

Run LaTeX2e on the file alg.ins to generate the file alg.sty.  After
this is done, you can generate the documentation by running LaTeX2e
twice on the file alg.dtx.

You'll probably want to move the file alg.sty to a directory included
in your $TEXINPUTS environment variable.


Changes
=======

26 May 2003

* Make \alg@unmargin decrement alg@inmargin instead of setting it to
  zero.

12 March 2001

* Added support for German.
* Fixed typo in the French language support.
* Now uses the language selected for the babel package, if it is loaded. 
* \algmarginwidth replaced by \algleftmarginwidth and
  \algrightmarginwidth.

15 April 1999

* Changed \newenvironment{algtab}[0][\alglinenowidth] {....}  to
  \newenvironment{algtab}[1][\alglinenowidth] {....}.  (The bug didn't
  break things until a recent LaTeX release.)
