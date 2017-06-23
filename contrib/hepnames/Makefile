HN  := hepnames
HPN := heppennames
HNN := hepnicenames

PDFLATEX := pdflatex --interaction=nonstopmode
LATEX := latex "\scrollmode\input"
DVIPS := dvips

ifndef V
OUTPUT := > /dev/null 2> /dev/null
#$(info OUTPUT = $(OUTPUT))
endif

.PHONY: all pdf ps clean

all: pdf $(HN).tar.gz
	@true

pdf: $(HN).pdf $(HNN)-rm.pdf $(HNN)-it.pdf $(HPN)-rm.pdf $(HPN)-it.pdf
	@true

ps: $(HN).ps $(HNN)-rm.ps $(HNN)-it.ps $(HPN)-rm.ps $(HPN)-it.ps
	@true

$(HN).tar.gz: README ChangeLog $(wildcard *.sty) $(wildcard *.pdf) $(wildcard *.tex) mkmacrotables Makefile
	@echo "Building $@ archive"
	tar czf $@ README ChangeLog *.sty *.pdf *.tex mkmacrotables Makefile

%.pdf: %.tex $(HNN)-macros.tex $(HPN)-macros.tex $(wildcard *.sty)
	@echo "Running pdflatex on $< ..."
	@$(PDFLATEX) $< $(OUTPUT)

%.ps: %.dvi
	@echo "Running dvips on $< ..."
	@$(DVIPS) $< $(OUTPUT)

%.dvi: %.tex $(HNN)-macros.tex $(HPN)-macros.tex $(wildcard *.sty)
	@echo "Running latex on $< ..."
	@$(LATEX) $< $(OUTPUT)

$(HNN)-macros.tex $(HNN)-rm.tex $(HNN)-it.tex $(HPN)-macros.tex $(HPN)-rm.tex $(HPN)-it.tex : $(wildcard *.sty) mkmacrotables
	@echo "Running mkmacrotables to generate code -> symbol tables"
	@./mkmacrotables

clean:
	rm -f *.tar.gz *.tgz *.dvi *.log *.aux *.pdf *.ps *.tmp *-macros.tex *-rm.tex *-it.tex
