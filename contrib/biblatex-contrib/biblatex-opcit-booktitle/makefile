dist: all
	rm -rf biblatex-opcit-booktitle
	mkdir biblatex-opcit-booktitle
	ln README makefile *sty biblatex-opcit-booktitle
	mkdir biblatex-opcit-booktitle/documentation
	ln documentation/*tex documentation/*bib documentation/*pdf documentation/latexmkrc documentation/makefile  biblatex-opcit-booktitle/documentation 
	$(RM) ../biblatex-opcit-booktitle.zip
	zip -r ../biblatex-opcit-booktitle.zip biblatex-opcit-booktitle


clean:
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*

all: documentation/biblatex-opcit-booktitle-example.tex documentation/biblatex-opcit-booktitle.tex documentation/biblatex-opcit-booktitle-example.bib documentation/latexmkrc
	$(MAKE) -C documentation all
