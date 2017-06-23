%%%%%%%%%%%%%%%%%%%%%%  english readme %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
readme-tkz-fct.txt 01/06/2011  version 1.16

tkz-fct.sty  uses   tkz-base to draw   graph of functions with a Cartesian (rectangular) coordinate system. You need pgf/tikz 2.1 to use this package. You need to install Gnuplot 4.3 or higher.  

Licence
-------

This program can be redistributed and/or modified under the terms
of the LaTeX Project Public License Distributed from CTAN
archives in directory macros/latex/base/lppl.txt. 

Features
--------
 -- needs etex, fp.sty, tkz-base and gnuplot;
 -- automatically loads the package TikZ; 
 -- compiles with utf8, pdflatex;
 -- compiles using the chain dvi->dvips->ps2pdf; 
 -- not yet ready for use with TeX and ConText (I need more time and ideas); 

Installation  
------------

You can experiment with the tkz-fct package by placing all of the distribution files in the directory containing your current tex file.

You can also placing all of the distribution files in the directory : 
/texmf/tex/latex/tkz.

How to use it
-------------

To use the package tkz-fct, place the following line in the preamble of your LaTeX document.

\usepackage{tkz-fct} 

If you use the xcolor package, load that package before tkz-fct to avoid package conflicts.

\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{amsmath,tkz-fct}

Documentation
-------------
 Documentation for tkz-fct and tkz-base is available on my sites:
 
 http://altermundus.fr (en français) or  http://altermundus.fr (in english) 
 
 
Examples
--------
 All  examples given in documentation will be stored on my sites as standalone files, ready for compilation.  

History

-- 1.16 c correction of bugs 
          now default domain is xmin:xmax and not -5:5.  
-- 1.13 first version 

How to get all the  examples :

1) You need to modify the file TKZdoc-fct-main.tex . Replace
  \usepackage{tkzexample}  by
  
\usepackage[saved]{tkzexample}
\def\tkzFileSavedPrefix{tkzFct}

2) Compile the sources
  $ pdflatex TKZdoc-fct-main.tex 
   You get in your folder all the examples  with the prefix tkzFct.

3) Put all these files in a new folder with the ruby script "addcontent.rb"
  Run the script 
  $ ruby  addcontent.rb
  You get  a folder with all the complete examples. The files begin with
  \input{tkzfctpreamble.ltx} 

4) Now you can compile the files. A fine solution is to use a makefile . You can put the two files  tkzfctpreamble.ltx and Makefile inside the last folder and now you run
$make       



 Alain Matthes
 5 rue de Valence
 Paris 75005  
 
 al (dot) ma (at) mac (dot) com     