## 
## Makefile to install pdftricks.sty
##
## CV Radhakrishnan <cvr@river-valley.org>
##
##
BINDIR = /usr/bin
MKDIR=mkdir
COPY=cp
CHDIR=cd
ECHO=echo
ZIP=zip -9
INSTALLDIRVAR=TEXMFMAIN

all: pdftricks binaries test

pdftricks: 
	( \
	TEXMF=`kpsewhich -expand-var '$$$(INSTALLDIRVAR)'`; \
	echo installing to $${TEXMF}/tex/latex/pdftricks; \
	$(MKDIR) $${TEXMF}/tex/latex/pdftricks; \
	$(COPY) *.sty manual.pdf $${TEXMF}/tex/latex/pdftricks \
	)

binaries:
	$(COPY) pst2pdf  $(BINDIR)

test:
	texhash               ;
	pdflatex test         ;
	pdflatex test         ;
	acroread example.pdf

clean:
	rm -f ./*
