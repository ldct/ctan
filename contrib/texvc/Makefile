PACKAGE = texvc
all: $(PACKAGE).pdf

$(PACKAGE).sty: $(PACKAGE).dtx $(PACKAGE).ins
	pdflatex $(PACKAGE).ins

$(PACKAGE).pdf: $(PACKAGE).dtx $(PACKAGE).sty
	pdflatex $(PACKAGE).dtx
