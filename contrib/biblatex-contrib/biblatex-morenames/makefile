dist: all
	rm -rf biblatex-morenames
	mkdir biblatex-morenames
	ln README *bbx *dbx *makefile biblatex-morenames
	mkdir biblatex-morenames/documentation
	ln documentation/*tex documentation/*bib documentation/*dot documentation/*pdf documentation/makefile documentation/latexmkrc documentation/*py biblatex-morenames/documentation
	$(RM) ../biblatex-morenames.zip
	zip -r ../biblatex-morenames.zip biblatex-morenames


clean:
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*

all: documentation/biblatex-morenames.tex
	$(MAKE) -C documentation all
