% encodage utf8    
--------------------  english readme ----------------------------------------
readme-tkz-graph.txt V 1.00 c 02/06/2011 

The package tkz-graph.sty is a collection of some useful macros if you want to
 draw manually a graph of the graph theory. The kind of graphs that I will
  present, are sometimes called combinatorial graphs to distinguish them from
  the graphs of functions. The macros are designed to give math
 teachers (and students) easy access at the programmation of drawing graphs
  with  TikZ.  I therefore hope that my  packages provide  ideal tools for
   teachers wanting to offer their students fine documents of maths.

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

You can experiment with the tkz-graph package by placing tkz-graph.sty in the directory containing your current tex file.

You can also placing tkz-graph.sty in the directory : 
/texmf/tex/latex/tkz.

 
How to use it
-------------

To use the package tkz-graph, place the following lines in the preamble of
 your LaTeX document.

\usepackage{tkz-graph} 

tkz-graph  loads  TikZ. 

If you use the xcolor package, load that package before tkz-graph to avoid
 package conflicts.

\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{amsmath,tkz-graph}


Documentation
-------------  

The documentation is in french.
Documentation for tkz-graph is available on my sites:
 
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
 
               