#
# This makefile is mainly for my convenience, so that the tarball is
# made with all the right bits. But I'm including it in the distro
# for people who want to see how I make the pdf file.... 
#
SRC=rrgtrees.dtx rrgtrees.ins Makefile
PRODUCTS=rrgtrees.sty
SIDEEFFECTS=rrgtrees.aux rrgtrees.log rrgtrees.dvi 
DOCS=rrgtrees.pdf README

doc: rrgtrees.pdf
	
rrgtrees.dvi: rrgtrees.sty rrgtrees.dtx
	latex rrgtrees.dtx
	latex rrgtrees.dtx

rrgtrees.ps: rrgtrees.dvi
	dvips rrgtrees.dvi -o rrgtrees.ps

rrgtrees.pdf: rrgtrees.ps
	ps2pdf rrgtrees.ps rrgtrees.pdf


rrgtrees.sty: $(SRC)
	latex rrgtrees.ins
clean:
	-rm $(SIDEEFFECTS)
spotless:
	-rm $(PRODUCTS) $(DOCS)
tarball: $(SRC) $(DOCS)
	tar -czvf rrgtrees.tgz $(SRC) $(DOCS) 
