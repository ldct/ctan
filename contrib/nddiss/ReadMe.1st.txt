==============================================================

Notre Dame's Dissertation document class by Sameer Vijay
that adheres to the University of Notre Dame guidelines
published in Spring 2004.

Please send any improvements/suggestions to :
    Shari Hill, Graduate Reviewer.
    sharihill@nd.edu or shill2@nd.edu

==============================================================

This is a dissertation class file for the University of Notre
Dame, provided by Sameer Vijay and also can be used for
formatting any thesis as well.

This classfile can possibly be used by students with their
own TeX installation and as such does not need to be
installed in a central file location. One can install them
in a local TEXMF tree on a unix home dir or Windoze mikTeX
installation, or must be in a path searchable by LaTeX.

EXTRACTING
----------

To obtain the nddiss2e class file, process the 'nddiss2e.ins'
through LaTeX.
   $ latex nddiss2e.ins

This will create 2 files - nddiss2e.cls (the classfile) and
template.tex (a template file)

To obtain the documentation for the nddiss2e class, use the
following commands:
   $ latex nddiss2e.dtx
   $ latex nddiss2e.dtx
   $ makeindex -s gglo.ist -o nddiss2e.gls nddiss2e.glo
   $ makeindex -s gglo.ist -o nddiss2e.ind nddiss2e.idx
   $ latex nddiss2e.dtx

This will create a dvi file (nddiss2e.dvi) which is the
documentation for the nddiss2e classfile. If you've pdfTeX
installed as well, you can now use the following command to
generate a pdf documentation.
   $ pdflatex nddiss2e.dtx

Alternatively, one can use the included `process.sh' shell script
to carry out all the above steps.
   $ sh process.sh


TEXMF TREE
----------

As mentioned earlier, it is possible to install this class in a
local TEXMF tree. For eg. in a unix environment, it can be
installed in ~/texmf/tex/latex/nddiss2e/. The file nddiss2e.bst
can be installed in ~/texmf/bibtex/bst/base/. Make sure to run
`cd ~/texmf; mktexlsr' as well to generate index of the local 
TEXMF tree.

Similarly, other classes and packages can be also installed in
the local TEXMF tree.

EXAMPLE THESIS
--------------

The subdirectory `example' contains a sample thesis for the
purpose of demonstrating the usage and output of the various
parameters. The files are the same as in the
sample_ndthesis.tar.gz distribution by Jeff Squyeres and D. A.
Peterson, but modified for the nddiss2e class.

Thanks to D. A. Peterson and others.
