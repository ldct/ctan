
README for the `xt_capts' package (February 1998)
=================================

Abstract:
---------
This package allows to define language dependent text macros. They are
called \emph{extended captions}, because \emph{caption} is the term that is
used in \LaTeX2e for denoting language dependent words.

Whenever a new language is selected, the appropriate macros are used,
provided they have been defined. In addition, a default variant can be
defined for \emph{all} languages. And it is possible to use a fixed
language for a caption, which is not affected by changing the current
language.


Installation:
-------------
Running LaTeX on the file `xt_capts.ins' will produce the package file
`xt_capts.sty'. So you should first process

  latex xt_capts.ins

The resulting package file should then be moved to a directory on
LaTeX's standard input path.


Documentation:
--------------
The documented source code of this package is in the file `xt_capts.dtx'.
Documentation for the package may be obtained by running LaTeX on that file.

For example:

  latex xt_capts.dtx

will produce the file xt_capts.dvi, documenting the package.



Good Luck!

Olaf Fricke (ofricke@cs.tu-berlin.de)
