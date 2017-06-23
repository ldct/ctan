#
# Makefile for multibibliography package
#
# This file is in public domain
#
# $Id: Makefile,v 1.4 2013-05-30 02:20:11 boris Exp $
#

PACKAGE=multibibliography
SAMPLES = tug-paper.tex

all:  $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf} 
	chmod a+x multibibliography.pl

%.pdf:  %.dtx   $(PACKAGE).sty
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


%.pdf:  %.tex   $(PACKAGE).sty multibibliography.pl
	pdflatex $<
	- perl multibibliography.pl $<
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


%.sty:   %.ins %.dtx  
	pdflatex $<



.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).sty


clean:
	$(RM)  $(PACKAGE).sty *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls \
	*.dvi *.ps *.tgz *.zip *.brf

veryclean: clean
	$(RM) $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf} 

distclean: veryclean

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	tar -czvf $(PACKAGE).tgz --exclude '*~' --exclude '*.tgz' --exclude CVS .

zip:  all clean
	${MAKE} $(PACKAGE).sty
	$(RM) *.log
	zip -r  $(PACKAGE).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'