# `Makefile' for `pst-3dplot.pdf', hv, 2007/03/17

.SUFFIXES : .tex .ltx pdf

PACKAGE = xhfill

MAIN = $(PACKAGE)-doc

LATEX = pdflatex

ARCHNAME = $(MAIN)-$(shell date +%y%m%d)

ARCHFILES = $(PACKAGE).sty $(PACKAGE).tex $(PACKAGE).pro $(MAIN).tex README Changes Makefile

all : doc clean
doc: $(MAIN).pdf

$(MAIN).pdf : $(MAIN).tex
	$(LATEX) $<
	if ! test -f $(basename $<).glo ; then touch $(basename $<).glo; fi
	if ! test -f $(basename $<).idx ; then touch $(basename $<).idx; fi
	$(LATEX) $<

clean : 
	$(RM) $(addprefix $(MAIN), .log .aux .glg .glo .gls .ilg .idx .ind .tmp .toc .out .blg .bbl )
	$(RM) $(addprefix $(MAIN), .xcp)

veryclean : clean
	$(RM) $(addprefix $(MAIN), .pdf .bbl .blg)

arch :
	zip $(ARCHNAME).zip $(ARCHFILES)

# EOF
