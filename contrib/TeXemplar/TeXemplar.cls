% This file is copyrighted (c) 1999 by Javier Bezos.
% All Rights Reserved.
%
% This program can be redistributed and/or modified under the terms
% of the LaTeX Project Public License Distributed from CTAN
% archives in directory macros/latex/base/lppl.txt; either
% version 1 of the License, or any later version.

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
\ProvidesClass{texanos}[1999/02/20 v0.1]

\newcommand\@ptsize{}

\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse

\DeclareOption{a4paper}
   {\setlength\oddsidemargin {21mm}%
    \setlength\evensidemargin{20mm}%
    \setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\mag1414
    \setlength\oddsidemargin {-1mm}%140mm{-8mm}%
    \setlength\evensidemargin{-1mm}%{-8mm}%
	\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}%
	\setlength\topmargin{-7mm}} %%% -14mm
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}

\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
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

\DeclareOption{quire}{%
  \input quire
  \htotal=148mm \vtotal=210mm
  \horigin=-4mm \vorigin=-4mm
  \shhtotal=296mm
  \shvoffset=-.7in
  \shoutline=0pt
  \shstaplewidth=.2pt
  \shcrop=0pt
  \shfootline{}%
  \latexquire
  \let\supereject\relax
  \quire{4}}
  
\DeclareOption{babel}{%
  \AtEndOfPackage{%
    \RequirePackage[spanishb,activeacute]{babel}%
	\selectspanish}}
  
\ExecuteOptions{a4paper,10pt,twoside,onecolumn,final}
\input{size1\@ptsize.clo}
\ProcessOptions

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

