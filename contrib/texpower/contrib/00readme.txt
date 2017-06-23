======================================================================

			   TeXPower bundle
			  Directory: contrib

	    This readme file last changed on Mar 15, 2002

  Author: Stephan Lehmke <mailto:Stephan.Lehmke@cs.uni-dortmund.de>
	  Lehrstuhl Informatik I
	  Universität Dortmund
	  Dortmund, Germany

======================================================================


This directory contains some additions to the TeXPower bundle
contributed by other people.


======================================================================

Contents:
=========

This directory contains the following files:

config.landscapeplus
	
dvips configuration file which provides new paper sizes letterl and
a4l for landscape documents in the respective sizes. Use by passing
the option

-Plandscapeplus

to dvips (you can have as many -P options as you like).

Using this will avoid turned and cropped pages with ghostscript's
ps2pdf.

Contributed by Berthold Crysmann <crysmann@dfki.de>.


tpmultiinc.tar

Archive containing a package for including a sequence of graphics
files which represents an `incremental diagram'. There is a patch to
xfig available from

http://www-sp.iti.informatik.tu-darmstadt.de/software/xfig/

which allows to generate such a sequence of files in MetaPost format.

There are some inline comments in tpmultiinc.sty which explain
usage. Furthermore, the archive contains some examples.

Contributed by Holger Wenzel <H.Wenzel@itm.rwth-aachen.de>.
