all:bibleref.pdf bibleref.sty
	rm -rf bibleref
	mkdir bibleref
	mkdir bibleref/samples
	latexmk sample*tex
	ln sample*tex bibleref/samples
	ln sample*pdf bibleref/samples
	ln CHANGES *ins *ist *dtx bibleref.pdf README makefile bibleref
	@$(RM) ../bibleref.zip
	zip -r ../bibleref.zip bibleref

%.sty: %.ins %.dtx
	rm -f $*.sty $*tex
	@pdflatex $*.ins

%.pdf: %.sty %.dtx
	@pdflatex $*.dtx
	@pdflatex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@pdflatex $*.dtx
	@pdflatex $*.dtx
