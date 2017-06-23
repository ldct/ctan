#******************************************************************************
#* $Id: Makefile 8333 2010-12-29 19:58:06Z gene $
#******************************************************************************
#* Author: Gerd Neugebauer
#*=============================================================================

DISTFILES = productbox.ins \
	    productbox.dtx \
	    productbox.bib \
	    README         \
	    Makefile       \
	    productbox.pdf

all: productbox.pdf

%.pdf: %.dtx productbox.sty %.bbl %.ind %.gls
	pdflatex -interaction=batchmode -draftmode $*.dtx
	pdflatex -interaction=batchmode $*.dtx
	${RM} $*.out

%.sty: %.dtx *.ins
	rm -f $*.sty
	tex $*.ins

%.bbl: %.aux *.bib
	bibtex $*

%.ind: %.idx
	makeindex -s gind $*.idx

%.idx: %.dtx
	pdflatex -draftmode $*.dtx

%.aux: %.dtx
	pdflatex -draftmode $*.dtx

%.gls: %.glo
	makeindex -s gglo -o $*.gls $*.glo

%.glo: %.dtx
	pdflatex -draftmode $*.dtx

#------------------------------------------------------------------------------

productbox.tgz dist: productbox.pdf
	tar -cvzf productbox.tgz ${DISTFILES}

clean:
	${RM} productbox.aux productbox.ilg productbox.idx productbox.log productbox.toc productbox.glo productbox.out *~

distclean: clean
	${RM} productbox.sty productbox.pdf

#
