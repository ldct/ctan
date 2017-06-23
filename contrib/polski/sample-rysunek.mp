%% Example of MetaPost file (TP, Public domain)
%% 
verbatimtex %\input 8pt.tex 
 %% -- 8pt.tex included below --
\font\eightrm = plr8 \font\sixrm = plr6 \font\sixi = plmi6 
\font\eighti = plmi8 \font\eightsy = plsy8 \font\sixsy = plsy6
\font\eightit =plti8 \font \eightbf = plbx8 \font\sixbf =plbx6
\def\eightpoint{\def\rm{\fam0\eightrm}%
\textfont0\eightrm\scriptfont0=\sixrm\textfont1\eighti\scriptfont1=\sixi    
\textfont2\eightsy\scriptfont2=\sixsy%\textfont3\eightex 
\textfont\itfam=\eightit
\def\it{\fam\itfam\eightit}%
\textfont\bffam=\eightbf \scriptfont\bffam=\sixbf
\def\bf{\fam\bffam\eightbf}%
%%
\normalbaselineskip=9.85 pt
\setbox\strutbox=\hbox{\vrule height7.2 pt depth 2.6 pt width0pt}%
\normalbaselines\rm}
\eightpoint
%%\endinput
etex;

beginfig(1)
z0 = (0,0);  z2=(40mm,y0); z3 = (x0,27mm); z1 = (-22mm,-18mm);

drawarrow z0 -- z2;
drawarrow z0 -- z3;
drawarrow z0 -- z1;

z8 = (.6[x0,x2],  .5[y0,y3]);
z9 = (.75[x0,x2], .5[y0,y1]);

drawarrow z0 -- z8;
drawarrow z0 -- z9;

label.rt(btex ${\bf x}_2$ etex, z2 );

label.bot(btex ${\bf x}_1$ etex, z1 );
label.bot(btex ${\bf y}_a$ etex, .5[z0, z9] );

label.top(btex ${\bf x}_3$ etex, z3 );
label.top(btex ${\bf y}$ etex, .5[z0, z8] );

drawarrow z9 -- z8;

label.rt(btex ${\bf y} - {\bf y}_a$ etex, .6[z9, z8] );

label.bot(btex ${\cal W}$ etex, .5[z2, z1] );
label.bot(btex ${\cal V}$ etex, (.9x2,.9y3) );

endfig;


\bye

