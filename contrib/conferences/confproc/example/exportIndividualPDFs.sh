#!/bin/bash

args=("$@")
GPATH=${args[0]}  #= ~/e-proceedings
TEXFILE=${args[1]}  #= proceedings
INPATH=${args[2]}  #= papers_info
#mkdir -p $INPATH
SPPATH=${args[3]}  #= papers_split
#mkdir -p $SPPATH
PDFPATH=${args[4]}
PDFTKPATH=${args[5]}

PDFFILE=${TEXFILE}.pdf  # for use in the paper_split.sh and paper_info.sh scripts

echo "-PATH (working path):       $GPATH"
echo "-TeX file (orig. TeX proc): $TEXFILE"
echo "-PDF:                       $PDFFILE (original PDF proc)"
echo "-PDFPATH (indiv. PDFs):     $PDFPATH "
echo "-PDFTKPATH (pdftk info):    $PDFTKPATH"
echo "-INPATH (papers info):      $INPATH"
echo "-SPPATH (split papers):     $SPPATH"

cd $PDFTKPATH
list=`ls *.pdftk`
for tmpfile in $list
do
  cp ${tmpfile} test.txt
  #-- 2-concat all lines, removing carriage returns
  sed -e :a -e '$!N;s/\n/LineBreak/;ta' -e 'P;D' test.txt >test2.txt
  perl -ne ' s/LineBreakInfoKey/\nInfoKey/g; print ' test2.txt >test3.txt
  perl -ne ' s/LineBreakInfoValue/\nInfoValue/g; print ' test3.txt >test4.txt
  perl -ne ' s/LineBreak//g; print ' test4.txt >test5.txt
  mv test5.txt $tmpfile
done

rm -f tmp*
rm -f test*.txt

cd $GPATH
echo "__________"
echo "__ split PDFs: generate bash script file"
pwd
echo "cmd: cat paperssplitpreamble.sh $TEXFILE.pdftk >tmp.sh"
cat paperssplitpreamble.sh $TEXFILE.pdftk >tmp.sh
mv tmp.sh ${GPATH}/papers_split.sh

echo "__________"
echo "__ split PDFs: Perl to add echo lines to 'papers_split.sh' script"

#echo "cmd: Perl to copy/add 'echo' cmd to each pdftk command, in 'papers_split.sh'"
perl -p -e 's/^pdftk(.*[\n\r])/echo \"pdftk $1\"\npdftk $1/gm' ${GPATH}/papers_split.sh >tmp.txt
mv tmp.txt ${GPATH}/papers_split_all.sh

echo; echo "__________"
echo "__ split PDFs: launch bash script file"
#echo "cmd: chmod +x papers_split_all.sh"
chmod +x papers_split_all.sh

echo "cmd: ./papers_split_all.sh"
#echo "    ./papers_split_all.sh ${GPATH} ${TEXFILE} ${INPATH} ${SPPATH} ${PDFPATH}"
./papers_split_all.sh ${GPATH} ${TEXFILE} ${INPATH} ${SPPATH} ${PDFPATH}
# rm ${SPPATH}/*.ps #useful only if 'pdf2ps -> ps2pdf', not useful with 'gs'

#--- generate PDF with corrected metadata
echo "__________"
echo "__ Correct PDF metadata with papersinfo.sh"
./papersinfo.sh ${GPATH} ${TEXFILE} ${INPATH} ${SPPATH} ${PDFPATH} ${PDFTKPATH}

##--- clean
#rm -r ${INPATH}
#rm -r ${SPPATH}
#rm papers_split.sh
#rm -r tmp
