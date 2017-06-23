#
#
# This file is in public domain
#
# $Id: Makefile,v 1.2 2015-02-27 22:01:15 boris Exp $
#

PACKAGE=fitbox
SAMPLES = sample.tex

all:  $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf} 

%.pdf:  %.dtx   $(PACKAGE).sty
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done




%.sty:   %.ins %.dtx  
	pdflatex $<

%.pdf:  %.tex $(PACKAGE).sty
	pdflatex $*
	-bibtex $*
	pdflatex $*
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $*; done


.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).sty


clean:
	$(RM)  $(PACKAGE).sty *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.hd \
	*.dvi *.ps *.tgz *.zip *.brf

veryclean: clean
	$(RM) $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf} 

distclean: veryclean

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	tar -czvf $(PACKAGE).tgz -C .. --exclude '*~' --exclude '*.tgz' --exclude CVS $(PACKAGE)

zip:  all clean
	${MAKE} $(PACKAGE).sty
	$(RM) *.log
	zip -r  $(PACKAGE).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'