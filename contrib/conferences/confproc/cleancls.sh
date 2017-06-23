#!/bin/sh

mkdir backup #--- move the files to be kept
mv confproc.dtx backup/
mv confproc_diag.pdf backup/
mv confproc-short.tex backup/
mv confproc-short.pdf backup/
mv buildcls.sh backup/
cp cleancls.sh backup/
rm *.* #--- clean up!
mv backup/* . #--- move the backed up files
rm -r backup #--- remove the temporary backup folder
