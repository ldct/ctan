%.pdf: %.tex ../exam-n.cls
	TEXINPUTS=..: pdflatex $<
	if grep 'Rerun to get cross' ${<:.tex=.log}; then TEXINPUTS=..: pdflatex $<; else :; fi

all: sample_exam.pdf

sample_exam.pdf: numerical1-solution.pdf

sample_exam_solution.pdf: sample_exam_solution.tex

sample_exam_solution.tex: sample_exam.tex
	rm -f $@
	sed '1s/documentclass/documentclass[showsolutions]/' sample_exam.tex >sample_exam_solution.tex

# This will depend somehow on the .dtx file in the parent directory,
# but expressing that here second-guesses how that file is actually
# generated, so skip this ('don't repeat yourself'; also, this is only
# occasionally used while testing)
../exam-n.cls:
	cd ..; $(MAKE) exam-n.cls

clean:
	rm -f *.pdf *.log *.aux sample_exam_solution.tex
