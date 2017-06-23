## bgteubner class bundle
##
## Makefile
## Copyright 2003--2005 Harald Harders
#
# This program may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license or (at your opinion) any later version.
# The latest version of this license is in
#    http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of LaTeX
# version 1999/12/01 or later.
#
# This program consists of all files listed in manifest.txt.

LATEX= pdflatex '\pdfoutput=0\let\pdfoutput=\relax\input'
PDFLATEX= pdflatex

TEX=	\
	befehlsreferenz.tex \
	bgteubner.tex \
	bilder.tex \
	checkliste.tex \
	einleitung.tex \
	globales.tex \
	hyphenation.tex \
	installation.tex \
	literatur.bib \
	literatur.tex \
	optionen-advanced.tex \
	tex_aufruf.tex \
	tex_bilder.tex \
	tex_globales.tex \
	tex_textelemente.tex \
	tex_typographie.tex \
	tex_verzeichnisse.tex \
	textelemente.tex \
	verzeichnisse.tex \
	vorwort.tex \


all: bgteubner-17x24-times.pdf

cm:	bgteubner-17x24-cm.pdf
times:	bgteubner-17x24-times.pdf
mathtime:	bgteubner-17x24-mathtime.pdf

bgteubner-17x24-times.pdf: $(TEX)
	-makeindex -c -g -s bgteuglochar.ist -o bgteubner-17x24-times.glscmd -t bgteubner-17x24-times.logcmd bgteubner-17x24-times.glocmd
	-makeindex -c -g -s bgteubner.ist bgteubner-17x24-times
	-bibtex bgteubner-17x24-times
	$(PDFLATEX) bgteubner-17x24-times

bgteubner-17x24-mathtime.pdf: $(TEX)
	-makeindex -c -g -s bgteuglochar.ist -o bgteubner-17x24-mathtime.glscmd -t bgteubner-17x24-mathtime.logcmd bgteubner-17x24-mathtime.glocmd
	-makeindex -c -g -s bgteubner.ist bgteubner-17x24-mathtime
	-bibtex bgteubner-17x24-mathtime
	$(PDFLATEX) bgteubner-17x24-mathtime

bgteubner-17x24-cm.pdf: $(TEX)
	-makeindex -c -g -s bgteuglochar.ist -o bgteubner-17x24-cm.glscmd -t bgteubner-17x24-cm.logcmd bgteubner-17x24-cm.glocmd
	-makeindex -c -g -s bgteubner.ist bgteubner-17x24-cm
	-bibtex bgteubner-17x24-cm
	$(PDFLATEX) bgteubner-17x24-cm

bgteubner-a5-times.pdf: $(TEX)
	-makeindex -c -g -s bgteuglochar.ist -o bgteubner-a5-times.glscmd -t bgteubner-a5-times.logcmd bgteubner-a5-times.glocmd
	-makeindex -c -g -s bgteubner.ist bgteubner-a5-times
	-bibtex bgteubner-a5-times
	$(PDFLATEX) bgteubner-a5-times

bgteubner-a5-cm.pdf: $(TEX)
	-makeindex -c -g -s bgteuglochar.ist -o bgteubner-a5-cm.glscmd -t bgteubner-a5-cm.logcmd bgteubner-a5-cm.glocmd
	-makeindex -c -g -s bgteubner.ist bgteubner-a5-cm
	-bibtex bgteubner-a5-cm
	$(PDFLATEX) bgteubner-a5-cm

bgteubner-a5-mathtime.pdf: $(TEX)
	-makeindex -c -g -s bgteuglochar.ist -o bgteubner-a5-mathtime.glscmd -t bgteubner-a5-mathtime.logcmd bgteubner-a5-mathtime.glocmd
	-makeindex -c -g -s bgteubner.ist bgteubner-a5-mathtime
	-bibtex bgteubner-a5-mathtime
	$(PDFLATEX) bgteubner-a5-mathtime

class:
	cd ../../source && make install

clean:
	-rm -f bgteubner-17x24-times.{bbl,blg,dvi,idx,ilg,ind,log,toc,glocmd,logcmd,glscmd,lox}
	-rm -f bgteubner-17x24-mathtime.{bbl,blg,dvi,idx,ilg,ind,log,toc,glocmd,logcmd,glscmd,lox}
	-rm -f bgteubner-17x24-cm.{bbl,blg,dvi,idx,ilg,ind,log,toc,glocmd,logcmd,glscmd,lox}
	-rm -f bgteubner-a5-times.{bbl,blg,dvi,idx,ilg,ind,log,toc,glocmd,logcmd,glscmd,lox}
	-rm -f bgteubner-a5-cm.{bbl,blg,dvi,idx,ilg,ind,log,toc,glocmd,logcmd,glscmd,lox}
	-rm -f bgteubner-a5-mathtime.{bbl,blg,dvi,idx,ilg,ind,log,toc,glocmd,logcmd,glscmd,lox}
	-rm -f *.aux

