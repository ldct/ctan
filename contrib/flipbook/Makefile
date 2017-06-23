default: flipbook-doc flipbook-ex

all: clean flipbook-doc flipbook-ex
	#

flipbook-doc:
	pdflatex flipbook-doc.tex
	pdflatex flipbook-doc.tex

flipbook-ex:
	pdflatex flipbook-ex.tex
	pdflatex flipbook-ex.tex

publish: clean
	make
	cp flipbook-doc.pdf /local/web-homepages/buffet/software/
	cp flipbook-ex.pdf /local/web-homepages/buffet/software/
	make clean
	tar -X .exclude.txt -czf ../flipbook.tgz ../flipbook
	mv ../flipbook.tgz /local/web-homepages/buffet/software/
	cd .. ; zip -r ./flipbook.zip ./flipbook -x@flipbook/.exclude.txt
	mv ../flipbook.zip /local/web-homepages/buffet/software/

clean:
	rm -f *~ .*~ *.log *.blg *.bbl *.aux
