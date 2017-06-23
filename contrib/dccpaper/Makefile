NAME  = dccpaper
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -d -t tmp.XXXXXXXXXX)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell ltxfileinfo -v $(NAME).dtx)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)

.PHONY: clean distclean inst install uninst uninstall zip ctan

all:	$(NAME).pdf clean
	@exit 0

ijdc-v9.cls idcc.cls $(NAME)-base.sty: $(NAME).dtx
	pdflatex -shell-escape -recorder -interaction=batchmode $(NAME).dtx >/dev/null

$(NAME).pdf: $(NAME).dtx ijdc-v9.cls $(NAME)-biblatex.bib $(NAME)-by.pdf
	biber $(NAME)
	pdflatex --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null
	pdflatex --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null

clean:
	rm -f $(NAME).{aux,bbl,bcf,blg,fdb_latexmk,fls,glo,gls,hd,idx,ilg,ind,ins,log,out,run.xml,synctex.gz} $(NAME)-base.doc ijdc-v9.doc idcc.doc

distclean: clean
	rm -f $(NAME).pdf ijdc-v9.cls idcc.cls $(NAME)-base.sty $(NAME)-{biblatex,apacite}.bib

inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp {ijdc-v9,idcc}.cls $(NAME)-base.sty $(NAME)-by.{eps,pdf} $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).pdf $(NAME)-{biblatex,apacite}.bib README.md $(UTREE)/doc/latex/$(NAME)
	mktexlsr
uninst:
	rm -r $(UTREE)/{tex,source,doc}/latex/$(NAME)
	mktexlsr

install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	sudo cp {ijdc-v9,idcc}.cls $(NAME)-base.sty $(NAME)-by.{eps,pdf} $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(NAME)-{biblatex,apacite}.bib README.md $(LOCAL)/doc/latex/$(NAME)
	mktexlsr
uninstall:
	sudo rm -r $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	mktexlsr

zip: all
	mkdir $(TDIR)
	cp {ijdc-v9,idcc}.cls $(NAME)-base.sty $(NAME)-by.{eps,pdf} $(NAME).{dtx,pdf} README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)

ctan: all
	mkdir $(TDIR)
	cp $(NAME).{dtx,pdf} $(NAME)-by.{eps,pdf} README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
