#******************************************************************************
#* $Id: Makefile,v 1.9 2009/09/13 08:37:19 gene Exp gene $
#******************************************************************************
#* Author: Gerd Neugebauer
#*=============================================================================

INSTALLDIR = /usr/local/lib/texmf/tex/latex/cwpuzzle

FILES	   = cwpuzzle.dtx	\
	     cwpuzzle.ins	\
	     Makefile		\
	     README

LATEX      = latex
PDFLATEX   = pdflatex
MAKEINDEX  = makeindex
RM         = rm -f
INSTALL    = install
MKDIR      = mkdir

#*=============================================================================

all: cwpuzzle.pdf

cwpuzzle.sty sty: cwpuzzle.dtx cwpuzzle.ins
	$(RM) cwpuzzle.cls cwpuzzle.sty
	$(PDFLATEX) cwpuzzle.ins

cwpuzzle.dvi dvi: cwpuzzle.dtx cwpuzzle.sty
	$(LATEX) cwpuzzle.dtx
	$(LATEX) cwpuzzle.dtx
	$(MAKEINDEX) -s gind.ist cwpuzzle
	$(MAKEINDEX) -s gglo.ist -o cwpuzzle.gls cwpuzzle.glo
	$(LATEX) cwpuzzle.dtx

cwpuzzle.pdf pdf: cwpuzzle.sty cwpuzzle.gls
	$(PDFLATEX) cwpuzzle.dtx
	$(PDFLATEX) cwpuzzle.dtx
	$(MAKEINDEX) -s gind.ist cwpuzzle
	$(MAKEINDEX) -s gglo.ist -o cwpuzzle.gls cwpuzzle.glo
	$(PDFLATEX) cwpuzzle.dtx

cwpuzzle.gls:

zip dist: ${FILES} cwpuzzle.pdf
	zip cwpuzzle-` perl -n -e 'print $$1 if m/\\\\def\\\\fileversion[{](.*)[}]/' cwpuzzle.dtx`.zip \
	    ${FILES} cwpuzzle.pdf

clean:
	$(RM) cwpuzzle.log cwpuzzle.aux cwpuzzle.glo cwpuzzle.gls \
	      cwpuzzle.idx cwpuzzle.ilg cwpuzzle.ind cwpuzzle.toc

veryclean: clean
	$(RM) cwpuzzle.cls cwpuzzle.sty cwpuzzle.dvi cwpuzzle.pdf

#
