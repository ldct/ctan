#!/bin/bash

# arg 0: path, arg 1: input file; arg 2: output file

#-- save arguments for use
args=("$@")
path=${args[0]}
file=${args[1]}
outputfile=${args[2]}
cd ${path}
cp ${file} tmp.txt
#echo "__ ORIGINAL: $file ___"
#cat tmp.txt

#echo "  "
#echo "__ removed accents: __"
perl -p -i -e " s/\\\'e/e/g " tmp.txt
perl -p -i -e " s/\\'{e}/e/g " tmp.txt
perl -p -i -e " s/\\\`e/e/g " tmp.txt
perl -p -i -e ' s/\\"e/e/g ' tmp.txt
perl -p -i -e " s/\\\`{e}/e/g " tmp.txt
perl -p -i -e " s/\\\'a/a/g " tmp.txt
perl -p -i -e " s/\\\`a/a/g " tmp.txt
perl -p -i -e " s/\\\`{a}/a/g " tmp.txt
perl -p -i -e ' s/\\"{o}/oe/g ' tmp.txt
perl -p -i -e ' s/\\"o/o/g ' tmp.txt
perl -p -i -e ' s/\\o{}/o/g ' tmp.txt
perl -p -i -e ' s/\\\^o/o/g ' tmp.txt
perl -p -i -e " s/\\\'o/o/g " tmp.txt
perl -p -i -e " s/\\\`o/o/g " tmp.txt
perl -p -i -e " s/\\\'u/u/g " tmp.txt
perl -p -i -e ' s/\\u //g ' tmp.txt
perl -p -i -e ' s/\\"u/u/g ' tmp.txt
perl -p -i -e ' s/\\i /i/g ' tmp.txt
perl -p -i -e ' s/\\i/i/g ' tmp.txt
perl -p -i -e " s/\\\'{i}/i/g " tmp.txt
perl -p -i -e ' s/\\"{i}/i/g ' tmp.txt
perl -p -i -e ' s/\\c {c}/c/g ' tmp.txt

#echo "  "
#echo "__ removed textit, texbf, {, }: __"
perl -p -i -e ' s/\--/-/g ' tmp.txt
perl -p -i -e " s/\\ss/ss/g " tmp.txt
perl -p -i -e ' s/\\textsuperscript //g ' tmp.txt
perl -p -i -e " s/\\&/&/g " tmp.txt
perl -p -i -e ' s/\\mu/mu\:/g ' tmp.txt
perl -p -i -e ' s/\\sim\s//g ' tmp.txt
perl -p -i -e ' s/\\sim//g ' tmp.txt
perl -p -i -e ' s/\s:/:/g ' tmp.txt

perl -p -i -e ' s/\$//g ' tmp.txt
perl -p -i -e " s/textit //g " tmp.txt
perl -p -i -e " s/textbf //g " tmp.txt
perl -p -i -e " s/\{//g " tmp.txt
perl -p -i -e " s/\}//g " tmp.txt
perl -p -i -e ' s/\`\`/"/g ' tmp.txt
perl -p -i -e " s/\'\'/\"/g " tmp.txt

#echo "  "
#echo "__ removed \: ___"
perl -pi -e 's/\\//g' tmp.txt
perl -pi -e 's/\s{2,10}\{\}/ /g' tmp.txt
perl -pi -e 's/\s{2,10}/ /g' tmp.txt

cp tmp.txt $outputfile
