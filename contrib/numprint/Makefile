
SRCDIR=numprint
INSTALLDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/numprint
DOCDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/doc/latex/numprint
#VERSION=`latex getversion | grep '^VERSION' | sed 's/^VERSION \\(.*\\)\\.\\(.*\\)/\\1_\\2/g'`
VERSION=`latex getversion | grep '^VERSION' | sed 's/^VERSION //' | sed 's/\\([0-9]*\\)\\.\\([0-9a-z]*\\)/\\1_\\2/g'`


.SUFFIXES: .sty .ins .dtx .pdf

.ins.sty:
	pdflatex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<


all:	numprint.sty numprint.pdf numprinttest.pdf \
	nbaseprt.pdf nbaseprttest.pdf

numprinttest.pdf: numprinttest.tex numprint.sty
	pdflatex numprinttest

nbaseprttest.pdf: nbaseprttest.tex nbaseprt.sty
	pdflatex nbaseprttest



clean:
	@-rm -f numprint.glo numprint.gls numprint.idx numprint.ilg
	@-rm -f numprint.ind numprint.aux numprint.log numprint.toc
	@-rm -f numprinttest.log numprinttest.aux
	@-rm -f nbaseprt.glo nbaseprt.gls nbaseprt.idx nbaseprt.ilg
	@-rm -f nbaseprt.ind nbaseprt.aux nbaseprt.log nbaseprt.toc
	@-rm -f nbaseprttest.log nbaseprttest.aux
	@-rm -f *~

distclean: clean
	@-rm -f numprint.sty numprint.pdf numprint032.sty
	@-rm -f numprinttest.pdf
	@-rm -f nbaseprt.sty nbaseprt.pdf nbaseprt032.sty
	@-rm -f nbaseprttest.pdf

tar:	all clean
	echo Lege numprint-$(VERSION).tar.gz an
	-rm -f numprint-$(VERSION).tar.gz
	tar czCf .. numprint-$(VERSION).tar.gz \
	  $(SRCDIR)/README \
	  $(SRCDIR)/ChangeLog.numprint \
	  $(SRCDIR)/ChangeLog.nbaseprt \
	  $(SRCDIR)/Makefile \
	  $(SRCDIR)/numprint.dtx \
	  $(SRCDIR)/nbaseprt.dtx \
	  $(SRCDIR)/numprint.ins \
	  $(SRCDIR)/numprint.pdf \
	  $(SRCDIR)/nbaseprt.pdf \
	  $(SRCDIR)/numprint032.dtx \
	  $(SRCDIR)/numprinttest.tex \
	  $(SRCDIR)/nbaseprttest.tex \
	  $(SRCDIR)/getversion.tex
	rm -f getversion.log

texlive:	all clean
	rm -rf texmf
	mkdir -p texmf/tex/latex/numprint
	mkdir -p texmf/doc/latex/numprint
	mkdir -p texmf/source/latex/numprint
	cp numprint.sty nbaseprt.sty numprint032.sty texmf/tex/latex/numprint
	cp numprint.dtx numprint.ins texmf/source/latex/numprint
	cp nbaseprt.dtx texmf/source/latex/numprint
	cp numprint032.dtx Makefile texmf/source/latex/numprint
	cp README ChangeLog.numprint ChangeLog.nbaseprt texmf/doc/latex/numprint
	cp numprinttest.tex numprint.pdf texmf/doc/latex/numprint
	cp nbaseprttest.tex nbaseprt.pdf texmf/doc/latex/numprint

zip:	all clean texlive
	-@rm -f numprint-$(VERSION).zip
	zip -r numprint-$(VERSION).zip texmf
	rm -r texmf/
	rm -f getversion.log

install: all
	if [ ! -d $(INSTALLDIR) ]; then mkdir -p $(INSTALLDIR); fi
	if [ ! -d $(DOCDIR) ]; then mkdir -p $(DOCDIR); fi
	install -m644 numprint.sty numprint032.sty nbaseprt.sty $(INSTALLDIR)
	install -m644 numprint.pdf numprinttest.tex $(DOCDIR)
	install -m644 nbaseprt.pdf nbaseprttest.tex $(DOCDIR)
	install -m644 README ChangeLog.numprint ChangeLog.nbaseprt $(DOCDIR)
	texhash

numprint.sty: numprint.ins numprint.dtx
nbaseprt.sty: numprint.ins nbaseprt.dtx
