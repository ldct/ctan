all: *tex *bib
	xelatex --shell-escape biblatex-realauthor.tex
	biber biblatex-realauthor
	xelatex --shell-escape biblatex-realauthor.tex
	xelatex --shell-escape example-realauthor.tex
	biber example-realauthor
	xelatex --shell-escape example-realauthor.tex
	xelatex --shell-escape example-realauthor.tex

clean:realauthor
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*
