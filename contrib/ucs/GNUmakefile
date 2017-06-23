#FIXME: In general, we should modify this makefile such that it becomes
#	less hacky.

ucs_generated   = ucs.sty utf8x.def ucsencs.def ucsutils.sty ucshyper.sty
utils_generated = c00enc.def    \
                  c10enc.def    \
                  c40enc.def    \
                  c42enc.def    \
                  c61enc.def    \
                  cenccmn.tex   \
                  lklenc.def    \
                  lklkli.fd     \
                  autofe.sty    \
                  ldvenc.def    \
                  ldvarial.fd   \
                  ldvc2000.fd   \
                  letenc.def    \
                  letgfzem.fd   \
                  letjiret.fd   \
                  letc2000.fd   \
                  ltaenc.def    \
                  ltaarial.fd   \
                  ltac2000.fd   \
                  ltgenc.def    \
                  ltgc2000.fd   \
                  ltlenc.def    \
                  ltlcmr.fd     \
                  lucenc.def    \
                  lucc2000.fd   \
                  lucarial.fd   \
                  mkrenc.def    \
                  mkrezra.fd    \
                  mkrhadas.fd   \
                  mkromega.fd   \
                  mkrrashi.fd   \
                  t2denc.def    \
                  t2dcmr.fd     \
                  tengwarDS.enc \
                  ltwenc.def    \
                  ltwdsque.fd   \
                  ltwdsnol.fd   \
                  ltwdssin.fd   \
                  xsenc.def     \
                  xscmr.fd      \
                  cp1252.enc

local_pdflatex=TEXINPUTS=.:data:utils: pdflatex

all: docstrip datafiles doc
.PHONY: all

clean: clean-doc clean-datafiles clean-docstrip clean-dist
.PHONY: clean

docstrip: clean-docstrip
	tex ucs.ins
	rm ucs.log
	mv $(utils_generated) utils
.PHONY: docstrip

clean-docstrip:
	rm -f $(ucs_generated)
	cd utils; rm -f $(utils_generated)
.PHONY: clean-docstrip

datafiles: clean-datafiles
	wget http://www.unicode.org/Public/UNIDATA/UnicodeData.txt
	mkdir data
	perl -w makeunidef.pl --nocomments --targetdir=data config/*.ucf
	rm UnicodeData.txt
.PHONY: datafiles

clean-datafiles:
	rm -rf data
.PHONY: clean-datafiles

doc: docstrip datafiles clean-doc
	$(local_pdflatex) -draftmode ucs.dtx
	makeindex -s gind ucs.idx
	makeindex -s gglo -o ucs.gls ucs.glo
	$(local_pdflatex) ucs.dtx
	rm -f ucs.{aux,glo,gls,idx,ilg,ind,log,out,toc}
.PHONY: doc

clean-doc:
	rm -f ucs.pdf
.PHONY: clean-doc

dist: clean-dist
	darcs dist --dist-name ucs --set-scripts-executable
.PHONY: dist

clean-dist:
	rm -f ucs.tar.gz
.PHONY: clean-dist
