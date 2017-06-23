#!/bin/sh

#--- set user dependent file name
TEXFILE="example3optim"
#--- set system-dependent variables
LATEXPATH="/usr/texbin/" # for TexLive
#--- set compilers' paths
PDFLATEX=$LATEXPATH"pdflatex"
BIBTEX=$LATEXPATH"bibtex"
MAKEINDEX=$LATEXPATH"makeindex"
mkdir pdftk_info/

#--- class settings: "empty" option and binding
cp exclasspre.tex exclass.tex

#--- Compile
separator='___________________________________________________'
echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** PdfLaTeX: create toc (1/6) ***'
$PDFLATEX  $TEXFILE.tex

echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** Bibtex: generate the general biblio. (2/6) ***'
$BIBTEX $TEXFILE

echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** Makeindex: create index of authors (3/6) ***'
$MAKEINDEX -s confproc2.ist $TEXFILE.idx

echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** PdfLaTeX: add toc + insert index and bibliography (4/6) ***'
$PDFLATEX  $TEXFILE.tex

echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** PdfLaTeX: createupdate toc, index and bib page numbers (5/6) ***'
$PDFLATEX $TEXFILE.tex

echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** PdfLaTeX: mod. class insertion, for proper PDF links for full papers (6/6) ***'
$PDFLATEX $TEXFILE.tex
