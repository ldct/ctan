HT := hepthesis
.PHONY: all clean check

all: $(HT).zip
	@true

$(HT).zip: README ChangeLog $(HT).pdf example/example.pdf
	@rm -rf $(HT)
	@mkdir $(HT)
	@cp README TODO ChangeLog Makefile $(HT).pdf $(HT).cls $(HT).tex  $(HT)/
	@mkdir $(HT)/example
	@cp example/*.pdf example/*.tex example/extrastyles.zip example/Makefile  $(HT)/example/
	@cp example/getNewBibtex example/h-physrev.bst  $(HT)/example/
	@cp example/mythesis.bib example/preamble.tex example/mythesismath.sty  $(HT)/example/
	zip -r $@ $(HT)
	@rm -rf $(HT)

$(HT).pdf: $(HT).tex example/example.pdf
	(rm -f $(HT).{aux,toc,lof,lot} && pdflatex $(HT).tex && pdflatex $(HT).tex && rm -f $(HT).{aux,toc,lof,lot})

example/example.pdf: force_look
	cd example && $(MAKE) $(MFLAGS)

clean:
	@rm -rf $(HT)
	@rm -f $(HT).zip
	@rm -f $(HT).pdf $(HT).log $(HT).aux $(HT).out $(HT).dvi comment.cut
	cd example && $(MAKE) $(MFLAGS) clean

check: $(HT).zip
	@rm -rf $(HT)
	@unzip $(HT).zip
	(cd $(HT) && make $(HT).pdf && make example/example.pdf)

force_look:
	@true
