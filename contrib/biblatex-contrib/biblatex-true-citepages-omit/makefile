FILES = *sty *tex *pdf README *.bib makefile latexmkrc
%.pdf: %.tex latexmkrc %.bib
	latexmk *tex
dist: biblatex-true-citepages-omit.pdf
	@$(RM) ../biblatex-true-citepages-omit.zip
	rm -rf biblatex-true-citepages-omit
	mkdir biblatex-true-citepages-omit	
	cp $(FILES) biblatex-true-citepages-omit
	zip -r ../biblatex-true-citepages-omit.zip  biblatex-true-citepages-omit
  
clean:
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*