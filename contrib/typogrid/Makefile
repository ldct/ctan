
SRCDIR=typogrid
INSTALLDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/typogrid
DOCDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/doc/latex/typogrid
VERSION=`latex getversion | grep '^VERSION' | sed 's/^VERSION \\(.*\\)\\.\\(.*\\)/\\1_\\2/'`


.SUFFIXES: .sty .ins .dtx .pdf .ps .pdf

.ins.sty:
	pdflatex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<

all: typogrid.sty typogrid.pdf


clean:
	@-rm -f typogrid.glo typogrid.gls typogrid.idx typogrid.ilg
	@-rm -f typogrid.ind typogrid.aux typogrid.log typogrid.toc
	@-rm -f testtypogrid.aux testtypogrid.log
	@-rm -f *~

distclean: clean
	@-rm -f typogrid.sty typogrid.pdf
	@-rm -f testtypogrid.pdf

tar:	all clean
	-rm -f typogrid-$(VERSION).tar.gz
	tar czCf .. typogrid-$(VERSION).tar.gz \
	  $(SRCDIR)/README \
	  $(SRCDIR)/ChangeLog \
	  $(SRCDIR)/Makefile \
	  $(SRCDIR)/typogrid.dtx \
	  $(SRCDIR)/typogrid.ins \
	  $(SRCDIR)/typogrid.pdf \
	  $(SRCDIR)/getversion.tex \
	  $(SRCDIR)/testtypogrid.tex
	rm -f getversion.log

zip:	all clean
	-@rm -f typogrid-$(VERSION).zip
	mkdirhier tex/latex/typogrid
	mkdirhier doc/latex/typogrid
	mkdirhier source/latex/typogrid
	mv typogrid.sty tex/latex/typogrid
	cp typogrid.dtx typogrid.ins typogrid.xml source/latex/typogrid
	cp Makefile source/latex/typogrid
	cp README ChangeLog typogrid.pdf testtypogrid.tex doc/latex/typogrid
	zip -r typogrid-$(VERSION).zip tex doc source
	rm -r tex/ doc/ source/
	rm -f getversion.log

install: all
	if [ ! -d $(INSTALLDIR) ]; then mkdirhier $(INSTALLDIR); fi
	if [ ! -d $(DOCDIR) ]; then mkdirhier $(DOCDIR); fi
	install -m644 typogrid.sty $(INSTALLDIR)
	install -m644 typogrid.pdf $(DOCDIR)
	texhash


typogrid.sty: typogrid.ins typogrid.dtx

