dist: all
	rm -rf biblatex-claves
	mkdir biblatex-claves
	ln README *bbx *dbx *makefile biblatex-claves
	mkdir biblatex-claves/documentation
	ln documentation/*tex documentation/*bib documentation/*pdf documentation/makefile documentation/latexmkrc biblatex-claves/documentation
	$(RM) ../biblatex-claves.zip
	zip -r ../biblatex-claves.zip biblatex-claves


clean:
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*

all: documentation/biblatex-claves.tex
	$(MAKE) -C documentation all
