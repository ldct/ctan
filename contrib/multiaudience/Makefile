#
#
# This file is in public domain
#
# $Id: Makefile,v 1.3 2015/08/02 23:00:13 boris Exp $
#

PACKAGE=multiaudience
PDF = sample-execs.pdf sample-devs.pdf sample-admins.pdf


all:  $(PACKAGE).pdf ${PDF}

%.pdf:  %.dtx   $(PACKAGE).sty
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done




%.sty:   %.ins %.dtx  
	pdflatex $<

sample-%.pdf:  sample.tex $(PACKAGE).sty
	pdflatex -jobname sample-$* "\def\CurrentAudience{$*}\input{sample.tex}"
	-bibtex sample-$*
	pdflatex -jobname sample-$* "\def\CurrentAudience{$*}\input{sample.tex}"
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' sample-$*.log) \
	do pdflatex -jobname sample-$* "\def\CurrentAudience{$*}\input{sample.tex}"; done


.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).sty


clean:
	$(RM) $(PACKAGE).sty  *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.hd \
	*.dvi *.ps *.tgz *.zip *.brf

veryclean: clean
	$(RM) $(PACKAGE).pdf ${PDF}

distclean: veryclean

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	tar -czvf $(PACKAGE).tgz -C .. --exclude '*~' --exclude '*.tgz' --exclude CVS $(PACKAGE)

zip:  all clean
	${MAKE} $(PACKAGE).sty
	$(RM) *.log
	zip -r  $(PACKAGE).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'