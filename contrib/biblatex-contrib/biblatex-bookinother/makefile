FILES = *.sty documentation   makefile README


dist: all
	rm -rf biblatex-bookinother
	mkdir biblatex-bookinother
	ln README *bbx *dbx *makefile biblatex-bookinother
	mkdir biblatex-bookinother/documentation
	ln documentation/*tex  documentation/*bib documentation/*pdf documentation/*.dot documentation/*py documentation/makefile documentation/latexmkrc  biblatex-bookinother/documentation
	$(RM) ../biblatex-bookinother.zip
	zip -r ../biblatex-bookinother.zip biblatex-bookinother


clean:
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*

all:  documentation/biblatex-bookinother.tex documentation/example-bookinarticle.bib documentation/example-bookinincollection.bib documentation/example-bookinthesis.bib
	$(MAKE) -C documentation all
