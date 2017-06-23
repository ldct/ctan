# A simple script for Bash
getopts "p" opt
if [[ $opt == '?' ]]; then 
  tex_format=latex 
  ext=dvi
  name=$1
else
  tex_format=pdflatex
  ext=pdf
  name=$2
fi
name=$(basename $name .tex)
if [[ -f $name.$ext ]]; then
  rm $name.$ext 
fi
if [[ -f $name.aux ]]; then
  rm $name.aux 
fi
if [[ -f $name.auy ]]; then
  rm $name.auy 
fi
if [[ -f $name.idy ]]; then
  rm $name.idy 
fi
while true; do
  if [[ -f $name.rpt ]]; then
    rm $name.rpt 
  fi
  $tex_format $name
  if [[ ! -f $name.rpt ]]; then
    break
  fi
done
