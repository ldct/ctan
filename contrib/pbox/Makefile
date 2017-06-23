## Makefile - Makefile for the pbox package.
## Copyright (C) 2003  Simon Law
##
##   This program is free software: you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation, either version 3 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

# Set the package name
PACKAGE = pbox

# Use pdfLaTeX for best results
LATEX = pdflatex
LATEX2DVI = $(LATEX) \\pdfoutput=0 \\input
LATEX2PDF = $(LATEX) \\pdfoutput=1 \\input

# MakeIndex parameters
MAKEINDEX = makeindex
GIND = gind.ist
GGLO = gglo.ist

# Installation
INSTALL = /usr/bin/install -c
INSTALL_DATA = $(INSTALL) -m 644
DESTDIR = .
TDSFORMAT = latex/

# Shell
RM = rm -f
ZIP = zip -9

TEXFILES=\
         $(PACKAGE).aux\
         $(PACKAGE).drv\
         $(PACKAGE).dvi\
         $(PACKAGE).glo\
         $(PACKAGE).gls\
         $(PACKAGE).idx\
         $(PACKAGE).ilg\
         $(PACKAGE).ind\
         $(PACKAGE).log\
         $(PACKAGE).pdf\
         $(PACKAGE).sty

PKGFILES=\
         AUTHORS\
         COPYING\
         ChangeLog\
         INSTALL\
         Makefile\
         README\
         $(PACKAGE).dtx\
         $(PACKAGE).ins\
         $(PACKAGE).pdf

.PHONY : all install uninstall dvi pdf clean

all : $(PACKAGE).sty $(PACKAGE).dvi $(PACKAGE).pdf ;

install : all
	$(INSTALL) -d $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)
	$(INSTALL) -d $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)
	$(INSTALL_DATA) $(PACKAGE).sty $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)/
	$(INSTALL_DATA) $(PACKAGE).dvi $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/
	$(INSTALL_DATA) $(PACKAGE).pdf $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/

uninstall : all
	$(RM) $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)/$(PACKAGE).sty
	$(RM) $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/$(PACKAGE).dvi
	$(RM) $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/$(PACKAGE).pdf
	ls $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)/* >/dev/null 2>&1  \
	    || $(RM) -r $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)
	ls $(DESTDIR)/texmf/doc/$(PACKAGE)/* >/dev/null 2>&1 \
	    || $(RM) -r $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)

dvi : $(PACKAGE).dvi

pdf : $(PACKAGE).pdf

%.sty : %.ins %.dtx
	$(LATEX) $<

%.dvi : %.dtx %.sty
	$(LATEX2DVI) $<
	$(MAKEINDEX) -s $(GIND) $*.idx
	$(MAKEINDEX) -s $(GGLO) -o $*.gls $*.glo
	$(LATEX2DVI) $<

%.pdf : %.dtx %.sty
	$(LATEX2PDF) $<
	$(MAKEINDEX) -s $(GIND) $*.idx
	$(MAKEINDEX) -s $(GGLO) -o $*.gls $*.glo
	$(LATEX2DVI) $<

$(PACKAGE).zip : $(PKGFILES)
	$(RM) $@
	$(ZIP) $@ $^

clean :
	$(RM) $(TEXFILES) $(PACKAGE).zip
