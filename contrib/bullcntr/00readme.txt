
This is file `00readme.txt'.
(Start your first tour of the bullcntr package by reading this file.)

This file is part of a work named "bullcntr package".

Copyright (C) 2007 by Gustavo MEZZETTI <gustavo.mezzetti@istruzione.it>.

The bullcntr package may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

The bullcntr package has the LPPL maintenance status
  "author-maintained".

The file `manifest.txt' that comes along with this file specifies what the
bullcntr package consists of; more precisely, it explains how the locutions
"Work" and "Compiled Work", used in the LaTeX Project Public License, are
to be interpreted in the case of this work.

This file, after giving a brief description of the bullcntr package,
explains how to install it and how to generate its documentation.

October 10, 2008 (vers. 0.04)



CONTENTS
========

- Brief description of the software
- Installation in a snapshot
- Checking the contents of the distribution
- How to install the bullcntr package
- How to generate the main documentation
- Ancillary files and documentation



BRIEF DESCRIPTION OF THE SOFTWARE
=================================

This software is named after its primary component, but it actually
contains _two_ packages: the bullcntr package and the bullenum package.

The bullcntr package defines the command "\bullcntr", which can be thought
of as an analogue of the "\fnsymbol" command: like the latter, it displays
the value of a counter lying between 1 and 9, but uses, for the purpose, a
regular pattern of bullets.

The bullenum package--which also loads the bullcntr package as part of its
own initialization--defines the environment "bullenum", a list-making
environment similar to "enumerate", which numbers its item using the
"\bullcntr" command.  Most users will simply use this package and never
call the bullcntr package directly.



INSTALLATION IN A SNAPSHOT
==========================

The bullcntr package is distributed in the usual .dtx + .ins format.  The
main file is `bullcntr.dtx', with installation script `bullcntr.ins'.  Do
the usual things to install it and to generate the documentation.  If you
do not know what the usual things are, read below.  Note that in order to
generate the documentation you should do the following:

latex; latex; makeindex (.idx); makeindex (.glo); latex; latex.

The distribution also includes three files with extension `.tex': these are
sample source files that illustrate how to use the abovementioned packages,
and should simply be copied to the same location where the documentation is
put.



CHECKING THE CONTENTS OF THE DISTRIBUTION
=========================================

Before installing the bullcntr package and generating its documentation, it
is a good idea to read the file `manifest.txt', which lists all the files
that make up the distribution, to check that you don't lack any of them (in
particular, that you have the file `manifest.txt' itself!).  If you do find
that some files are missing, don't hesitate to complain to the distributor
from whom you obtained the others: this person, company, or institution is
infringing the copyright (actually, the copyleft) of the bullcntr package.
Please remember, however, that in order to comply with the copyright a
distributor is only requested to supply the files listed in `manifest.txt'
under the title "MEANING OF THE TERM `Work'", but not those listed under
"MEANING OF THE TERM `Compiled Work'".



HOW TO INSTALL THE BULLCNTR PACKAGE
===================================

To install the bullcntr package, follow these steps:

1) Make sure that the files `bullcntr.dtx' and `bullcntr.ins' are placed in
the same directory; below, we shall indicate this directory as "the current
directory".

2) Run LaTeX (or Plain TeX) once on the file `bullcntr.ins'.  This will
generate, in the current directory, the following two LaTeX input files:

    bullcntr.sty
    bullenum.sty

3) Move the files listed in 2) from the current directory to a LaTeX input
directory--see b) and c) below.

4) If you wish, delete the file `bullcntr.log' to save disk space.

Installation is now finished!  The following comments may be useful:

