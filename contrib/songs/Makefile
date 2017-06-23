LATEX = pdflatex
TEXOUT = pdf
MAKEINDEX = makeindex

all: songs.sty songs.$(TEXOUT)

songs.sty: songs.ins songs.dtx
	$(LATEX) $<

songs.$(TEXOUT): songs.dtx songs.sty
	$(LATEX) $<
	$(MAKEINDEX) -s gind.ist -o $(join $(basename $@ $@),.ind .idx)
	$(MAKEINDEX) -s gglo.ist -o $(join $(basename $@ $@),.gls .glo)
	$(LATEX) $<
	$(MAKEINDEX) -s gind.ist -o $(join $(basename $@ $@),.ind .idx)
	$(MAKEINDEX) -s gglo.ist -o $(join $(basename $@ $@),.gls .glo)
	$(LATEX) $<

clean:
	-rm songs.$(TEXOUT) songs.sty
	-rm *.aux *.log *.out
	-rm *.ind *.idx *.gls *.glo *.ilg

