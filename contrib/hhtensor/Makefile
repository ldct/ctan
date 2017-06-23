
SRCDIR=hhtensor
INSTALLDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/hhtensor
DOCDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/doc/latex/hhtensor
VERSION=`latex getversion | grep '^VERSION' | sed 's/^VERSION \\(.*\\)\\.\\(.*\\)/\\1_\\2/'`


.SUFFIXES: .sty .ins .dtx .dvi .ps .pdf

.ins.sty:
	pdflatex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<


all: hhtensor hhtensor.pdf

hhtensor: hhtensor.sty

hhtensor.pdf: hhtensor.dtx hhtensor.ins
	pdflatex hhtensor.dtx
	pdflatex hhtensor.dtx
	makeindex -s gind.ist hhtensor
	makeindex -s gglo.ist -o hhtensor.gls hhtensor.glo
	pdflatex hhtensor.dtx

clean:
	@-rm -f hhtensor.glo hhtensor.gls hhtensor.idx hhtensor.ilg
	@-rm -f hhtensor.ind hhtensor.aux hhtensor.log hhtensor.toc
	@-rm -f *~

distclean: clean
	@-rm -f hhtensor.sty hhtensor.pdf

tar:	all clean
	echo Lege hhtensor-$(VERSION).tar.gz an
	-rm -f hhtensor-$(VERSION).tar.gz
	tar czCf .. hhtensor-$(VERSION).tar.gz \
	  $(SRCDIR)/README \
	  $(SRCDIR)/ChangeLog \
	  $(SRCDIR)/Makefile \
	  $(SRCDIR)/hhtensor.pdf \
	  $(SRCDIR)/hhtensor.dtx \
	  $(SRCDIR)/hhtensor.ins \
	  $(SRCDIR)/getversion.tex \
	  $(SRCDIR)/hhtensor.xml
	rm getversion.log

zip:	all clean
	-@rm -f hhtensor-$(VERSION).zip
	mkdirhier tex/latex/hhtensor
	mkdirhier doc/latex/hhtensor
	mkdirhier source/latex/hhtensor
	mv hhtensor.sty tex/latex/hhtensor
	cp hhtensor.dtx hhtensor.ins hhtensor.xml source/latex/hhtensor
	cp Makefile source/latex/hhtensor
	cp README hhtensor.pdf doc/latex/hhtensor
	zip -r hhtensor-$(VERSION).zip tex doc source
	rm -r tex/ doc/ source/
	rm getversion.log

install: all
	if [ ! -d $(INSTALLDIR) ]; then mkdirhier $(INSTALLDIR); fi
	if [ ! -d $(DOCDIR) ]; then mkdirhier $(DOCDIR); fi
	install -m644 hhtensor.sty $(INSTALLDIR)
	install -m644 hhtensor.pdf $(DOCDIR)
	texhash


hhtensor.sty: hhtensor.ins hhtensor.dtx

