#
# Makefile for issuulinks package
#
# This file is in public domain
#
# $Id: Makefile,v 1.2 2012-02-25 21:06:49 boris Exp $
#

PACKAGE=issuulinks

SAMPLESTEX = sample.tex

SAMPLESPDF = ${SAMPLESTEX:%.tex=%.pdf}

all:  $(PACKAGE).pdf $(SAMPLESPDF)


%.pdf:  %.dtx   $(PACKAGE).sty
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


%.pdf:  %.tex   $(PACKAGE).sty
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex  -o $*.ind $*.idx
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done



%.sty:   %.ins %.dtx  
	pdflatex $<



.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).sty


clean:
	$(RM)  *.sty *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls \
	*.dvi *.ps *.hd

distclean veryclean: clean
	$(RM) *.pdf

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	cd ..; \
	tar -czvf $(PACKAGE).tgz --exclude '*~' --exclude '*.tgz' --exclude CVS $(PACKAGE);\
	mv $(PACKAGE).tgz $(PACKAGE);\
	cd $(PACKAGE)
