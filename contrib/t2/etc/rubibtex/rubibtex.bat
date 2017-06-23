@echo off
move %1.aux %TEMP%
sed.exe -f %EMTEXDIR%\data\rubibtex.sed %TEMP%\%1.aux > %1.aux
bibtex.exe -c %EMTEXDIR%\bibtex\csf\cp866rus.csf %1
move %TEMP%\%1.aux .
