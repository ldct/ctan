# Makefile -- install emp.
# Copyright (C) 1997 Thorsten.Ohl@Physik.TH-Darmstadt.de
#
# Emp is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by 
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# Emp is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# $Id: Makefile,v 1.6 1997/11/12 21:14:41 ohl Exp $
#
########################################################################

VERSION = 1
RELEASE = 00
STATUS  =

########################################################################

# Directories
prefix = $(HOME)
texdir = $(prefix)/tex/inputs
docdir = $(texdir)/doc

# Commands
INSTALL = install -c -m 755
INSTALL_DATA = install -c -m 644
# INSTALL = cp
# INSTALL_DATA = cp

LATEX = latex
MP = TEX=$(LATEX) mpost
MAKEINDEX = makeindex
DVIPS = dvips
DFLAGS =

########################################################################
# No user serviceable parts below:
########################################################################

RESOLVE_XREF = \
  $(LATEX) $*.drv && \
  while grep 'Rerun to get cross-references right\.' $*.log; \
  do \
    $(LATEX) $*.drv; \
  done

RUN_MAKEINDEX = \
  $(MAKEINDEX) -s gind.ist -o $*.ind $*.idx && \
  $(MAKEINDEX) -s gglo.ist -o $*.gls $*.glo

all: emp.sty emp.drv

man: empman.dvi

ps: emp.ps

dvi: emp.dvi

install: all
	$(INSTALL_DATA) emp.sty $(texdir)

install.doc: all
	$(INSTALL_DATA) emp.dtx $(docdir)
	$(INSTALL_DATA) emp.drv $(docdir)
	$(INSTALL_DATA) empman.drv $(docdir)

uninstall:
	rm -f $(texdir)/emp.sty

uninstall.doc:
	rm -f $(docdir)/emp.dtx
	rm -f $(docdir)/emp.drv
	rm -f $(docdir)/empman.drv

emp.sty: emp.dtx emp.ins
	$(LATEX) emp.ins

emp.drv empman.drv: emp.sty

emp.dvi: emp.dtx emp.drv emp.sty
	-$(LATEX) $*.drv
	$(MP) $*
	-$(LATEX) $*.drv
	$(RUN_MAKEINDEX)
	$(RESOLVE_XREF)

empman.dvi: emp.dtx empman.drv emp.sty
	-$(LATEX) $*.drv
	$(MP) $*
	-$(LATEX) $*.drv
	$(RUN_MAKEINDEX)
	$(RESOLVE_XREF)

manual.ps.gz: manual.ps
	gzip < $< > $@

manual.ps: empman.dvi $(MANPICS)
	$(DVIPS) $(DFLAGS) -o $@ $<

emp.ps: emp.dvi $(MANPICS)
	$(DVIPS) $(DFLAGS) -o $@ $<

clean:
	rm -f *.mp *.rawmp *.[0-9]* \
	      *.log *.dvi *.aux *.toc *.ilg *.glo *.gls *.idx *.ind \
	      *.ps *.mpx '#*#' *~ .*~

realclean: clean
	rm -f emp.sty emp.drv empman*

distclean: realclean

########################################################################
# Maintenance:

DISTFILES = /usr/local/etc/COPYING README Makefile emp.dtx emp.ins

distdir = emp-$(VERSION).$(RELEASE)$(STATUS)
CVSTAG = EMP_$(VERSION)_$(RELEASE)$(STATUS)
TEXTAG = v$(VERSION).$(RELEASE)
M = 

fileversion:
	perl -pe \
	  's/^\\def\\fileversion\{.*\}/\\def\\fileversion{$(TEXTAG)}/;' \
	  emp.dtx > emp.vtmp
	if cmp -s emp.dtx emp.vtmp; then \
	  rm -f emp.vtmp; \
	else \
	  mv emp.vtmp emp.dtx; \
	fi
	
commit: fileversion
	@if test -n "$(M)"; then \
	  echo "cvs commit -m '$(M)'"; cvs commit -m '$(M)'; \
	  echo "cvs tag $(CVSTAG)"; cvs tag $(CVSTAG); \
	  echo "cvs tag -b $(CVSTAG)_"; cvs tag -b $(CVSTAG)_; \
	else \
	  echo "usage: make commit M='<message>'" 1>&2; \
	fi

dist: $(distdir).tar.gz
snap: emp-current.tar.gz

$(distdir).tar.gz:
	rm -fr $(distdir) $(distdir).tmp
	cvs export -r $(CVSTAG) -d $(distdir).tmp emp
	mkdir $(distdir)
	(cd ./$(distdir).tmp && \
         make $(DISTFILES) && \
         cp $(DISTFILES) ../$(distdir))
	tar cf - $(distdir) | gzip > $@
	rm -fr $(distdir) $(distdir).tmp

emp-current.tar.gz: $(DISTFILES) fileversion
	rm -fr emp-current
	mkdir emp-current
	touch emp-current/1_THIS_IS_A_SNAPSHOT_OF_
	touch emp-current/2_WORK_IN_PROGRESS_AND__
	touch emp-current/3_NOT_YET_RELEASED_CODE_
	cp $(DISTFILES) emp-current
#	perl -pe \
#	  's/\[\\filedate/[(UNRELEASED and UNSUPPORTED snapshot)/;' \
	  emp.dtx > emp-current/emp.dtx
	tar cf - emp-current | gzip > $@
	rm -fr emp-current

########################################################################
# Local Variables:
# mode:text
# End:
