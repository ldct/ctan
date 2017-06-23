#!/bin/sh

# Compile all papers with 'pdflatex' of 'latex'
#   (depending if they are in 'sources_pdftex' or 'sources_tex')
# and copy resulting pdf files in the 'papers' folder.
# Expected tree structure:
#     proceedings/papers/sources_pdftex/
#     proceedings/papers/sources_tex/
# with this script in 'proceedings/'

#--- choose if you compile from scratch or only once
#BUILD_TYPE=final      #recompile and re-do biblio
BUILD_TYPE=renumber   #recompile only once for re-numbering

#--- set system dependent variables
LATEXPATH="/usr/texbin/" # TeXLive

#--- paths
LATEX=$LATEXPATH"latex"
DVIPDF=/usr/local/bin/dvipdf
PDFLATEX=$LATEXPATH"pdflatex"
BIBTEX=$LATEXPATH"bibtex"
MAKEINDEX=$LATEXPATH"makeindex"
PROCSTY='dafx_06.sty'

#--- Compiling .tex files with pdfLaTeX
cd papers/sources_pdftex
for i in *; do
  echo; echo; echo '=====> Compiling' $i '.tex  with pdfLaTeX <====='
  cd $i
  # copy the paper style (in case you changed it)
  cp ../../$PROCSTY .
  echo; echo '   ---> 1st compilation of ' $i '.tex'
  $PDFLATEX $i
  if [ $BUILD_TYPE = final ]; then
    echo; echo '   ---> Compiling the bibliography ' $i '.tex'
    $BIBTEX $i
    echo; echo '   --- 2nd compilation of ' $i '.tex'
    $PDFLATEX $i
    echo; echo '   ---> 3rd compilation of ' $i '.tex'
    $PDFLATEX $i
  fi
  #--- copy the pdf where the proceedings will be assembled
  cp $i.pdf ../..
  cd ..
done
#--- Compiling .tex files with LaTeX (problems related with hyperref)
cd ../sources_tex
for i in *; do
  echo; echo; echo '=====> Compiling' $i '.tex  with LaTeX <====='
  cd $i
  #--- copy the paper proceedings style (if you changed the tree)
  cp ../../$PROCSTY .
  echo; echo '   ---> 1st compilation of ' $i '.tex '
  $LATEX $i.tex
  if [ $BUILD_TYPE = final ]; then
    echo; echo '   ---> Compiling the bibliography ' $i '.tex '
    $BIBTEX $i
    echo; echo '   ---> 2nd compilation of ' $i '.tex '
    $LATEX $i
    echo; echo '   ---> 3rd compilation of ' $i '.tex '
    $LATEX $i
  fi
  #--- produce the pdf from dvi
  $DVIPDF $i.dvi $i.pdf
  #--- copy the pdf where the proceedings will be assembled
  cp $i.pdf ../..
  cd ..
done
