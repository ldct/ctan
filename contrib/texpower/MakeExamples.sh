#!/bin/sh
# 
# Script (for *nix) to compile all examples and demos.
#
# Remarks:
# Not compiling bgndexample - too time consuming

# Handling powersem based examples/demos which 
# must go the latex+dvips+ps2pdf route:
for file in \
    bckwrdexample \
    divexample \
    fancyexample \
    hilitexample \
    mathexample \
    panelexample \
    parexample \
    picexample \
    tabexample \
    spanelexample \
    prosperdemo \
    seminardemo 
do
    echo "Compiling $file.tex"
    latex -interaction=batchmode $file.tex > /dev/null
    latex -interaction=batchmode $file.tex > /dev/null
    dvips -q $file.dvi
    ps2pdf $file.ps
done  

# Examples/demos which can be compiled with pdflatex:
for file in \
    verbexample \
    foilsdemo \
    ifmslidemo \
    pdfslidemo \
    simpledemo \
    pdfscrdemo \
    pp4sldemo \
    slidesdemo
do
    echo "Compiling $file.tex"
    pdflatex -interaction=batchmode $file > /dev/null
    pdflatex -interaction=batchmode $file > /dev/null
done

