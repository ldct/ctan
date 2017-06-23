#
# Makefile for resphilosophica package
#
# This file is in public domain
#
# $Id: Makefile,v 1.5 2014-12-23 17:16:01 boris Exp $
#

PACKAGE=afparticle

SAMPLES = afpsample.tex 

PDF = $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf}

all:  ${PDF} 


%.pdf:  %.dtx   $(PACKAGE).cls
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


%.cls:   %.ins %.dtx  
	pdflatex $<

%.pdf:  %.tex   $(PACKAGE).cls 
	pdflatex $<
	- bibtex $*
	pdflatex $<
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).cls


clean:
	$(RM)  *.log *.aux *.spl \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls \
	*.dvi *.ps *.hd *.rpi *.notes

distclean: clean
	$(RM) $(PDF) $(PACKAGE).cls 

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	tar -C .. -czvf $(PACKAGE).tgz --exclude '*~' --exclude '*.tgz' --exclude CVS  $(PACKAGE)