#!/bin/bash

args=("$@")
GPATH=${args[0]}
TEXFILE=${args[1]} # example1
INPATH=${args[2]} # papers_info
SPPATH=${args[3]}  #papers_split
PDFPATH=${args[4]}

cd ${GPATH}
SPPATH=${GPATH}/${SPPATH}
PDFFILE=${GPATH}/${TEXFILE}.pdf # PDF proceedings
echo "PDF proc used for individual PDFs extraction:\n  --> $PDFFILE"
echo "saving tmp .ps and .pdf files into\n  --> $SPPATH"
