FILES = *.bbx *.dbx *.lbx documentation   makefile README


dist: all
	rm -rf biblatex-subseries
	mkdir biblatex-subseries
	ln README *bbx *dbx *makefile biblatex-subseries
	mkdir biblatex-subseries/documentation
	ln documentation/*tex documentation/*bib documentation/*pdf documentation/makefile  biblatex-subseries/documentation
	$(RM) ../biblatex-subseries.zip
	zip -r ../biblatex-subseries.zip biblatex-subseries


clean:
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*

all: documentation/biblatex-subseries-example.tex documentation/biblatex-subseries.tex documentation/biblatex-subseries-example.bib
	$(MAKE) -C documentation all
