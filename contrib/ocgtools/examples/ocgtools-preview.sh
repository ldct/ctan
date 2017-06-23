pdflatex "\AtBeginDocument{\usepackage[pdftex,displaymath,floats,active,tightpage]{preview}}\PassOptionsToPackage{noocg}{ocgtools} \def\ocgpreview#1#2{#2}\input $1 "
cp $1.pdf preview-temp.pdf
grep '\\newlabel{' ocgtools-preview.aux | sed 's/newlabel/maplabelstoall/g' > preview.labels
pdflatex $1
pdflatex $1
pdflatex $1
