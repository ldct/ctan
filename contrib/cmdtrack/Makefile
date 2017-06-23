# Copyright 2012 TeX Users Group.
# This file is part of the cmdtrack package, released under the LPPL;
# see cmdtrack.dtx for details.

pkg = cmdtrack
#
opt = --interaction=nonstopmode --file-line-error
latex = latex $(opt)
pdflatex = pdflatex $(opt)

$(pkg).pdf: $(pkg).sty $(pkg).dtx
	$(pdflatex) $(pkg).dtx
	$(pdflatex) $(pkg).dtx

$(pkg).sty: $(pkg).ins $(pkg).dtx
	$(latex) $<

dist: $(pkg).zip
$(pkg).zip: Makefile README $(pkg).dtx $(pkg).pdf $(pkg).ins
	chmod a+rw $^
	rm -f $@; zip $@ $^
