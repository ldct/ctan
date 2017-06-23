
SRCDIR=miller
TEXMF=`kpsewhich --expand-path='$$TEXMFLOCAL'`
INSTALLDIR=tex/latex/miller
DOCDIR=/doc/latex/miller
SOURCEDIR=/source/latex/miller
TEXLIVEDIR=texmf-dist
VERSION=`grep -e '\\[.*\\]' miller-v.tex | sed 's/  \\[[0-9/]* *\\([v0-9]*\\)\\.\\([0-9]*\\).*\\]/\\1_\\2/'`


.SUFFIXES: .sty .ins .dtx .pdf

.ins.sty:
	latex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<


all: miller miller.pdf millertest.pdf ausgabe 

millertest.pdf: millertest.tex miller.sty
	pdflatex millertest


miller: miller.sty



clean:
	@-rm -f miller.glo miller.gls miller.idx miller.ilg
	@-rm -f miller.ind miller.aux miller.log miller.toc
	@-rm -f millertest.log millertest.aux
	@-rm -f *~

distclean: clean
	@-rm -f miller.sty miller.pdf
	@-rm -f millertest.pdf miller-v.tex

tar:	all clean
	echo Lege miller-$(VERSION).tar.gz an
	-rm -f miller-$(VERSION).tar.gz
	tar czCf .. miller-$(VERSION).tar.gz \
	  $(SRCDIR)/README \
	  $(SRCDIR)/ChangeLog \
	  $(SRCDIR)/Makefile \
	  $(SRCDIR)/miller.dtx \
	  $(SRCDIR)/miller.ins \
	  $(SRCDIR)/miller.pdf \
	  $(SRCDIR)/millertest.tex \
	  $(SRCDIR)/miller.xml

install: all
	if [ ! -d $(TEXMF)/$(INSTALLDIR) ]; then mkdir -p $(TEXMF)/$(INSTALLDIR); else rm -f $(TEXMF)/$(INSTALLDIR)/*; fi
	if [ ! -d $(TEXMF)/$(DOCDIR) ]; then mkdir -p $(TEXMF)/$(DOCDIR); else rm -f $(TEXMF)/$(DOCDIR)/*; fi
	if [ ! -d $(TEXMF)/$(SOURCEDIR) ]; then mkdir -p $(TEXMF)/$(SOURCEDIR); else rm -f $(TEXMF)/$(SOURCEDIR)/*; fi
	install -m644 miller.sty $(TEXMF)/$(INSTALLDIR)
	install -m644 miller.pdf README ChangeLog $(TEXMF)/$(DOCDIR)
	install -m644 miller.xml millertest.tex $(TEXMF)/$(DOCDIR)
	install -m644 miller.dtx miller.ins $(TEXMF)/$(SOURCEDIR)

texlive: all clean
	rm -rf $(TEXLIVEDIR)
	mkdir -p $(TEXLIVEDIR)/$(INSTALLDIR)
	mkdir -p $(TEXLIVEDIR)/$(DOCDIR)
	mkdir -p $(TEXLIVEDIR)/$(SOURCEDIR)
	cp miller.sty $(TEXLIVEDIR)/$(INSTALLDIR)
	cp miller.pdf README ChangeLog $(TEXLIVEDIR)/$(DOCDIR)
	cp miller.xml millertest.tex $(TEXLIVEDIR)/$(DOCDIR)
	cp miller.dtx miller.ins $(TEXLIVEDIR)/$(SOURCEDIR)

ausgabe:
	@echo "Please copy miller.sty to a directory"
	@echo "in the LaTeX search path"

miller.sty: miller.ins miller.dtx

