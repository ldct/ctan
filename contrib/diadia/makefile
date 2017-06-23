TEXMF    = $(shell kpsewhich -var-value TEXMFLOCAL)
RM       = rm -f
PKGNAME  = diadia

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
	mv README.txt README

example:
	pdflatex $(PKGNAME)-example
	pdflatex $(PKGNAME)-example


install: doc
	mkdir -p ${TEXMF}/doc/latex/${PKGNAME}
	cp README ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.txt ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.dat ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.tex ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.pdf ${TEXMF}/doc/latex/${PKGNAME}/
	mkdir -p ${TEXMF}/scripts/${PKGNAME}
	cp *.lua ${TEXMF}/scripts/${PKGNAME}/
	mkdir -p ${TEXMF}/tex/latex/${PKGNAME}
	cp *.sty ${TEXMF}/tex/latex/${PKGNAME}/
	cp *.cfg ${TEXMF}/tex/latex/${PKGNAME}/
	cp *.trsl ${TEXMF}/tex/latex/${PKGNAME}/
	texhash

uninstall: 
	rm -rf ${TEXMF}/doc/latex/${PKGNAME}
	rm -rf ${TEXMF}/scripts/${PKGNAME}
	rm -rf ${TEXMF}/tex/latex/${PKGNAME}
	texhash
  
git: package
	cp *.sty ./../tex/latex/${PKGNAME}
	cp *.cfg ./../tex/latex/${PKGNAME}
	cp *.trsl ./../tex/latex/${PKGNAME}
	cp *.lua ./../scripts/${PKGNAME}

ctan:
	./copyCTAN

clean:
	$(RM) *.aux *.fdb_latexmk *.fls *.ind *.idx *.ilg *.glo *.gls \
        *.log *.lol *.m *.out *.tmp *.toc *.sh *.hd \
        *.bbl *.blg *.ins *.txt *.bib

cleanall: clean
	$(RM) $(PKGNAME).pdf $(PKGNAME)-example.pdf $(PKGNAME)-example.tex \
	      $(PKGNAME).sty $(PKGNAME).lua README *.dat *.trsl *.tex

.PHONY: all doc package example install uninstall git ctan clean cleanall
