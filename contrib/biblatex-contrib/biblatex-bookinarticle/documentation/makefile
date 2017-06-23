all: *tex *bib
	xelatex --shell-escape biblatex-bookinarticle.tex
	biber biblatex-bookinarticle
	biber -output-format=dot --dot-include=crossref,field  biblatex-bookinarticle
	dot -Tpdf biblatex-bookinarticle.dot -o biblatex-bookinarticle-crossref.pdf
	xelatex --shell-escape biblatex-bookinarticle.tex

clean:bookinarticle
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*
