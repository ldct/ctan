# Copyright 2007-2011 Christoph P. Neumann, Bernd Haberstumpf
#
# This makefile is intended to build an CV withg the ecv package.
#
# This file is free software; as a special exception the author
# gives unlimited permission to copy and/or distribute it, with
# or without modifications, as long as this notice is 
# preserved.
#
# This file is distributed in the hope that it will be useful, 
# but WITHOUT ANY WARRANTY, to the extent permitted by law; 
# without even the implied warranty of MERCHANTABILITY or 
# FITNESS FOR A PARTICULAR PURPOSE.

# LANGUAGE: The language to use
LANGUAGE	?= de
# BASENAME: The basename of the document without language
BASENAME	= CV-template_
# NAME: Basename of the package
NAME		= $(BASENAME)$(LANGUAGE)
# PORTTRAIT: The portrait of the writer
PORTRAIT	= portrait.eps

# BUILDPATH: Where distribution will be assembled
BUILDPATH	= build
# IMAGESPATH: Where images are searched
IMAGESPATH	= .

TEX		= $(NAME).tex
PDF		= $(NAME).pdf
DVI		= $(NAME).dvi

RES		= 600

#
# Tools
#

MKDIRP		= mkdir -p
CP		= cp
RMRF		= rm -rf
PDFLATEX	= pdflatex
LATEX		= latex
CONVERT		= convert
ACROREAD	= acroread

.PHONY : all force pdf fpdf dvi clean distclean

# create $(NAME).pdf
all : pdf

force : fpdf

# forced create a pdf from $(NAME).tex
fpdf : 
	@touch $(TEX)
	$(MAKE) $(PDF)

# Creates a pdf from $(NAME).tex
pdf : $(PDF)

# Creates a dvi from $(NAME).tex
dvi : $(DVI)

# show document with acroread
viewpdf : pdf
	@$(ACROREAD) $(PDF)

# Rule to create pdfs
%.pdf : %.tex
	@echo "-- Creating $(BUILDPATH)"
	@$(MKDIRP) "$(BUILDPATH)"
	@echo "-- Copy $< to $(BUILDPATH)"
	@$(CP) "$<" "$(BUILDPATH)"
	@echo "-- Copying image images/$(PORTRAIT)"
	@$(CONVERT) -density $(RES)x$(RES) \
		    -size 945x1417 \
		    $(IMAGESPATH)/$(PORTRAIT) \
		    $(BUILDPATH)/portrait.jpg
	@echo "-- Running pdflatex"
	cd $(BUILDPATH); $(PDFLATEX) $<
	@$(CP) $(BUILDPATH)/$@ .

%.dvi : %.tex
	@echo "-- Creating $(BUILDPATH)"
	@$(MKDIRP) "$(BUILDPATH)"
	@echo "-- Copy $< to $(BUILDPATH)"
	@$(CP) "$<" "$(BUILDPATH)"
	@echo "-- Running pdflatex"
	@( \
	cd $(BUILDPATH); \
	$(LATEX) $<; \
	)
	@$(CP) $(BUILDPATH)/$@ .

images/%.jpg : build/%.jpg
	

# Cleans up this installation
clean:
	@echo "-- Removing $(BUILDPATH)"
	@$(RMRF) $(BUILDPATH)

# Also removes pdfs and dvis
distclean: clean
	@echo "-- Removing $(PDF)and $(DVI)"
	@$(RMRF) $(PDF)
	@$(RMRF) $(DVI)
