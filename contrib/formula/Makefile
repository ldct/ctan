## Makefile to install formula
## Copyright Andreas Tille under GPL
## Apr 24, 1998
##
PACKAGE = formula
VERSION = 0.2
prefix = /usr
FORMULA_DIR = $(prefix)/lib/texmf/tex/latex/$(PACKAGE)
DOC_DIR = $(prefix)/doc/$(PACKAGE)
EXAMPLE_DIR = $(prefix)/doc/$(PACKAGE)/example
BIN_DIR = $(prefix)/bin
INSTALL = /usr/bin/install -c 
INSTALL_TEX = $(INSTALL) -m 644
INSTALLDIR = $(INSTALL) -d

SOURCES = $(PACKAGE).dtx $(PACKAGE).ins
DOCS = README.1ST Bugs Changes Todo
INSTDOCS = install.ger install.eng 
ALLDOCS = $(DOCS) $(INSTDOCS)
HELPER = newformula
DOSHELPER = newform.bat
ALLHELPER = $(HELPER) $(DOSHELPER)
DISTFILES = $(SOURCES) $(ALLDOCS) $(ALLHELPER) Makefile
EXAMPLES = abverz.tex abverz.dvi formpel.tex formpel.dvi
distdir = $(PACKAGE)-$(VERSION)

PARTS=teile/driver.prt \
      teile/doc.prt \
      teile/formula.prt \
      teile/prepverz.prt \
      teile/exampl.prt

all: $(PACKAGE).dvi abverz.dvi formpel.dvi

##$(PACKAGE).dtx: dtx-stamp

##dtx-stamp:
#	if test -d teile; then \
#	    cd teile && make && cp -p $(PACKAGE).dtx ../$(PACKAGE).dtx ; \
#	fi
#	touch dtx-stamp

$(PACKAGE).sty: $(PACKAGE).dtx	
	latex $(PACKAGE).ins
	sed "/^$$/d" prepverz.sh > prepverz
	rm prepverz.sh
	chmod 755 prepverz

$(PACKAGE).dvi: $(PACKAGE).sty
	latex $(PACKAGE).drv
	latex $(PACKAGE).drv

abverz.dvi: $(PACKAGE).sty
	./prepverz $(PACKAGE).sty
	latex abverz.tex
	latex abverz.tex

formpel.dvi: $(PACKAGE).sty
	latex formpel.tex
	latex formpel.tex

install: all
	$(INSTALLDIR) $(FORMULA_DIR) $(DOC_DIR) $(EXAMPLE_DIR) $(BIN_DIR)
	$(INSTALL_TEX) $(PACKAGE).sty $(FORMULA_DIR)
	$(INSTALL_TEX) $(DOCS) $(PACKAGE).dvi $(HELPER) $(DOC_DIR)
	$(INSTALL_TEX) $(EXAMPLES) $(EXAMPLE_DIR)
	$(INSTALL) prepverz $(BIN_DIR)

upload: README.1ST Makefile
	echo "mailx -s \"CTAN Submission\" ctan@urz.uni-heidelberg.de <<..." > upload
	echo "Upload of formula version" $(VERSION) >> upload
	echo " " >> upload
	echo "I have upload in" >> upload
	echo " " >> upload
	echo "   ftp.dante.de:/incoming/formula/" >> upload
	for file in $(DISTFILES) ; \
	do \
	   echo "                                  "$$file >> upload ; \
	done
	echo " " >> upload
	echo "the package formula." >> upload
	echo " " >> upload
	echo "In my opinion a reasonable location would be"
	echo "   macros/latex/contrib/other  ." >> upload
	echo " " >> upload
	echo "README.1ST says:" >> upload
	echo "----------------------------------------------------------------------------" >> upload
	cat README.1ST >> upload
	echo "----------------------------------------------------------------------------" >> upload
	echo " " >> upload
	echo "Thank you for maintaining CTAN" >> upload
	echo " " >> upload
	echo "Andreas Tille (tille@physik.uni-halle.de)" >> upload
	echo "..." >> upload
	chmod 755 upload

dist: distdir upload
	-chmod -R a+r $(distdir)
	GZIP=--best tar chozf $(distdir).tar.gz $(distdir)
	-rm -rf $(distdir)

distdir: $(DISTFILES)
	rm -f dtx-stamp
	-rm -rf $(distdir)
	mkdir $(distdir)
	-chmod 777 $(distdir)
	@for file in $(DISTFILES); do \
	  test -f $(distdir)/$$file \
	  || ln $$file $(distdir)/$$file 2> /dev/null \
	  || cp -p $$file $(distdir)/$$file; \
	done

clean:	
	rm -f $(PACKAGE).sty formpel.tex prepverz.bat $(PACKAGE).drv abverz.tex prepverz.sh prepverz
	rm -f *.log *.aux *.dvi *.toc zw *.bbl *.blg *.cp *.cps *.fn *.fns \
	      *.ky *.pg *.tp *.vr *.vrs *~
	rm -f dtx-stamp
	rm -f upload

