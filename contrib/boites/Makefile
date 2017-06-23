LATEX    = latex --interaction=nonstopmode
EXAMPLES = boites_examples
DVIPS    = dvips

all:
	$(LATEX) $(EXAMPLES).tex
	$(DVIPS) -o $(EXAMPLES).ps $(EXAMPLES).dvi

clean:
	rm -f *.dvi *.ps *.aux *.log *\~