### Makefile --- Makefile for CurVe examples

## Copyright (C) 2010 Didier Verna

## Author:        Didier Verna <didier@lrde.epita.fr>
## Maintainer:    Didier Verna <didier@lrde.epita.fr>
## Created:       Mon Dec  6 11:13:27 2010
## Last Revision: Mon Dec  6 11:25:22 2010

## This file is part of CurVe.

## CurVe may be distributed and/or modified under the
## conditions of the LaTeX Project Public License, either version 1.1
## of this license or (at your option) any later version.
## The latest version of this license is in
## http://www.latex-project.org/lppl.txt
## and version 1.1 or later is part of all distributions of LaTeX
## version 1999/06/01 or later.

## CurVe consists of the files listed in the file `README'.


### Commentary:

## Contents management by FCM version 0.1.


### Code:

TEXI2DVI := texi2dvi

BIB_EXAMPLES = bib splitbib
EXAMPLES := raw $(BIB_EXAMPLES)

PDF_BIB_EXAMPLES = $(BIB_EXAMPLES:%=%.pdf)
DVI_BIB_EXAMPLES = $(BIB_EXAMPLES:%=%.dvi)
ALL_BIB_EXAMPLES = $(PDF_BIB_EXAMPLES) $(DVI_BIB_EXAMPLES)

PDF_EXAMPLES = $(EXAMPLES:%=%.pdf)
DVI_EXAMPLES = $(EXAMPLES:%=%.dvi)
ALL_EXAMPLES = $(PDF_EXAMPLES) $(DVI_EXAMPLES)


all:
	@echo "Please use either the pdf or the dvi target."
pdf: $(PDF_EXAMPLES)
dvi: $(DVI_EXAMPLES)

$(ALL_BIB_EXAMPLES): bib.bib
$(ALL_EXAMPLES): rubric.tex


%.pdf: %.tex
	$(TEXI2DVI) -p $<

%.dvi: %.tex
	$(TEXI2DVI) $<


clean:
	-rm *~ *.aux *.lo* *.bbl *.blg *.sbb *.out

distclean: clean
	-rm $(ALL_EXAMPLES)


.PHONY: all pdf dvi clean distclean


### Makefile ends here
