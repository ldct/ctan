PACKAGE = *.dtx \
		  eledform.pdf \
		  example.pdf \
		  *.ins \
		  *.tex \
		  include/*\
		  makefile\
		  README.md



.PHONY: all dist clean cleanall


all:eledform.sty eledform.pdf dist clean


example.pdf:example.tex eledform.sty
	pdflatex example.tex
	pdflatex example.tex
	pdflatex example.tex

%.sty: %.ins %.dtx 
	@rm -f $*.sty
	@pdflatex $*.ins

%.pdf: %.dtx %.sty
	@xelatex $*.dtx
	@xelatex $*.dtx
	makeindex -s gglo.ist -o $*.gls $*.glo
	makeindex -s gind.ist -o $*.ind $*.idx
	@xelatex $*.dtx
	

dist: $(PACKAGE)
	@$(RM) ../eledform.zip
	zip ../eldeform.zip $(PACKAGE)
	

clean:
	@$(RM) *.aux *.log *.out *.toc  *glo *idx *bib *bbl *blg *xml *gls *ilg *gz *ind

cleanall:clean
	@$(RM) bibleref-french-francais.pdf bibleref-french.pdf test.pdf *sty