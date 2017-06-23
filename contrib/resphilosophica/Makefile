#
# Makefile for resphilosophica package
#
# This file is in public domain
#
# $Id: Makefile,v 1.10 2017/03/28 16:39:12 boris Exp $
#

PACKAGE=resphilosophica

SAMPLES = rpsample.tex 

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
	$(RM)  $(PACKAGE).cls *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls \
	*.dvi *.ps *.hd *.rpi *.notes

distclean: clean
	$(RM) $(PDF) 

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	tar -czvf $(PACKAGE).tgz -C .. --exclude '*~' \
	--exclude '*.tgz' --exclude CVS \
	--transform 's/latex/resphilosophica/' latex
