#!/bin/bash

# this script is part of the pdf-annotation LaTeX package by M. Palmer
# like all files in the package, it is covered by the LPPL.

# this assumes ghostscript is installed as 'gs - change as needed
ghostscript="gs"

script_name=`basename "$0"`

if [ -z $1 ]; then
   echo "Usage: $script_name inputfile.pdf > outputfile.tex"
   exit 1
fi

source_doc=$1

# doc_header will become the preamble of your wrapper document
# edit it according it your preferences.

doc_header="\documentclass[letterpaper,10pt]{article}

\usepackage[
  sourcedoc=$source_doc,
  inline=true,
  grid=true,
  gridcolor=black!30,
  trim={1cm 1cm 1cm 1cm},
  bodywidth=0.75,
  pageoffset=0,
  fontsize=footnotesize,
  twocolumn=false,
  notesbg=yellow,
  notesframe=black,
  insertpagemargin=2.5cm
]{pdfreview}

\begin{document}
"

echo "$doc_header"

# use ghostscript to obtain the page count from the pdf file
page_count=$($ghostscript -q -dNODISPLAY -c "($source_doc) (r) file runpdfbegin pdfpagecount = quit")

# write page environment for each of the pages
for (( i=1; i<=$page_count; i++ ))
do
   echo "\begin{page}{$i}"
   echo "\end{page}"
   echo ""
done

echo "\end{document}"