distclean: clean
	-rm -f bgteubner-17x24-times.pdf
	-rm -f bgteubner-17x24-mathtime.pdf
	-rm -f bgteubner-17x24-cm.pdf
	-rm -f bgteubner-a5-times.pdf
	-rm -f bgteubner-a5-mathtime.pdf
	-rm -f bgteubner-a5-cm.pdf
	-rm -f bgteubner-17x24-times.info
	-rm -f bgteubner-17x24-mathtime.info
	-rm -f bgteubner-17x24-cm.info
	-rm -f bgteubner-a5-times.info
	-rm -f bgteubner-a5-mathtime.info
	-rm -f bgteubner-a5-cm.info

install:
	$(PDFLATEX) bgteubner-17x24-times
	bibtex bgteubner-17x24-times
	$(PDFLATEX) bgteubner-17x24-times
	makeindex -c -g -s bgteuglochar.ist -o bgteubner-17x24-times.glscmd \
		-t bgteubner-17x24-times.logcmd bgteubner-17x24-times.glocmd
	makeindex -c -g -s bgteubner.ist bgteubner-17x24-times
	$(PDFLATEX) bgteubner-17x24-times
	$(PDFLATEX) bgteubner-17x24-times
	makeindex -c -g -s bgteubner.ist bgteubner-17x24-times
	$(PDFLATEX) bgteubner-17x24-times
	cp -f bgteubner-17x24-times.pdf ..
	echo ''
	$(PDFLATEX) bgteubner-17x24-cm
	bibtex bgteubner-17x24-cm
	$(PDFLATEX) bgteubner-17x24-cm
	makeindex -c -g -s bgteuglochar.ist -o bgteubner-17x24-cm.glscmd \
		-t bgteubner-17x24-cm.logcmd bgteubner-17x24-cm.glocmd
	makeindex -c -g -s bgteubner.ist bgteubner-17x24-cm
	$(PDFLATEX) bgteubner-17x24-cm
	$(PDFLATEX) bgteubner-17x24-cm
	makeindex -c -g -s bgteubner.ist bgteubner-17x24-cm
	$(PDFLATEX) bgteubner-17x24-cm
	cp -f bgteubner-17x24-cm.pdf ..
	echo ''
	$(PDFLATEX) bgteubner-17x24-mathtime
	bibtex bgteubner-17x24-mathtime
	$(PDFLATEX) bgteubner-17x24-mathtime
	makeindex -c -g -s bgteuglochar.ist \
		-o bgteubner-17x24-mathtime.glscmd \
		-t bgteubner-17x24-mathtime.logcmd \
		bgteubner-17x24-mathtime.glocmd
	makeindex -c -g -s bgteubner.ist bgteubner-17x24-mathtime
	$(PDFLATEX) bgteubner-17x24-mathtime
	$(PDFLATEX) bgteubner-17x24-mathtime
	makeindex -c -g -s bgteubner.ist bgteubner-17x24-mathtime
	$(PDFLATEX) bgteubner-17x24-mathtime
	cp -f bgteubner-17x24-mathtime.pdf ..
#	echo ''
#	$(PDFLATEX) bgteubner-a5-times
#	bibtex bgteubner-a5-times
#	$(PDFLATEX) bgteubner-a5-times
#	makeindex -c -g -s bgteuglochar.ist -o bgteubner-a5-times.glscmd \
#		-t bgteubner-a5-times.logcmd bgteubner-a5-times.glocmd
#	makeindex -c -g -s bgteubner.ist bgteubner-a5-times
#	$(PDFLATEX) bgteubner-a5-times
#	$(PDFLATEX) bgteubner-a5-times
#	makeindex -c -g -s bgteubner.ist bgteubner-a5-times
#	$(PDFLATEX) bgteubner-a5-times
#	cp -f bgteubner-a5-times.pdf ..
#	echo ''
#	$(PDFLATEX) bgteubner-a5-cm
#	bibtex bgteubner-a5-cm
#	$(PDFLATEX) bgteubner-a5-cm
#	makeindex -c -g -s bgteuglochar.ist -o bgteubner-a5-cm.glscmd \
#		-t bgteubner-a5-cm.logcmd bgteubner-a5-cm.glocmd
#	makeindex -c -g -s bgteubner.ist bgteubner-a5-cm
#	$(PDFLATEX) bgteubner-a5-cm
#	$(PDFLATEX) bgteubner-a5-cm
#	makeindex -c -g -s bgteubner.ist bgteubner-a5-cm
#	$(PDFLATEX) bgteubner-a5-cm
#	cp -f bgteubner-a5-cm.pdf ..
#	echo ''
#	$(PDFLATEX) bgteubner-a5-mathtime
#	bibtex bgteubner-a5-mathtime
#	$(PDFLATEX) bgteubner-a5-mathtime
#	makeindex -c -g -s bgteuglochar.ist \
#		-o bgteubner-a5-mathtime.glscmd \
#		-t bgteubner-a5-mathtime.logcmd \
#		bgteubner-a5-mathtime.glocmd
#	makeindex -c -g -s bgteubner.ist bgteubner-a5-mathtime
#	$(PDFLATEX) bgteubner-a5-mathtime
#	$(PDFLATEX) bgteubner-a5-mathtime
#	makeindex -c -g -s bgteubner.ist bgteubner-a5-mathtime
#	$(PDFLATEX) bgteubner-a5-mathtime
#	cp -f bgteubner-a5-mathtime.pdf ..
