# Copyright 2013 TeX Users Group.
# This file is part of the dialogl package, released under the LPPL;
# see dialogl.ins for details.

pkg = dialogl
dtx = $(pkg).dtx grabhedr.dtx listout.dtx menus.dtx
#
srcfiles = Makefile README
srcfiles += $(pkg).ins $(dtx)
srcfiles += cnvunits.tex dia-driv.tex
srcfiles += dialogl-doc.sty
srcfiles += fontmenu.tex fontmenu.lg # doc
srcfiles += diatest.tex
derivedfiles =

opt = --interaction=nonstopmode --file-line-error
latex = latex $(opt)
pdflatex = pdflatex $(opt)
#
%.pdf: %.tex
	$(pdflatex) $<
	$(pdflatex) $<

default: all
all: dist

derivedfiles += default.los
default.los: dialogl.dtx

derivedfiles += codialog.pdf
codialog.pdf: codialog.tex
	echo P | pdflatex $<
	echo P | pdflatex $<

derivedfiles += dia-driv.pdf
dia-driv.pdf: dialogl-doc.sty

# doesn't really depend on dialog.sty for running, but we want to make
# sure the .ins works.
dia-driv.pdf: dialog.sty
dialog.sty grabhedr.sty listout.tex menus.sty: $(pkg).ins $(dtx)
	yes | head -100 | latex $<
# \askforoverwritefalse seemingly has no effect.

dist: $(pkg).zip
$(pkg).zip: manifest.txt $(srcfiles) $(derivedfiles)
	chmod a+rw $^
	rm -f $@; zip $@ $^

manifest.txt: $(srcfiles)
	chmod a+rw $^
	echo $@ $^ | tr ' ' '\n' >$@
