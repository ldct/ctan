%% This is file cje.cls
%% 2017/04/17 v1.01
%%
%% It was developed from `article.cls',
%% generated with the docstrip utility.
%%
%% This file was generated from file(s) of the LaTeX base system.
%%
%% The original source files were:
%% classes.dtx  (with options: `article')
%%
%% =========
%%
%% COPYRIGHT (c) 2017 Canadian Economics Association
%%
%% LICENSE
%% =======
%%
%% This work can be distributed and/or modified under the conditions of the LaTeX Project Public License, 
%% either version 1.3 of this license or any later version. The latest version of this license is available at 
%% latex-project.org/lppl.txt. Version 1.3, or later, is part of all distributions of LaTeX version 2005/12/01 or later.
%%
%%
%% This file has the LPPL maintenance status "maintained".
%%
%% This file may be distributed only together with a copy of the LaTeX
%% base system. You may, however, distribute the LaTeX base system without
%% such generated files.
%%
%% The list of all files belonging to the LaTeX base distribution is
%% given in the file `manifest.txt'. See also `legal.txt' for additional
%% information.
%%
%% The list of derived (unpacked) files belonging to the distribution
%% and covered by LPPL is defined by the unpacking scripts (with
%% extension .ins), which are part of the distribution.
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cje}
              [2017/04/17 v1.01 CJE document class]

\newcommand{\@xiiiptvpt}{13.5}%large For author
\DeclareMathSizes{\@xiiiptvpt}{\@xiiiptvpt}{\@xpt}{\@viipt}

\newcommand{\@xviiipt}{18}%LARGE For title
\DeclareMathSizes{\@xviiipt}{\@xviiipt}{\@xiipt}{\@xpt}

\newcommand\small{% 9/10
  \@setfontsize\small\@ixpt\@xpt
  \abovedisplayskip 5\p@ \@plus 5\p@ \@minus 1\p@
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip 3\p@ \@plus 3\p@
  \belowdisplayshortskip \abovedisplayshortskip
}

\newcommand\indexsize{\@setfontsize\indexsize\@viiipt\@ixpt}%8/9 CJE 
\newcommand\footnotesize{\@setfontsize\footnotesize\@viiipt\@ixpt}%8/9 CJE
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}%CJE used in Vol line
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\captionsize{\@setfontsize\captionsize\@viiipt{9}}%fig and table captions (8/9)%CJE
\newcommand\smaller{\@setfontsize\smaller\@viiipt\@ixpt}% for entries in tables (8/9)%CJE
\newcommand\abstractsize{\@setfontsize\abstractsize\@ixpt{10}}%abstractsize (9/10)%CJE
\newcommand\sectionsize{\@setfontsize\sectionsize\@xpt{12}}%section heads (10/12)
\newcommand\large{\@setfontsize\large\@xiiiptvpt{16.5}}%not used
\newcommand\Large{\@setfontsize\Large\@xiipt{14}}% authors 
\newcommand\LARGE{\@setfontsize\LARGE\@xviiipt{22}}%new, for titlesize (18/22)
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

% define a smallverbatim 9/10

