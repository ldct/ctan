pdflatex "\AtBeginDocument{\usepackage[pdftex,displaymath,floats,active,tightpage]{preview}}\PassOptionsToPackage{noocg}{ocgtools} \def\ocgpreview#1#2{#2}\input ocgtools-preview "
copy ocgtools-preview.pdf preview-temp.pdf
pdflatex ocgtools-preview
pdflatex ocgtools-preview
pdflatex ocgtools-preview
