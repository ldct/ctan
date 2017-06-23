
## rubikexamples.sh
## run twice to get hyperref links correct

 pdflatex  --shell-escape  rubikexamples.tex
 pdflatex  --shell-escape  rubikexamples.tex

## echo "...checking error file" 
## grep ERROR  ./rubikstateERRORS.dat
