# gnuplot 4.2/4.4 file

set terminal epslatex
set output "gnuplot42.tex"

set size 0.5, 0.5

set title "Sinus"
set xlabel "x"
set ylabel "sin(x)"
set xrange [ 0 : 2 * pi ]

set style fill solid 0.2
set label "filled" at pi / 2., 0.333 center

plot sin(x) with filledcurves y1 = 0
