#!/bin/sh

wd=`pwd`

extarget="example" #- set the example folder name

#-- prepare scripts for building example
mkdir $extarget #- create the folder

#-- generate the program session files
perl generateswitch.pl<exprogram.csv

mv ex*.* $extarget/ #- move all other example files into proper folder
mv buildproc* $extarget/ #- move scripts into it
mv buildcppdfpapers* $extarget/
mv buildpapers* $extarget/
mv countnbpages.sh $extarget/
mv generateswitch.pl $extarget/
mv papersinfo.sh $extarget/
mv paperssplitpreamble.sh $extarget/
mv removeLaTeXcmds.sh $extarget/

cp -r pictures $extarget/ #- copy pictures into it
cp -r papers $extarget/ #- copy papers into it
cp confproc.cls $extarget/ #- copy the class into it
cp confproc*.ist $extarget/ #- copy the index style into it
cp newapave* $extarget/ #- copy the newapave bib style files

#-- prepare building scripts and generate needed directories
cd $wd/$extarget
mkdir pdftk_info/
mv expages.tex papers/

cd $wd/$extarget
chmod +x buildproc*
chmod +x generateswitch.pl
chmod +x exportIndividualPDFs.sh
chmod +x papersinfo.sh
chmod +x paperssplitpreamble.sh
cd ..

#-- build example
cd $wd/$extarget
#./buildproc.sh
