all:	clean macroswap.pdf

clean:
	rm -f *.log *.bbl *.blg *.dvi *.glo *.idx *.ilg *.ind *.sty *.aux *.gls *.zip *~

dist:	clean
	cd .. && zip -r macroswap/macroswap.zip macroswap/

macroswap.sty : macroswap.ins macroswap.dtx
	latex macroswap.ins

macroswap.pdf : macroswap.sty macroswap.glo macroswap.ind
	pdflatex macroswap.dtx

# Glossary contains the changelist(?)
macroswap.glo : macroswap.dtx
	pdflatex macroswap.dtx && makeindex -s gglo.ist -o macroswap.gls macroswap.glo

macroswap.ind : macroswap.idx
	makeindex -s gind.ist -o macroswap.ind macroswap.idx