a) The above listing of the files you need to move is also displayed on the
terminal at the end of the run of the file `bullcntr.ins'.

b) The documentation of your TeX installation should tell you how to find
the LaTeX input directory/ies, and probably also how to create new LaTeX
input directories reserved to hold your private classes and packages.  If
your TeX installation offers you the chance of defining your private LaTeX
input directories, I recommend you exploit this possibility and place the
generated files into such a directory.

c) If you are not able to find the LaTeX input directories, or you are not
allowed to modify them and cannot create your personal LaTeX input
directories, do this: place the files listed under 2) above in any
directory of your choice (a newly created, empty directory would be the
best choice, however); then put all the LaTeX source files that you want to
typeset using the bullcntr package in that same directory.  Of course, this
solution becomes impractical if the number of such source files exceeds a
dozen or so; but for a few files you can do this way, at least until you
decide to finally learn how to create your private LaTeX input directories!
:-)

d) You may also choose to install the bullcntr package within the main
texmf tree of your TeX installation (as opposed to installing it inside a
directory devoted to private classes and packages).  In this case, note
that the **proposed** (but not yet approved!) TDS-compliant location for
the bullcntr package, that is, the directory inside which you should put
the files listed in 2), is

    $TEXMF/tex/latex/bullcntr/

The **proposed** location for the documentation, on the other hand, is

    $TEXMF/doc/latex/bullcntr/

We shall describe below in detail which files should be put in this place.
Of course, in order to do all this you must have appropriate access
priviledges to the texmf tree of your site.



HOW TO GENERATE THE MAIN DOCUMENTATION
======================================

An alternative form of the documentation, already typeset and packaged in
PDF format, is given in the file `bullcntr-man.pdf' that you might have
found on some sites (e.g., the CTAN sites).  This file, however, is not
part of the bullcntr package and distributors are not requested to include
it among the distributed files.  Moreover, it does not contain any
implementation notes (in which most users are not at all interested).

If the distributor from whom you obtained the bullcntr package did not
provide the file `bullcntr-man.pdf', or if you want the full documentation,
complete with all implementation notes, you can generate it by following
these steps:

1) Run LaTeX (_not_ Plain TeX) _twice_ on the file `bullcntr.dtx'.  This,
among other things, will generate the files `bullcntr.idx' and
`bullcntr.glo' in the same directory as the file `bullcntr.dtx'.

2) Run MakeIndex on the file `bullcntr.idx' obtained in 1), using the style
file `gind.sty', which is part of the standard LaTeX distribution.

3) Run MakeIndex on the file `bullcntr.glo' obtained in 1), using the style
file `gglo.sty', which is part of the standard LaTeX distribution.

4) Run LaTeX _two_ more times on the file `bullcntr.dtx'.

5) If you wish, you may now delete the following files, to save disk space:

    bullcntr.aux
    bullcntr.glo
    bullcntr.gls
    bullcntr.idx
    bullcntr.ilg
    bullcntr.ind
    bullcntr.lof
    bullcntr.log
    bullcntr.toc

After step 4), you should get the documentation in DVI format in the file
`bullcntr.dvi', located in the same directory as `bullcntr.dtx', with all
indexes, table of contents, etc. correctly set.

However, if you are neurotic (as I am), you could run LaTeX three or four
times, instead of two, in step 1)...  :-)

Other LaTeX typesetting engines should work in the same way, perhaps
producing the output in a different format; for example, you may use
pdflatex in place of LaTeX to obtain the documentation in PDF format
(doing so, of course, produces a file named `bullcntr.pdf').

When you have typeset the documentation, in either format (or in both
formats, why not), you might want to install it in the main texmf tree of
your site; as said above,

    $TEXMF/doc/latex/bullcntr/

is the **proposed** location for this purpose, that is, the directory
inside which you should put the files `bullcntr.dvi' and/or `bullcntr.pdf',
or equivalent files in other formats, should you have produced any.  This
is also the place where ancillary files and documentation, described in the
next section, should be put.



ANCILLARY FILES AND DOCUMENTATION
=================================

If you want to distribute a "Compiled Work" (see manifest.txt), you are
bound to make the following files available to your users:

    00readme.txt
    manifest.txt
    bullcntr-man.tex
    bullcntr-sam.tex
    bullenum-sam.tex

These files are best placed together with the compiled documentation
(files `bullcntr.dvi' and/or `bullcntr.pdf'), possibly under

    $TEXMF/doc/latex/bullcntr/

Any compiled version of the above files that you wish to include in your
distribution of a "Compiled Work" (e.g., the file `bullcntr-man.pdf') also
belongs here.  Remember, however, that you are not obliged to distribute
such compiled files, except--always in the case of a "Compiled Work"--for
the result of typesetting `bullcntr.dtx'; for other files, distributing
their sources suffices to comply with the license.  Once again, see
`manifest.txt' and the LaTeX Project Public License for precise
instructions.



Have fun with the bullcntr package!

