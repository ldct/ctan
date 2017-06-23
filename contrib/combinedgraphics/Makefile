#
# Makefile for combinedgraphics package
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

export PACKAGE := combinedgraphics

PDFLATEX  := pdflatex
MAKEINDEX := makeindex

# installation directories
DESTDIR   := $(HOME)/.texmf
DOCDIR    := $(DESTDIR)/doc/latex/$(PACKAGE)
SRCDIR    := $(DESTDIR)/source/latex/$(PACKAGE)
TEXDIR    := $(DESTDIR)/tex/latex/$(PACKAGE)

.PHONY: all pkg doc test install clean distclean force

all: pkg doc test

%.sty: %.ins %.dtx
	$(RM) $@
	$(PDFLATEX) -interaction=nonstopmode $<

%.idx %.glo: %.dtx %.sty
	$(PDFLATEX) -interaction=nonstopmode $<

%.ind: %.idx
	$(MAKEINDEX) -s gind.ist -o $@ $<

%.gls: %.glo
	$(MAKEINDEX) -s gglo.ist -o $@ $<

$(PACKAGE).pdf: %.pdf: %.dtx %.sty %.ind %.gls
	$(PDFLATEX) -interaction=nonstopmode $<
	$(PDFLATEX) -interaction=nonstopmode $<
	$(PDFLATEX) -interaction=nonstopmode $<

pkg: $(PACKAGE).sty

doc: $(PACKAGE).pdf

test: $(PACKAGE).sty
	$(MAKE) -C test

install:
	mkdir -p $(DOCDIR) $(SRCDIR) $(TEXDIR)
	install -m 644 README COPYING $(PACKAGE).pdf $(DOCDIR)
	install -m 644 $(PACKAGE).ins $(PACKAGE).dtx Makefile $(SRCDIR)
	install -m 644 $(PACKAGE).sty $(TEXDIR)
	$(MAKE) -C test install
	mktexlsr $(DESTDIR)

clean:
	$(RM) *.aux *.glo *.gls *.idx *.ilg *.ind *.log *.toc *~
	$(MAKE) -C test clean

distclean: clean
	$(RM) $(PACKAGE).sty
	$(MAKE) -C test distclean

mrproper: distclean
	$(RM) $(PACKAGE).pdf
	$(MAKE) -C test mrproper
