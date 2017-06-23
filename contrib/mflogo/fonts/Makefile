## Makefile for the installation of the `mflogo' fonts:
##
## 1999-03-15, Ulrik Vieth <vieth@thphy.uni-duesseldorf.de>
##

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

## Usage:
##
## say 'make install' to install the fonts
##

### package specifics (don't change!):

# package name, used in directories
SUPPLIER = public
TYPEFACE = mflogo

# file names, used in dependencies

MFFILES = \
	logo.mf		\
	logo10.mf	\
	logo9.mf	\
	logo8.mf	\
	logosl10.mf	\
	logosl9.mf	\
	logosl8.mf	\
	logobf10.mf	\
	logod10.mf
TFMFILES = \
	logo10.tfm	\
	logo9.tfm	\
	logo8.tfm	\
	logosl10.tfm	\
	logosl9.tfm	\
	logosl8.tfm	\
	logobf10.tfm	\
	logod10.tfm


### customizable variables:

# Where the TeX installation resides:
TEXMF   = `kpsewhich --expand-path='$$TEXMFMAIN'`
#TEXMF  = /usr/local/teTeX/share/texmf

# standard directories
srcdir = .
MFDIR  = $(TEXMF)/fonts/source/$(SUPPLIER)/$(TYPEFACE)
TFMDIR = $(TEXMF)/fonts/tfm/$(SUPPLIER)/$(TYPEFACE)


# How to install the files:
INSTALL = cp -p
#INSTALL = install -c

# How to cleanup the files:
CLEAN   = rm -f

# How to update the directory database:
TEXHASH = mktexlsr
#TEXHASH = texhash


### unpack targets:

default: all
all:
	@echo
	@echo "Please call \`make install' to install the font files!"
	@echo
	@true

### install targets:

install: install-fonts post-install
.PHONY:	install

install-fonts:
	test -d $(MFDIR) || mkdir $(MFDIR)
	(for f in $(MFFILES); \
	  do $(INSTALL) $(srcdir)/mf/$$f $(MFDIR); done)
	test -d $(TFMDIR) || mkdir $(TFMDIR)
	(for f in $(TFMFILES); \
	  do $(INSTALL) $(srcdir)/tfm/$$f $(TFMDIR); done)
.PHONY:	install-fonts

# uninstall target:

uninstall:
	(for f in $(MFFILES); \
	  do $(CLEAN) $(MFDIR)/$$f; done)
	(for f in $(TFMFILES); \
	  do $(CLEAN) $(TFMDIR)/$$f; done)
.PHONY: uninstall


# Update the directory database:
post-install:
	$(TEXHASH)
.PHONY:	post-install


### clean targets:
clean:
	rm -f *.log *.aux *.toc *.lof *.lot *.bbl *.blg
	rm -f *.idx *.ind *.ilg *.glo *.gls

distclean: clean