\if@twoside
  \def\ps@headings{%
    \def\@oddfoot{\small\itshape\TeX{}emplares \@issue\hfil}%
	\def\@evenfoot{\small\hfil\itshape\TeX{}emplares \@issue}%
    \def\@evenhead{\small\thepage\hfil\itshape\leftmark}%
    \def\@oddhead{\small{\itshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{}%
    \def\subsectionmark##1{}
	\def\articlemark##1{\markboth{##1}{##1}}}
\else
  \def\ps@headings{%
      \def\@oddfoot{\small\itshape\TeX{}emplares \@issue\hfil}%
      \def\@oddhead{\small{\itshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\sectionmark##1{}%
    \def\subsectionmark##1{}
	\def\articlemark##1{\markright{##1}}}
\fi

\def\ps@myheadings{%
      \def\@oddfoot{\small\itshape\TeX{}emplares \@issue\hfil}%
      \def\@evenfoot{\small\hfil\itshape\TeX{}emplares \@issue}%
      \def\@evenhead{\small\thepage\hfil\itshape\leftmark}%
      \def\@oddhead{\small{\itshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth}
	
\def\@processto#1\@@{\@xproc #1\\@@@\ifx\@address\@empty
    \else \@yproc #1@@@\fi}
\def\@xproc #1\\#2@@@{\def\@author{#1}\def\@address{#2}}
\def\@yproc #1\\#2@@@{\def\@address{\\#2}}

\def\issue#1#2#3{%
  \def\@issue{#1}%
  \setcounter{page}{#2}%
  \def\@frompage{#2}%
  \def\@topage{#3}}
  
\issue{0/0000}{0}{0}

\def\maketitle{%
\expandafter\@processto\@author\@@
{\footnotesize
\parindent\z@
\textit{\TeX emplares} \@issue, p\'ags.\ \@frompage-\@topage\par}%
\vspace*{5pc plus 4pt}%
\begingroup
\parindent\z@
{\LARGE\sffamily\bfseries\@title\par}%
\vspace*{1pc}%
\hrule
\vspace*{6pt}%
  {{\sffamily%
   \raggedleft\@author\footnotesize\itshape\@address\par}%
  \hrule height \z@ depth \z@
  \vspace*{6pt}%
  \hbox to \textwidth{\dotfill}}{}%
% {\usefont{T1}{pag}{m}{n}%
%  \raggedleft\@date\par}\par
\@thanks
\vspace*{2pc}%
\endgroup
\thispagestyle{empty}
\gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\maketitle\relax}

\setcounter {secnumdepth}{1} % No se numeran subsecciones
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart         {\@Roman\c@part}
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{\par
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
       \Large\bfseries \partname~\thepart
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
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-4ex \@plus -1ex \@minus -.1ex}%
                                   {2.3ex \@plus.1ex}%
								   {\normalfont\large\sffamily\bfseries}}
                                 %  {\usefont{T1}{pag}{b}{n}}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                   {-3.25ex\@plus -1ex \@minus -.2ex}%
                                   {.01pt plus .01pt}%
								   {\normalfont\normalsize\sffamily\bfseries}}
                                 %    {\small\usefont{T1}{pag}{b}{n}}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                   {-3.25ex\@plus -1ex \@minus -.2ex}%
                                   {1.5ex \@plus .2ex}%
                                   {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                   {3.25ex \@plus1ex \@minus.2ex}%
                                   {-1em}%
                                   {\usefont{T1}{pag}{b}{n}}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                   {3.25ex \@plus1ex \@minus .2ex}%
                                   {-1em}%
                                   {\normalfont\normalsize\bfseries}}
									  
\if@twocolumn
  \setlength\leftmargini  {1.8em}
\else
  \setlength\leftmargini  {1.8em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {1.75em}
\setlength\leftmarginiii {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {.7em}
  \setlength\leftmarginvi {.7em}
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
\newcommand\labelitemi{---\kern-.5em}
\newcommand\labelitemii{---\kern-.5em}
\newcommand\labelitemiii{---\kern-.5em}
\newcommand\labelitemiv{---\kern-.5em}

\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}

\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
			   
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
			   
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
			   
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

\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand\thesection{\@Alph\c@section}}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\@arabic\c@equation}


\newcounter{figure}
\renewcommand\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

			   
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
			   
			   
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
  
\RequirePackage{t1enc}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\def\rmdefault{ppl}
\def\sfdefault{phv}
\@namedef{ttfamily }{%
  \not@math@alphabet\ttfamily\mathtt
  \fontencoding{OT1}%
  \fontfamily\ttdefault
  \selectfont}

\DeclareFontFamily{T1}{phv}{}

\DeclareFontShape{T1}{phv}{b}{n}{<->s * [.9] phvb8t}{}
\DeclareFontShape{T1}{phv}{b}{sc}{<->s * [.9] phvbc8t}{}
\DeclareFontShape{T1}{phv}{b}{sl}{<->s * [.9] phvbo8t}{}
\DeclareFontShape{T1}{phv}{l}{n}{<->s * [.9] phvl8t}{}
\DeclareFontShape{T1}{phv}{l}{sc}{<->s * [.9] phvlc8t}{}
\DeclareFontShape{T1}{phv}{l}{sl}{<->s * [.9] phvlo8t}{}
\DeclareFontShape{T1}{phv}{m}{n}{<->s * [.9] phvr8t}{}
\DeclareFontShape{T1}{phv}{m}{sc}{<->s * [.9] phvrc8t}{}
\DeclareFontShape{T1}{phv}{m}{sl}{<->s * [.9] phvro8t}{}

\DeclareFontShape{T1}{phv}{bx}{n}{<->ssub * phv/b/n}{}
\DeclareFontShape{T1}{phv}{bx}{sc}{<->ssub * phv/b/sc}{}
\DeclareFontShape{T1}{phv}{bx}{sl}{<->ssub * phv/b/sl}{}
\DeclareFontShape{T1}{phv}{b}{it}{<->ssub * phv/b/sl}{}
\DeclareFontShape{T1}{phv}{bx}{it}{<->ssub * phv/b/it}{}
\DeclareFontShape{T1}{phv}{l}{it}{<->ssub * phv/l/sl}{}
\DeclareFontShape{T1}{phv}{m}{it}{<->ssub * phv/m/sl}{}

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
    \begingroup
      \setlength\@tempdima{3em}%
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
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}


\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure


\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}


\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
	

\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\today{}
\edef\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
  
  
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}


\pagestyle{headings}
\pagenumbering{arabic}
\raggedbottom
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

\textwidth=115mm
\textheight=16.5cm

\parindent1pc

\headsep1.5pc

%\let\oldcaption\caption
%\def\caption#1{\oldcaption{\protect\linestrut[b]{1.5}#1}}
\let\oldtabular\tabular  \let\endoldtabular\endtabular
\def\tabular{\center\oldtabular}
\def\endtabular{\endoldtabular\endcenter}

\def\do{\noexpand\do\noexpand}
\edef\do{\dospecials\do\|}

\def\do@nobreak#1#2#3{%
  \catcode`#3\active
  \begingroup
    \lccode`\~`#3\relax
    \lowercase{\endgroup
	  \def~{\penalty#1\hskip\z@\char`#3\penalty#2\hskip\z@}}}

\begingroup
\catcode`-=13
\gdef\new@verb{\relax\ifmmode\else\leavevmode\hskip\z@\fi
  \bgroup
    \verb@eol@error
	\def\do{\do@nobreak\@M\@M}%
	\dospecials
	\do\~\do\!\do\@\do\*\do\"%
    \do@nobreak\z@\z@\+%
	\do@nobreak\z@\z@\=%
	\do@nobreak\@M\z@\.%
	\do@nobreak\@M\z@\?%
	\do@nobreak\@M\z@\/%
	\do@nobreak\@M\z@\:%
	\do@nobreak\@M\z@\;%
	\do@nobreak\z@\@M\[\do@nobreak\@M\z@\]%
	\do@nobreak\z@\@M\(\do@nobreak\@M\z@\)%
	\do@nobreak\z@\@M\{\do@nobreak\@M\z@\}%
	\@noligs
 	\catcode`\-=\active
 	\def-{\penalty\@M\hskip\z@
	      \discretionary{\char`\-}{\char`\-}{\char`\-}%
 	      \penalty\@M\hskip\z@}%
    \verbatim@font
	\hyphenchar\font=`\-\relax
	\righthyphenmin=\z@\relax\lefthyphenmin=\z@\relax
    \@ifstar\@sverb\@verb}
\endgroup

\catcode`|=\active
\def|{\new@verb|}

% Este estilo usa una variante de verbatim que simula por completo
% el funcionamiento del resto de los entornos. Al contrario que
% la forma de \LaTeX{} se puede separar \end de {verbatim} incluso
% en dos lineas
% \begin{verbatim}
% \end
% {verbatim}
% \end{verbatim}
% y adem'as no se lee todo el texto literal antes de componerlo, lo que en 
% sistemas peque–os podr’a causar problemas, sino que se va componiendo
% segœn se lee. Al contrario que el paquete verbatim, el texto que sigue a
% \end{verbatim} no se elimina.

\begingroup
\catcode`\ =12\global\let\verb@space= %
\endgroup

\begingroup
\catcode`\/=0
\catcode`\\=13
/catcode`/^^M=13/relax%
/gdef/verb@eol@char{^^M}%
/gdef/@xverbatim{%
  /def/verb@get@ii##1##2##3##4##5##6##7##8{%
      /verb@get@iii{##1##2##3##4##5##6##7##8}}%
  /edef/verb@string{/string{verbatim/string}}}%
/gdef/@sxverbatim{%
  /let/@xobeysp=/verb@space%
  /def/verb@get@ii##1##2##3##4##5##6##7##8##9{%
      /verb@get@iii{##1##2##3##4##5##6##7##8##9}}%
  /edef/verb@string{/string{verbatim*/string}}}%
/gdef/verb@activate{/catcode`/\=/active/let\=/verb@test@cmd}%
/endgroup

\def\verb@test@cmd#1{%
  \@ifundefined{verb@cmd@\string#1}{%
    \verb@test@end{#1}%
  }{%
    \csname verb@cmd@\string#1\endcsname}}%

\def\verb@test@end#1#2#3{%
  \def\@tempa{end}\def\@tempb{#1#2#3}%
  \ifx\@tempa\@tempb
    \expandafter\verb@get@i
  \else
    \expandafter\@gobble\string\\\expandafter\@tempb
  \fi}

\def\verb@get@i#1{%
  \ifx#1\@xobeysp
    \expandafter\def\expandafter\verb@sofar\expandafter
	   {\verb@sofar\@xobeysp}%
	\def\next{\verb@get@i}%
  \else\expandafter\ifx\verb@eol@char#1%
    \expandafter\def\expandafter\verb@sofar\expandafter
	   {\verb@sofar\verb@eol@char}%
	\def\next{\verb@get@i}%
  \else
    \def\next{\verb@get@ii#1}%
  \fi\fi\next}
  
\def\verb@get@ii#1#2#3#4#5#6#7#8{\verb@get@iii{#1#2#3#4#5#6#7#8}}
\def\verb@get@iii#1#2#3{%
  \def\@tempa{#1#2#3}%
  \ifx\@tempa\verb@string
    \expandafter\end\expandafter{\@currenvir}%
  \else
    \string\end\verb@sofar\def\verb@sofar{}\expandafter\@tempa
  \fi}
  
\let\verb@tokill\@empty
  
\def\restartverb{%
  \begingroup
  \def\@xobeysp{%
    \ifvmode
	  \edef\verb@tokill{\verb@tokill\nobreakspace}%
	\else
	  \nobreakspace
	\fi}%
  \def\par{%
    \if@tempswa
	  \everypar{\verb@tokill\let\verb@tokill\@empty}%
	  \leavevmode\null\@@par
      \penalty\interlinepenalty
	\else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \let\do\@makeother
  \dospecials
  \def\verb@sofar{}%
  \verb@activate
  \obeylines
  \@noligs}
  
\let\stopverb\endgroup

\def\verbcommand#1{%
  \expandafter\def\csname verb@cmd@\string#1\endcsname}

\def\@verbatim{%
  \trivlist
  \item\relax
  \if@minipage\else\vskip\parskip\fi
  \advance\@totalleftmargin1pc
  \leftskip\@totalleftmargin
  \rightskip\z@skip
  \parindent\z@
  \parfillskip\@flushglue
  \parskip\z@skip
  \catcode`|=11
  \verbatim@font 
  \ifx\@currsize\normalsize
     \small
  \fi
  \@@par
  \@tempswafalse
  \everypar\expandafter{\the\everypar\unpenalty
	  \verb@tokill\let\verb@tokill\@empty}%
  \restartverb}
  
\def\endverbatim{\stopverb\if@newlist \leavevmode\fi\endtrivlist}
\expandafter\let\csname endverbatim*\endcsname =\endverbatim


\def\bibTeX{\textsc{bib}\TeX}
\def\BibTeX{\textsc{Bib}\TeX}

\endinput


\usepackage[spanishb,activeacute]{babel}
%\usepackage{titlesec}

