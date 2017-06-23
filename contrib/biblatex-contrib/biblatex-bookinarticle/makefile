FILES = *.sty documentation   makefile README


dist: all
	rm -rf biblatex-bookinarticle
	mkdir biblatex-bookinarticle
	ln README *sty *makefile biblatex-bookinarticle
	mkdir biblatex-bookinarticle/documentation
	ln documentation/*tex documentation/*bib documentation/*pdf documentation/*.dot documentation/makefile  biblatex-bookinarticle/documentation
	$(RM) ../biblatex-bookinarticle.zip
	zip -r ../biblatex-bookinarticle.zip biblatex-bookinarticle


clean:
	$(MAKE) -C documentation clean
	@$(RM) *.pdf *.toc *.aux *.out *.fdb_latexmk *.log *.bbl *.bcf *.blg *run.xml *.synctex.gz*

all:  documentation/biblatex-bookinarticle.tex documentation/example-bookinarticle.bib documentation/example-bookinincollection.bib documentation/example-bookinthesis.bib
	$(MAKE) -C documentation all
