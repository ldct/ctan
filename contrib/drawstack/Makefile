all: stack-example.pdf drawstack.zip

stack-example.pdf: stack-example.tex drawstack.sty
	pdflatex stack-example.tex

FILES=stack-example.pdf stack-example.tex drawstack.sty README Makefile

drawstack.zip: $(FILES)
	cd .. && zip -r $@ $(FILES:%=drawstack/%) && mv drawstack.zip drawstack/
