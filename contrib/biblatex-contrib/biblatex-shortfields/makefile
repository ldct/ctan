dist: all
	rm -rf biblatex-shortfields
	mkdir biblatex-shortfields
	ln README.md biblatex-shortfields/README     
	ln makefile *sty biblatex-shortfields
	mkdir biblatex-shortfields/documentation
	ln documentation/*tex documentation/*bib documentation/*pdf documentation/latexmkrc documentation/makefile  biblatex-shortfields/documentation 
	$(RM) ../biblatex-shortfields.zip
	zip -r ../biblatex-shortfields.zip biblatex-shortfields


clean:
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*

all: documentation/biblatex-shortfields-example.tex documentation/biblatex-shortfields.tex documentation/biblatex-shortfields.bib documentation/latexmkrc
	$(MAKE) -C documentation all
