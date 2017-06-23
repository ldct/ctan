% Copyright (C) 2016 by Paul Gaborit
%
% Tis file may be distributed and/or modified
%
% 1. under the LaTeX Project Public License and/or
% 2. under the GNU Public License.
%
\RequirePackage{etex}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\def\iscram@version{v1.0.2}
\def\iscram@date{2016/11/29}
\ProvidesClass{iscram}[\iscram@date\space\iscram@version\space ISCRAM document class]

% pgfkeys interface
\RequirePackage{etoolbox}
\RequirePackage{pgfopts}

\def\iscram@keys@prefix{/iscram}
\def\iscramset#1{\pgfqkeys{\iscram@keys@prefix}{#1}}

\newbool{iscram@anonymous@version}
\newbool{iscram@first@alone}
\newbool{iscram@draft}
\iscramset{
  .unknown/.code={
    \ClassWarningNoLine{iscram}{unknown option [\pgfkeyscurrentname]}
  },
  anonymous/.is if=iscram@anonymous@version,
  firstalone/.is if=iscram@first@alone,
  author/.code={
    \numdef\@numauthor{\@numauthor+1}
    \iscramset{
      author/.cd,
      short name/.code={\csdef{@shortauthor-\@numauthor}{##1}},
      full name/.code={%
        \csdef{@author-\@numauthor}{##1}%
        \ifcsdef{@shortauthor-\@numauthor}{}{\csdef{@shortauthor-\@numauthor}{##1}}%
      },
      affiliation/.code={\csdef{@affiliation-\@numauthor}{##1}},
    }
    \iscramset{author/.cd,#1}
  },
  % footer lines
  footer/line 1/.store in=\iscram@footer@linei,
  footer/line 2/.store in=\iscram@footer@lineii,
  footer/line 3/.store in=\iscram@footer@lineiii,
  % default values
  footer/line 1={\emph{<WiPe or CoRe>} Paper -- \emph{<Track Name>}},
  footer/line 2={Proceedings of the \emph{<n>}th ISCRAM Conference -- \emph{<Town>}, \emph{<Country>}, \emph{<Date>}},
  footer/line 3={\emph{<Editors>}},
  % title and short title
  title/.store in=\iscram@title,
  short title/.store in=\iscram@shorttitle,
  shorttitle/.style={short title={#1}},
  % draft mode
  draft/.is if=iscram@draft,
}

% 2017 default values (footer)
\iscramset{
  iscram 2017 footer/.style={
    footer/line 2={Proceedings of the 14th ISCRAM Conference -- Albi, France, May 2017},
    footer/line 3={Tina Comes, Fr{\'e}d{\'e}rick B{\'e}naben, Chihab Hanachi, Matthieu Lauras, eds.},
  },
  WiPe Paper 2017/.style={
    iscram 2017 footer,
    footer/line 1={WiPe Paper -- #1},
  },
  WiPePaper2017/.style={WiPe Paper 2017=#1},
  CoRe Paper 2017/.style={
    iscram 2017 footer,
    footer/line 1={CoRe Paper -- #1},
  },
}

% Process all options and load article class
\ProcessPgfOptions{\iscram@keys@prefix}
\let\@classoptionslist\relax
\PassOptionsToClass{\ifbool{iscram@draft}{draft}{final}}{article}
\PassOptionsToClass{10pt,a4paper}{article}
\LoadClass{article}[2014/09/29]

% Page layout
\RequirePackage[a4paper,margin=1in,
headheight=10bp,headsep=\dimexpr.5in-10bp\relax,
%footheight=\dimexpr3*11bp\relax,
footskip=\dimexpr1in-1cm\relax,
marginparsep=3mm,marginparwidth=\dimexpr 1in-6mm\relax]{geometry}
\RequirePackage{microtype}

% Fonts
%\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}

% Headings
\RequirePackage[pagestyles]{titlesec}

\setcounter{secnumdepth}{0}

\titlespacing{\section}{0pt}{*2}{*.3}
\titleformat{\section}[block]{}{}{0pt}{\sffamily\bfseries\fontsize{10bp}{12bp}\selectfont\MakeUppercase}[]

\titlespacing{\subsection}{0pt}{*2}{*.3}
\titleformat{\subsection}[block]{}{}{0pt}{\sffamily\bfseries\fontsize{10bp}{12bp}\selectfont}[]

\titlespacing{\subsubsection}{0pt}{*1}{*.3}
\titleformat{\subsubsection}[block]{}{}{0pt}{\sffamily\itshape\fontsize{10bp}{12bp}\selectfont}[]

% Header and footer
\def\iscram@left@header{%
  \itshape\fontsize{9bp}{11bp}\selectfont%
  \ifbool{iscram@anonymous@version}{%
    Anonymous version%
  }{%
    \ifcsdef{@shortauthor-1}{\csuse{@shortauthor-1}}{\csuse{@author-1}}%
    \ifcsdef{@author-2}{ et al.}{}%
  }%
}
\def\iscram@right@header{%
  \itshape\fontsize{9bp}{11bp}\selectfont%
  \ifdef{\iscram@shorttitle}{\iscram@shorttitle}{\ifdef{\iscram@title}{\iscram@title}{}}%
}
\def\iscram@footer{%
  \parbox[b][0bp][b]{1.0\linewidth}{
    \centering\itshape\small
    \iscram@footer@linei\\
    \iscram@footer@lineii\\
    \iscram@footer@lineiii%
  }%
}
\def\iscram@headerandfooter{
  \sethead*{\iscram@left@header}{}{\iscram@right@header}
  \setfoot*{}{\iscram@footer}{}
}
\newpagestyle{iscram}[]{\iscram@headerandfooter}
\renewpagestyle{plain}[]{\iscram@headerandfooter}

\pagestyle{iscram}


% Paragraphs
\setlength{\parindent}{0pt}
\setlength{\parskip}{.5\baselineskip plus .3\baselineskip minus .2\baselineskip}

% Title and authors
\let\titleorig\title
\renewcommand\title[1]{\def\iscram@title{#1}\titleorig{#1}}
\def\@maketitle{%
  \ifdef{\iscram@title}{%
    \vspace*{\dimexpr24bp-28bp}%
    {\centering\fontsize{26.666bp}{28bp}\selectfont\sffamily\bfseries\iscram@title\par}%
    \vspace*{28bp}%
    {\centering\fontsize{20.666bp}{22bp}\selectfont\iscram@insert@authors@and@affiliations\par}%
  }{%
    \ClassWarningNoLine{iscram}{(\string\maketitle) unknown title!}
  }%
}

% Figures and tables : captions and rules (via booktabs)
\RequirePackage{float}
\RequirePackage{caption}
\captionsetup{margin=10pt,font={bf,small},labelsep=period}
\RequirePackage{booktabs}

% Bibliography
\RequirePackage[
  url=false,doi=false,isbn=false,
  style=authoryear,
  maxbibnames=10,minbibnames=10,
  maxcitenames=2,mincitenames=1,
  giveninits=true,
  uniquename=init,
  dashed=false,
]{biblatex}
\DeclareNameAlias{sortname}{last-first}
\AtEveryBibitem{\clearfield{note}}
\defbibheading{bibliography}[References]{\section{#1}}
\setlength\bibitemsep{1ex}

% Authors and affiliations
\numdef\@numauthor{0}

\def\iscram@author@box#1#2{% name, affiliation and e-mail
  \begin{minipage}[t]{.48\linewidth}
    \centering\rmfamily
    {\fontsize{16bp}{19bp}\selectfont\bfseries#1\par}
    {\fontsize{12bp}{15bp}\selectfont#2\par}
  \end{minipage}%
}

\def\iscram@author@box@by@num#1{%
  \iscram@author@box{\csuse{@author-#1}}{\csuse{@affiliation-#1}}%
}

\def\iscram@two@authors@line@by@num#1#2{%
  \iscram@author@box@by@num{#1}\hfill\iscram@author@box@by@num{#2}\par%
  \vspace{3mm}%
}

\def\iscram@one@authors@line@by@num#1{%
  {\centering\iscram@author@box@by@num{#1}\par}%
  \vspace{3mm}%
}

\def\iscram@@insert@authors@and@affiliations{%
  \numdef\@numauthor{\@numauthor+1}%
  \numdef\@nextnumauthor{\@numauthor+1}%
  \ifcsdef{@author-\@nextnumauthor}{%
    \iscram@two@authors@line@by@num{\@numauthor}{\@nextnumauthor}%
    \numdef\@numauthor{\@nextnumauthor}
    \expandafter\iscram@@insert@authors@and@affiliations%
  }{
    \ifcsdef{@author-\@numauthor}{%
      \iscram@one@authors@line@by@num{\@numauthor}%
      \numdef\@numauthor{\@nextnumauthor}%
    }{}%
  }
}

\def\iscram@insert@authors@and@affiliations{
  \ifbool{iscram@anonymous@version}%
  {\iscram@author@box{Anonymous version}{\null}}%
  {%
    \ifbool{iscram@first@alone}{%
      \iscram@one@authors@line@by@num{1}%
      \numdef\@numauthor{1}%
    }{%
      \numdef\@numauthor{0}%
    }
    \iscram@@insert@authors@and@affiliations%
  }%
}

% No widow
\RequirePackage[all]{nowidow}

% Abstract and keywords
\renewcommand\abstract[1]{\section{Abstract} #1}
\newcommand\keywords[1]{\subsection{Keywords} #1}

% Full page
\flushbottom

% URL and links
\RequirePackage{url}
\RequirePackage{xcolor}
\colorlet{iscram links}{blue!50!black}
\RequirePackage[colorlinks,linkcolor={iscram links},citecolor={iscram links},
filecolor={iscram links},urlcolor={iscram links}]{hyperref}

