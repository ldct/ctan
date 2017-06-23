INS         = beamercolorthemeowl.ins
PACKAGE_SRC = beamercolorthemeowl.dtx
PACKAGE_STY = beamercolorthemeowl.sty
DOC_SRC     = beamercolorthemeowl.dtx
DOC_PDF     = beamercolorthemeowl.pdf

DESTDIR     ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(DESTDIR)/tex/latex/beamercolorthemeowl
DOC_DIR     = $(DESTDIR)/doc/latex/beamercolorthemeowl
CACHE_DIR   := .latex-cache

COMPILE_TEX := latexmk -pdf -output-directory=$(CACHE_DIR)

.PHONY: all sty doc install uninstall clean clean-cache clean-sty

all: sty doc

sty: $(PACKAGE_STY)

doc: $(DOC_PDF)

demo: $(DEMO_PDF)

clean: clean-cache clean-sty

install: $(PACKAGE_STY) $(DOC_PDF)
	@mkdir -p $(INSTALL_DIR)
	@cp $(PACKAGE_STY) $(INSTALL_DIR)
	@mkdir -p $(DOC_DIR)
	@cp $(DOC_PDF) $(DOC_DIR)

uninstall:
	@rm -f $(addprefix $(INSTALL_DIR)/, $(PACKAGE_STY))
	@rmdir $(INSTALL_DIR)
	@rm -f $(DOC_DIR)/$(notdir $(DOC_PDF))
	@rmdir $(DOC_DIR)

clean-cache:
	@rm -f $(CACHE_DIR)/*

clean-sty:
	@rm -f $(PACKAGE_STY)

$(CACHE_DIR):
	@mkdir -p $(CACHE_DIR)

$(PACKAGE_STY): $(PACKAGE_SRC) $(INS) | $(CACHE_DIR) clean-cache
	@cd $(dir $(INS)) && latex -output-directory=$(CACHE_DIR) $(notdir $(INS))
	@cp $(addprefix $(CACHE_DIR)/,$(PACKAGE_STY)) .

$(DOC_PDF): %.pdf: %.dtx $(PACKAGE_STY) | $(CACHE_DIR) clean-cache
	$(COMPILE_TEX) $<
	@cp $(CACHE_DIR)/$(notdir $@) $@

