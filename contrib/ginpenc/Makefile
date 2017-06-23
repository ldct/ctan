
SRCDIR=ginpenc
INSTALLDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/tex/latex/ginpenc
DOCDIR=`kpsewhich --expand-path='$$TEXMFLOCAL'`/doc/latex/ginpenc
VERSION=`latex getversion | grep '^VERSION' | sed 's/^VERSION \\(.*\\)\\.\\(.*\\)/\\1_\\2/'`

.SUFFIXES: .sty .ins .dtx .pdf .ps

.ins.sty:
	pdflatex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<


all: ginpenc ginpenc.pdf ausgabe 


ginpenc: ginpenc.sty

ginpenc.sty: ginpenc.dtx ginpenc.ins



clean:
	@-rm -f ginpenc.{glo,gls,idx,ilg,ind,aux,log,toc}
	@-rm -f testginpenc.{log,aux}
	@-rm -f *~ *.aux *.idx *.log

distclean: clean
	@-rm -f ginpenc.{pdf,ps,sty}
	@-rm -f testginpenc.{pdf,ps}
	@-rm -f testginpenc.pdf
	@-rm -f *.gie


tar:	all clean
	echo Lege ginpenc-$(VERSION).tar.gz an
	-rm -f ginpenc-$(VERSION).tar.gz
	tar czCf .. ginpenc-$(VERSION).tar.gz \
	  $(SRCDIR)/Makefile \
	  $(SRCDIR)/README \
	  $(SRCDIR)/ChangeLog \
	  $(SRCDIR)/ginpenc.dtx \
	  $(SRCDIR)/ginpenc.pdf \
	  $(SRCDIR)/ginpenc.ins \
	  $(SRCDIR)/ginpenc.xml \
	  $(SRCDIR)/news-message.txt \
	  $(SRCDIR)/testginpenc.tex

zip:	all
	mkdirhier tex/latex/ginpenc
	mkdirhier doc/latex/ginpenc
	mkdirhier source/latex/ginpenc
	cp ginpenc.sty *.gie tex/latex/ginpenc/
	cp ginpenc.pdf testginpenc.tex news-message.txt README doc/latex/ginpenc/
	cp ginpenc.ins ginpenc.dtx Makefile source/latex/ginpenc/
	@rm -f ginpenc-$(VERSION).zip
	zip -r ginpenc-$(VERSION) tex doc source
	rm -rf tex doc source

install: all
	if [ ! -d $(INSTALLDIR) ]; then mkdirhier $(INSTALLDIR); fi
	install -m644 ginpenc.sty *.gie $(INSTALLDIR)
	texhash

ausgabe:
	@echo "Please copy ginpenc.sty to a directory"
	@echo "in the LaTeX search path"


