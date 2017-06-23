#
# Makefile for multibibliography package
#
# This file is in public domain
#
# $Id: Makefile,v 1.8 2015/04/27 19:29:03 boris Exp $
#

PACKAGE=nmbib
SAMPLES = nmsample.tex

PERLSCRIPTS = nmbibtex.pl

MANPAGES = ${PERLSCRIPTS:%.pl=%.1}

all:  $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf}  ${MANPAGES}
	chmod a+x ${PERLSCRIPTS}

%.pdf:  %.dtx   $(PACKAGE).sty 
	pdflatex $<
	perl nmbibtex.pl $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done




%.sty:   %.ins %.dtx  
	pdflatex $<

%.pdf:  %.tex $(PACKAGE).sty
	pdflatex $<
	perl nmbibtex.pl $*
	pdflatex $<
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).sty

%.1: %.pl
	pod2man $< $@

clean:
	$(RM)  $(PACKAGE).sty *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.hd \
	*.dvi *.ps *.tgz *.zip *.brf

veryclean: clean
	$(RM) $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf} ${MANPAGES}

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