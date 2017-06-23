
PACKAGE := minidocument

TEXMFDIST:=$(shell kpsewhich -var-value TEXMFDIST)

all: sty doc

sty: $(PACKAGE).sty
$(PACKAGE).sty: $(PACKAGE).dtx $(PACKAGE).ins
	pdflatex ${PACKAGE}.ins

doc: $(PACKAGE).pdf
$(PACKAGE).pdf: $(PACKAGE).dtx
	pdflatex ${PACKAGE}.dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	pdflatex ${PACKAGE}.dtx
	pdflatex ${PACKAGE}.dtx

install: $(PACKAGE).dtx $(PACKAGE).ins $(PACKAGE).sty README $(PACKAGE).pdf
	install -m 755 -d $(TEXMFDIST)/source/latex/$(PACKAGE)
	install -m 644 -t $(TEXMFDIST)/source/latex/$(PACKAGE) $(PACKAGE).dtx
	install -m 644 -t $(TEXMFDIST)/source/latex/$(PACKAGE) $(PACKAGE).ins
	install -m 755 -d $(TEXMFDIST)/tex/latex/$(PACKAGE)
	install -m 644 -t $(TEXMFDIST)/tex/latex/$(PACKAGE) $(PACKAGE).sty
	install -m 755 -d $(TEXMFDIST)/doc/latex/$(PACKAGE)
	install -m 644 -t $(TEXMFDIST)/doc/latex/$(PACKAGE) README
	install -m 644 -t $(TEXMFDIST)/doc/latex/$(PACKAGE) $(PACKAGE).pdf

dist: $(PACKAGE).tar.gz
$(PACKAGE).tar.gz: Makefile README $(PACKAGE).dtx $(PACKAGE).ins $(PACKAGE).pdf
	tar -cjf $@ --transform "s#^#$(PACKAGE)/#" $^

