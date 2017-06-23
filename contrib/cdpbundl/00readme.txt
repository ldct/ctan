
This is file `00readme.txt'.
(Start your first tour of the C.D.P. Bundle by reading this file.)

This file is part of a work named "C.D.P. Bundle".

Copyright (C) 1999-2015 by Gustavo MEZZETTI
                          <gustavo.mezzetti@istruzione.it>.

The C.D.P. Bundle may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

The C.D.P. Bundle has the LPPL maintenance status
  "author-maintained".

The file `manifest.txt' that comes along with this file specifies
what the C.D.P. Bundle consists of; more precisely, it explains how
the locutions "Work" and "Compiled Work", used in the LaTeX Project
Public License, are to be interpreted in the case of this work.

This file, after giving a brief description of the C.D.P. Bundle,
explains how to install it and how to generate its--alas, still
incomplete!--documentation.

April 1, 2015 (vers. 0.36)



CONTENTS
========

- A dozen lines description of the software
- Drawbacks
- Installation in a snapshot
- Checking the contents of the distribution
- How to install the C.D.P. Bundle
- How to generate the documentation
- The makefile



A DOZEN LINES DESCRIPTION OF THE SOFTWARE
=========================================

The C.D.P. Bundle was originally developed for a free association named
"C.D.P." (more on it in the documentation), to typeset its official letters
with the appropriate letterhead; but more generally, it can be used to
typeset business letters bearing a letterhead of your choice and formatted
according to Italian style conventions.  Its modular structure, however,
provides you with building blocks of increasing level, by means of which
you should be able to adapt the letter format to a wide variety of styles.
It is also possible to write letters divided into sections and paragraphs,
to include floating figures and tables, and to use the commands
"\tableofcontents", "\listoffigures", and "\listoftables" to compile the
relevant indexes.  A single input file can contain several letters, and
each letter will have its own table of contents, etc., independent of the
other ones.



DRAWBACKS
=========

The documentation included in this distribution is absolutely minimal.  For 
meaningful instructions on how to use the macros, the reader is referred to 
other documents available at the web site of the past author's department, 
which, however, are written in Italian.  Since the main purpose of these 
macros is to typeset letters according to Italian conventions, this should 
not be a problem.  I will consider translating the documentation in English 
only if at least 5 persons ask me to.  Nobody has asked yet.



INSTALLATION IN A SNAPSHOT
==========================

The C.D.P. Bundle is distributed in the usual .dtx + .ins format.  The main 
file is `cdpbundl.dtx', with installation script `cdpbundl.ins'.  Do the 
usual things to install it and to generate the documentation.  If you don't 
know what the usual things are, read below.  Note that in order to generate 
the documentation you should do the following:

latex; latex; makeindex (.idx); makeindex (.glo); latex; latex.



CHECKING THE CONTENTS OF THE DISTRIBUTION
=========================================

Before installing the C.D.P. Bundle and generating its documentation, it is 
a good idea to read the file `manifest.txt', which lists all the files that 
make up the distribution, to check that you don't lack any of them (in 
particular, that you have the file `manifest.txt' itself!).  If you do find 
that some files are missing, don't hesitate to complain to the distributor 
from whom you obtained the others: this person, company, or institution is 
infringing the copyright (actually, the copyleft) of the C.D.P. Bundle.  
Please remember, however, that in order to comply with the copyright a 
distributor is only requested to supply the files listed in `manifest.txt' 
under the title "MEANING OF THE TERM `Work'", but not those listed under 
"MEANING OF THE TERM `Compiled Work'".



HOW TO INSTALL THE C.D.P. BUNDLE
================================

Note that in many pre-packaged TeX distributions, like MiKTeX and TeX Live, 
the C.D.P. Bundle is already installed, and you can use it straight away.

If, for some reason, you need to install the C.D.P. Bundle yourself, follow 
these steps (but also see the section titled "The makefile", below):

1) Make sure that the files `cdpbundl.dtx' and `cdpbundl.ins' are placed in 
the same directory; below, we shall indicate this directory as "the current 
directory".

2) Run LaTeX (or plain TeX) once on the file `cdpbundl.ins'.  This will 
generate, in the current directory, the following LaTeX input files:

    articoletteracdp.cls
    cdpaddon.sty
    cdpbabel.sty
    cdpnamesenglish.ldf
    cdpnamesitalian.ldf
    cdpshues-example.def
    cdpshues.cfg
    epson-stylus-740.def
    hp-laserjet-4500.def
    letteracdp.cls

3) Move all the files listed in 2) from the current directory to a LaTeX 
input directory--see b) and c) below.

4) If you wish, delete the file `cdpbundl.log' to save disk space.

