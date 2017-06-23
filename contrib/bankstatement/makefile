TEXMF    = $(shell kpsewhich -var-value TEXMFLOCAL)
RM       = rm -f
PKGNAME  = bankstatement

all: package doc example

doc:
	pdflatex $(PKGNAME).dtx
	bibtex $(PKGNAME)
	makeindex -s gind.ist $(PKGNAME)
	makeindex -s gglo.ist $(PKGNAME).glo -o $(PKGNAME).gls
	pdflatex $(PKGNAME).dtx
	bibtex $(PKGNAME)
	makeindex -s gind.ist $(PKGNAME)
	makeindex -s gglo.ist $(PKGNAME).glo -o $(PKGNAME).gls
	pdflatex $(PKGNAME).dtx
	makeindex -s gind.ist $(PKGNAME)
	makeindex -s gglo.ist $(PKGNAME).glo -o $(PKGNAME).gls
	pdflatex $(PKGNAME).dtx

package: 
	pdftex $(PKGNAME).dtx

example:
	pdflatex $(PKGNAME)-example
	pdflatex $(PKGNAME)-example


install: doc
	mkdir -p ${TEXMF}/doc/latex/${PKGNAME}
	cp README.md ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.txt ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.tex ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.pdf ${TEXMF}/doc/latex/${PKGNAME}/
	mkdir -p ${TEXMF}/tex/latex/${PKGNAME}
	cp *.cls ${TEXMF}/tex/latex/${PKGNAME}/
	cp *.def ${TEXMF}/tex/latex/${PKGNAME}/
	texhash

uninstall: 
	rm -rf ${TEXMF}/doc/latex/${PKGNAME}
	rm -rf ${TEXMF}/tex/latex/${PKGNAME}
	texhash
  
git: package
	cp *.cls ./../tex/latex/${PKGNAME}
	cp *.def ./../tex/latex/${PKGNAME}

ctan:
	./copyCTAN

clean:
	$(RM) *.aux *.fdb_latexmk *.fls *.ind *.idx *.ilg *.glo *.gls \
        *.log *.lol *.m *.out *.tmp *.toc *.sh *.hd \
        *.bbl *.blg *.ins *.txt *.bib *.cls *.sty *.tex

cleanall: clean
	$(RM) $(PKGNAME).pdf $(PKGNAME)-example.pdf README.md *.def *.csv

.PHONY: all doc package example install uninstall git ctan clean cleanall
