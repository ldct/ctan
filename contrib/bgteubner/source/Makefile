## bgteubner class bundle
##
## Makefile
## Copyright 2003--2017 Harald Harders
#
# This program may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license or (at your opinion) any later version.
# The latest version of this license is in
#    http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of LaTeX
# version 1999/12/01 or later.
#
# This program consists of all files listed in manifest.txt.

SRCDIR=bgteubner
INSTALLDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/bgteubner
PTMXCOMPDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/ptmxcomp
DOCDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/doc/latex/bgteubner
IDXDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/makeindex/bgteubner
BSTDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/bibtex/bst/bgteubner
VERSION=`latex getversion | grep '^VERSION' | sed 's/^VERSION \\(.*\\)\\.\\(.*\\)/\\1_\\2/'`

.SUFFIXES: .sty .ins .dtx .dvi .ps .pdf .cls .bst .ist

.ins.cls:
	latex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<
	cp $(*D)/$(*F).pdf ../doc/

.dvi.ps:
	dvips -o $(*D)/$(*F).ps $(*D)/$(*F)


all: bgteubner.cls bgteucls.pdf cdcover.pdf

bgteubner.cls: bgteucls.ins bgteucls.dtx
	latex bgteucls.ins

bgteucls.pdf: bgteucls.dtx bgteucls.ins

cdcover.pdf: cdcover.tex
	@if [ "`kpsewhich cd-cover.sty`" ]; then pdflatex cdcover; fi

clean:
	@-rm -f bgteucls.glo bgteucls.gls bgteucls.idx bgteucls.ilg
	@-rm -f bgteucls.ind bgteucls.aux bgteucls.log bgteucls.toc
	@-rm -f bgteucls.dvi getversion.log
	@-rm -f *~

distclean: clean
	@-rm -f bgteucls.pdf
	@-rm -f bgteubner.cls bgteubner.ist bgteuversion.tex
	@-rm -f bgteuglo.ist bgteuglochar.ist bgteu*.bst
	@-rm -f cdcover.aux cdcover.log cdcover.tex cdcover.pdf

tar:	all clean
	if [ ! -f "../bgteubner" ]; then (cd .. ; ln -s source bgteubner ); fi
	echo Generate bgteubner-$(VERSION).tar.gz
	-rm -f bgteubner-$(VERSION).tar.gz
	tar czCf .. bgteubner-$(VERSION).tar.gz \
	  $(SRCDIR)/Makefile \
	  $(SRCDIR)/bgteucls.dtx \
	  $(SRCDIR)/bgteucls.ins \
	  $(SRCDIR)/ptmxcomp.sty \
	  $(SRCDIR)/ChangeLog \
	  $(SRCDIR)/getversion.tex
	rm -f getversion.log ../bgteubner

install: all
	if [ ! -d $(INSTALLDIR) ]; then mkdirhier $(INSTALLDIR); fi
	if [ ! -d $(PTMXCOMPDIR) ]; then mkdirhier $(PTMXCOMPDIR); fi
	if [ ! -d $(DOCDIR) ]; then mkdirhier $(DOCDIR); fi
	if [ ! -d $(IDXDIR) ]; then mkdirhier $(IDXDIR); fi
	if [ ! -d $(BSTDIR) ]; then mkdirhier $(BSTDIR); fi
	install -m644 bgteubner.cls $(INSTALLDIR)
	install -m644 ptmxcomp.sty $(PTMXCOMPDIR)
	install -m644 bgteucls.pdf $(DOCDIR)
	install -m644 ../doc/bgteubner-17x24-mathtime.pdf $(DOCDIR)/bgteubner.pdf
	install -m644 bgteubner.ist $(IDXDIR)
	install -m644 bgteuglo.ist $(IDXDIR)
	install -m644 bgteuglochar.ist $(IDXDIR)
	install -m644 bgteu*.bst $(BSTDIR)
	texhash

tds: all 
	-@rm -f bgteubner-$(VERSION)-tds.zip
	-@rm -f ../pakete/bgteubner-v*-tds.zip
	mkdirhier tex/latex/bgteubner
	mkdirhier tex/latex/ptmxcomp
	mkdirhier makeindex/bgteubner
	mkdirhier bibtex/bst/bgteubner
	mkdirhier doc/latex/bgteubner
	mkdirhier source/latex/bgteubner
	cp bgteubner.cls tex/latex/bgteubner/
	cp ptmxcomp.sty tex/latex/ptmxcomp/
	cp bgteubner.ist bgteuglo.ist bgteuglochar.ist makeindex/bgteubner/
	cp bgteu*.bst bibtex/bst/bgteubner/
	cp bgteucls.pdf ChangeLog doc/latex/bgteubner/
	cp ../doc/bgteubner-17x24-cm.pdf doc/latex/bgteubner/bgteubner-cm.pdf
	cp ../doc/bgteubner-17x24-mathtime.pdf doc/latex/bgteubner/bgteubner.pdf
	cp Makefile bgteucls.ins bgteucls.dtx getversion.tex source/latex/bgteubner/
	zip -r bgteubner-$(VERSION)-tds.zip tex makeindex bibtex doc source
	rm -rf tex makeindex bibtex doc source
	cp bgteubner-$(VERSION)-tds.zip ../pakete
	rm -f getversion.log

ctan: all 
	-@rm -f bgteubner-$(VERSION)-ctan.zip
#	-@rm -f ../pakete/bgteubner-v*-ctan.zip
	mkdir bgteubner
	mkdir bgteubner/source
	mkdir bgteubner/hhsubfigure
	mkdir bgteubner/doc
	mkdir bgteubner/doc/mathtime
	mkdir bgteubner/doc/src
	mkdir bgteubner/doc/src/bilder
	mkdir bgteubner/doc/src/bilder/seiten
	cp ../LIESMICH ../README ../ToDo ../manifest.txt ../usefiles.txt bgteubner/
	cp ChangeLog Makefile bgteucls.dtx bgteucls.ins getversion.tex bgteubner/source/
	cp ptmxcomp.sty testquick.tex bgteubner/source/
	cp ../hhsubfigure/hhsubfigure.dtx ../hhsubfigure/hhsubfigure.ins bgteubner/hhsubfigure/
	cp ../hhsubfigure/README ../hhsubfigure/Makefile bgteubner/hhsubfigure/
	cp ../doc/bgteubner-17x24-mathtime.pdf bgteubner/doc/bgteubner.pdf
	cp ../doc/bgteubner-17x24-cm.pdf bgteubner/doc/bgteubner-cm.pdf
	cp bgteucls.pdf bgteubner/doc/
	cp ../doc/src/*.tex ../doc/src/*.sty ../doc/src/*.bib ../doc/src/Makefile bgteubner/doc/src/
	cp ../doc/src/bilder/*.* bgteubner/doc/src/bilder/
	cp ../doc/src/bilder/seiten/* bgteubner/doc/src/bilder/seiten/
	cp ../doc/mathtime/*.tex ../doc/mathtime/*.pdf bgteubner/doc/mathtime/
	zip -r bgteubner-$(VERSION)-ctan.zip bgteubner
	rm -rf bgteubner
	rm -f getversion.log
