
This is file `00readme.txt'.
(Start your first tour of the halloweenmath package by reading this file.)

This file is part of a work named "halloweenmath package".

Copyright (C) 2017 by Gustavo MEZZETTI.

The halloweenmath package may be distributed and/or modified under
the conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

The halloweenmath package has the LPPL maintenance status
  "author-maintained".

The file `manifest.txt' that comes along with this file specifies
what the halloweenmath package consists of; more precisely, it explains
how the locutions "Work" and "Compiled Work", used in the LaTeX Project
Public License, are to be interpreted in the case of this work.

This file, after giving a brief description of the halloweenmath
package, explains how to install it and how to generate its--alas, still
incomplete!--documentation.

April 25, 2017 (vers. 0.10a)



CONTENTS
========

- A dozen lines description of the software
- Installation in a snapshot
- Checking the contents of the distribution
- How to install the halloweenmath package
- How to generate the documentation
- The makefile



A DOZEN LINES DESCRIPTION OF THE SOFTWARE
=========================================

The halloweenmath package originated from a question asked for enjoyment
on TeX-LaTeX Stack Exchange <http://tex.stackexchange.com> by the user
cfr (see <http://tex.stackexchange.com/q/336768/69818>); it defines a
handful of commands for typesetting mathematical symbols of various
kinds, ranging from "large" operators to extensible arrow-like relations
and growing arrow-like math accents, that all draw from the classic
Halloween-related iconography (pumpkins, witches, ghosts, cats, and so
on) while being, at the same time, seamlessly integrated within the rest
of the mathematics produced by (AmS-)LaTeX.



INSTALLATION IN A SNAPSHOT
==========================

The halloweenmath package is distributed in the usual .dtx + .ins
format.  The main file is `halloweenmath.dtx', with installation script
`halloweenmath.ins'.  Do the usual things to install it and to generate
the documentation.  If you don't know what the usual things are, read
below.  Note that in order to generate the documentation you should do
the following:

latex; latex; makeindex (.idx); makeindex (.glo); latex; latex.



CHECKING THE CONTENTS OF THE DISTRIBUTION
=========================================

Before installing the halloweenmath package and generating its
documentation, it is a good idea to read the file `manifest.txt', which
lists all the files that make up the distribution, to check that you
don't lack any of them (in particular, that you have the file
`manifest.txt' itself!).  If you do find that some files are missing,
don't hesitate to complain to the distributor from whom you obtained the
others: this person, company, or institution is infringing the copyright
(actually, the copyleft) of the halloweenmath package.  Please remember,
however, that in order to comply with the copyright a distributor is
only requested to supply the files listed in `manifest.txt' under the
title "MEANING OF THE TERM `Work'", but not those listed under "MEANING
OF THE TERM `Compiled Work'".



HOW TO INSTALL THE HALLOWEENMATH PACKAGE
========================================

Note that in many pre-packaged TeX distributions, like MikTeX and TeX
Live, the halloweenmath package could be already installed, in which
case you can use it straight away.

If you need to install the halloweenmath package yourself, follow these
steps (but also see the section titled "The makefile", below):

1) Make sure that the files `halloweenmath.dtx' and `halloweenmath.ins'
are placed in the same directory; below, we shall indicate this
directory as "the current directory".

2) Run LaTeX (or plain TeX) once on the file `halloweenmath.ins'.  This
will generate, in the current directory, the following LaTeX input file:

    halloweenmath.sty

3) Move the file listed in 2) from the current directory to a LaTeX
input directory--see b) and c) below.

4) If you wish, delete the file `halloweenmath.log' to save disk space.

Installation is now finished!  The following comments may be useful:

