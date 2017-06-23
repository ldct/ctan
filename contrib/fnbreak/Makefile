
SRCDIR=fnbreak
INSTALLDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/fnbreak
DOCDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/doc/latex/fnbreak
VERSION=`grep -e '\\[.*\\]' fnbreak-v.tex | sed 's/  \\[[0-9/]* *\\([v0-9]*\\)\\.\\([0-9]*\\).*\\]/\\1_\\2/'`


.SUFFIXES: .sty .ins .dtx .dvi .pdf

.ins.sty:
	latex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<


all: fnbreak fnbreak.pdf fnbreaktest.dvi

fnbreaktest.dvi: fnbreaktest.tex fnbreak.sty
	latex fnbreaktest


fnbreak: fnbreak.sty



clean:
	@-rm -f fnbreak.{glo,gls,idx,ilg,ind,aux,log,toc}
	@-rm -f fnbreaktest.{log,aux}
	@-rm -f *~

distclean: clean
	@-rm -f fnbreak.sty fnbreak.pdf
	@-rm -f fnbreaktest.dvi fnbreak-v.tex

tar:	all clean
	echo Lege fnbreak-$(VERSION).tar.gz an
	-rm -f fnbreak-$(VERSION).tar.gz
	tar czCf .. fnbreak-$(VERSION).tar.gz \
	  $(SRCDIR)/README \
	  $(SRCDIR)/ChangeLog \
	  $(SRCDIR)/Makefile \
	  $(SRCDIR)/fnbreak.dtx \
	  $(SRCDIR)/fnbreak.ins \
	  $(SRCDIR)/fnbreak.pdf \
	  $(SRCDIR)/fnbreaktest.tex \
	  $(SRCDIR)/fnbreak.xml

zip:	texlive
	-@rm -f fnbreak-$(VERSION).zip
	zip -r fnbreak-$(VERSION).zip texmf
	rm -rf texmf
	rm -f getversion.log


texlive:	all clean
	rm -rf texmf
	mkdir -p texmf/tex/latex/fnbreak/
	mkdir -p texmf/doc/latex/fnbreak/
	mkdir -p texmf/source/latex/fnbreak/
	cp fnbreak.sty texmf/tex/latex/fnbreak/
	cp fnbreak.pdf README ChangeLog fnbreaktest.tex texmf/doc/latex/fnbreak/
	cp fnbreak.dtx fnbreak.ins texmf/source/latex/fnbreak/
	cp Makefile fnbreak.xml texmf/source/latex/fnbreak/


install: all
	if [ ! -d $(INSTALLDIR) ]; then mkdir -p $(INSTALLDIR); fi
	if [ ! -d $(DOCDIR) ]; then mkdir -p $(DOCDIR); fi
	install -m644 fnbreak.sty $(INSTALLDIR)
	install -m644 fnbreak.pdf $(DOCDIR)
	texhash

fnbreak.sty: fnbreak.ins fnbreak.dtx

