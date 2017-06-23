FILES = *sty *tex *pdf README  makefile latexmkrc
%.pdf: %.tex latexmkrc 
	latexmk *tex
dist: biblatex-anonymous.pdf
	@$(RM) ../biblatex-anonymous.zip
	rm -rf biblatex-anonymous
	mkdir biblatex-anonymous	
	ln $(FILES) biblatex-anonymous
	zip -r ../biblatex-anonymous.zip  biblatex-anonymous
  
clean:
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*