a) The above listing of the files you need to move is also displayed on
the terminal at the end of the run of the file `halloweenmath.ins'.

b) The documentation of your TeX installation should tell you how to
find the LaTeX input directory/ies, and probably also how to create new
LaTeX input directories reserved to hold your private classes and
packages.

c) If you are not able to find the LaTeX input directories, or you are
not allowed to modify them and cannot create your personal LaTeX input
directories, do this: place all the files listed under 2) above in any
directory of your choice (a newly created, empty directory would be the
best choice, however); then put all the LaTeX source files that you want
to typeset using the halloweenmath package in that same directory.  Of
course, this solution becomes impractical if the number of such source
files exceeds a dozen or so; but for a few files you can do this way, at
least until you decide to finally learn how to create your private LaTeX
input directories!  :-)

d) You may also choose to install the halloweenmath package inside the
main texmf tree of your TeX installation (as opposed to installing it
inside a directory devoted to private classes and packages).  In this
case, note that the--now accepted--TDS-compliant location for the
halloweenmath package, that is, the directory inside which you should
put all the files listed in 2), is

    $TEXMF/tex/latex/halloweenmath/
    
The documentation, on the other hand, should be stored inside

    $TEXMF/doc/latex/halloweenmath/

Of course, in order to do so you must have appropriate access
priviledges to the texmf tree of your site.



HOW TO GENERATE THE DOCUMENTATION
=================================

A shortened form of the documentation, already typeset and packaged in
PDF, is provided in the file `halloweenmath-doc.pdf' that you might have
found on some sites (e.g., the CTAN sites).  This file, however, is not
part of the halloweenmath package and distributors are not requested to
include it among the distributed files.  Moreover, it does not contain
any implementation notes (in which most users, though, are not at all
interested).

If the distributor from whom you obtained the halloweenmath package did
not provide the file `halloweenmath-doc.pdf', or if you want the full
documentation, complete with all the available implementation notes
(but, alas, still unfinished for many respects), you can generate it
following these steps (but also see the section titled "The makefile",
below):

1) Run LaTeX (_not_ plain TeX) _twice_ on the file `halloweenmath.dtx'.
This, among other things, will generate the files `halloweenmath.idx'
and `halloweenmath.glo' in the same directory as the file
`halloweenmath.dtx'.

2) Run MakeIndex on the file `halloweenmath.idx' obtained in 1), using
the style file `gind.ist', which is part of the standard LaTeX
distribution.

3) Run MakeIndex on the file `halloweenmath.glo' obtained in 1), using
the style file `gglo.ist', which is part of the standard LaTeX
distribution, and specifying the file `halloweenmath.gls' as the output
file.

4) Run LaTeX _two_ more times on the file `halloweenmath.dtx'.

5) If you wish, you can now delete the following files, to save disk
space:

    halloweenmath.aux
    halloweenmath.glg
    halloweenmath.glo
    halloweenmath.gls
    halloweenmath.hd
    halloweenmath.idx
    halloweenmath.ilg
    halloweenmath.ind
    halloweenmath.lof
    halloweenmath.log
    halloweenmath.out
    halloweenmath.toc

After step 4), you should get the documentation in DVI format in the
file `halloweenmath.dvi', located in the same directory as
`halloweenmath.dtx', with all indexes, table of contents, etc.
correctly set.

However, if you are neurotic (as I am) and have a fast computer, you
could run LaTeX three or four times, instead of two, in step 1)...  :-)

Other LaTeX typesetting engines should work in the same way, perhaps
producing the output in a different format; for example, you may use
pdflatex in place of LaTeX to obtain the documentation in PDF.



THE MAKEFILE
============

A (quite trivial!)  makefile that "knows" how to produce the
documentation is offered along with the halloweenmath package.  Although
it is not a required part of the distribution (as per LPPL), you may
find that some distributors supply it all the same (I hope the CTAN
sites will do so).  With this makefile in the same directory as
`halloweenmath.dtx', the shell command

    make doc

will take all the necessary actions to produce the full documentation
(in PDF; the modifications you need to introduce into the makefile in
order to obtain DVI output should be quite obvious, however).

The same makefile can also be used to extract the "executable" package
file: simply issue the command

    make code

at the shell prompt; whereas

    make

will _both_ extract the code _and_ typeset the documentation.  Type

    make help

for more information.


Have fun with the halloweenmath package!

