% encodage utf8
----------------------- french lisez-moi ! -----------------------------------
readme-tkz-fct.txt 01/06/2011    version 1.16

Objet
-----

tkz-fct.sty  utilise   tkz-base pour tracer  des représentations de fonctions en 2D dans des repères orthogonaux.

Licence 
-------
LaTeX Project Public License 


Contraintes
----------
 -- ce package nécessite etex.sty, fp.sty, le dossier tkzbase et gnuplot;
 -- bien sûr, PGF/TikZ doit être installé en version 2.1 ; 
 -- ce package fonctionne avec utf8 et pdflatex;
 -- la chaîne dvi->dvips->ps2pdf est aussi possible;
 -- il ne fonctionne pas encore avec TeX et ConTeXt. 
 -- les premiers tests que lualatex peut être utilisé     

Installation
------------
Si vous voulez installer ce package à la main pour tester une version beta, il
 suffit de placer le package tkz-fct   dans un dossier tkz (par exemple) ici :
  /texmf/tex/latex/tkz, à côté du dossier tkzbase.
Il est possible aussi de le mettre dans le dossier avec vos propres fichiers.

Le plus simple est de récupérer l'archive tkz.zip qui contient l'ensemble de
 mes packages liés à tkz-base.    


Fonctionnement
-------------  
Son fonctionnement s'obtient en plaçant la ligne suivante dans le préambule : 
\usepackage{tkz-fct} 

Ce package  charge tkz-base et TikZ. Si vous  avez besoin de xcolor.sty, il
 est nécessaire de le charger  avant tkz-base,   afin d'éviter des conflits 
  entre packages.  

\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{amsmath,tkz-fct}
 
Documentation
-------------
 tkz-fct-screen.pdf est actuellement en français mais de nombreux exemples 
  sont donnés. 
Une documentation destinée à l'impression sera bientôt prête. Vous trouverez
 ces fichiers sur mes sites :
  http://altermundus.fr  ou   http://altermundus.com 


Exemples
--------
 Tous les exemples donnés dans la documentation, sont stockés sur mes sites
  sous forme de fichiers individuels, prêts pour être compilés.  

Historique des versions

-- 1.16 c correction de bugs 
          maintenant le domaine par défaut est xmin:xmax


Comment obtenir tous les exemples de la documentation
-----------------------------------------------------

1) Il faut modifier l fichier TKZdoc-fct-main.tex . Remplacez
  \usepackage{tkzexample}  par
  
\usepackage[saved]{tkzexample}
\def\tkzFileSavedPrefix{tkzFct}
Les exemples sont enregistrés dans des fichiers ayant comme préfixe tkzFct.

2) Ensuite il faut compiler les sources
  $ pdflatex TKZdoc-fct-main.tex 

3) Placez tous les fichiers dans un dossier avec le  script ruby
     "addcontent.rb"
  Lancez le script 
  $ ruby  addcontent.rb
  Vous devez obtenir un dossier "new" avec tous les exemples complétés avec en
   particulier la ligne  \input{tkzfctpreamble.ltx} 

4) Vous pouvez  compiler tous les exemples en une seule fois. Placez les deux
fichiers  tkzfctpreamble.ltx and Makefile dans le dernier dossier et lancez
$ make



 Alain Matthes
 5 rue de Valence
 Paris 75005  
 
 al (dot) ma (at) mac (dot) com    