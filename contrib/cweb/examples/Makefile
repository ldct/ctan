# $Id: Makefile,v 1.5 1995/11/21 00:42:38 schrod Exp $
#----------------------------------------------------------------------


all:: wcltx.dvi


wcltx.dvi: wcltx.tex wcltx.bib ../cweb.cls
	tex-it latex wcltx
	rm -f wcltx.blg

wcltx.tex: wcltx.w
	cweave wcltx


    AUX = *.aux *.bbl *.dvi *.idx *.log *.scn *.tex

distrib::
	decomment-tex /usr/local/lib/texmf/tex/latex/misc/rcs.sty \
	    'from CTAN, directory macros/tex/latex/contrib/supported/rcs/.' \
	    >rcs.sty
	cp /usr/local/bin/tex-it .
	$(MAKE) all
	mkdir compare
	mv $(AUX) compare


clean::
	/bin/rm -f $(AUX)
