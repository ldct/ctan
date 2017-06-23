# makefile
#
# 2015 Apr 01
#
# Macro definitions
ROOT_NAME	= cdpbundl
DTX_NAME	= $(ROOT_NAME).dtx
INS_NAME	= $(ROOT_NAME).ins
DOC_AUX_FIL	= $(ROOT_NAME).aux $(ROOT_NAME).log \
				$(ROOT_NAME).glo $(ROOT_NAME).gls \
				$(ROOT_NAME).idx $(ROOT_NAME).ind \
				$(ROOT_NAME).ilg $(ROOT_NAME).glg \
				$(ROOT_NAME).toc $(ROOT_NAME).lof \
				$(ROOT_NAME).hd  $(ROOT_NAME).out
DOCUM_FILE	= $(ROOT_NAME).pdf
CODE_FILES	= letteracdp.cls \
				articoletteracdp.cls \
				cdpaddon.sty \
				cdpbabel.sty \
				*.ldf \
				*.def \
				cdpshues.cfg
#
LATEX		= pdflatex
MAKEINDEX	= makeindex

#
define GEN_FAKE_INDEX
	@echo '\\begin{theindex}' > $(ROOT_NAME).ind
	@echo '\\end{theindex}'  >> $(ROOT_NAME).ind
	@echo "Generating fake .ind file."
endef
#
define GEN_FAKE_GLOSSARY
	@echo '\\begin{theglossary}' > $(ROOT_NAME).gls
	@echo '\\end{theglossary}'  >> $(ROOT_NAME).gls
	@echo "Generating fake .gls file."
endef



.PHONY: default
.PHONY: code doc
.PHONY: clean cleandoc cleanaux cleancode cleanall
.PHONY: help

# Default target
default: doc code

# Generating the code
################################################################
#                                                              #
#   PLEASE NOTE THAT THE INSTALLER SCRIPT IS EXECUTED WITH     #
#       openout_any=r                                          #
#                                                              #
################################################################
code:
	openout_any=r tex $(INS_NAME)

# Generating the documentation
doc: $(DOCUM_FILE)

$(DOCUM_FILE): $(DTX_NAME)
	# Hack for getting index and glossary in the toc since first run:
	$(GEN_FAKE_INDEX)
	$(GEN_FAKE_GLOSSARY)
	# We know how many runs are needed:
	$(LATEX) $(DTX_NAME)
	$(LATEX) $(DTX_NAME)
	$(MAKEINDEX) -s gind.ist -t $(ROOT_NAME).ilg -o $(ROOT_NAME).ind \
			$(ROOT_NAME).idx
	$(MAKEINDEX) -s gglo.ist -t $(ROOT_NAME).glg -o $(ROOT_NAME).gls \
			$(ROOT_NAME).glo
	$(LATEX) $(DTX_NAME)
	$(LATEX) $(DTX_NAME)

# Cleaning up: command "make clean" defaults to "make cleanall"
clean: cleanall

# Cleaning the code files
cleancode:
	-rm $(CODE_FILES)

# Cleaning the documentation files
cleandoc: cleanaux
	-rm $(DOCUM_FILE)

# Cleanng just the auxiliary files used in producing the documentation
cleanaux:
	-rm $(DOC_AUX_FIL)

# Cleaning up all the generated files
cleanall: cleancode cleandoc

# Giving help
help:
	@echo "Here is a list of the available commands:"
	@echo
	@echo "  make"
	@echo "    Generate both the code and the documentation (see below)."
	@echo
	@echo "  make code"
	@echo "    Generate the LaTeX sources for all the classes, packages,"
	@echo "    definition files, etc. of the C.D.P. Bundle; these files go"
	@echo "    into the LaTeX input directories."
	@echo
	@echo "  make doc"
	@echo "    Generate the documentation (in PDF); the resulting PDF file"
	@echo "    goes into the LaTeX documentation directories (the auxiliary"
	@echo "    files may be discarded)."
	@echo
	@echo "  make clean"
	@echo "  make cleanall"
	@echo "    These two commands are synonyms; they remove all of the"
	@echo "    generated files (both code and documentation)."
	@echo
	@echo "  make cleancode"
	@echo "    Remove the LaTeX source files (the \"code files\")."
	@echo
	@echo "  make cleandoc"
	@echo "    Remove the documentation, together with all the auxiliary"
	@echo "    files used to generate it."
	@echo
	@echo "  make cleanaux"
	@echo "    Remove only the auxiliary files used to generate the"
	@echo "    documentation."
	@echo
	@echo "  make help"
	@echo "    Print this help message."
	@echo

