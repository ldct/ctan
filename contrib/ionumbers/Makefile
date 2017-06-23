#
# Makefile for ionumbers package
#
# Copyright 2008,2011,2012 Christian Schneider <software(at)chschneider(dot)eu>
#
# This file is part of ionumbers.
#
# ionumbers is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation, not any later version.
#
# ionumbers is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ionumbers.  If not, see <http://www.gnu.org/licenses/>.
#
# WARNING: THIS IS ALPHA SOFTWARE AND MAY CONTAIN SERIOUS BUGS!
#

PACKAGE   := ionumbers
TESTFILE  := ionumbers_test

PDFLATEX  := pdflatex
MAKEINDEX := makeindex

# installation directories
DESTDIR   := $(HOME)/.texmf
DOCDIR    := $(DESTDIR)/doc/latex/$(PACKAGE)
SRCDIR    := $(DESTDIR)/source/latex/$(PACKAGE)
TEXDIR    := $(DESTDIR)/tex/latex/$(PACKAGE)

.PHONY: all pkg doc test install clean distclean mrproper force

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

$(TESTFILE).pdf: %.pdf: %.tex $(PACKAGE).sty
	$(PDFLATEX) -interaction=nonstopmode $<
	$(PDFLATEX) -interaction=nonstopmode $<
	$(PDFLATEX) -interaction=nonstopmode $<

pkg: $(PACKAGE).sty

test: $(TESTFILE).pdf

doc: $(PACKAGE).pdf

install:
	mkdir -p $(DOCDIR) $(SRCDIR) $(TEXDIR)
	install -m 644 README COPYING $(PACKAGE).pdf $(TESTFILE).pdf $(DOCDIR)
	install -m 644 $(PACKAGE).ins $(PACKAGE).dtx $(TESTFILE).tex Makefile \
	  $(SRCDIR)
	install -m 644 $(PACKAGE).sty $(TEXDIR)
	mktexlsr $(DESTDIR)

clean:
	$(RM) *.aux *.glo *.gls *.idx *.ilg *.ind *.log *.toc *.out *~

distclean: clean
	$(RM) $(PACKAGE).sty

mrproper: distclean
	$(RM) $(PACKAGE).pdf $(TESTFILE).pdf
