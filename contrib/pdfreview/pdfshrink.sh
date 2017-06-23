#!/bin/bash

# this script is part of the pdf-annotation LaTeX package by M. Palmer
# like all files in the package, it is covered by the LPPL.

# this assumes ghostscript is installed as 'gs - change as needed
ghostscript="gs"

script_name=`basename "$0"`

if [ -z $1 ]; then
   echo "Usage: $script_name inputfile.pdf [quality [outputfile]]"
   exit 1
fi

input_pdf=$1

# values for 'quality' argument:
#
# 'prepress' is highest quality
# 'printer' or 'default' are 300dpi, both quite good
# 'ebook' is 150 dpi; still reasonable on screen
# 'screen' is 72dpi - looks poor


if [ ! -f $input_pdf ]; then
   echo "file $input_pdf not found"
   exit 1
fi

# let quality default to 'default'
quality=${2-default}

if [ $quality = 'default' ]; then
    suffix="shrunk"
else
    suffix=$quality
fi

output_pdf=${3-${1%.pdf}-${suffix}}
output_pdf=${output_pdf%.pdf}.pdf

echo "converting $input_pdf to $output_pdf using quality '$quality'"

$ghostscript \
   -sDEVICE=pdfwrite \
   -dCompatibilityLevel=1.4 \
   -dHaveTransparency=true \
   -dFastWebView=true \
   -dPDFSETTINGS=/$quality \
   -dEmbedAllFonts=true \
   -dSubsetFonts=true \
   -dNOPAUSE \
   -dQUIET \
   -dBATCH \
   -sOutputFile="$output_pdf" \
   "$input_pdf"

chmod 644 "$output_pdf"
echo "done"
