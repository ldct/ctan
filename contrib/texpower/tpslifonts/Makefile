RM=rm -f
SHELL=sh
VERSION=0.1
JUNKS=*.aux *.toc *.idx *.glo *.dvi *.log *.lof *.ist *.ilg *.ind *.gls *.out *.tmp *~

help:
	@echo '**********************************************'
	@echo ' The following targets exist:                 '
	@echo ' - all: All targets below                     '
	@echo ' - unpack: Unpacks the tpslifonts package     '
	@echo ' - pack: Packs the package                    '
	@echo ' - doc: Builds tpslifonts documentation       '
	@echo ' - clean: Remove all generate/junk files      '
	@echo '**********************************************'

unpack:
	latex tpslifonts.ins
	@echo '**********************************************'
	@echo ' To make tpslifonts package documentation     '
	@echo ' % make doc                                   '
	@echo '**********************************************'

all: unpack doc 

doc: tpslifonts.dtx
	latex tpslifonts.dtx
	latex tpslifonts.dtx
	makeindex -s gglo.ist -o tpslifonts.gls tpslifonts.glo
	makeindex -s gind.ist -o tpslifonts.ind tpslifonts.idx
	latex tpslifonts.dtx

pack: clean
	-(cd ..; cp -r tpslifonts tpslifonts-$(VERSION); \
        tar cvfz tpslifonts-$(VERSION).tgz tpslifonts-$(VERSION))

clean:
	@$(RM) $(JUNKS) tpslifonts.sty
	@echo The current directory has been cleaned up.