Installation is now finished!  The following comments may be useful:

a) The above listing of all the files you need to move is also displayed on 
the terminal at the end of the run of the file `cdpbundl.ins'.

b) The documentation of your TeX installation should tell you how to find 
the LaTeX input directory/ies, and probably also how to create new LaTeX 
input directories reserved to hold your private classes and packages.

c) If you are not able to find the LaTeX input directories, or you are not 
allowed to modify them and cannot create your personal LaTeX input 
directories, do this: place all the files listed under 2) above in any 
directory of your choice (a newly created, empty directory would be the 
best choice, however); then put all the LaTeX source files that you want to 
typeset using the C.D.P. Bundle in that same directory.  Of course, this 
solution becomes impractical if the number of such source files exceeds a 
dozen or so; but for a few files you can do this way, at least until you 
decide to finally learn how to create your private LaTeX input directories!  
:-)

d) You may also choose to install the C.D.P. Bundle inside the main texmf 
tree of your TeX installation (as opposed to installing it inside a 
directory devoted to private classes and packages).  In this case, note 
that the TDS-compliant location for the C.D.P. Bundle, that is, the 
directory inside which you should put all the files listed in 2), is

    tex/latex/cdpbundl/
    
The documentation, on the other hand, should be stored inside

    doc/latex/cdpbundl/

Of course, in order to do so you must have appropriate access priviledges 
to the texmf tree of your site.



HOW TO GENERATE THE DOCUMENTATION
=================================

A shortened form of the documentation, already typeset and packaged in PDF, 
is provided in the file `cdpbundl-doc.pdf' that you might have found on 
some sites (e.g., the CTAN sites).  This file, however, is not part of the 
C.D.P. Bundle and distributors are not requested to include it among the 
distributed files.  Moreover, it does not contain any implementation notes 
(in which most users, though, are not at all interested).

If the distributor from whom you obtained the C.D.P. Bundle did not provide 
the file `cdpbundl-doc.pdf', or if you want the full documentation, 
complete with all the available implementation notes (but, alas, still 
unfinished for many respects), you can generate it following these steps 
(but also see the section titled "The makefile", below):

1) Run LaTeX (_not_ plain TeX) _twice_ on the file `cdpbundl.dtx'.
This, among other things, will generate the files `cdpbundl.idx' and 
`cdpbundl.glo' in the same directory as the file `cdpbundl.dtx'.

2) Run MakeIndex on the file `cdpbundl.idx' obtained in 1), using the style 
file `gind.ist', which is part of the standard LaTeX distribution.

3) Run MakeIndex on the file `cdpbundl.glo' obtained in 1), using the style 
file `gglo.ist', which is part of the standard LaTeX distribution, and 
specifying the file `cdpbundl.gls' as the output file.

4) Run LaTeX _two_ more times on the file `cdpbundl.dtx'.

5) If you wish, you can now delete the following files, to save disk space:

    cdpbundl.aux
    cdpbundl.glo
    cdpbundl.gls
    cdpbundl.idx
    cdpbundl.ilg
    cdpbundl.ind
    cdpbundl.lof
    cdpbundl.log
    cdpbundl.out
    cdpbundl.toc

After step 4), you should get the documentation in DVI format in the file 
`cdpbundl.dvi', located in the same directory as `cdpbundl.dtx', with all 
indexes, table of contents, etc. correctly set.

However, if you are neurotic (as I am) and have a fast computer, you could 
run LaTeX three or four times, instead of two, in step 1)...  :-)

Other LaTeX typesetting engines should work in the same way, perhaps 
producing the output in a different format; for example, you may use 
pdflatex in place of LaTeX to obtain the documentation in PDF.



THE MAKEFILE
============

Starting with version 0.36 of the C.D.P. Bundle, a (quite trivial!) 
makefile that "knows" how to produce the documentation is offered along 
with the Bundle itself.  Although it is not a required part of the 
distribution (as per LPPL), you may find that some distributors supply it 
all the same (I hope the CTAN sites will do so).  With this makefile in 
the same directory as `cdpbundl.dtx', the shell command

    make doc

will take all the necessary actions to produce the full documentation
(in PDF; the modifications you need to introduce into the makefile
in order to obtain DVI output should be quite obvious, however).

The same makefile can also be used to extract the various class, package, 
and ancillary (definition and configuration) files: simply issue the 
command

    make code

at the shell prompt; whereas

    make

will _both_ extract the code _and_ typeset the documentation.  Type

    make help

for more information.


Have fun with the C.D.P. Bundle!

