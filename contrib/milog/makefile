TEXMF    = $(shell kpsewhich -var-value TEXMFLOCAL)
RM       = rm -f
PKGNAME  = milog

all: package doc example

doc: git example
	pdflatex $(PKGNAME).dtx
	bibtex $(PKGNAME)
	makeindex -s gind.ist $(PKGNAME).idx
	makeindex -s gglo.ist $(PKGNAME).glo -o $(PKGNAME).gls
	pdflatex $(PKGNAME).dtx
	bibtex $(PKGNAME)
	makeindex -s gind.ist $(PKGNAME).idx
	makeindex -s gglo.ist $(PKGNAME).glo -o $(PKGNAME).gls
	pdflatex $(PKGNAME).dtx
	bibtex $(PKGNAME)
	makeindex -s gind.ist $(PKGNAME).idx
	makeindex -s gglo.ist $(PKGNAME).glo -o $(PKGNAME).gls
	sed -i -e '17,27d' $(PKGNAME).ind
	pdflatex $(PKGNAME).dtx

package: 
	pdftex $(PKGNAME).dtx
	mv milog.sh milog
	mv README.md ./../README.md

example:
	pdflatex $(PKGNAME)-example
	pdflatex $(PKGNAME)-example
	pdflatex $(PKGNAME)-formular
	pdflatex $(PKGNAME)-formular


install: doc
	mkdir -p ${TEXMF}/doc/latex/${PKGNAME}
	cp README.md ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.txt ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.tex ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.cfg ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.dat ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.csv ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.pdf ${TEXMF}/doc/latex/${PKGNAME}/
	mkdir -p ${TEXMF}/tex/latex/${PKGNAME}
	cp *.cls ${TEXMF}/tex/latex/${PKGNAME}/
	texhash

uninstall: 
	rm -rf ${TEXMF}/doc/latex/${PKGNAME}
	rm -rf ${TEXMF}/tex/latex/${PKGNAME}
	texhash
  
git: package
	cp *.cls ./../tex/latex/${PKGNAME}

ctan: git
	./copyCTAN

clean:
	$(RM) *.aux *.fdb_latexmk *.fls *.ind *.idx *.ilg *.glo *.gls \
        *.log *.lol *.m *.out *.tmp *.toc *.sh *.hd mlgdoc.csv \
        *.bbl *.blg *.ins *.bib *.sty

cleanall: clean
	$(RM) $(PKGNAME).pdf $(PKGNAME)-example.pdf $(PKGNAME)-formular.pdf \
        $(PKGNAME) README.md *.cfg *.csv *.dat *.tex *.txt *.cls

.PHONY: all doc package example install uninstall git ctan clean cleanall
