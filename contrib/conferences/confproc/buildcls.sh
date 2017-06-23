#!/bin/sh

wd=`pwd`

#-- set path to LaTeX binaries
LaPath="/usr/texbin/" # TeXLive

#-- set names of LaTeX and related compilers
Latex=$LaPath"pdflatex"
Index=$LaPath"makeindex"
Target="confproc"  #- set document's name
extarget="example/" #- set the example folder name

#-- build doc, class and example files
$Latex $Target.dtx #- build doc. and .ins file
$Latex $Target.ins #- build class and example files

#-- HACK: rename newapave2.sty
mv newapave2.sty newapave.sty

cd $wd/
#-- finish to build the documentation
$Latex $Target.dtx #- re-run doc for toc update
$Latex $Target.dtx #- re-run doc for proper back-references
$Index -s gind.ist $Target  #- with \CodelineIndex of \PageIndex
$Index -s gglo.ist -o $Target.gls $Target.glo  #- with \RecordChanges
$Latex $Target.dtx #- insert index & list of changes, re-number
$Latex $Target.dtx #- last run with proper page numbers

#-- prepare scripts for cleaning package
cd $wd
chmod +x cleancls.sh

#-- prepare scripts for building example
chmod +x prepareexample.sh
./prepareexample.sh

#-- build example
cd $extarget
#./buildproc.sh