\begingroup \catcode `|=0 \catcode `[= 1
\catcode`]=2 \catcode `\{=12 \catcode `\}=12
\catcode`\\=12 |gdef|@xsmallverbatim#1\end{smallverbatim}[#1|end[smallverbatim]]
|gdef|@sxsmallverbatim#1\end{smallverbatim*}[#1|end[smallverbatim*]]
|endgroup

\def\@smallverbatim{\topsep=0.5\baselineskip\trivlist\item\relax% leave half a line above and below
  \if@minipage\else\vskip\parskip\fi
  \leftskip\@totalleftmargin\rightskip\z@skip
  \parindent\z@\parfillskip\@flushglue\parskip\z@skip
  \@@par
  \@tempswafalse
  \def\par{%
    \if@tempswa
      \leavevmode \null \@@par\penalty\interlinepenalty
    \else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \let\do\@makeother \dospecials
  \obeylines \smallverbatim@font \@noligs
  \hyphenchar\font\m@ne
  \everypar \expandafter{\the\everypar \unpenalty}%
}
\def\smallverbatim{\@smallverbatim \frenchspacing\@vobeyspaces \@xsmallverbatim}
\def\endsmallverbatim{\if@newlist \leavevmode\fi\endtrivlist}

\def\smallverbatim@font{\normalfont\abstractsize\ttfamily}

\def\@verbatim{\topsep=0.5\baselineskip\trivlist \item\relax% leave half a line above and below
  \if@minipage\else\vskip\parskip\fi
  \leftskip\@totalleftmargin\rightskip\z@skip
  \parindent\z@\parfillskip\@flushglue\parskip\z@skip
  \@@par
  \@tempswafalse
  \def\par{%
    \if@tempswa
      \leavevmode \null \@@par\penalty\interlinepenalty
    \else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \let\do\@makeother \dospecials
  \obeylines \verbatim@font \@noligs
  \hyphenchar\font\m@ne
  \everypar \expandafter{\the\everypar \unpenalty}%
}

\renewcommand\normalsize{%
  \@setfontsize\normalsize{10pt}{12pt}
  \abovedisplayskip 6\p@ \@plus 6\p@ \@minus 1\p@
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip 3\p@ \@plus 3\p@
  \belowdisplayshortskip \abovedisplayshortskip
}

\newif\ifprodtf
\DeclareOption{prodtf}{\prodtftrue}

\newif\if@proof 
\DeclareOption{proof}{\@prooftrue}

%\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\newif\if@tablestar

\@titlepagefalse
%\if@compatibility\else
%\DeclareOption{a4paper}
%   {\setlength\paperheight {297mm}%
%    \setlength\paperwidth  {210mm}}
%\DeclareOption{a5paper}
%   {\setlength\paperheight {210mm}%
%    \setlength\paperwidth  {148mm}}
%\DeclareOption{b5paper}
%   {\setlength\paperheight {250mm}%
%    \setlength\paperwidth  {176mm}}
%\DeclareOption{letterpaper}
%   {\setlength\paperheight {11in}%
%    \setlength\paperwidth  {8.5in}}
%\DeclareOption{legalpaper}
%   {\setlength\paperheight {14in}%
%    \setlength\paperwidth  {8.5in}}
%\DeclareOption{executivepaper}
%   {\setlength\paperheight {10.5in}%
%    \setlength\paperwidth  {7.25in}}
%\DeclareOption{landscape}
%   {\setlength\@tempdima   {\paperheight}%
%    \setlength\paperheight {\paperwidth}%
%    \setlength\paperwidth  {\@tempdima}}
%\fi
%\if@compatibility
%  \renewcommand\@ptsize{0}
%\else
%\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
%\fi
%\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
%\DeclareOption{12pt}{\renewcommand\@ptsize{2}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AMS check

% check if the author has AMS Euler fonts installed
% if they have, attempt to use the 'cjeupmath' package to provide upright math

\newif\iffontfound
\newcommand\checkfont[1]{%
  \batchmode
  \font\test=#1\relax
  \errorstopmode
  \fontfoundfalse
  \ifx\test\nullfont \else \fontfoundtrue\fi
}

\AtBeginDocument{%
\ifprodtf\else
  \checkfont{eurm10}
  \iffontfound
    \IfFileExists{cjeupmath.sty}
      {\typeout{^^JFound AMS Euler Roman fonts on the system,
                   using the 'cjeupmath' package.^^J}%
       \usepackage{cjeupmath}}
      {\typeout{^^JFound AMS Euler Roman fonts on the system, but you
                   don't seem to have the}%
       \typeout{'cjeupmath' package installed. cje.cls can take advantage
                 of these fonts,^^Jif you use the 'cjeupmath' package.^^J}%
       \providecommand\mathup[1]{##1}%
       \providecommand\mathbup[1]{##1}%
      }
  \else % no AMS fonts
    \providecommand\mathup[1]{#1}%
    \providecommand\mathbup[1]{#1}%
    \providecommand\upi{\pi}%
    \providecommand\upartial{\partial}%
    \providecommand\ubpartial{\partial}%
    \providecommand\ualpha{\alpha}%
    \providecommand\ubalpha{\alpha}%
    \providecommand\ubeta{\beta}%
    \providecommand\ubbeta{\beta}%
    \providecommand\ugamma{\gamma}%
    \providecommand\ubgamma{\gamma}%
    \providecommand\udelta{\delta}%
    \providecommand\ubdelta{\delta}%
  \fi
\fi

% check if the author has AMS symbol fonts installed
% if they have, attempt to use the 'amssymb' package to provide the AMS symbol characters

\ifprodtf\else
  \checkfont{msam10}
  \iffontfound
    \IfFileExists{amssymb.sty}
      {\typeout{^^JFound AMS Symbol fonts on the system, using the
                'amssymb' package.^^J}%
       \usepackage{amssymb}%
      }{}
  \fi
\fi

% check if the author has the AMS 'amsbsy' package installed
% if they have, use it to provide better bold math support (with \boldsymbol).

\ifprodtf\else
  \IfFileExists{amsbsy.sty}
    {\typeout{^^JFound the 'amsbsy' package on the system, using it.^^J}%
     \usepackage{amsbsy}}
    {\providecommand\boldsymbol[1]{\mbox{\boldmath $##1$}}}
\fi

% bring amsthm.sty into line with CJE style
%
\@ifpackageloaded{amsthm}{%
\providecommand\proof{}
%added
\renewcommand*{\qedsymbol}{\(\blacksquare\)}%
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
% \normalfont \topsep6\p@\@plus6\p@\relax
  \normalfont \topsep0.5\baselineskip \@plus 2\p@ \@minus 1\p@\relax%changed
  \trivlist
  \item[\hskip\labelsep
        \itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

% line space above and below
\def\@thm#1#2#3{%
  \ifhmode\unskip\unskip\par\fi
  \normalfont
  \trivlist
  \let\thmheadnl\relax
  \let\thm@swap\@gobble
  \thm@notefont{\fontseries\mddefault\upshape}%
  \thm@headpunct{.}% add period after heading
  \thm@headsep 5\p@ plus\p@ minus\p@\relax
  \thm@space@setup
  #1% style overrides
    \thm@preskip\baselineskip
    \thm@postskip\thm@preskip
  \@topsep \thm@preskip        % used by thm head
  \@topsepadd \thm@postskip    % used by \@endparenv
  \def\@tempa{#2}\ifx\@empty\@tempa
    \def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
  \else
    \refstepcounter{#2}%
    \def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
  \fi
  \@tempa
}

% and reset:
\def\[{\relax\ifmmode\@badmath\else\topsep 0.5\baselineskip\begin{trivlist}\item[]\leavevmode
  \hbox to\linewidth\bgroup$ \displaystyle \hskip\eqn@indent\bgroup\fi}
\def\]{\relax\ifmmode \egroup $\hfil \egroup \end{trivlist}%
  \else \@badmath \fi}
%
\def\equation{\refstepcounter{equation}\topsep 0.5\baselineskip\trivlist \item[]\leavevmode
  \hbox to\linewidth\bgroup $ \displaystyle \hskip\eqn@indent}
\def\endequation{$\hfil \displaywidth\linewidth\@eqnnum\egroup \endtrivlist}

}{}

%\thm@headfont{\normalfont\bfseries}
 \thm@headfont{\normalfont\scshape}

}

% end of AMS check
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% modify sidewaysfigure to use \fstyle@table

\AtBeginDocument{%
 \def\hline{\noalign{\ifnum0=`}\fi
  \vskip 6pt
%  \hrule \@height \arrayrulewidth
     \if@tablestar
       {\hbox to \textwidth{\hrulefill}}%
     \else
       {\hbox to \textwidth{\hrulefill}}%
     \fi
     \vskip 6pt%
  \futurelet \@tempa\@xhline}
%
  \def\doublehrulefill{\leavevmode\leaders\hrule height 0.8pt\hfill\kern\z@}%
  \def\finalhline{\noalign{\ifnum0=`}\fi%
   \vskip 6pt
%  \hrule \@height \arrayrulewidth
   {\hbox to \textwidth{\doublehrulefill}}
   \vskip 6pt
   \futurelet \@tempa\@xhline}
  \def\sidewaysfigure{\@rotfloat{figure}}%\fstyle@figure}%
  \def\sidewaystable{\@rotfloat{table}%
    \let\@makecaption=\make@table@caption%line added
    \begin{tabular}{l}\finalhline\\[-30pt]%
    \end{tabular}\fstyle@table\setlength\footnotesep{8.5\p@}}%


}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\headsep{24pt}%CJE
\setlength\footskip{22.5pt}%CJE multiple of 9
\setlength\voffset{0pt}
\setlength\hoffset{1pc}

\setlength\textwidth{28pc}%CJE
\setlength\columnsep{6mm}%not used
\setlength\columnseprule{\z@}%not used

\setlength\oddsidemargin{2pc}
\setlength\evensidemargin{2pc}
\setlength\topmargin{2pc}
\setlength\marginparwidth{6pc}
\setlength\marginparsep{0.5pc}

\let\cjemarginpar\marginpar
\renewcommand\marginpar[1]{\cjemarginpar{\raggedright\footnotesize\textbf{#1}}}

\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}

\newif\if@letterp@per
\DeclareOption{letterpaper}{\@letterp@pertrue}

\newif\if@review
\DeclareOption{review}{\@reviewtrue}

\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{twoside,onecolumn,final}%article.cls settings -- letterpaper,10pt,oneside,
\ProcessOptions

\normalsize

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setlength\parindent{12pt}

\setcounter{topnumber}{1}
\renewcommand\topfraction{.9}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.9}
\setcounter{totalnumber}{4}
\renewcommand\textfraction{.05}
\renewcommand\floatpagefraction{.95}
\setcounter{dbltopnumber}{1}
\renewcommand\dbltopfraction{.9}
\renewcommand\dblfloatpagefraction{.9}

       \setlength\floatsep{10.5\p@ \@plus  10.5\p@ \@minus 3\p@}% between stacked floats
   \setlength\textfloatsep{25\p@ \@plus 13\p@ \@minus 8\p@}% between text and float
      \setlength\intextsep{13\p@ \@plus  7\p@ \@minus 2\p@}% above and below float when [h] is used
    \setlength\dblfloatsep{10.5\p@ \@plus  10.5\p@ \@minus 3\p@}% between stacked double-column floats
\setlength\dbltextfloatsep{25\p@ \@plus 13\p@ \@minus 8\p@}% between text and double-column float


% for floats on a separate float page or column:

% one-column mode or single-column floats in two-column mode:
\@fpsep    13pt plus 0.5fil
% centre on page
\@fptop     0pt plus 1fil
\@fpbot     0pt plus 1fil

% double-column floats in two-column mode.
\@dblfptop  0pt plus 0fil
\@dblfpsep 13pt plus 0.5fil
\@dblfpbot  0pt plus 3fil


\newcommand\volume[1]{\gdef\@volume{#1}}
\gdef\@volume{00}

\newcommand\issueno[1]{\gdef\@issueno{#1}}
\gdef\@issueno{0}

\newcommand\articleref[1]{\def\@articleref{#1}}
\edef\@articleref{00000}

\newcommand\dispatch[1]{\def\@dispatch{#1}}
\edef\@dispatch{01.01.20XX}

\newcommand\noofpages[1]{\def\@noofpages{#1}}
\edef\@noofpages{00}

\newcommand\journal[1]{\gdef\@journal{#1}}
\gdef\@journal{Canadian Journal of Economics / \textit{Revue canadienne d'\'economique} \@pubyear~\@volume(\@issueno)}

\newcommand\monthyearen[1]{\gdef\@monthyearen{#1}}
\gdef\@monthyearen{January 20XX}

\newcommand\monthyearfr[1]{\gdef\@monthyearfr{#1}}
\gdef\@monthyearfr{Janvier 20XX}

\newcommand\issn[1]{\gdef\@issn{#1}}
\gdef\@issn{0000-0000}

\newcommand\pubyear[1]{\def\@pubyear{#1}}
\edef\@pubyear{20XX}


\if@letterp@per
  \setlength\textheight{53\baselineskip}% was 59
\else
  \setlength\textheight{43\baselineskip}
\fi
\addtolength\textheight{\topskip}


\if@review
  \setlength\textheight{53\baselineskip}% letterpaper length / was 59
%  \addtolength\textheight{2\topskip}
  \onecolumn
  \usepackage{lineno}% line numbering package
  \linenumbers% use continuous numbering
  %
  % increase all baselineskips by 2
  %
  \renewcommand\small{%
    \@setfontsize\small\@ixpt{20}%\@xpt
    \abovedisplayskip 10\p@ \@plus 10\p@ \@minus 2\p@
    \belowdisplayskip \abovedisplayskip
    \abovedisplayshortskip 6\p@ \@plus 6\p@
    \belowdisplayshortskip \abovedisplayshortskip
  }
  \renewcommand\indexsize{\@setfontsize\indexsize\@viiipt{18}}%\@ixpt}
  \renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt{16}}%\@viiipt}
  \renewcommand\tiny{\@setfontsize\tiny\@vpt{12}}%\@vipt}
  \renewcommand\captionsize{\@setfontsize\captionsize\@viiipt{18}}%fig and table captions (8/9)
  \renewcommand\smaller{\@setfontsize\smaller\@viiipt{18}}%\@xpt}% for entries in tables (8/9)
  \renewcommand\footnotesize{\@setfontsize\footnotesize\@viiipt{18}}%8/9 
  \renewcommand\abstractsize{\@setfontsize\abstractsize\@ixpt{20}}%abstractsize (9/10)
  \renewcommand\sectionsize{\@setfontsize\sectionsize\@xpt{24}}%section heads (10/12)
  \renewcommand\large{\@setfontsize\large\@xiiiptvpt{33}}%{16.5}}%not used
  \renewcommand\Large{\@setfontsize\Large\@xiipt{28}}%new!
  \renewcommand\LARGE{\@setfontsize\LARGE\@xviiipt{48}}%new!
  \renewcommand\huge{\@setfontsize\huge\@xxpt{50}}%{25}}
  \renewcommand\Huge{\@setfontsize\Huge\@xxvpt{60}}%{30}}
  %
  \renewcommand\normalsize{%
    \@setfontsize\normalsize{10pt}{24}%
    \abovedisplayskip 12\p@ \@plus 12\p@ \@minus 2\p@
    \belowdisplayskip \abovedisplayskip
    \abovedisplayshortskip 6\p@ \@plus 6\p@
    \belowdisplayshortskip \abovedisplayshortskip
  }
  %
  \normalsize
\fi

\if@proof
  \usepackage{lineno}% line numbering package
  \linenumbers% use continuous numbering
\fi

\mark{{}{}}

\newcommand\authors[1]{\gdef\@shortauthor{#1}\relax}

\newcommand\authorone[2]{\gdef\@authorone
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authortwo[2]{\gdef\@authortwo
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authorthree[2]{\gdef\@authorthree
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authorfour[2]{\gdef\@authorfour
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authorfive[2]{\gdef\@authorfive
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authorsix[2]{\gdef\@authorsix
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authorseven[2]{\gdef\@authorseven
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authoreight[2]{\gdef\@authoreight
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authornine[2]{\gdef\@authornine
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

\newcommand\authorten[2]{\gdef\@authorten
  {\Large\centering #1\\%
   \normalsize\centering\textit{#2\strut}\\[4pt]}%
}

%------------------

\gdef\@authorone{\mbox{}}
\gdef\@authortwo{\mbox{}}
\gdef\@authorthree{\mbox{}}
\gdef\@authorfour{\mbox{}}
\gdef\@authorfive{\mbox{}}
\gdef\@authorsix{\mbox{}}
\gdef\@authorseven{\mbox{}}
\gdef\@authoreight{\mbox{}}
\gdef\@authornine{\mbox{}}
\gdef\@authorten{\mbox{}}

\newcommand\shortauthor[1]{\gdef\@shortauthor{#1}}
\gdef\@shortauthor{}

\renewcommand\title{\@ifnextchar [{\@titletwo}{\@titleone}}
\def\@titletwo[#1]#2{\gdef\@title{#2}\gdef\@shorttitle{#1}}
\def\@titleone#1{\gdef\@title{#1}\gdef\@shorttitle{#1}}
\gdef\@title{\mbox{}}

\newcommand\shorttitle[1]{\gdef\@shorttitle{#1}}
\gdef\@shorttitle{}

% add catchline to titlepage using 'proof' option
\if@proof
  \def\ps@titlepage{\leftskip\z@\let\@mkboth\@gobbletwo\vfuzz=5\p@
    \def\@oddhead{}%
    \def\@evenhead{}%
    \def\@oddfoot{\vbox to 45pt{\vfill%
      {\footnotesize ISSN:~\@issn~/~\@pubyear~/~pp.\,\pageref{firstpage}--\pageref{lastpage} / 
       \copyright~Canadian Economics Association\hfill\\ \textbf{CAJE / Article ref: \@articleref~/ 
       Dispatch date: \@dispatch~/ No. of pages: \@noofpages}}}}
    \let\@evenfoot\@oddfoot
    \def\sectionmark##1{}%
    \def\subsectionmark##1{}%
  }%
\else
  \def\ps@titlepage{\leftskip\z@\let\@mkboth\@gobbletwo\vfuzz=5\p@
    \def\@oddhead{}%
    \def\@evenhead{}%
    \def\@oddfoot{%
      {\footnotesize ISSN:~\@issn~/~\@pubyear~/~pp.\,\pageref{firstpage}--\pageref{lastpage} / 
       \copyright~Canadian Economics Association\hfill}}
    \let\@evenfoot\@oddfoot
    \def\sectionmark##1{}%
    \def\subsectionmark##1{}%
  }%
\fi

% add catchline to rest of pages using 'proof' option
\if@proof
  \def\ps@headings{\let\@mkboth\markboth
    \def\@oddhead{\normalsize\normalfont{\hfill\itshape\@shorttitle\quad\normalfont\thepage}}%
    \def\@evenhead{\thepage\quad\@shortauthor\hfill}%
    \def\@oddfoot{\hfill\normalfont\footnotesize\@journal}
    \def\@evenfoot{\normalfont\footnotesize\@journal\hfill}%
    \def\sectionmark##1{\markboth{##1}{}}%
    \def\subsectionmark##1{\markright{##1}}%
  }%
\else
  \def\ps@headings{\let\@mkboth\markboth
    \def\@oddhead{\normalsize\normalfont{\hfill\itshape\@shorttitle\quad\normalfont\thepage}}%
    \def\@evenhead{\thepage\quad\@shortauthor\hfill}%
    \def\@oddfoot{\hfill\normalfont\footnotesize\@journal}
    \def\@evenfoot{\normalfont\footnotesize\@journal\hfill}%
    \def\sectionmark##1{\markboth{##1}{}}%
    \def\subsectionmark##1{\markright{##1}}%
  }%
\fi

\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
}

\newcommand\@raggedright{\rightskip=\@flushglue \let\\=\@centercr
  \parindent\z@}
\newcommand\@raggedcenter{\centering\rightskip=\@flushglue
  \let\\=\@centercr}

\def\tabular{\def\@halignto{}
 \def\hline{\noalign{\ifnum0=`}\fi
  \vskip 6pt
%  \hrule \@height \arrayrulewidth
     \if@tablestar
       {\hbox to \textwidth{\hrulefill}}%
     \else
       {\hbox to \textwidth{\hrulefill}}%
     \fi
     \vskip 6pt%
  \futurelet \@tempa\@xhline}
%
% double-thick rule (0.8pt)
\def\doublehrulefill{\leavevmode\leaders\hrule height 0.8pt\hfill\kern\z@}
%
 \def\finalhline{\noalign{\ifnum0=`}\fi
   \vskip 6pt
%  \hrule \@height \arrayrulewidth
   {\hbox to \textwidth{\doublehrulefill}}
  \vskip 6pt
  \futurelet \@tempa\@xhline}
%
 \def\@xhline{\ifx\@tempa\hline
   \vskip -12pt
   \vskip \doublerulesep
  \fi
  \ifnum0=`{\fi}}
  \def\@arrayrule{\@addtopreamble{\hskip -.5\arrayrulewidth
%                                  \vrule \@width \arrayrulewidth
                                  \hskip .5\arrayrulewidth}}
\@tabular
}

% equations, 12pt indent
\newdimen\eqn@indent
\eqn@indent=12pt

\def\[{\relax\ifmmode\@badmath\else\topsep 0.5\baselineskip\begin{trivlist}\item[]\leavevmode
  \hbox to\linewidth\bgroup$ \displaystyle \hskip\eqn@indent\bgroup\fi}
\def\]{\relax\ifmmode \egroup $\hfil \egroup \end{trivlist}%
  \else \@badmath \fi}

\def\equation{\refstepcounter{equation}\topsep 0.5\baselineskip\trivlist \item[]\leavevmode
  \hbox to\linewidth\bgroup $ \displaystyle \hskip\eqn@indent}
\def\endequation{$\hfil \displaywidth\linewidth\@eqnnum\egroup \endtrivlist}


%remove extra space around alignments
\renewcommand\eqnarray{%
  \stepcounter{equation}%
  \def\@currentlabel{\p@equation\theequation}%
  \global\@eqnswtrue
  \m@th
  \global\@eqcnt\z@%Y
  \tabskip\eqn@indent%Y
  \let\\=\@eqncr%Y
  \topsep 0.5\baselineskip
  \abovedisplayskip\topsep\ifvmode\advance\abovedisplayskip\partopsep\fi
  \belowdisplayskip\abovedisplayskip
  \belowdisplayshortskip\abovedisplayskip
  \abovedisplayshortskip\abovedisplayskip
  $$\halign to \linewidth\bgroup
    \@eqnsel\hskip\@centering$\displaystyle\tabskip\z@{##}$
    &\global\@eqcnt\@ne \hskip 0.75\arraycolsep \hfil${\mskip-8mu##\mskip-3mu}$\hfil%space closed around operator
    &\global\@eqcnt\tw@ \hskip 0.75\arraycolsep $\displaystyle{##}$\hfil%space closed around operator
    \tabskip\@centering&\llap{##}\tabskip\z@\cr}
\def\endeqnarray{\@@eqncr\egroup
  \global\advance\c@equation\m@ne$$\global\@ignoretrue}%

% THEOREM
%
% let theorems be handled by amsthm.sty
%
% PROOFs
%
% let proofs be handled by amsthm.sty

\newenvironment{proof*}[1][\proofname]{\par
  \pushQED{}%{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

% this allows proof boxes to be right-aligned in \[ ... \]
\newcommand\equationqed[1]{\hbox to\textwidth{%
  $\displaystyle #1$\hfil\llap{\qedsymbol}\hskip\eqn@indent}}

% this allows proof boxes to be right-aligned in eqnarrays
\newcommand\arrayqed{\arrayqedtrue}
\newcommand\arrayqedhere{\arrayqedfalse}
\newif\ifarrayqed

\def\@@eqncr{\let\reserved@a\relax
    \ifcase\@eqcnt \def\reserved@a{& & &}\or \def\reserved@a{& &}%
     \or \def\reserved@a{&}\else
       \let\reserved@a\@empty
       \@latex@error{Too many columns in eqnarray environment}\@ehc\fi
     \reserved@a
     \if@eqnsw
       \ifarrayqed
         \qedsymbol%
       \else
         \@eqnnum\stepcounter{equation}%
       \fi
    \fi
     \global\@eqnswtrue\global\@eqcnt\z@\cr}
%------------------


\if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\authorone\relax
  \global\let\authortwo\relax
  \global\let\authorthree\relax
  \global\let\authorfour\relax
  \global\let\authorfive\relax
  \global\let\authorsix\relax
  \global\let\authorseven\relax
  \global\let\authoreight\relax
  \global\let\authornine\relax
  \global\let\authorten\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{%\parindent 1em
            \noindent
%            \hb@xt@1.8em{%
%                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
             {\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{titlepage}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
 \newpage
 \null
  \vspace*{-12\p@}%-8
  {\let \footnote \thanks
  \sloppy
  {\raggedright\normalfont\LARGE\@title\par}%
  \vskip 12\p@ \@plus 2\p@ \@minus 1\p@
   {\noindent\@authorone}%
   {\noindent\@authortwo}%
   {\noindent\@authorthree}%
   {\noindent\@authorfour}%
   {\noindent\@authorfive}%
   {\noindent\@authorsix}%
   {\noindent\@authorseven}%
   {\noindent\@authoreight}%
   {\noindent\@authornine}%
   {\noindent\@authorten}%
  \vskip 5\p@ \@plus 2\p@ \@minus 1\p@
  \par}%
 \vskip 8\p@ \@plus 2\p@ \@minus 1\p@
% abstract
  {\abstractsize\rmfamily
    \list{}{\leftmargin0\p@ \rightmargin\leftmargin
      \parsep\z@ \@plus 1\p@ \listparindent\parindent}%
    \item[]{\normalfont\textit{Abstract}.}\enskip\ignorespaces \@abstract\par\ignorespaces}%
    \endlist
    \vspace{10pt}%baselineskip (9/10)
% resume
  {\abstractsize\rmfamily
    \list{}{\leftmargin0\p@ \rightmargin\leftmargin
      \parsep\z@ \@plus 1\p@ \listparindent\parindent}%
    \item[]{\normalfont\textit{R\'esum\'e}.}\enskip\ignorespaces \@resume\par\ignorespaces}%
    \endlist 
    \mbox{}\par
% JEL    
  {\normalsize\rmfamily
    \list{}{\leftmargin0\p@ \rightmargin\leftmargin
      \parsep\z@ \@plus 1\p@ \listparindent\parindent}%
    \item[]{}\ignorespaces\normalfont{JEL classification:}\enskip\ignorespaces\@JEL\par\ignorespaces}%
    \endlist 
   \vskip 30\p@ \@plus 10\p@ \@minus 2\p@
% acknowledgements footer1    
   \footnotetext{\vbox{%
     \footnotesize\rmfamily\list{}{\leftmargin12\p@ \rightmargin0\p@
      \parsep\z@ \@plus 1\p@ \listparindent\parindent}%
    \item[]{}\raggedright\ignorespaces\mbox{}\@acknowledgements\par\ignorespaces}%
    \endlist}%
% printedinCanada footer2, 
  % lines 1 and 2 / scriptsize 7/8?
  %  line 3 / copyright line 9pt (abstractsize)
   \footnotetext{\vbox{\mbox{}\\*[3pt]%
     \normalfont\footnotesize\@journal\\
     \@monthyearen. Printed in Canada / \textit{\@monthyearfr. Imprim\'e au Canada}%\\[10pt]
     }}%
}
\fi

\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname\nobreakspace\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}

\newcommand\section{%
  \@startsection{section}{1}{\z@}%
    {-18pt\@plus -6pt\@minus -3pt}%
    {6pt}%
    {\normalfont\sectionsize\bfseries\@raggedright}}

\newcommand\subsection{%
  \@startsection{subsection}{2}{\z@}%
    {-12pt\@plus -6pt \@minus -3pt}%
    {0.001pt}%
    {\normalfont\sectionsize\bfseries\itshape\@raggedright}}

\newcommand\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}%
    {-12pt\@plus -6pt \@minus -3pt}%
    {0.001pt}%
    {\normalfont\sectionsize\itshape\@raggedright}}

\newcommand\paragraph{%
  \@startsection{paragraph}{4}{\z@}%
    {-12pt\@plus -6pt \@minus -3pt}%
    {0.001pt}%
    {\normalfont\sectionsize\itshape\@raggedright}}

\newcommand\subparagraph{%
  \@startsection{subparagraph}{5}{\z@}%
  {12pt\@plus 6pt \@minus 3pt}%
  {-1em}%
  {\normalfont\sectionsize\itshape}}

\def\@secappcntformat#1{%
  \ifappendix \appendixname
  \ifoneappendix %no 'A'
    \else
    ~\fi
  \fi
  \ifoneappendix\else
    \csname the#1\endcsname\relax
  \fi
  \ifx\apphe@d\@empty 
    \else
    \ifappendix :%
    \else .%
    \fi
  \fi
  \enskip
}

% change format of numbers to match text
% \@sect{1NAME}{2LEVEL}{3INDENT}{4BEFORESKIP}{5AFTERSKIP}{6STYLE}[ARG1]{ARG2}
\def\@sect#1#2#3#4#5#6[#7]#8{% FROM LATEX.LTX
    \ifnum #2=1
      \def\@seccntformat##1{\normalfont\bfseries\csname the##1\endcsname.\enskip }
      \else
        \ifnum #2=2
          \def\@seccntformat##1{\normalfont\bfseries\itshape\csname the##1\endcsname.\enskip }
          \else
            \ifnum #2=3
              \def\@seccntformat##1{\normalfont\itshape\csname the##1\endcsname.\enskip }
              \else
                \def\@seccntformat##1{\normalfont\itshape\csname the##1\endcsname.\enskip }
            \fi
        \fi
    \fi
    \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \ifnum #2>\@ne
      \protected@edef\@svsec{\@seccntformat{#1}\relax}%
    \else
      \def\apphe@d{#8}%
      \protected@edef\@svsec{\@secappcntformat{#1}\relax}%
    \fi
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
    #6{%
       \@hangfrom{\hskip #3\relax\@svsec}%
         \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \ifnum #2=\@ne
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
        \ifappendix \appendixname~\csname the#1\endcsname
        \else \protect\numberline{\csname the#1\endcsname.}#7\fi
        \fi}%
    \else
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname.}#7\fi}%
    \fi
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname.}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\if@twocolumn
  \setlength\leftmargini  {14pt}
\else
  \setlength\leftmargini  {14pt}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\raisebox{1pt}{$\scriptstyle\bullet$}}
\newcommand\labelitemii{\bfseries --}
\newcommand\labelitemiii{$\circ$}
\newcommand\labelitemiv{$\diamond$}

\newcommand\makeitemlabel[1]{\hspace\labelwidth\hspace\labelsep\hfill #1}

% ITEMIZE
%
\def\itemize{\ifnum \@itemdepth >3 \@toodeep \else
  \advance\@itemdepth \@ne
  \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
  \list{\csname\@itemitem\endcsname}%
   {\topsep 0.5\baselineskip plus 3pt%
    \def\makelabel##1{\hss\llap{##1}}}
 \fi
}

% ENUMERATE -- with optional argument to set left margin
% DEFAULT is arabic numbering with full point

\def\makeRRlabel#1{\hss\llap{#1}}

\newbox\@dotbox
\setbox\@dotbox\hbox{.}%
\def\enumerate{\ifnum \@enumdepth >3 \@toodeep \else
  \advance\@enumdepth \@ne
  \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
 \fi
 \@ifnextchar [{\@enumeratetwo}{\@enumerateone}%
}
\def\@enumeratetwo[#1]{%
 \list{\csname label\@enumctr\endcsname}%
  {\settowidth\labelwidth{#1}%
   \topsep 0.5\baselineskip plus 3pt%
   \leftmargin\labelwidth \advance\leftmargin\labelsep
   \usecounter{\@enumctr}%
   \let\makelabel\makeRRlabel}%
}
\def\@enumerateone{%
 \list{\csname label\@enumctr\endcsname}%
  {\usecounter{\@enumctr}%
   \topsep 0.5\baselineskip plus 3pt%
   \leftmargin 0.5em% width of a digit
   \advance\leftmargin\labelsep
   \advance\leftmargin\wd\@dotbox
   \let\makelabel\makeRRlabel}}

\newcommand\usealpha{%
  \renewcommand{\theenumi}{(\alph{enumi})}%
  \renewcommand\labelenumi{\theenumi}%
}  

\newcommand\useroman{%
  \renewcommand{\theenumii}{(\roman{enumii})}%
  \renewcommand\labelenumii{\theenumii}%
}  

\newenvironment{description}
               {\list{}{\topsep=0.5\baselineskip
                        \labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

\newenvironment{rmdescription}
               {\list{}{\topsep=0.5\baselineskip
                        \labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\rmdescriptionlabel}}
               {\endlist}
\newcommand*\rmdescriptionlabel[1]{\hspace\labelsep
                                \normalfont #1}


\newcommand\abstract[1]{\long\gdef\@abstract{#1}}
\gdef\@abstract{}

\newcommand\resume[1]{\long\gdef\@resume{#1}}
\gdef\@resume{}

\newcommand\JEL[1]{\long\gdef\@JEL{#1}}
\gdef\@JEL{}

\newcommand\acknowledgements[1]{\long\gdef\@acknowledgements{#1}}
\gdef\@acknowledgements{}

% FOOTNOTES 8/9
%
\setlength\footnotesep{9\p@}
\setlength{\skip\footins}{18\p@ \@plus 4\p@ \@minus 2\p@}% top of first footnote.

\newskip\@footindent
\@footindent=1em
%
%\renewcommand\footnoterule{\kern-3\p@ \hrule width 0\columnwidth \kern 2.6\p@}
%
% for footnotes (bottom of pages)
\long\def\@makefntext#1{\raggedright\@setpar{\@@par\@tempdima \hsize
 \advance\@tempdima-\@footindent
 \parshape \@ne \@footindent \@tempdima}\par
 \noindent \hbox to \z@{\hss\@thefnmark\enskip}#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MINIPAGE
%

\setlength{\skip\@mpfootins}{0\p@}% top of first minipage footnote.
\def\thempfootnote{\alph{mpfootnote}}
\def\@makempfnmark{\rlap{\hbox{$^{\@thefnmark}$}}}%rlap to stop footnotemark interfering with alignments
%
\long\def\@makempfntext#1{\raggedright\@setpar{\@@par\@tempdima \hsize
 \advance\@tempdima-\@footindent
 \parshape \@ne \@footindent \@tempdima}\par
 \noindent \hbox to \z@{\hss${\@thefnmark}$\enskip}#1}
%
\def\@iiiminipage#1#2[#3]#4{% from latex.ltx
  \leavevmode
  \@pboxswfalse
  \setlength\@tempdima{#4}%
  \def\@mpargs{{#1}{#2}[#3]{#4}}%
  \setbox\@tempboxa\vbox\bgroup
    \color@begingroup
      \hsize\@tempdima
      \textwidth\hsize \columnwidth\hsize
      \@parboxrestore
      \def\@mpfn{mpfootnote}\def\thempfn{\thempfootnote}\c@mpfootnote\z@
      \let\@makefnmark\@makempfnmark 
      \let\@footnotetext\@mpfootnotetext
      \let\@listdepth\@mplistdepth \@mplistdepth\z@
      \@minipagerestore\global\@minipagetrue 
      \everypar{\global\@minipagefalse\everypar{}}}

\long\def\@mpfootnotetext#1{\global\setbox\@mpfootins
 \vbox{\unvbox\@mpfootins
  \footnotesize
  \hsize\columnwidth \@parboxrestore
  \edef\@currentlabel{\csname p@mpfootnote\endcsname\@thefnmark}
  \@makempfntext{\rule{\z@}{\footnotesep}\ignorespaces #1\strut}}}

% NOTES text in tables (always in minipages)
\long\def\tablenote#1{%
  \@footindent\z@\let\@thefnmark\relax
  \global\setbox\@mpfootins
  \vbox{\unvbox\@mpfootins
  \footnotesize
  \hsize\columnwidth \@parboxrestore
  \edef\@currentlabel{\csname p@mpfootnote\endcsname\@thefnmark}
  \@makempfntext{\rule{\z@}{\footnotesep}\ignorespaces #1\strut}}}

\newenvironment{extract}
  {\par\list{}{\abstractsize %9/10
   \topsep\baselineskip
   \listparindent 0pc%
   \leftmargin 1pc%
   \rightmargin\leftmargin
   \parsep\z@\@plus\p@}%
     \item\relax}
  {\endlist}
 
\newenvironment{epigraph}%flush left/right
  {\par\list{}{\abstractsize %9/10
   \topsep\baselineskip
   \listparindent 0pc%
   \leftmargin 0pc%
   \rightmargin\leftmargin
   \parsep\z@\@plus\p@}%
     \item\relax}
  {\endlist}

\newcommand\epigraphauthor[1]{\mbox{}\\[0.5\baselineskip]\mbox{}\hfill --#1}             
                                         
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi

\newif\ifappendix
\newif\ifoneappendix

\newcommand\oneappendix{\global\oneappendixtrue\appendix}

% all numbering in appendices to begin with 'A'
% remove the thin space from equation numbers
\newcommand\appendix{\par
  \setcounter{section}\z@
  \setcounter{equation}\z@
  \setcounter{figure}\z@
  \setcounter{table}\z@
  \ifoneappendix% then we want A1. for subsection/A1.1. for subsubsection
    \renewcommand\thesection{\@arabic\c@section}%
    \renewcommand\thesubsection{A\@arabic\c@subsection}%
    \renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}%
  \else%Appendix A1, Appendix A2, then we want A1 for subsection  --  A1.1 for subsubsection 
    \renewcommand\thesection{A\@arabic\c@section}%
    \renewcommand\thesubsection{A\@arabic\c@section}%
    \renewcommand\thesubsubsection{A\@arabic\c@section.\@arabic\c@subsection}%
  \fi
    \renewcommand\theequation{A\@arabic\c@equation}%
    \renewcommand\thefigure{A\@arabic\c@figure}%
    \renewcommand\thetable{A\@arabic\c@table}%
    \global\appendixtrue
}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
%\skip\@mpfootins = \skip\footins%defined above
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
%\def\fstyle@figure{\normalfont\smaller\rmfamily}

\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}

\def\fstyle@table{\normalfont\smaller\rmfamily}

\newenvironment{table}
  {\let\@makecaption=\make@table@caption\@float{table}\fstyle@table\setlength\footnotesep{8.5\p@}}% \fstyle@table NOT moved to \@xfloat
  {\end@float}
\newenvironment{table*}
               {\@tablestartrue\@dblfloat{table}\fstyle@table}% \fstyle@table NOT moved to \@xdblfloat
               {\end@dblfloat\@tablestarfalse}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\long\def\make@table@caption#1#2{%
 \begin{tabular}{l}\finalhline\end{tabular}
 \raggedright\captionsize\textrm{#1}\\* #2\par
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure captions
\long\def\@makecaption#1#2{\raggedright\captionsize%
  \vskip\abovecaptionskip
   {\normalfont #1}\quad #2\par
    \global \@minipagefalse
    \hb@xt@\hsize{\box\@tempboxa\hfil}%
  \vskip\belowcaptionskip}
  
% to add NOTE to figure captions
\newcommand\figurenote{\protect\\[2pt]}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure

% remove natbib Error
\let\@listi\relax

\newcommand\skiphalfline{\mbox{}\\[-0.5\baselineskip]}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcounter{dummy}

% need to define thebibliography before cjenatbib.sty is called in
\newenvironment{thebibliography}[1]{%
  \par\vskip 20\p@ \@plus 1\p@ \@minus 1\p@
  \section*{References}%
  \nobreak
  \vskip 4\p@ \@plus .5\p@ \@minus .5\p@
  \nobreak
  \list{}{\usecounter{dummy}\labelwidth\z@ \leftmargin 11.5pt\itemindent -11.5pt\itemsep 1\p@}%
  \normalfont\captionsize \parindent\z@
  \parskip\z@ \@plus .1\p@\relax
  \sloppy\clubpenalty\z@ \widowpenalty\@M
  \sfcode`\.\@m\relax
  %\let\citeN\cite \let\shortcite\cite
  %\let\citeasnoun\cite
  }
  {\vspace{\baselineskip}\endlist}

\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}

\def\@fnsymbol#1{\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or
   \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}

\let\footnoterule\relax

\def\thanks#1{\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{#1}}%
}


\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References} %included in natbib
\newcommand\indexname{Index}
\newcommand\figurename{FIGURE}
\newcommand\tablename{TABLE}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{ABSTRACT.}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
%\setlength\columnsep{10\p@}
%\setlength\columnseprule{0\p@}

\widowpenalty=10000 % avoid widows
\clubpenalty=10000  % avoid orphans
\hyphenpenalty=2500 % 10000 almost prevents hyphenation
\pretolerance=3000  % 10000 gives infinite tolerance


\pagestyle{headings}
\pagenumbering{arabic}
\frenchspacing      % suppress extra space after punctuation
\flushbottom
\sloppy

\endinput
