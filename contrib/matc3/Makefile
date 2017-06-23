# Makefile per il pacchetto matc3
# (c) 2013 Dimitrios Vrettos - d.vrettos@gmail.com
# v1.1 -- 2013/04/06

NAME = matc3
INS = $(NAME).ins
DTX = $(NAME).dtx
IND = $(NAME).ind
DOC = $(NAME).pdf
IDX = $(NAME).idx
GLS = $(NAME).gls
GLO = $(NAME).glo

PDFLATEX = pdflatex --shell-escape
MAKEINDEX = makeindex -s gind.ist -o $(IND) $(IDX) && \
	    makeindex -s gglo.ist -o $(GLS) $(GLO)

FILE_CLEAN = *.aux *.idx *.ilg *.ind *.log *.glo *.gls *.toc *.log *~* *backup

VERSION	= 1_0_1
TAR = $(NAME)-$(VERSION).tar.gz 
ZIP = $(NAME)-$(VERSION).zip

# Cambiare la variabile TEXDIR se non si vuole installare nell'albero personale
TEXDIR = `kpsewhich --expand-path='$$TEXMFHOME'`
INSDIR = $(TEXDIR)/tex/latex/$(NAME)
DOCDIR = $(TEXDIR)/doc/latex/$(NAME)
SRCDIR = $(TEXDIR)/source/latex/$(NAME)

.SILENT: clean x-clean dist-tar dist-zip directories help install uninstall

help:
	echo ''
	echo 'Makefile targets:'
	echo ''
	echo " help          - Questo messaggio"
	echo ' install       - Compila il pacchetto e la documentazione e poi li installa'
	echo ' uninstall     - Disinstallazione completa'
	echo ' pdf           - Crea solo la documentazione senza installarla'
	echo ' clean         - Rimuove i file intermediari'
	echo ' x-clean       - Rimuove i file intermediari e il pacchetto derivato'
	echo ' dist-tar      - Crea una distibuzione (.tar.gz) del pacchetto'
	echo ' dist-zip      - Crea una distibuzione (.zip) del pacchetto'
	echo ''

ins: $(INS)
	latex $<

pdf: $(DTX)
	$(PDFLATEX) $<
	$(MAKEINDEX)
	$(PDFLATEX) $<
	$(PDFLATEX) $<
	$(PDFLATEX) $<

clean:
	rm -f $(FILE_CLEAN)

x-clean:
	rm -f $(FILE_CLEAN)
	rm -f $(NAME).sty


dist-tar: x-clean
	rm -f $(TAR)
	tar --exclude '*.zip' -zcvf $(TAR) *
	
dist-zip: x-clean
	rm -f $(ZIP)
	zip -r $(ZIP) . -x '*.tar.gz'

directories:
	if [ ! -d $(INSDIR) ]; then  \
		mkdir -p $(INSDIR); \
	fi
	if [ ! -d $(DOCDIR) ]; then \
		mkdir -p $(DOCDIR); \
	fi
	if [ ! -d $(SRCDIR) ] ; then \
		mkdir -p $(SRCDIR) ; \
	fi
	
	
install: ins pdf directories
	install -m644 $(NAME).sty $(INSDIR)
	install -m644 $(DOC) README $(DOCDIR)
	install -m644 $(INS) $(DTX) Makefile $(SRCDIR)
	texhash

uninstall:
	if [ -d $(INSDIR) ] ; then \
		rm -rf $(INSDIR); \
	fi
	if [ -d $(DOCDIR) ] ; then \
		rm -rf $(DOCDIR); \
	fi
	if [ -d $(SRCDIR) ] ; then \
		rm -rf $(SRCDIR) ; \
	fi
	texhash

# End of Makefile
