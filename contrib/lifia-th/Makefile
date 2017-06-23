## Makefile pour la classe lifia-th
##
## Utilise GNU Make et nécessite `makeindex' et `bibtex'
##
## Tapez `make install' pour installer la classe.
##
## Pour créer une autre classe, il suffit de changer la variable PREFIX
##

# version
VERSION		= "2.0"

# logiciels nécessaires
#
LATEX		= latex2e
RM_FORCE	= rm -f
INDEXMAKER	= makeindex
BIBTEX		= bibtex
DVIPS		= dvips

# préfixe
#
PREFIX		= lifia-th

# répertoires d'installation
#
INSTDIR		= ./$(PREFIX)
TEXFORMATSDIR	= $(HOME)/TEX/FORMATS

# fichiers de la distribution
#
DISTFILES	= 0_taper_make_install_pour_installer \
                  LISEZ.MOI \
                  Makefile \
                  gglo.ist gind.ist $(PREFIX).ist \
                  $(PREFIX).dtx $(PREFIX).ins $(PREFIX).dvi\
                  test-draft.ps test-draft.texf \
                  test-$(PREFIX).ps test-$(PREFIX).texf \
		  makeindex-2.12wp.patch.tar

# commande pour créer le fichier tar
#
TARCMD		= -C .. $(INSTDIR)/0_taper_make_install_pour_installer \
                  -C .. $(INSTDIR)/LISEZ.MOI \
                  -C .. $(INSTDIR)/Makefile \
                  -C .. $(INSTDIR)/gglo.ist \
                  -C .. $(INSTDIR)/gind.ist \
                  -C .. $(INSTDIR)/$(PREFIX).ist \
                  -C .. $(INSTDIR)/$(PREFIX).dtx \
                  -C .. $(INSTDIR)/$(PREFIX).ins \
                  -C .. $(INSTDIR)/$(PREFIX).dvi\
                  -C .. $(INSTDIR)/test-draft.ps \
                  -C .. $(INSTDIR)/test-draft.texf \
                  -C .. $(INSTDIR)/test-$(PREFIX).ps \
                  -C .. $(INSTDIR)/test-$(PREFIX).texf \
                  -C .. $(INSTDIR)/makeindex-2.12wp.patch.tar

# commande d'installation
#
install : $(PREFIX).cls $(PREFIX).dvi
	@echo
	@echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	@echo
	@echo "L'installation est terminée."
	@echo
	@echo "Le fichier $(PREFIX).dvi contient la doc de la classe,"
	@echo "et test-$(PREFIX).* contient un exemple."
	@echo
	@echo "Je vous conseille *fortement* de lire l'intro de la doc (sinon,"
	@echo " pourquoi la faire ??)."
	@echo
	@echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	@echo

# commande pour créer une distribution
#
dist : $(DISTFILES)
	/usr/bin/tar -cvf ../$(PREFIX)-$(VERSION).tar $(TARCMD)
	gzip -f ../$(PREFIX)-$(VERSION).tar

# commandes diverses
#
%.cls : %.dtx %.ins
	$(RM_FORCE) $@
	$(LATEX) $*.ins

%.dvi : %.dtx
	$(LATEX) $<
	$(INDEXMAKER) -s ./gglo.ist -o $*.gls $*.glo
	$(INDEXMAKER) -s gind.ist $*.idx
	$(LATEX) $<
	$(LATEX) $<

%.dvi : %.texf $(PREFIX).cls
	-$(LATEX) $<
	-$(INDEXMAKER) -s ./$(PREFIX).ist $*.idx
	-$(BIBTEX) $*
	-$(LATEX) $<
	-$(LATEX) $<

%.dvis : %.texf $(PREFIX).cls
	$(LATEX) $<

%.ps : %.dvi %.texf
	$(DVIPS) $< -o $@


%.imp : %.dvi
	$(DVIPS) $<

clean :
	$(RM_FORCE) *~ *.aux *.idx *.log *.log.fig *.blg *.ilg *.glo

cleandist :
	$(RM_FORCE) $(DISTFILES)
