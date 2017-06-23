# GNUmakefile, © 2003, 2004, Djalil CHAFAI.

# Please adjust the following variables to your environment.

BIBTEX=bibtex
DVIPS=dvips -D 600 -t a4
LATEX=latex #--src-specials
PDFLATEX=pdflatex
RM=rm
THUMBPDF=thumbpdf

# Normally, what follows does not need any modification. 

NOM=xpl-fr
NOML=""
MAKEFILENAME=GNUmakefile
OUTPUTS=dvi ps pdf
INTERMED=log out aux toc ind bbl blg lol lof lot ilg idx inc rel brf tpt
FIGSDIR=img
CODESDIR=pgm
TEXINPUTS:=.:./$(FIGSDIR)//:./$(CODESDIR)//:$(TEXINPUTS)
export TEXINPUTS

# Static sources related variables.

TEX= $(NOM).bib $(NOM).tex
MISC1= $(shell kpsewhich amsalpha.bst)
MISC2= $(wildcard $(FIGSDIR)/* $(CODESDIR)/*) $(MAKEFILENAME)
SRC= $(MISC1) $(MISC2) $(TEX)

# Dependencies.

DEP_PS=$(MAKEFILENAME) $(MISC1) $(TEX)
DEP_PDF=$(MAKEFILENAME) $(MISC1) $(TEX)
DEP_ARCH=$(SRC) $(NOM).ps $(NOM).pdf


# Special variables.

.PHONY= $(OUTPUTS) help clean cleanall
.PHONY: $(.PHONY)
.SUFFIXES:
.INTERMEDIATE: $(INTERMDED:%=$(NOM).%)

# Phony rules.

help:
	@echo
	@echo " Rules to compile $(NOM).tex : $(.PHONY)."
	@echo " For example «make ps» will make the PS file for you!"
	@echo 

dvi: clean $(NOM).dvi
ps: $(NOM).ps
pdf: clean $(NOM).pdf

clean:
	@$(RM) -f $(INTERMED:%=$(NOM).%) thb*.png *~ *.aux *.inc
	@$(RM) -f $(CODESDIR)/*~ $(FIGSDIR)/*~ 
	@$(RM) -rf auto

cleanall: clean
	@for f in $(OUTPUTS); do $(RM) -f $(NOM).$$f; done

# Rules based on target files.

$(NOM).ps: $(NOM).dvi
	@$(DVIPS) $(NOM).dvi -o $(NOM).ps

$(NOM).dvi: $(DEP_PS)
	@$(LATEX) $(NOM)
	@$(BIBTEX) $(NOM)
	@$(LATEX) $(NOM)
	@$(LATEX) $(NOM)
	@$(LATEX) $(NOM)

$(NOM).pdf: $(DEP_PDF)
	@$(PDFLATEX) $(NOM)
	@$(BIBTEX) $(NOM)
	@$(PDFLATEX) $(NOM)
	@$(PDFLATEX) $(NOM)
	@$(THUMBPDF) $(NOM).pdf
	@$(PDFLATEX) $(NOM)

# End Of File.
