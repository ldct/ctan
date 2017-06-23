TEXMFHOME=/usr/local/share/texmf
DESTDIR=$(TEXMFHOME)/tex/latex/unswcover

INSTALL=install
TEXHASH=texhash
INKSCAPE=inkscape
LATEX=pdflatex
BIBTEX=bibtex

STYLE=unswcover.sty
LOGOSBASE=logo_unsw_short.

LOGOSPS=$(LOGOSBASE:.=.ps)
LOGOSPDF=$(LOGOSBASE:.=.pdf)
LOGOS=$(LOGOSPS) $(LOGOSPDF)

PACKAGENAME=unswcover-$(shell date +%Y%m%d)

all: $(LOGOS) thesis.pdf

thesis.aux: thesis.tex
	$(LATEX) -draftmode -interaction nonstopmode $< > /dev/null
thesis.pdf: thesis.tex thesis.aux
	$(BIBTEX) $(<:.tex=.aux) 
	$(LATEX) -halt-on-error -interaction nonstopmode $< > /dev/null
	$(LATEX) -halt-on-error -interaction nonstopmode $< > /dev/null

install: $(STYLE) $(LOGOS)
	$(INSTALL) -m 0755 -d $(DESTDIR)
	$(INSTALL) -m 0644 $(STYLE) $(LOGOS) $(ARTWORK) $(DESTDIR)
	$(TEXHASH) $(TEXMFHOME)

package: $(PACKAGENAME).tar.bz2
$(PACKAGENAME).tar.bz2: $(STYLE) $(LOGOS) $(ARTWORK) README COPYING Makefile thesis.tex thesis.bib thesis.pdf
	test ! -d $(PACKAGENAME)
	for FILE in $^; do\
		DIR=$(PACKAGENAME)/`dirname $$FILE`; \
		mkdir -p $$DIR; \
		cp $$FILE $$DIR; \
	done
	tar cjvf $@ $(PACKAGENAME)
	rm -rf $(PACKAGENAME)

%.ps: %.svg
	$(INKSCAPE) -P $@ $<
%.pdf: %.svg
	$(INKSCAPE) -A $@ $<

clean:
	rm -f *.pdf *.ps
	rm -f *.log *.out *.nav *.snm *.toc *.bbl *.bcf *.blg *-blx.bib *.run.xml
	
real-clean: clean
	rm -rf unswcover-*
	rm -f *.aux

.PHONY: all install package clean real-clean
