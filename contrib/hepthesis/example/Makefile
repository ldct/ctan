.PHONY: clean

EXTRASTYS = abhepexpt.sty abhep.sty abmath.sty lineno.sty siunitx.sty SIunits.sty varwidth.sty

example.pdf: example.tex preamble.tex chap1.tex chap2.tex chap3.tex frontmatter.tex appendices.tex
	@rm -f $(EXTRASTYS)
	unzip extrastyles.zip
	@rm -f example.{aux,toc,lof,lot}
	(pdflatex example && bibtex example && pdflatex example && pdflatex example) || rm -f $(EXTRASTYS) example.pdf
	@rm -f example.{aux,toc,lof,lot}
	@rm -f $(EXTRASTYS)

clean:
	@rm -f $(EXTRASTYS)
	@rm -f example.pdf example.log example.aux
	@rm -f *.bbl *.blg *.lof *.cut
	@rm -f *.lot *.out *.toc
