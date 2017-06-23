#!/bin/bash

#--- set user dependent file name
INTEXFILE="example4optim"
TEXFILE="proceedings"
TEXFILEPATH="example"
PAPERBACKFOLDER="PDF_printed/"
ELECTRONICFOLDER="PDF_electronic/"

#--- different class options for electronic vs paperback version
class_paperback_pre=exclasspre
class_paperback_final=exclasslastpb
class_electronic_final=exclasslastel

#--- set system-dependent variables
LATEXPATH="/usr/texbin/" # TexLive

#--- set compilers' paths
PDFLATEX=$LATEXPATH"pdflatex"
BIBTEX=$LATEXPATH"bibtex"
MAKEINDEX=$LATEXPATH"makeindex"

#--- set script-specific paths
GPATH=`pwd` # general proc path
PAPERBACKFOLDER=${GPATH}/${PAPERBACKFOLDER}
ELECTRONICFOLDER=${GPATH}/${ELECTRONICFOLDER}
PDFPATH="${ELECTRONICFOLDER}/papers"
PDFTKPATH="pdftk_info/"
INPATH="tmp/papersinfo/"
SPPATH="tmp/papers_split/"

#=== prepare output folders
mkdir -p ${PAPERBACKFOLDER}
mkdir -p ${ELECTRONICFOLDER}
rm -r ${ELECTRONICFOLDER}/papers/
mkdir -p ${ELECTRONICFOLDER}/papers/
mkdir -p $INPATH
mkdir -p $SPPATH
mkdir -p $PDFTKPATH

#=== GO TO LaTeX FOLDER !!!
cd ${GPATH}

#=== MAKE PAPERBACK VERSION
#--- class settings: "empty" option and binding
cat ${class_paperback_pre}.tex ${INTEXFILE}.tex >${TEXFILE}.tex

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

#--- class settings: "final" option and binding
cat ${class_paperback_final}.tex ${INTEXFILE}.tex  >${TEXFILE}.tex

echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** PdfLaTeX: mod. class insertion, for proper PDF links for full papers (6/6) ***'
$PDFLATEX $TEXFILE.tex

#--- save PDF
cp ${TEXFILE}.pdf $PAPERBACKFOLDER/${TEXFILE}.pdf

#=== MAKE ELECTRONIC VERSION FOR CD, FROM PAPERBACK VERSION
#--- class settings: "final" option and no binding
cd ${GPATH}/${TEXFILEPATH}
cat ${class_electronic_final}.tex ${INTEXFILE}.tex  >${TEXFILE}.tex

#--- Compile
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
echo '*** PdfLaTeX: add toc (4/6) ***'
$PDFLATEX  $TEXFILE.tex

echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** PdfLaTeX: create toc + include index (5/6) ***'
$PDFLATEX $TEXFILE.tex

#--- class settings: "final" option and binding
cat ${class_paperback_final}.tex ${INTEXFILE}.tex  >${TEXFILE}.tex

echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** PdfLaTeX: mod. class insertion, for proper PDF links for full papers (6/6) ***'
$PDFLATEX $TEXFILE.tex

mkdir ${ELECTRONICFOLDER}/papers/
#--- save PDF
echo "cmd: cp ${TEXFILE}.pdf ${GPATH}/${ELECTRONICFOLDER}/${TEXFILE}.pdf"
cp ${TEXFILE}.pdf $ELECTRONICFOLDER/${TEXFILE}.pdf

#=== EXPORT individual pdf papers back from the proceedings + hdr/footers/metadata
cd ${GPATH}
echo; echo; echo; echo; echo; echo; echo $separator; echo $separator;
echo '*** Export individual PDFs ***'
echo "cmd: ./exportIndividualPDFs.sh ${GPATH} ${TEXFILEPATH}/${TEXFILE} ${INPATH} ${SPPATH} ${PDFPATH} ${PDFTKPATH}"
./exportIndividualPDFs.sh ${GPATH} ${TEXFILE} ${INPATH} ${SPPATH} ${PDFPATH} ${PDFTKPATH}

# rm -r ${GPATH}/tmp/
