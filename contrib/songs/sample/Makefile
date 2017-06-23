LATEX = pdflatex
TEXOUT = pdf
SONGIDX = ../songidx/songidx
BIBLE = ../songidx/bible.can

all: chordbook.$(TEXOUT) lyricbook.$(TEXOUT) slidebook.$(TEXOUT) transparencies.$(TEXOUT)

.SUFFIXES:
.SUFFIXES: .$(TEXOUT) .tex .sbx .sxd

%.$(TEXOUT): %.tex songs.sbd songs.sty
	$(LATEX) $<
	$(MAKE) indexes
	$(LATEX) $<

indexes: $(patsubst %.sxd,%.sbx,$(wildcard *.sxd))

%.sbx: %.sxd $(SONGIDX) $(BIBLE)
	$(SONGIDX) -b $(BIBLE) $< $@

$(SONGIDX): ../songidx/*.c ../songidx/*.h
	$(MAKE) -C ../songidx songidx

../songs.sty: ../songs.dtx
	$(MAKE) -C .. songs.sty

songs.sty: ../songs.sty
	cp ../songs.sty .

clean:
	-rm *.$(TEXOUT) *.aux *.log *.out *.sxc *.sxd *.sbx
	-rm songs.sty

