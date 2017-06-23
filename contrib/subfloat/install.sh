# Generate package file
latex subfloat.ins

# Generate documentation
latex subfloat.dtx
latex subfloat.dtx
makeindex -s gind.ist subfloat
makeindex -s gglo.ist -o subfloat.gls subfloat.glo
latex subfloat.dtx
rm subfloat.glo subfloat.gls subfloat.idx subfloat.ilg subfloat.ind
rm subfloat.aux subfloat.log subfloat.toc

echo
echo
echo "Please copy subfloat.sty to a directory in the LaTeX search path"
