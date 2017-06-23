TEXMF    = $(shell kpsewhich -var-value TEXMFLOCAL)
BINDIR   = /usr/local/bin
RM       = rm -f
PKGNAME  = getmap

all: doc

doc: package $(PKGNAME).pdf

$(PKGNAME).pdf:
	pdflatex -shell-escape $(PKGNAME).dtx
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
	dos2unix ./copyCTAN

install: doc
	mkdir -p ${TEXMF}/doc/latex/${PKGNAME}
	cp README ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.txt ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.dtx ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.tex ${TEXMF}/doc/latex/${PKGNAME}/
	cp *.pdf ${TEXMF}/doc/latex/${PKGNAME}/
	mkdir -p ${TEXMF}/tex/latex/${PKGNAME}
	cp *.sty ${TEXMF}/tex/latex/${PKGNAME}/
	cp *.cfg ${TEXMF}/tex/latex/${PKGNAME}/
	mkdir -p ${TEXMF}/scripts/${PKGNAME}
	cp getmapdl.lua ${TEXMF}/scripts/${PKGNAME}/
	texhash
	chmod 0755 ${TEXMF}/scripts/${PKGNAME}/getmapdl.lua
	ln -s ${TEXMF}/scripts/${PKGNAME}/getmapdl.lua ${BINDIR}/getmapdl

uninstall: 
	rm -rf ${TEXMF}/doc/latex/${PKGNAME}
	rm -rf ${TEXMF}/tex/latex/${PKGNAME}
	rm -rf ${TEXMF}/scripts/${PKGNAME}
	rm -f  ${BINDIR}/getmapdl
	texhash

styles: package
	cp *.sty ${TEXMF}/tex/latex/${PKGNAME}/

git: package
	cp getmapdl.lua ./../dev/scripts/getmap/getmapdl.lua
	cp getmap.sty ./../dev/tex/latex/getmap/getmap.sty
	cp getmap.cfg ./../dev/tex/latex/getmap/getmap.cfg
	cp README.md ./../README.md

ctan:
	./copyCTAN

clean:
	$(RM) *.aux *.fdb_latexmk *.fls *.ind *.idx *.ilg *.glo *.gls \
        *.log *.lol *.m *.out *.tmp *.toc *.sh *.hd \
        *.bbl *.blg *.ins *.bib *.epl

cleanall: clean
	$(RM) getmapdl.lua *.sty *.png *.jpg manifest.txt \
        *.cfg *.tex README.md getmap.pdf

.PHONY: all doc package install uninstall styles git ctan clean cleanall
