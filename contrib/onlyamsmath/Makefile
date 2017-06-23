VERSION=`grep -e '\\[.*\\]' onlyamsmath-v.tex | sed 's/  \\[[0-9/]* *\\([v0-9]*\\)\\.\\([0-9]*\\).*\\]/\\1_\\2/'`

.SUFFIXES: .sty .ins .dtx .pdf


.ins.sty:
	pdflatex $<

.dtx.pdf:
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	pdflatex $<

all: onlyamsmath onlyamsmath.pdf message 

onlyamsmathtest.pdf:
	pdflatex onlyamsmathtest


onlyamsmath:
	pdflatex onlyamsmath.ins



clean:
	@-rm -f onlyamsmath.{glo,gls,idx,ilg,ind,aux,log,toc}
	@-rm -f onlyamsmathtest.{log,aux}
	@-rm -f *~

distclean: clean
	@-rm -f onlyamsmath.{sty,pdf,ps}
	@-rm -f onlyamsmathtest.{pdf,ps}

tar:	all clean
	@echo Generate onlyamsmath-$(VERSION).tar.gz
	@-rm -f onlyamsmath-$(VERSION).tar.gz
	@tar czCf .. onlyamsmath-$(VERSION).tar.gz \
	  onlyamsmath/README \
	  onlyamsmath/ChangeLog \
	  onlyamsmath/Makefile \
	  onlyamsmath/onlyamsmath.{dtx,ins,pdf} \
	  onlyamsmath/onlyamsmathtest.tex

zip:	all clean
	@echo Generate onlyamsmath-$(VERSION).zip
	mkdir -p tex/latex/onlyamsmath
	mkdir -p doc/latex/onlyamsmath
	mkdir -p source/latex/onlyamsmath
	cp onlyamsmath.sty tex/latex/onlyamsmath
	cp README ChangeLog onlyamsmath.pdf onlyamsmathtest.tex doc/latex/onlyamsmath
	cp onlyamsmath.dtx onlyamsmath.ins Makefile source/latex/onlyamsmath
	@rm -f onlyamsmath-$(VERSION).zip
	@zip -r onlyamsmath-$(VERSION).zip source/ tex/ doc/
	rm -rf source/ tex/ doc/

message:
	@echo "Please copy onlyamsmath.sty to a directory"
	@echo "in the LaTeX search path"
	@echo "Then run \`latex onlyamsmathtest' to see an example"


