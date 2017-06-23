# Makefile
# Run `make main' to compile examples
#
# Copyright 2016 Lin DasSarma <lin@noblejury.com>
#
# This file is part of umbclegislation.
#
# umbclegislation is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

LATEX = `which latex`
PDFLATEX = `which pdflatex`

PDFFILES = legislation.pdf
DVIFILES = legislation.dvi
ALLFILES = $(PDFFILES) $(DVIFILES)

main:	$(PDFFILES)

pdf:	main

all:	$(ALLFILES)

%.pdf:	%.tex
	$(PDFLATEX) $<
	$(PDFLATEX) $< # Run twice for pagewise lineno

clean:
	git clean -f
