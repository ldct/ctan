#!/bin/sh

#-- set path to LaTeX binaries
LATEXPATH="/usr/texbin/" # TeXLive
#-- set names of LaTeX and related compilers
PDFLATEX=$LATEXPATH"pdflatex"

TEXFILE="simple_proceedings"  #- set document's name
PDFSPATH="papers" #- set the papers' folder name

rm -f ${TEXFILE}.npt # count pages from terminal
cd ${PDFSPATH}
for file in *.pdf
do
  pdfinfo -meta $file | grep "Pages:" > tmp0
  echo "file $file has `sed 's/.*\([0-9]\).*/\1/' < tmp0` pages" >> ../${TEXFILE}.npt
done
rm -f tmp0
cd ..
more ${TEXFILE}.npt
