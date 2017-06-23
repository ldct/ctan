

NAME=bondgraphs
ARCHIVE_NAME=$(NAME).tar.gz
ARCHIVE_CONTENTS=$(NAME).dtx Makefile README $(NAME).ins $(NAME).pdf

all: sty pdf

pdf: sty
	pdflatex $(NAME).dtx > $(NAME).log
	pdflatex $(NAME).dtx >> $(NAME).log
	makeindex -s gglo.ist -o $(NAME).gls $(NAME).glo >> $(NAME).log
	makeindex -s gind.ist -o $(NAME).ind $(NAME).idx >> $(NAME).log
	pdflatex $(NAME).dtx >> $(NAME).log

sty:
	rm -f $(NAME).sty
	tex $(NAME).ins > $(NAME).log

archive:
	@ tar -czf $(ARCHIVE_NAME) $(ARCHIVE_CONTENTS)
	
clean:
	rm -f $(NAME).{log,idx,ilg,ind,aux,blg,bbl,out,gls,glo,fdb_latexmk,synctex.gz,fls,sty,hd,pdf}
