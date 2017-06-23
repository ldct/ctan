# Makefile for contracard.
# Copied almost exactly from the fontspec makefile.

#### MAKEFILE CONFIG ####

SHELL = /bin/sh
.SUFFIXES:
.SILENT:

#### BEGIN ####

help:
	@echo 'CONTRACARD makefile targets:'
	@echo ' '
	@echo '                  help  -  (this message)'
	@echo '                unpack  -  extracts all files'
	@echo '                   doc  -  compile documentation'
	@echo '                gendoc  -  compile git-aware documentation'
	@echo '                  ctan  -  generate archive for CTAN'
	@echo '                   all  -  unpack & doc'
	@echo '                 world  -  all & ctan'
	@echo '                 clean  -  remove all generated and built files'
	@echo '                preview -  preview the documentation'
	@echo ' '
	@echo '                   install  -  install the complete class into your home texmf tree'
	@echo '               cls-install  -  install the class code only'
	@echo ' install TEXMFROOT=<texmf>  -  install the class into the path <texmf>'


NAME = contracard
DOC = $(NAME).pdf
DTX = $(NAME).dtx

# Redefine this to print output if you need:
REDIRECT = > /dev/null

# Files grouped by generation mode
COMPILED = $(DOC)
UNPACKED = $(NAME).cls
SOURCE = $(DTX) Makefile README LICENSE
GENERATED = $(COMPILED) $(UNPACKED)

CTAN_FILES = $(SOURCE) $(COMPILED)

UNPACKED_DOC =

RUNFILES = $(filter-out $(UNPACKED_DOC), $(UNPACKED))
DOCFILES = $(COMPILED) README LICENSE $(UNPACKED_DOC)
SRCFILES = $(DTX) Makefile

ALL_FILES = $(RUNFILES) $(DOCFILES) $(SRCFILES)

# Installation locations
FORMAT = latex
RUNDIR = $(TEXMFROOT)/tex/$(FORMAT)/$(NAME)
DOCDIR = $(TEXMFROOT)/doc/$(FORMAT)/$(NAME)
SRCDIR = $(TEXMFROOT)/source/$(FORMAT)/$(NAME)
TEXMFROOT = $(shell kpsewhich --var-value TEXMFHOME)

CTAN_ZIP = $(NAME).zip
TDS_ZIP = $(NAME).tds.zip
ZIPS = $(CTAN_ZIP) $(TDS_ZIP)

DO_LATEX = xelatex --interaction=nonstopmode $<  $(REDIRECT)
DO_LATEX_WRITE18 = xelatex --shell-escape --interaction=nonstopmode $< $(REDIRECT)
DO_TEX = tex --interaction=nonstopmode $< $(REDIRECT)
DO_MAKEINDEX = makeindex -s gind.ist $(subst .dtx,,$<) $(REDIRECT) 2>&1
DO_SPLITINDEX = splitindex $(subst .dtx,,$<) $(REDIRECT) 2>&1
DO_MAKECHANGES = makeindex -s gglo.ist -o $(NAME).gls $(NAME).glo $< $(REDIRECT) 2>&1

all: $(GENERATED)
doc: $(COMPILED)
unpack: $(UNPACKED)
ctan: $(CTAN_ZIP)
tds: $(TDS_ZIP)
world: all ctan

resources: by.png by-nc.png

by.png:
	wget http://mirrors.creativecommons.org/presskit/buttons/80x15/png/by.png

by-nc.png:
	wget http://mirrors.creativecommons.org/presskit/buttons/80x15/png/by-nc.png


gendoc: $(DTX) resources
	@echo "Compiling documentation"
	$(DO_LATEX_WRITE18)
	$(DO_SPLITINDEX)
	$(DO_MAKEINDEX)
	$(DO_MAKECHANGES)
	while ($(DO_LATEX_WRITE18) ; \
	grep -q "Rerun to get" $(NAME).log ) do true; \
	done

COMMAND = command -v $(1) >/dev/null 2>&1
preview: $(DOC)
	($(COMMAND) evince && evince $(NAME).pdf) || ($(COMMAND) open && open $(NAME).pdf)

$(DOC): $(DTX)
	@echo "Compiling documentation"
	$(DO_LATEX_WRITE18)
	$(DO_MAKEINDEX)
	$(DO_MAKECHANGES)
	while ($(DO_LATEX_WRITE18) ; \
	grep -q "Rerun to get" $(NAME).log ) do true; \
	done


$(UNPACKED): $(DTX)
	@$(DO_TEX)

$(CTAN_ZIP): $(CTAN_FILES)
	@echo "Making $@ for CTAN upload."
	@$(RM) -- $@
	@mkdir -p $(NAME)/
	@cp $^ $(NAME)/
	@zip -9 $@ $(NAME)/* >/dev/null
	@rm -rf $(NAME)/

define run-install
@mkdir -p $(RUNDIR) && cp $(RUNFILES) $(RUNDIR)
@mkdir -p $(DOCDIR) && cp $(DOCFILES) $(DOCDIR)
@mkdir -p $(SRCDIR) && cp $(SRCFILES) $(SRCDIR)
endef

define run-cls-install
@mkdir -p $(RUNDIR) && cp $(RUNFILES) $(RUNDIR)
endef

$(TDS_ZIP): TEXMFROOT=./tmp-texmf
$(TDS_ZIP): $(ALL_FILES)
	@echo "Making TDS-ready archive $@."
	@$(RM) -- $@
	$(run-install)
	@cd $(TEXMFROOT) && zip -9 ../$@ -r . >/dev/null
	@$(RM) -r -- $(TEXMFROOT)

# Rename the README for CTAN
README: README.md
	cp $< $@

# Rename the LICENSE for CTAN
LICENSE: LICENSE.md
	cp $< $@

.PHONY: install manifest clean mrproper

install: $(ALL_FILES)
	@if test ! -n "$(TEXMFROOT)" ; then \
		echo "Cannot locate your home texmf tree. Specify manually with\n\n    make install TEXMFROOT=/path/to/texmf\n" ; \
		false ; \
	fi ;
	@echo "Installing in '$(TEXMFROOT)'."
	$(run-install)

cls-install: $(RUNFILES)
	@if test ! -n "$(TEXMFROOT)" ; then \
		echo "Cannot locate your home texmf tree. Specify manually with\n\n    make install TEXMFROOT=/path/to/texmf\n" ; \
		false ; \
	fi ;
	@echo "Installing in '$(TEXMFROOT)'."
	$(run-install)

manifest: 
	@echo "Source files:"
	@for f in $(SOURCE); do echo $$f; done
	@echo ""
	@echo "Derived files:"
	@for f in $(GENERATED); do echo $$f; done

clean:
	@$(RM) -- *.log *.aux *.toc *.idx *.ind *.ilg *.glo *.gls *.example *.out
	@$(RM) -- *.synctex* *.tmp *.cls *.sty *.ins *.pdf *.dvi README LICENSE *.lot
	@$(RM) -- *.lod *.png
	@$(RM) -- $(GENERATED) $(ZIPS)
	@$(RM) -- $(builddir)/*


#############
# TESTSUITE #
#############

#### Needed to compile and make stuff ####

builddir=build
lprefix=L
xprefix=X
both=F

COPY = cp -a
MOVE = mv -f
COMPARE_OPTS = -density 300x300 -metric ae -fuzz 35%

LTXSOURCE = $(NAME).cls
