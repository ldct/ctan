@echo	off
rem A simple batch file for Windows XP and MiKTeX
if "%1" == "-p" goto pdf
set name=%~n1
set pgm=latex
goto start
:pdf
set name=%~n2
set pgm=pdflatex
:start
if exist %name%.aux del /q %name%.aux	> nul
if exist %name%.auy del /q %name%.auy	> nul
if exist %name%.idy del /q %name%.idy	> nul
:loop
if exist %name%.rpt del /q %name%.rpt	> nul
setlocal
set TEXMFMAIN=c:\MiKTeX
c:\MiKTeX\miktex\bin\%pgm%  %name%.tex
endlocal
if exist %name%.rpt goto loop
