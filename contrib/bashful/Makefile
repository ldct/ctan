PACKAGE=bashful
ARTICLE=00
SOURCES=${PACKAGE}.tex ${PACKAGE}.sty Makefile README

${PACKAGE}.pdf: ${SOURCES}
	pdflatex -shell-esc ${PACKAGE}.tex
	pdflatex -shell-esc ${PACKAGE}.tex

${ARTICLE}.pdf: ${ARTICLE}.tex
	xelatex -shell-esc ${ARTICLE}.tex
	xelatex -shell-esc ${ARTICLE}.tex

wrap: ${PACKAGE}.zip 

${PACKAGE}.zip: ${PACKAGE}.pdf $(SOURCES) ${ARTICLE}.tex ${ARTICLE}.pdf
	zip $@ $?

${ARTICLE}.zip: *.sty *.tex *.sh *.stderr *.stdout error.* 
	zip $@ $?

clean:
	rm -rf [dD]elme* *.aux *.sh *.osh *.toc *~ *.log *.out *.dvi *.lsh *.stderr \
	  *.stdout *.toc *.c minimal.* error.* date bashful.date *.exitCode \
		condition.* temperature.* _00 _bashful bashful.pdf *.pdf *.backup *.ps \
    begins.tex examining.tex good.* morning.* evening.* *.lst init.tex \
  	lines.tex weather.tex words.tex ls.* _rev.tex
