SHELL=/bin/bash
NAME=mnotes
VERSION=0.8
DISTDIR=$(NAME)
ARCHIVE_NAME=/tmp/$(NAME)-$(VERSION).tar.gz
DISTFILES=$(NAME).dtx Makefile README $(NAME).ins $(NAME).pdf

DEP=$(NAME).sty

all: pdf

ps: $(NAME).ps

%.ps: %.dvi
	dvips $(DVIPSOPT) $< -o $@

pdf: $(NAME).pdf $(DEP)

%.pdf: %.dtx
	pdflatex $<
	makeindex -s gglo.ist -o $(NAME).gls $(NAME).glo
	makeindex -s gind.ist -o $(NAME).ind $(NAME).idx
	pdflatex $<

dist: $(DISTFILES)
	rm -rf $(DISTDIR)
	mkdir $(DISTDIR)
	cp -aL --parents $(DISTFILES) $(DISTDIR)
	tar cfvz $(ARCHIVE_NAME) $(DISTDIR)
	rm -rf $(DISTDIR)

clean: 
	rm -f $(NAME).{glo,log,toc,lot,lof,idx,ilg,ind,aux,blg,bbl,dvi}
	rm -f *~

cleandist: clean 
	rm -f $(NAME).{pdf,sty,ins}

REFWARN = 'Rerun to get cross-references'
LATEXMAX = 5

%.dvi: %.dtx $(DEP)
	latex $<
	RUNS=$(LATEXMAX); \
	while [ $$RUNS -gt 0 ] ; do \
		if grep $(REFWARN) $*.log > /dev/null; \
		then latex $< ; else break; fi; \
		RUNS=`expr $$RUNS - 1`; \
	done

$(NAME).sty: $(NAME).ins FORCE
	tex $(NAME).ins

$(NAME).ins:
	pdflatex $(NAME).dtx

FORCE:
