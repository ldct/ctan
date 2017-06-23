@echo off
sed -f %EMTEXDIR%\data\rumkidx1.sed %1.idx | mkidx32 -t %1.ilg | sed -f %EMTEXDIR%\data\rumkidx2.sed > %1.ind
