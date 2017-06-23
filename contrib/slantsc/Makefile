
SRCDIR=slantsc
INSTALLDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/slantsc
DOCDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/doc/latex/slantsc
VERSION=`pdflatex getversion | grep '^VERSION' | sed 's/^VERSION \\(.*\\)\\.\\(.*\\)/\\1_\\2/'`


.SUFFIXES: .sty .ins .dtx .pdf

.ins.sty:
	pdflatex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<


all: slantsc slantsc.pdf


slantsc: slantsc.sty



clean:
	@-rm -f slantsc.{glo,gls,idx,ilg,ind,aux,log,toc}
	@-rm -f *~

distclean: clean
	@-rm -f slantsc.{sty,pdf,ps}

tar:	all clean
	echo Lege slantsc-$(VERSION).tar.gz an
	-rm -f slantsc-$(VERSION).tar.gz
	tar czCf .. slantsc-$(VERSION).tar.gz \
	  $(SRCDIR)/README $(SRCDIR)/Makefile \
	  $(SRCDIR)/ChangeLog \
	  $(SRCDIR)/slantsc.{dtx,ins,pdf} \
	  $(SRCDIR)/testslantsc.tex \
	  $(SRCDIR)/slantsc.xml \
	  $(SRCDIR)/getversion.tex
	rm -f getversion.log

zip:	all clean
	-rm -f slantsc-$(VERSION).zip
	mkdir -p tex/latex/slantsc
	mkdir -p doc/latex/slantsc
	mkdir -p source/latex/slantsc
	cp slantsc.sty tex/latex/slantsc/
	cp slantsc.pdf testslantsc.tex doc/latex/slantsc/
	cp ChangeLog Makefile slantsc.dtx slantsc.ins README source/latex/slantsc/
	zip -r slantsc-$(VERSION).zip tex doc source
	rm -rf tex doc source
	rm -f getversion.log


install: all
	if [ ! -d $(INSTALLDIR) ]; then mkdir -p $(INSTALLDIR); fi
	if [ ! -d $(DOCDIR) ]; then mkdir -p $(DOCDIR); fi
	install -m644 slantsc.sty $(INSTALLDIR)
	install -m644 slantsc.pdf $(DOCDIR)
	texhash


slantsc.sty: slantsc.ins slantsc.dtx

