PACKAGE = elbioimp

$(PACKAGE).cls:	$(PACKAGE).ins $(PACKAGE).dtx
	tex $(PACKAGE).ins

$(PACKAGE).pdf: $(PACKAGE).cls
	pdflatex $(PACKAGE).dtx
	bibtex $(PACKAGE)
	makeindex -s gglo.ist -o elbioimp.gls elbioimp.glo
	makeindex -s gind.ist -o elbioimp.ind elbioimp.idx
	pdflatex $(PACKAGE).dtx

test1.pdf:	test1.tex $(PACKAGE).cls
	pdflatex test1.tex
	bibtex test1
	pdflatex test1.tex
	pdflatex test1.tex

distr:		$(PACKAGE).pdf test1.pdf
	zip elbioimp README Makefile $(PACKAGE).dtx $(PACKAGE).ins \
		$(PACKAGE).cls $(PACKAGE).pdf test1.tex test-bib.bib \
		test-ill.png $(PACKAGE)-basis.tex
	cp elbioimp.pdf ~dag/www_docs/latex-links

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.glo *.gls *.idx *.ilg *.ind *.log *.zip *~
