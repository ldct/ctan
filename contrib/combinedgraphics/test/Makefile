#
# Makefile for tests of combinedgraphics package
#
# Copyright 2009,2011,2012 Christian Schneider <software(at)chschneider(dot)eu>
#
# This file is part of combinedgraphics.
#
# combinedgraphics is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation, not any later version.
#
# combinedgraphics is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with combinedgraphics.  If not, see <http://www.gnu.org/licenses/>.
#
# WARNING: THIS IS ALPHA SOFTWARE AND MAY CONTAIN SERIOUS BUGS!
#

# input files
SRCFILE   := combinedgraphics_test.tex
STYFILES  := ../combinedgraphics.sty
FIGFILES  := xfig325.fig
PLTFILES  := gnuplot42.plt

# installation directories
DESTDIR   := $(HOME)/.texmf
DOCDIR    := $(DESTDIR)/doc/latex/$(PACKAGE)/test
SRCDIR    := $(DESTDIR)/source/latex/$(PACKAGE)/test

# output files
PDFFILE     := $(patsubst %.tex,%.pdf,$(SRCFILE))
TEXGRAPHICS := $(patsubst %.fig,%.tex,$(FIGFILES)) \
               $(patsubst %.plt,%.tex,$(PLTFILES))
EPSGRAPHICS := $(patsubst %.fig,%.eps,$(FIGFILES)) \
               $(patsubst %.plt,%.eps,$(PLTFILES))
PDFGRAPHICS := $(patsubst %.fig,%.pdf,$(FIGFILES)) \
               $(patsubst %.plt,%.pdf,$(PLTFILES))

# required tools
PDFLATEX  := pdflatex
FIG2DEV   := fig2dev
GNUPLOT   := gnuplot
EPSTOPDF  := epstopdf

# environment variables of (pdf)latex
export TEXINPUTS := .:..:$(TEXINPUTS)
export TEXPICTS  := .:..:$(TEXPICTS)

.PHONY: all test install clean distclean force

all: test

%.tex: %.fig
	$(FIG2DEV) -L pstex_t $< $@

%.eps: %.fig
	$(FIG2DEV) -L pstex $< $@

%.tex %.eps: %.plt
	$(GNUPLOT) $<

%.pdf: %.eps
	$(EPSTOPDF) --outfile=$@ $<

$(PDFFILE): %.pdf: %.tex $(STYFILES) $(TEXGRAPHICS) $(PDFGRAPHICS)
	$(PDFLATEX) -interaction=nonstopmode $<
	$(PDFLATEX) -interaction=nonstopmode $<
	$(PDFLATEX) -interaction=nonstopmode $<

test: $(PDFFILE) $(EPSGRAPHICS)

install:
	mkdir -p $(DOCDIR) $(SRCDIR)
	install -m 644 $(PDFFILE) $(DOCDIR)
	install -m 644 $(SRCFILE) $(FIGFILES) $(PLTFILES) Makefile \
	  $(TEXGRAPHICS) $(EPSGRAPHICS) $(PDFGRAPHICS) $(SRCDIR)

clean:
	$(RM) *.aux *.glo *.gls *.idx *.ilg *.ind *.log *.toc *~

distclean: clean

mrproper: distclean
	$(RM) $(PDFFILE) $(TEXGRAPHICS) $(EPSGRAPHICS) $(PDFGRAPHICS)
