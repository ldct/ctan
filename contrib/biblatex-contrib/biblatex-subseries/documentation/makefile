all: *tex *bib
	xelatex --shell-escape biblatex-subseries.tex
	biber biblatex-subseries
	xelatex --shell-escape biblatex-subseries.tex
	xelatex --shell-escape biblatex-subseries-example.tex
	biber biblatex-subseries-example
	xelatex --shell-escape biblatex-subseries-example.tex

clean:subseries
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*
