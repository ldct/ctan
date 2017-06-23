## Makefile for the installation of the `concmath' fonts:
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
TYPEFACE = concmath

# file names, used in dependencies

MFFILES = \
	xccmi5.mf xccmi6.mf xccmi7.mf xccmi8.mf xccmi9.mf xccmi10.mf \
	xccsy5.mf xccsy6.mf xccsy7.mf xccsy8.mf xccsy9.mf xccsy10.mf \
	xccam5.mf xccam6.mf xccam7.mf xccam8.mf xccam9.mf xccam10.mf \
	xccbm5.mf xccbm6.mf xccbm7.mf xccbm8.mf xccbm9.mf xccbm10.mf \
	xccex7.mf xccex8.mf xccex9.mf xccex10.mf
TFMFILES = \
	xccmi5.tfm xccmi6.tfm xccmi7.tfm xccmi8.tfm xccmi9.tfm xccmi10.tfm \
	xccsy5.tfm xccsy6.tfm xccsy7.tfm xccsy8.tfm xccsy9.tfm xccsy10.tfm \
	xccam5.tfm xccam6.tfm xccam7.tfm xccam8.tfm xccam9.tfm xccam10.tfm \
	xccbm5.tfm xccbm6.tfm xccbm7.tfm xccbm8.tfm xccbm9.tfm xccbm10.tfm \
	xccex7.tfm xccex8.tfm xccex9.tfm xccex10.tfm


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
