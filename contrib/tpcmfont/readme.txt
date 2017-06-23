
TPCMFONT: Font Definition files for "True Point Computer Modern"
(and actually, for Computer Concrete in T1 encoding, too).
For example, cmr11 is declared as cmr11, not as cmr10 at 10.95pt.

This package is meant to replace (most of) the .fd -files distributed
with the standard LaTeX.

To install tpcmfont:

	1) move to an empty directory or create one
	2) copy tpcmfont.fdd and tpcmfont.ins therein
	3) run latex on tpcmfonts.ins
	4) (optional) copy the .fd -files distributed with
	   LaTeX to some backup directory
	5) replace the old .fd -files (in som LaTeX input directory)
	   with the ones just created.
	6) (optional) run latex on tpcmfonts.fdd and admire the missing
	   documentation.

Timo Knuutila
knuutila@utu.fi

