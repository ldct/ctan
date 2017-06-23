all:	clean arraysort.pdf

clean:
	rm -f *.log *.bbl *.blg *.dvi *.glo *.idx *.ilg *.ind *.sty *.aux *.gls *.zip *.tmp *~;

dist:	clean
	cd .. && zip -r arraysort/arraysort.zip arraysort/

arraysort.sty : arraysort.ins arraysort.dtx
	latex arraysort.ins

arraysort.pdf : arraysort.sty arraysort.glo arraysort.ind
	time pdflatex arraysort.dtx

# Glossary contains the changelist(?)
arraysort.glo : arraysort.dtx
	pdflatex arraysort.dtx && makeindex -s gglo.ist -o arraysort.gls arraysort.glo

arraysort.ind : arraysort.idx
	makeindex -s gind.ist -o arraysort.ind arraysort.idx
