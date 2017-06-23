
SRCDIR=contour
INSTALLDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/contour
DOCDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/doc/latex/contour
VERSION=`grep '^%<.*> *\\[' contour.dtx | sed 's/^%<.*> *\\[[0-9/]* *\\(v[0-9]*\\)\\.\\([0-9]*\\).*/\\1_\\2/'`

.SUFFIXES: .sty .ins .dtx .dvi .ps .pdf

.ins.sty:
	latex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<

.dvi.ps:
	dvips -o $(*D)/$(*F).ps $(*D)/$(*F)


all: contour contour.pdf 


contour: contour.sty


clean:
	@-rm -f contour.glo contour.gls contour.idx contour.ilg
	@-rm -f contour.ind contour.aux contour.log contour.toc
	@-rm -f *~

distclean: clean
	@-rm -f contour.sty contour.pdf dvips.cnt dvipsone.cnt pdftex.cnt vtex.cnt contour.cfg

tar:	all clean
	@echo Lege contour-$(VERSION).tar.gz an
	-@rm -f contour-$(VERSION).tar.gz
	@tar czCf .. contour-$(VERSION).tar.gz \
	  $(SRCDIR)/README \
	  $(SRCDIR)/ChangeLog \
	  $(SRCDIR)/Makefile \
	  $(SRCDIR)/contour.dtx \
	  $(SRCDIR)/contour.ins \
	  $(SRCDIR)/contour.pdf \
	  $(SRCDIR)/contour.xml \
	  $(SRCDIR)/contourtest.tex

zip:	all clean
	-@rm -f contour-$(VERSION).zip
	mkdirhier tex/latex/contour
	mkdirhier doc/latex/contour
	mkdirhier source/latex/contour
	mv contour.sty dvips.cnt dvipsone.cnt pdftex.cnt vtex.cnt contour.cfg tex/latex/contour
	cp contour.dtx contour.ins contour.xml source/latex/contour
	cp Makefile source/latex/contour
	cp README contour.pdf ChangeLog contourtest.tex doc/latex/contour
	zip -r contour-$(VERSION).zip tex doc source
	rm -r tex/ doc/ source/

texlive:	all clean
	rm -rf texmf
	mkdir -p texmf/tex/latex/contour
	mkdir -p texmf/doc/latex/contour
	mkdir -p texmf/source/latex/contour
	cp contour.sty dvips.cnt dvipsone.cnt pdftex.cnt vtex.cnt contour.cfg texmf/tex/latex/contour
	cp contour.dtx contour.ins contour.xml texmf/source/latex/contour
	cp Makefile texmf/source/latex/contour
	cp README ChangeLog texmf/doc/latex/contour
	cp contour.pdf contourtest.tex texmf/doc/latex/contour

install: all
	if [ ! -d $(INSTALLDIR) ]; then mkdirhier $(INSTALLDIR); fi
	if [ ! -d $(DOCDIR) ]; then mkdirhier $(DOCDIR); fi
	install -m644 contour.sty pdftex.cnt dvips.cnt dvipsone.cnt vtex.cnt contour.cfg $(INSTALLDIR)
	install -m644 contour.pdf contourtest.tex README ChangeLog $(DOCDIR)
	texhash

contour.sty: contour.ins contour.dtx

version:
	@echo $(VERSION)