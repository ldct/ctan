#!/bin/bash

args=("$@")
GPATH=${args[0]} #= ~/proceedings/e-proceedings
TEXFILE=${args[1]} #= ICMC2009_proceedings
INPATH=${args[2]} #= papers_info
SPPATH=${args[3]} #= papers_split
PDFPATH=${args[4]} #= ~/proceedings/e-proceedings
PDFTKPATH=${args[5]} #= ~/pdftk_info

PDFFILE=${TEXFILE}.pdf     # for use in the paper_split.sh and paper_info.sh scripts

cd ${GPATH}/${SPPATH}
filelist=`ls *.pdf`
mkdir ${PDFPATH}

cd ${GPATH}
chmod +x removeLaTeXcmds.sh

for file in $filelist
do
  base=${file%%.*}
  echo "removing LaTeX accents: ${base}.pdftk -> ${base}_clean.info"
#  echo "cmd: removeLaTeXcmds.sh ${GPATH} ${PDFTKPATH}/${base}.pdftk ${INPATH}/${base}_clean.info"
  ${GPATH}/removeLaTeXcmds.sh ${GPATH} ${PDFTKPATH}/${base}.pdftk ${INPATH}/${base}_clean.info
  echo "adding PDF metadata:    ${base}_clean.info -> ${base}.pdf"
#  echo "cmd: pdftk ${SPPATH}/${base}.pdf update_info ${INPATH}/${base}_clean.info output ${PDFPATH}/${base}.pdf"
  echo "pdftk ${GPATH}/${SPPATH}/${base}.pdf update_info ${GPATH}/${INPATH}/${base}_clean.info output ${PDFPATH}/${base}.pdf"
  pdftk ${GPATH}/${SPPATH}/${base}.pdf update_info ${GPATH}/${INPATH}/${base}_clean.info output ${PDFPATH}/${base}.pdf
done
