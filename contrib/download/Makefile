TEXMFHOME ?= $(shell kpsewhich -var-value TEXMFHOME)
.PHONY: all clean distclean install dist
all: download.pdf
clean:
	rm -f *.gl? *.id? *.aux # problematic files
	rm -f *.bbl *.bcf *.bib *.blg *.xdy # biblatex
	rm -f *.fls *.log *.out *.run.xml *.toc # junk
distclean: clean
	rm -f *.cls *.sty *.clo *.tar.gz *.tds.zip
	git reset --hard

%.pdf: %.tex %.sty
	makeglossaries $*
	biber $*
	pdflatex -shell-escape $<
	makeglossaries $*
	pdflatex -shell-escape $<

%.sty: %.tex
	pdflatex $<

install: all
	install -m 0644 download.sty $(TEXMFHOME)/tex/latex/download/download.sty
	install -m 0644 download.pdf $(TEXMFHOME)/doc/latex/download/download.pdf
	install -m 0644 download.tex $(TEXMFHOME)/source/latex/download/download.tex
	install -m 0644 README $(TEXMFHOME)/doc/latex/download/README
	-mktexlsr

download.tds.zip: download.tex download.pdf download.sty
	mkdir -p download/{tex,doc,source}/latex/download
	cp download.sty download/tex/latex/download/download.sty
	cp download.pdf download/doc/latex/download/download.pdf
	cp download.tex download/source/latex/download/download.tex
	cp README download/doc/latex/download/README
	cd download && zip -r ../download.tds.zip *
	rm -rf download

download.tar.gz: download.tds.zip download.tex download.pdf
	mkdir -p download
	cp download.tex download/download.tex
	cp download.pdf download/download.pdf
	cp README download/README
	cp Makefile download/Makefile
	tar -czf $@ download download.tds.zip
	rm -rf download

dist: download.tar.gz
