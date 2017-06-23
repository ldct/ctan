FILES = *sty *tex *pdf *bbx *dbx README  makefile latexmkrc
%.pdf: %.tex latexmkrc 
	latexmk *tex
dist: biblatex-multiple-dm.pdf
	@$(RM) ../biblatex-multiple-dm.zip
	rm -rf biblatex-multiple-dm
	mkdir biblatex-multiple-dm	
	ln $(FILES) biblatex-multiple-dm
	zip -r ../biblatex-multiple-dm.zip  biblatex-multiple-dm
  
clean:
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*
