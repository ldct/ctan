
dist: examples handout.tex README *.sty makefile latexmkrc
	$(RM) ../handout.zip
	rm -rf handout
	latexmk handout.tex
	$(MAKE) -C examples all
	
	mkdir handout
	cp *.sty *.tex *.pdf latexmkrc makefile README handout
	
	mkdir handout/examples
	cp examples/*pdf examples/*tex examples/*bib examples/latexmkrc examples/makefile handout/examples

	mkdir handout/examples/txt
	cp examples/txt/*tex handout/examples/txt
	zip -r ../handout.zip handout

clean:
	$(MAKE) -C examples clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz* *.pyg
	rm -rf handout
