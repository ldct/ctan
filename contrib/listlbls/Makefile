NAME  = listlbls
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -d)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell ltxfileinfo -v $(NAME).dtx)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)

all:	$(NAME).pdf README.md README clean

README: README.txt
	cp README.txt README

README.txt: $(NAME).pdf

README.md: $(NAME).pdf

$(NAME).pdf: $(NAME).dtx
	xelatex -shell-escape -recorder -interaction=batchmode $(NAME).dtx >/dev/null
	if [ -f $(NAME).glo ]; then makeindex -q -s gglo.ist -o $(NAME).gls $(NAME).glo; fi
	if [ -f $(NAME).idx ]; then makeindex -q -s gind.ist -o $(NAME).ind $(NAME).idx; fi
	xelatex -shell-escape -recorder -interaction=nonstopmode $(NAME).dtx > /dev/null
	xelatex -shell-escape -recorder -interaction=nonstopmode $(NAME).dtx > /dev/null

clean:
	rm -f *.fls
	rm -f $(NAME).{aux,toc,fls,glo,gls,hd,idx,ilg,ind,ins,log,out}

distclean: clean
	rm -f $(NAME).{pdf,sty} README{,.{md,txt}}

inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp $(NAME).sty $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).pdf $(UTREE)/doc/latex/$(NAME)

install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	sudo cp $(NAME).sty $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(LOCAL)/doc/latex/$(NAME)

zip: all
	mkdir $(TDIR)
	cp $(NAME).{pdf,dtx} Makefile README $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
