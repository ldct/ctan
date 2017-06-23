%%%%%%%%%%%%%%%%%%%%%%%%% pointruler.mp (v0.1) %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This file, when run through MetaPost, produces the same ruler as the
% ruler.tex of the pointRuler package of Troy Henderson. That package
% uses a couple of small C programs to generate a list of coordinates,
% and then PiCTeX to connect them in various ways.
%
% This file is all-in-one and builds an eps file of much smaller size in
% one step. The reduced size is mainly because MetaPost uses penstrokes,
% while PiCTeX builds lines out of copies of a dot from the font cmr5.
%
% To create the ruler, run
%       mpost pointruler.mp
% producing the eps file pointruler.mps (if the mpost version is .900 or
% higher, otherwise pointruler.1), plus two temporary files mptextemp.mp
% and mptextemp.mpx, which may be deleted. The extension .mps allows it to
% be directly included as graphics in latex or pdflatex documents.
%
% (Included in the pointRuler package with the permission of
% Troy Henderson.)
%
% -- Dan Luecking
%
% You should change prologues to 0 if you only intend to include the
% figure in a TeX or LaTeX document.
%
% If your MetaPost is less than 0.900, probably you want prologues to be
% 2 or 0. The value 3 is for embedding fonts, which early mpost couldn't
% do.

numeric version_num;
if known mpversion:
  prologues:=3;
  version_num := scantokens (mpversion);
else:
  prologues := 2;
  version_num := 0.642;
fi

% Set output filename to pointruler.mps:
if version_num > 1.199:
  outputtemplate := "%j.mps";
elseif version_num > 0.899:
  filenametemplate %j.mps;
fi

% tertiarydef makes this like other relations. (Personally,
% I would prefer relations bind more strongly than "and" and "or".)
tertiarydef a divides b =  ((b mod a) = 0)  enddef;

% Build most of the necessary labels in one call to LaTeX by writing
% necessary code to mptextemp.mp (as in the TEX macro). They are
% stored in the picture arrays P[] and Q[].
write "verbatimtex" to "mptextemp.mp";
write "%&latex" to "mptextemp.mp";
write "\documentclass[12pt]{article}" to "mptextemp.mp";
write "\begin{document}" to "mptextemp.mp";
write "etex" to "mptextemp.mp";

% The "pt" and "in" labels.
write "P[0] := btex {\tiny pt} etex;" to "mptextemp.mp";
write "Q[0] := btex {\tiny in} etex;" to "mptextemp.mp";

% The 86 pictures P[10] through P[860] where,
% e.g., P[10] = btex {\scriptsize 10} etex;
for n=10 step 10 until 860:
  write "P[" & decimal n & "] := btex {"
    & if 20 divides n: "\scriptsize " else: "\tiny " fi
    & decimal n &"} etex;" to "mptextemp.mp";
endfor

% the 12 pictures Q[1] through Q[12] where,
% e.g., Q[1] = btex {\scriptsize 1} etex;
for n= 1 upto 12:
  write "Q[" & decimal n & "] := btex {\scriptsize "
    & decimal n &"} etex;" to "mptextemp.mp";
endfor
write EOF to "mptextemp.mp"; % close the file

picture P[];
picture Q[];

% Generate the arrays of labels:
input mptextemp.mp;

numeric hh;
path pp;
pp := (0,0)--(0,1); % scaled to produce hashmarks.

beginfig(0);
  pickup pencircle scaled .4pt;
  labeloffset := 2pt;
  % All the pt scale marks. Each 10th is labeled, the locations staggered
  % Each 20th is 28pt long, each 10th is 21pt, each 5th is 14 pt and
  % all the rest 7pt.
  for n=1 upto 867:
    if 20 divides n:      hh := 28;
      label.top(P[n],(n*pt, 28pt));
    elseif 10 divides n:  hh := 21;
      label.top(P[n],(n*pt,21pt));
    elseif  5 divides n:  hh := 14;
    else               :  hh :=  7;
    fi
    draw pp scaled (hh*pt) shifted (n*pt,0);
  endfor
  % All the inch scale marks. Each inch is labeled. The inch rules are
  % 28pt long; the 1/2inch are 21pt; the 1/4inch are 14 pt; the
  % 1/8 inch are 7pt, and the 1/16inch are 3.5pt long..
  for n=1 upto 16*12-1 :
    if 16 divides n: hh:=28;
      label.bot (Q[n/16],(n*in/16,-28pt));
    elseif 8 divides n: hh :=  21;
    elseif 4 divides n: hh :=  14;
    elseif 2 divides n: hh :=   7;
    else:               hh := 3.5;
    fi
    draw pp scaled (-hh*pt) shifted (n*in/16,0);
  endfor
  labeloffset := 0;

  % The 12th inch is special. No rule is drawn and the label is shifted:
  draw thelabel.llft (Q12,(12in,-28pt)) shifted (-1pt,-2pt);

  % The line down the middle and the border.
  draw (0,0)--(12in,0);
  draw (0,-in/2)--(12in,-in/2)--(12in, in/2)--(0,in/2)--cycle;

  % Little squares in two corners to hold the text labels "pt" and "in"
  draw (0, 28pt)--(10pt, 28pt)--(10pt, in/2);
  draw (0,-28pt)--(10pt,-28pt)--(10pt,-in/2);

  % Those text labels:
  label(P[0], (5pt,.5[ 28pt, in/2]));
  label(Q[0], (5pt,.5[-28pt,-in/2]));
endfig;
end
