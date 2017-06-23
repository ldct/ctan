##################
# Setup commands #
##################
CC=gcc
LaTeX=latex
DVIPS=dvips
PS2EPS=./ps2eps
####################
# List LaTeX files #
####################
PiCTeX  = points.tex \
          inches.tex 
##########################
# Rules and dependencies #
##########################
all: ruler
 
ruler: ruler.ps
	$(PS2EPS) -f -l ruler.ps	

ruler.ps: ruler.dvi
	$(DVIPS) -Ppdf -t legal -o ruler.ps ruler.dvi

ruler.dvi: ruler.tex
	$(LaTeX) ruler.tex

ruler.tex: points.tex inches.tex

points.tex: points.c
	$(CC) -o points points.c
	./points
 
inches.tex: inches.c
	$(CC) -o inches inches.c
	./inches

############
# Clean up #
############
clean:
	rm -f inches.tex inches points.tex points ruler.dvi ruler.aux ruler.log ruler.ps
