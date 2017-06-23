# $Id: Makefile,v 1.5 1995/11/21 00:41:49 schrod Exp $
#----------------------------------------------------------------------

default:: install


#
# installation
#

# root of TDS compliant installation

    TEXMF = /usr/local/lib/texmf

# Comment it out if you don't want to install contributed packages.
# (Not recommended.)

    INSTALL_CONTRIB = install-contrib

# installation target directories
# (No need to change here for TDS installations.)

    LATEX = $(TEXMF)/tex/latex
    CWEB = $(LATEX)/cweb

    LATEX_DOC = $(TEXMF)/doc/latex
    CWEB_DOC = styles/cweb


# installation actions

.PHONY:	install install-cweb-sty install-contrib

install:: install-cweb-sty $(INSTALL_CONTRIB)

install-cweb-sty:: $(LATEX) $(LATEX_DOC)
	test -d $(CWEB)  ||  mkdir $(CWEB)
	cp *.sty *.cls $(CWEB)
	cd $(LATEX_DOC) ; \
		if [ ! -d $(CWEB_DOC) ] ; \
		   then	d=`echo $(CWEB_DOC) | sed 's:/.*::'` ; \
			test -d $$d  ||  mkdir $$d ; \
			test -d $(CWEB_DOC)  ||  mkdir $(CWEB_DOC) ; \
		fi
	cp *.dvi $(LATEX_DOC)/$(CWEB_DOC)

install-contrib::
	cp contrib/*.sty $(CWEB)
	: cp contrib/*.dvi $(CWEB_DOC)

$(LATEX):
	@echo "You don't have a LaTeX styles directory (tree)." >&2
	@exit 1

$(LATEX_DOC):
	@echo "You don't have a LaTeX documentation directory (tree)." >&2
	@exit 1


#
# management tasks
#

.PHONY:	distrib collect pack

distrib:: collect pack

pack::
	cp $(HOME)/Notes/Copying.gpl License
	pwd=`pwd` ; pwd=`suffix $$pwd /` ; cd .. ; \
	    gtar -czvf $$pwd.tar.gz \
		--exclude=CVS --exclude=.cvsignore --exclude=.rcsrc $$pwd ; \
	    cp $$pwd/README  $$pwd.README
	/bin/rm -f License

collect::
	cd src ; imkmf ; make distrib
	cd examples ; make distrib
	: 'cd contrib ; make distrib'
