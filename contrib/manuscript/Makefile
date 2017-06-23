all: manuscript.pdf

manuscript.pdf: manuscript.gls manuscript.ind
	xelatex manuscript.drv >/dev/null
	xelatex manuscript.drv >/dev/null
	xelatex manuscript.drv >/dev/null

manuscript.gls: manuscript.glo
	makeindex -s gglo -o manuscript.gls manuscript.glo >/dev/null 2>&1

manuscript.ind: manuscript.idx
	makeindex -s gind manuscript >/dev/null 2>&1

manuscript.glo: manuscript.drv
	xelatex manuscript.drv >/dev/null

manuscript.idx: manuscript.drv
	xelatex manuscript.drv >/dev/null

manuscript.drv: manuscript.dtx manuscript.ins
	xelatex manuscript.ins >/dev/null

manuscript.zip: manuscript.dtx manuscript.ins Makefile README manuscript.pdf
	$(eval TMPD := $(shell mktemp -d))
	$(eval CURDIR := $(shell pwd))
	mkdir -p $(TMPD)/manuscript
	install -p manuscript.{dtx,ins,pdf} README Makefile \
		$(TMPD)/manuscript/
	(cd $(TMPD) ; zip -9rvT $(CURDIR)/manuscript.zip manuscript/ )
	rm -rfv $(TMPD)

clean:
	rm -f *~ *.bak *.BAK *.aux *.drv *.glo *.gls *.idx *.ilg \
		*.ind *.log *.pdf *.sty

# vim: set noet:
