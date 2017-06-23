#******************************************************************************
#* This file is part of limap.
#*
#* Copyright (C) 1999-2016 Gerd Neugebauer
#*
#* limap may be distributed under the terms of the LaTeX Project
#* Public License version 1.3c, as described in lppl.txt.
#*
#*=============================================================================

LATEX		= latex
LUALATEX	= lualatex
MAKEINDEX	= makeindex

DISTFILES	= README.md		\
		  limap.dtx		\
		  limap.ins		\
		  Makefile		\
		  lppl.txt		\
		  samples/boxed-toc.ltx	\
		  samples/hyper.ltx	\
		  samples/nolines.ltx	\
		  samples/sample.ltx	\
		  limap.pdf		\
		  samples/boxed-toc.pdf	\
		  samples/hyper.pdf	\
		  samples/nolines.pdf	\
		  samples/sample.pdf

all: limap.cls limap.pdf

cls sty limap.cls limap.sty: limap.dtx limap.ins
	${RM} limap.cls limap.sty
	${LATEX} limap.ins

doc pdf limap.pdf: limap.sty limap.dtx
	${LUALATEX} limap.dtx
	${MAKEINDEX} -s gind.ist limap
	${MAKEINDEX} -s gglo.ist -o limap.gls limap.glo
	${LUALATEX} limap.dtx

limap.dvi: limap.sty limap.dtx
	${LATEX} limap.dtx
	${MAKEINDEX} -s gind.ist limap
	${MAKEINDEX} -s gglo.ist -o limap.gls limap.glo
	${LATEX} limap.dtx

#------------------------------------------------------------------------------

%.pdf: %.ltx limap.cls
	@${LUALATEX} $<
	@${LUALATEX} $<
	@mv $(notdir ${<:.ltx=.pdf}) ${<:.ltx=.pdf}
	@rm -f $(notdir ${<:.ltx=.aux}) $(notdir ${<:.ltx=.log}) $(notdir ${<:.ltx=.out})

#------------------------------------------------------------------------------

dist: distclean limap.zip

zip limap.zip: $(DISTFILES)
	(cd ..; zip limap/limap.zip $(addprefix limap/,$(DISTFILES)))

#------------------------------------------------------------------------------

clean:
	${RM} *.aux *.glo *.gls *.idx *.ilg *.ind *.log *.toc *.out *~ *.dvi *.pdf samples/*.pdf

distclean: clean
	${RM} limap.cls limap.sty limap*.zip

#------------------------------------------------------------------------------
