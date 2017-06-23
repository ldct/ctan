NAME		:= wsemclassic
NAME_EXT	:= dtx
TEST_NAME	:= $(NAME)-test
TEST_NAME_EXT	:= tex

work_dir	:= $(shell pwd)
tmp_dir		:= tmp
pkg_dir		:= pkg
PDF_LIST	:= $(tmp_dir)/pdflist

LATEX	:= pdflatex -output-directory=$(tmp_dir)
D_LATEX	= $(LATEX) -draftmode $(FILE).$(FILE_EXT)
BIBTEX	= bibtex $(tmp_dir)/$(FILE)

RUN_LATEX = $(LATEX) $(FILE).$(FILE_EXT)

.PHONY: all cls doc test package-stable package ctan-stable ctan clean-pdf clean mrpropper


ifeq "$(VERSION)" "stable"
  COMMIT	:= $(shell git tag | tail -n 1 | grep . || echo 'n') #; else echo "No stable version available!"; exit 1; fi)
  ifeq "$(COMMIT)" "n "
    $(error "No stable version available!")
  endif
  VERSION	:= $(COMMIT)
else
  COMMIT	:= $(shell git log | sed -e 's/commit\ //g' -e q)
  VERSION	:= $(shell git tag --contains $(COMMIT) | tail -n 1 | grep . || echo $(COMMIT)git)
endif

all: cls doc test

cls: $(NAME).cls

%.cls: %.dtx %.ins
	tex $*.ins

doc: FILE_EXT	:= $(NAME_EXT)
doc: clean-pdf $(NAME).pdf

test: FILE_EXT	:= $(TEST_NAME_EXT)
test: clean-pdf $(NAME).cls $(TEST_NAME).pdf

tmp-dir:
	test -d $(tmp_dir) || mkdir $(tmp_dir)

%.pdf: FILE	= $*
%.pdf: PDF	= $@
%.pdf: tmp-dir $(FILE).$(FILE_EXT) test.bib
	$(info pdf: $(PDF))
	$(D_LATEX)
	if [ '$(FILE)' = '$(TEST_NAME)' ]; then \
		grep nobib $(FILE).tex || $(BIBTEX); \
	else \
		makeindex -s gglo.ist -o $(tmp_dir)/$(FILE).gls $(tmp_dir)/$(FILE).glo; \
		makeindex -s gind.ist -o $(tmp_dir)/$(FILE).ind $(tmp_dir)/$(FILE).idx; \
	fi
	$(D_LATEX)
	$(RUN_LATEX)
	grep $(PDF) $(PDF_LIST) || echo $(FILE).pdf >> $(PDF_LIST)
	mv $(tmp_dir)/$(PDF) .


package-%: ctan-%

package: ctan

ctan-stable:
	$(MAKE) VERSION=stable ctan

ctan: PKG_NAME		:= $(NAME)-$(VERSION)
ctan: pkg_pdf_dir	:= $(tmp_dir)/$(PKG_NAME)
ctan: TAR		:= $(work_dir)/$(pkg_dir)/$(PKG_NAME).tar
ctan: all
	test -d $(pkg_pdf_dir) || mkdir $(pkg_pdf_dir)
	test -d $(pkg_dir) || mkdir $(pkg_dir)
	cp $$(< $(PDF_LIST)) $(pkg_pdf_dir)
	git archive --prefix=$(PKG_NAME)/ -o $(TAR) $(COMMIT)
	-for file in $$(grep -v '^#' .ctanignore); do \
		tar -f $(TAR) --delete $(PKG_NAME)/$$file; \
	done
	cd $(tmp_dir) && tar -rf $(TAR) $(PKG_NAME)/*.pdf

clean-pdf:
	-rm -f $(TEST_NAME).pdf $(NAME).pdf

clean: clean-pdf
	-rm -rf $(tmp_dir)
	-rm $(NAME).cls

mrpropper: clean
	-rm -rf $(pkg_dir)
