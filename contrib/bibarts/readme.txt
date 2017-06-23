
BibArts is a package to administer bibliographical references in footnotes,
and for creating a bibliography from these references simultaneously;
it requires a program, for which source and Windows executable are provided. 
(A summary of contents is in English; the full documentation is in German.)

===

BibArts 2.1 is a LaTeX package to assist in making bibliographical features
common in the arts, and the humanities (history, political science,
philosophy, etc.).  bibarts.sty provides commands for quotation, register
key words, abbreviations, and especially for a formatted citation of
literature, journals (periodicals), published documents, and unpublished
archive documents.

BibArts will also copy the arguments of all those commands into lists for an
automatically generated appendix.  These lists are optionally referring to
page and footnote numbers in your text (index).  BibArts has nothing to do
with BibTeX, and it does not use any data bank except your own LaTeX text.

The lists are created by bibsort.  A file bibsort.exe is part of the package
( CTAN mirrors > BibArts > bibarts.zip ) and runs on newer Windows systems.
Other users first have to create a binary file from bibsort.c with their own
C-compiler.  A Unix GNU C-compiler accepted the source, but I was not jet
able to test that binary on Unix.  BibArts 2.1 is tested on Windows with the
2015/10/01 LaTeX 2e distribution, but most features should even run on 2.09.

 BibArts 2.1 (9 files, 8 dated 2016/03/19):
  readme.txt     This file here
  bibarts.sty    The LaTeX style file
  ba-short.pdf   Short introduction (English)
  ba-short.tex   Source of ba-short.pdf
  bibarts.pdf    Full documentation (German)
  bibarts.tex    Source of bibarts.pdf
  bibsort.exe    Binary to create the lists
  bibsort.c      Source of bibsort.exe
  COPYING        License (dated 1993/11/28)

===

Changes from BibArts versions 1.x (1990s) to versions 2.x:

Version 2.0 was a completely new package with massive extensions.  Since,
bibarts.sty helps to use slanted fonts (italics), and is able to set ibidem
automatically in footnotes.  Therefore, it is now possible to add volume and
page numbers e.g. to the \vli command (\vli did also exist in 1.x for full
references to literature), and the new \kli command (shortened references).
Prepared text elements (captions) are provided in English, French and German.

bibsort is now making the index numbers; BibArts does no more use MakeIndex.

bibarts.sty starts an emulation for 1.3 texts, when you type \makebar, but
better also keep copies of the package files of a BibArts 1.x, when you did
write texts with it.  BibArts now uses .aux files instead of a .bar file.
Even if you set \makebar, any changes to commands \schrift, \barschrift, and
\indschrift will be ignored.  \verw and \punctuation do not exist any more;
see examples for the new commands \frompagesep and \ntsep in bibarts.pdf.

===

Changes from BibArts version 2.0 (2015) to version 2.1:

You now may choose your own order of page and footnote numbers in the index
(roman--arabic, arabic--roman, etc.).  Type  bibsort -s2 xxxx  for page and
... -f2 xxxx  for footnote numbers.  xxxx  are permutations of four letters
out of  nRrAas  (a=alph, A=Alph, n=arabic, R=Roman, r=roman, s=fnsymbol):
You always have to set n and s, and to choose R *or* A, and r *or* a.  E.g.
srnR  means, that you can use \Roman in your text, but you do not have to.

bibsort is able to evaluate the new fnsymbols (which expand to \TextOrMath).

If bibsort should write into files with a different prefix as the .aux input
file, you have to use -o <outfile> now.  And you may type  bibsort <infile>,
*or*  bibsort -i <infile>  (e.g., when the input file name begins with '-').

bibarts.sty will be even loaded, when ~":;!?'`<> are active (catcode 13);
and bibsort is sorting also "z (not only "s) as \ss now; see bibarts.pdf.

bibsort sorts the 'official' $Greek variables$ since version 2.0.  To write
single words in Old Greek, BibArts 2.1 also provides \Alpha [A], \Beta [B],
\Epsilon [E], \Zeta [Z], \Eta [H=sort=>E], \Iota [I], \Kappa [K], \Mu [M], 
\Nu [N], \Rho [P==>R], \Tau [T], \Chi [X==>Ch], \Omicron [O], \omicron [o].

BibArts 2.0 set \footnotesep to 2ex, whereas 2.1 does *not* change the 
pre-setted value.  If you want to continue with the 2.0 distance between two
footnotes, you will have to type \setlength{\footnotesep}{2ex} in your text.

Some of the prepared text elements (captions) have been modernized.  The 
\evkctitlename changed from {Short Titles} to {Shortened References}.  And
\gannouncektitname changed to '... im Folgenden'.  To restore the 2.0 def.:
\renewcommand{\gannouncektitname}{ (\kern 0.015em im folgenden \baupcorr}

===

Published under the terms of the GNU General Public License. 

BibArts 2.1  (C) Timo Baumann  2016
