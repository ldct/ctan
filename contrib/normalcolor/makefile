#
# makefile
# Copyright (c) Markus Kohm, 2016
#
# This work may be distributed and/or modified under the conditions of
# the LaTeX Project Public License, version 1.3c of the license.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.3c or later is part of all distributions of LaTeX
# version 2005/12/01 or later.
#
# This work has the LPPL maintenance status "maintained".
#
# The Current Maintainer and author of this work is Markus Kohm.
#
# The work consists of the file `normalcolor.dtx` only.
#

PACKAGENAME   = normalcolor

RM            = rm -f
CP            = cp -a
SED           = sed
CUT           = cut
ECHO          = echo
TeX           = tex -interaction=batchmode
PDFTeX        = pdflatex -interaction=batchmode
MKINDEX       = mkindex
INSTALLFILES  = install
INSTALLDIRS   = install -d
CTANIFY       = ctanify

GETTEXMFLOCAL = kpsewhich -var-value=TEXMFLOCAL | cut -d: -f1
GETTEXMFHOME  = kpsewhich -var-value=TEXMFHOME | cut -d: -f1

TEXHASH       = texhash

SOURCEFILES  = normalcolor.dtx makefile
UNSOURCEFILES= README.txt normalcolor.sty normalcolor-example.tex
LATEXFILES   = normalcolor.sty
DOCFILES     = normalcolor.pdf README
DISTFILES    = $(SOURCEFILES) $(LATEXFILES) $(DOCFILES)

CTANIFYEXTRA = --tdsonly normalcolor-example.tex \
	       normalcolor-example.tex=doc/latex/normalcolor

DATE    = $(word 2, $$Date: 2016-03-18 15:00:44 +0100 (Fr, 18 Mär 2016) $$)
YEAR    = $(shell $(ECHO) $(DATE) | $(CUT) -d- -f1)

ifdef INSTALLLOCAL
INSTALLROOT = $(shell $(GETTEXMFLOCAL))
else
INSTALLROOT = $(shell $(GETTEXMFHOME))
endif

ifeq ($(INSTALLROOT),)
$(error Installation TDS root dir not found)
endif

SOURCEDIR = $(INSTALLROOT)/source/latex/$(PACKAGENAME)
DOCDIR    = $(INSTALLROOT)/doc/latex/$(PACKAGENAME)
LATEXDIR  = $(INSTALLROOT)/tex/latex/$(PACKAGENAME)

all: info $(DISTFILES)

info:
	$(info Installation TDS root dir: $(INSTALLROOT))
	$(info Installation of source files to: $(SOURCEDIR))
	$(info Installation of LaTeX  files to: $(LATEXDIR))
	$(info Installation of docu   files to: $(DOCDIR))

makefile: makefile.in
ifeq ($(YEAR),2016)
	$(CP) $< $@
else
	$(SED) 's/^# Copyright (c) Markus Kohm, 2016$$/\1-$(YEAR)/' $< >$@
endif
	$(SED) -i 's/^\(# makefile\)\.in$$/\1/' $@

README: README.txt
	$(CP) $< $@

$(UNSOURCEFILES): $(SOURCEFILES)
	$(TeX) $<

normalcolor.pdf: $(SOURCEFILES)
	$(PDFTeX) $<
	$(PDFTeX) $<
	$(MKINDEX) $(basename $<)
	$(PDFTeX) $<
	$(PDFTeX) $<

install: $(DISTFILES)
	$(INSTALLDIRS) $(DOCDIR) $(LATEXDIR) $(SOURCEDIR)
	$(INSTALLFILES) $(DOCFILES) $(DOCDIR)
	$(INSTALLFILES) $(LATEXFILES) $(LATEXDIR)
	$(INSTALLFILES) $(SOURCEFILES) $(SOURCEDIR)
	$(TEXHASH) $(INSTALLROOT)

dist: $(DISTFILES)
	$(CTANIFY) -p $(PACKAGENAME) \
	           $(foreach latexfile,$(LATEXFILES),--tdsonly $(latexfile) )\
	           $(CTANIFYEXTRA) \
		   $(LATEXFILES) \
	           $(SOURCEFILES) \
	           $(DOCFILES)

clean:
	$(RM) *~ *.aux *.glo *.gls *.hd *.idx *.ilg *.ind *.log *.out *.toc \
	      *.synctex.gz

allclean: clean
	$(RM) $(UNSOURCEFILES) $(DOCFILES) $(PACKAGENAME).tar.gz \
	      $(PACKAGENAME).tds.zip
	$(RM) -r auto

.PHONY: all info install dist clean allclean
