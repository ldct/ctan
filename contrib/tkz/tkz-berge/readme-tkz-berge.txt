% encodage utf8    
--------------------  english readme ----------------------------------------
readme-tkz-berge.txt V 1.00 c 02/06/2011 

Important : tkz-berge.sty needs tkz-graph.sty, tkz-arith.sty and tkz-tools-arith.tex. This last file is a pat of tkz-base.
 
The package tkz-berge.sty is a collection of some useful macros if you want to
 draw some classic graphs of the graph theory or to make others graphs.
The macros are designed to give math  teachers (and students) easy access
at the programmation of drawing graphswith  TikZ.  I therefore hope that my
 packages provide  ideal tools for teachers wanting to offer their students fine documents of maths. 
Some of  graphs  have names, sometimes inspired by the graph's topology,
and sometimes after their discoverer.

Licence
-------

This program can be redistributed and/or modified under the terms
of the LaTeX Project Public License Distributed from CTAN
archives in directory macros/latex/base/lppl.txt. 


Features
-------- 

 -- needs etex;
 -- requires and automatically loads  PGF/TikZ 2.1; 
 -- compiles with utf8, pdflatex;
 -- compiles using the chain dvi->dvips->ps2pdf; 
 -- not yet ready for use with TeX and ConText (I need more time and ideas).    
 
Installation  
------------

You can experiment with the tkz-graph package by placing all of the
distribution files in the directory containing your current tex file.

You can also placing all of the distribution files in the directory : 
/texmf/tex/latex/tkz.

 -- tkz-berge.sty
 -- tkz-graph.sty
 -- tkz-arith.sty this file loads tkz-tools-arith.tex
 
 Some of the main macros used in the file \tkzname{tkz-tool-arith.tex} are now in the CVS version of PGF. With the next version of PGF, it would be possible to remove the  file \tkzname{tkz-tool-arith.tex}.


How to use it
-------------

To use the package tkz-berge, place the following lines in the preamble of
 your LaTeX document.

\usepackage{tkz-berge} 

tkz-berge  loads  tkz-graph, tkz-tools-arith.tex and TikZ. 

If you use the xcolor package, load that package before tkz-berge to avoid
 package conflicts.

\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{amsmath,tkz-berge}


Documentation
-------------  

The documentation is in english.
Documentation for tkz-berge is available on my sites:
 
 http://altermundus.fr (en français) or  http://altermundus.com (in english) 
 Documentation for printing will be ready soon. 
 
Examples
-------- 

 All  examples given in documentation will be stored on my sites as standalone
  files, ready for compilation.


 Alain Matthes
 5 rue de Valence
 Paris 75005  
 
 al (dot) ma (at) mac (dot) com 
 
               