FILEROOT=ryesample

SHELL=/bin/sh

VERSION=$(shell grep changes ryethesis.dtx | perl -wlne 'print $$1 if /v([0-9]+\.[0-9]+)/' | sort -n | tail -1)

LATEX=pdflatex

TEXFILES=ryesample.tex
BIBFILES=ryesample.bib
FIGS=figure1.pdf
FILES=README ryethesis.ins ryethesis.dtx ryethesis.pdf ryesample.pdf Makefile
EXTRACLEAN=*.aux *.lof *.lot *.loa *.log *.bbl *.blg *.ind *.ilg *.toc *.idx *.gls *.glo *.out *~ *.nls *.nlo *.ist *.toa *.glg *.acn *.acr *.alg *.fdb_latexmk *.synctex.gz *.dvi auto ryethesis-*.zip

TEXMFFLAGS=-file-line-error -halt-on-error #-interaction=batchmode

TARGETS=ryethesis.cls ryethesis.pdf ryesample.pdf ryethesis-$(VERSION).zip

all: $(TARGETS)

.PHONY: again.and.again once bibtex glossary index nomenclature 

once: 
	@$(LATEX) $(TEXMFFLAGS) $(FILEROOT) || (rm -f $(FILEROOT).pdf; exit 2);

bibtex: 
	@bibtex -terse $(FILEROOT) 

glossary:
	@if [ -f $(FILEROOT).ist ]; then makeglossaries -q $(FILEROOT) ; fi

index:
	@if [ -f $(FILEROOT).idx ]; then makeindex -q $(FILEROOT) ; fi

nomenclature:
	@if [ -f $(FILEROOT).nlo ]; then makeindex -q $(FILEROOT).nlo -s nomencl.ist -o $(FILEROOT).nls; fi

again.and.again:
	@if [ $(MAKELEVEL) = 4 ]; then \
	   echo "Too many nesting levels of make!"; exit 1; \
	fi
	$(MAKE) once
	@if `grep -q -e "There were undefined references" -e "There were multiply-defined labels" -e "Label(s) may have changed. Rerun to get cross-references right" $(FILEROOT).log`; \
	  then $(MAKE) again.and.again; \
	fi

clean:
	@rm -rf $(EXTRACLEAN)

clean-all:
	@make clean;
	@rm -rf $(TARGETS)

$(FILEROOT).pdf: Makefile ryethesis.cls ${TEXFILES} ${BIBFILES} ${FIGS}
	@$(MAKE) once
	@$(MAKE) bibtex
	@$(MAKE) glossary
	@$(MAKE) index
	@$(MAKE) nomenclature
	@$(MAKE) again.and.again

ryethesis.pdf: Makefile ryethesis.dtx
	echo "Making "$@
	@$(LATEX) $(TEXMFFLAGS) ryethesis.dtx || ( cat ryethesis.log; exit 1 )
	@$(LATEX) $(TEXMFFLAGS) ryethesis.dtx || ( cat ryethesis.log; exit 2 )

ryethesis.cls: Makefile ryethesis.ins ryethesis.dtx
	echo "Making "$@
	@$(LATEX) $(TEXMFFLAGS) ryethesis.ins || ( cat ryethesis.log; exit 1 )

ryethesis-$(VERSION).zip: ${FILES} ${TEXFILES} ${BIBFILES} ${FIGS}
	@rm -f ryethesis-*.zip; rm -rf ./ryethesis; mkdir ryethesis; cp $^ ryethesis; zip $@ ryethesis/*; rm -rf ./ryethesis;

