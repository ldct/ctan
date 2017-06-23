% This class file is provided 'as is' in the event that someone
% wants to compile the documentation that comes with my packages.
% It is not intended for any other purpose, although you may freely
% copy the code here to another file and modify it for your own purposes.
% There's no guarantee that it will work with other packages.
%
%  Copyright 2017 Nicola Talbot
% 
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license of (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nlctdoc}[2017/05/13 v1.06 (NLCT)]
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
% tex4ht stopped working with koma during TL2013.
% Use pdflatex with koma for the pdf version
% and latex with one of the base classes for the html 
% version to circumvent this.
\ifpdf
  \newcommand{\@nlctdoc@if@usingtexht}[2]{#2}
\else
  \ifxetex
   \newcommand{\@nlctdoc@if@usingtexht}[2]{#2}
  \else
   \newcommand{\@nlctdoc@if@usingtexht}[2]{#1}
  \fi
\fi

\@nlctdoc@if@usingtexht
{
  \def\@nlctdoc@class{article}%
}
{
  \def\@nlctdoc@class{scrartcl}%
}
\DeclareOption{article}{%
  \@nlctdoc@if@usingtexht
  {%
    \def\@nlctdoc@class{article}%
  }%
  {%
    \def\@nlctdoc@class{scrartcl}%
  }%
}
\DeclareOption{book}{%
  \@nlctdoc@if@usingtexht
  {%
    \def\@nlctdoc@class{book}%
  }%
  {%
    \def\@nlctdoc@class{scrbook}%
  }%
}
\DeclareOption{report}{%
  \@nlctdoc@if@usingtexht
  {%
    \def\@nlctdoc@class{report}%
  }%
  {%
    \def\@nlctdoc@class{scrreprt}%
  }%
}
\DeclareOption{a5paper}{\@latexerr{Option not supported}%
   {}}

\newcommand*{\nlct@setupmargin}{}
\DeclareOption{normalmp}{%
  \renewcommand*{\nlct@setupmargin}{%
    \normalmarginpar
    \renewcommand*{\nlctdocmarginfmt}{\raggedright}%
  }%
}

\newif\ifnlctdocinlinetitle
\nlctdocinlinetitlefalse
\DeclareOption{inlinetitle}{\nlctdocinlinetitletrue}
\newif\ifwidecs
\widecsfalse
\DeclareOption{widecs}{\widecstrue}
\DeclareOption*{%
    \PassOptionsToClass  {\CurrentOption}{\@nlctdoc@class}}
\ProcessOptions
\@nlctdoc@if@usingtexht
{%
  \LoadClass{\@nlctdoc@class}
}%
{%
  \ifnlctdocinlinetitle
    \LoadClass[captions=tableheading,abstract=true,titlepage=false]{\@nlctdoc@class}
  \else
    \LoadClass[captions=tableheading,abstract=true]{\@nlctdoc@class}
  \fi
}%
\RequirePackage{xcolor}
\ifxetex
\else
 \RequirePackage[utf8]{inputenc}
\fi
\@nlctdoc@if@usingtexht
{%
  \RequirePackage[xhtml,fn-in,css-in,uni-html4,utf8]{tex4ht}
}%
{%
  \ifxetex
  \else
    \RequirePackage[T1]{fontenc}
    \RequirePackage{cmap}
  \fi
  \RequirePackage{fourier}
}%
\RequirePackage{etoolbox}
\RequirePackage{doc,dox}
\RequirePackage{upquote}

% doc.sty interferes with upquote.sty so patch it
\def\@verbatim{\trivlist \item[]\if@minipage\else\vskip\parskip\fi
      \leftskip\@totalleftmargin\rightskip\z@
      \parindent\z@\parfillskip\@flushglue\parskip\z@
      \@@par
      \@tempswafalse
 \def\par{\if@tempswa\hbox{}\fi\@tempswatrue\@@par
          \penalty\interlinepenalty
   \check@percent}%
 \obeylines
 \@noligs
 \let\do\@makeother \dospecials}

\newcommand*{\nlctdocmarginfmt}{\raggedleft}
\nlct@setupmargin

\def\@@doxdescribe#1#2{%
    \endgroup%
    \ifdox@noprint\else%
      \marginpar{\nlctdocmarginfmt\@nameuse{PrintDescribe#1}{#2}}%
    \fi%
    \ifdox@noindex\else%
      \@nameuse{Special#1Index}{#2}%
    \fi%
    \endgroup%
\@esphack\ignorespaces}


\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}

\providecommand\marg[1]{%
  \allowbreak{\ttfamily\char`\{}\meta{#1}{\ttfamily\char`\}}}
\providecommand\oarg[1]{%
  \allowbreak{\ttfamily[}\meta{#1}{\ttfamily]}}
\providecommand\parg[1]{%
  \allowbreak{\ttfamily(}\meta{#1}{\ttfamily)}}

\def\PrintChanges{\@input@{\jobname.gls}%
                  \global\let\PrintChanges\@empty}

\let\RecordChanges\makeglossary

\def\main#1{\underline{\hyperpage{#1}}}
\def\usage#1{\textit{\hyperpage{#1}}}

\def\SortIndex#1#2{\index{#1\actualchar#2\encapchar hyperpage}}

\newcommand*{\SpecialPageIndex}[1]{\@bsphack
  \index{#1\encapchar hyperpage}\@esphack}

\renewcommand*\PageIndex{\makeindex
               \codeline@indexfalse
               \let\special@index\SpecialPageIndex}


\ifdef\chapter
{
 \renewcommand*\glossary@prologue{%
   \chapter*{{Change History}}%
     \markboth{{Change History}}{{Change History}}%
     \addcontentsline{toc}{chapter}{Change History}%
     \raggedright\sloppy
   }

  \def\index@prologue{\chapter*{Index}%
                 \markboth{Index}{Index}%
                 \addcontentsline{toc}{chapter}{Index}%
                 Numbers written in italic refer to the page
                 where the corresponding entry is described;
                 numbers underlined refer to the
                 \ifcodeline@index
                   code line of the
                 \fi
                 definition; numbers in roman refer to the
                 \ifcodeline@index
                   code lines
                 \else
                   pages
                 \fi
                 where the entry is used.
                 }

}
{
 \renewcommand*\glossary@prologue{%
   \section*{{Change History}}%
     \markboth{{Change History}}{{Change History}}%
     \addcontentsline{toc}{section}{Change History}%
     \raggedright\sloppy
   }

  \def\index@prologue{\section*{Index}%
                 \markboth{Index}{Index}%
                 \addcontentsline{toc}{section}{Index}%
                 Numbers written in italic refer to the page
                 where the corresponding entry is described;
                 numbers underlined refer to the
                 \ifcodeline@index
                   code line of the
                 \fi
                 definition; numbers in roman refer to the
                 \ifcodeline@index
                   code lines
                 \else
                   pages
                 \fi
                 where the entry is used.
                 }
}

\ifwidecs
\else
  \setlength\marginparwidth{8pc}
\fi

\renewcommand*{\changes@}[3]{%
  \protected@edef\@tempa{\noexpand\glossary{#1 (#2)\levelchar
                                 \ifx\saved@macroname\@empty
                                   \space
                                   \actualchar
                                   \generalname
                                 \else
                                   \expandafter\@gobble
                                   \saved@macroname
                                   \actualchar
                                   \string\verb\quotechar*%
                                   \verbatimchar\saved@macroname
                                   \verbatimchar
                                 \fi
                                 :\levelchar #3}}%
  \@tempa\endgroup\@esphack}

\newcommand{\see}[2]{\emph{see} #1}

\RecordChanges
\PageIndex
\CodelineNumbered

\newcommand{\importantsymbol}{\bfseries\Huge\danger}

\newcommand\Describe@Wide@Macro[1]{%
 \endgroup
  \marginpar{\raggedright\hbox to\marginparwidth{\PrintDescribeMacro{#1}}\par}%
  \SpecialUsageIndex{#1}\@esphack
  \ignorespaces
}

\newlength\macrowidth

\@nlctdoc@if@usingtexht
{%
  \newenvironment{definition}[1][]{%
    \par\HCode{<hr><div title="Definition">}#1\ttfamily\noindent
  }{%
    \HCode{</div><hr>}\par\noindent
  }

  \newcommand{\importantpar}[1][-3]{\importantsymbol\space}

  \newenvironment{important}{%
    \par\HCode{<div class="important" title="Important Note">}\noindent
  }{%
    \HCode{</div>}\par\noindent
  }

  \newenvironment{prompt}{%
    \HCode{<spacer type=vertical size=10>}\begin{ttfamily}\obeylines\ignorespaces
  }{%
    \end{ttfamily}\HCode{<spacer type=vertical size=10>}\noindent
  }

  \newenvironment{display}{%
    \HCode{<spacer type=vertical size=10>}\obeylines\ignorespaces
  }{%
    \HCode{<spacer type=vertical size=10>}\noindent
  }

  \newenvironment{labelledbox}[1]{%
    \par\HCode{<hr><div>}\marginpar{#1}\noindent
  }{%
    \HCode{</div><hr>}\par\noindent
  }
}%
{%
  \definecolor{defbackground}{rgb}{1,1,0.75}
  \newsavebox\defsbox
  \newlength\defwidth
  \newenvironment{definition}[1][]{%
    \def\defarg{#1}%
    \setlength{\fboxsep}{4pt}\setlength{\fboxrule}{1.25pt}%
    \begin{lrbox}{\defsbox}%
      \setlength\defwidth\linewidth
      \addtolength\defwidth{-2\fboxrule}%
      \addtolength\defwidth{-2\fboxsep}%
      \begin{minipage}{\defwidth}\flushleft\ttfamily
  }{%
      \end{minipage}
    \end{lrbox}%
    \vskip10pt
    \noindent
    \ifwidecs
     \let\Describe@Macro\Describe@Wide@Macro
      \defarg
      \nopagebreak\mbox{}\nopagebreak
       \par\nopagebreak\vspace{0.5ex plus 0.25ex minus 0.1ex}\nopagebreak\noindent
    \else
      \defarg
    \fi
    \fcolorbox{black}{defbackground}{\usebox\defsbox}%
    \vskip10pt
    \noindent
    \ignorespacesafterend
  }

  \newlength\tmpwidth
  \newlength\tmpheight

  \newcommand{\importantpar}[1][-3]{%
    \settoheight{\tmpheight}{\importantsymbol}%
    \settowidth{\tmpwidth}{\importantsymbol}%
    \advance\tmpwidth by .5em\relax
    \par\noindent
    \hangindent=\tmpwidth
    \hangafter=#1\relax
    \makebox[0pt][l]{\hspace*{-\tmpwidth}%
      \smash{\raisebox{-\tmpheight}{\importantsymbol}}%
    }%
  }

  \newenvironment{important}{%
    \setlength{\fboxrule}{4pt}%
    \setlength\defwidth{\linewidth}%
    \addtolength\defwidth{-2\fboxsep}%
    \addtolength\defwidth{-2\fboxrule}%
    \begin{lrbox}{\defsbox}%
      \begin{minipage}{\defwidth}%
      \raggedright
      \setlength\parindent{1em}%
      \noindent\ignorespaces
  }{%
      \end{minipage}%
    \end{lrbox}%
    \par\vskip10pt\noindent
    \fcolorbox{red}{white}{\usebox{\defsbox}}\par\vskip10pt
    \noindent\ignorespacesafterend
  }

  \newenvironment{prompt}{%
    \par\vskip\baselineskip
    \begin{ttfamily}\obeylines\noindent\ignorespaces
  }{%
    \end{ttfamily}%
    \par\vskip\baselineskip
    \noindent\ignorespacesafterend
  }

  \newenvironment{display}{%
    \par\vskip\baselineskip\noindent
    \obeylines\ignorespaces
  }{%
    \par
    \vskip\baselineskip
    \noindent\ignorespacesafterend
  }

  \newenvironment{labelledbox}[1]{%
    \def\defarg{#1}%
    \setlength{\fboxsep}{4pt}\setlength{\fboxrule}{1.25pt}%
    \begin{lrbox}{\defsbox}%
      \setlength\defwidth\linewidth
      \addtolength\defwidth{-2\fboxrule}%
      \addtolength\defwidth{-2\fboxsep}%
      \begin{minipage}{\defwidth}\flushleft
  }{%
      \end{minipage}
    \end{lrbox}%
    \vskip10pt
    \noindent
    \begin{tabular}{@{}r@{}}%
      \fbox{\usebox\defsbox}\\[4pt]
      \footnotesize\mbox{\defarg}%
    \end{tabular}
    \vskip10pt
    \noindent
    \ignorespacesafterend
  }
}%

\newcommand*{\appfmt}[1]{\texttt{#1}}
\DeclareRobustCommand*{\iapp}[1]{\index{#1=\appfmt{#1}\encapchar hyperpage}}
\DeclareRobustCommand*{\app}[1]{\appfmt{#1}\iapp{#1}}

\newcommand*{\qt}[1]{``#1''}

\DeclareRobustCommand*{\termdef}[1]{\emph{#1}\iterm{#1}}
\DeclareRobustCommand*{\term}[1]{#1\iterm{#1}}
\DeclareRobustCommand*{\iterm}[1]{\index{#1|main}}
\newcommand*{\tableref}[1]{\hyperref[#1]{table~\ref*{#1}}}
\newcommand*{\Tableref}[1]{\hyperref[#1]{Table~\ref*{#1}}}

\newcommand*{\ics}[1]{\cs{#1}\SpecialMainIndex{#1}}

\newcommand*{\icsopt}[2]{\index{#1 options\actualchar\cs{#1} options\levelchar#2\actualchar\textsf{#2}\encapchar hyperpage}}

\newcommand*{\csopt}[2]{%
  \textsf{#2}%
  \@for\@thiscmd:=#1\do{%
    \icsopt{\@thiscmd}{#2}%
  }%
}

\newcommand*{\pkgoptfmt}[1]{\textsf{#1}}

% \ipkgopt[value]{option}
\newcommand*{\ipkgopt}[2][]{%
  \def\@argi{#1}%
  \ifx\@argi\@empty
    \index{package options:>#2=\pkgoptfmt{#2}|main}%
  \else
    \index{package options:>#2=\pkgoptfmt{#2}>#1=\pkgoptfmt{#1}|main}%
\fi
}

\newcommand*{\pkgopt}[2][]{%
  \def\@argi{#1}%
  \ifx\@argi\@empty
    \pkgoptfmt{#2}\index{package options:>#2=\pkgoptfmt{#2}|main}%
  \else
    \pkgoptfmt{#2=#1}%
    \index{package options:>#2=\pkgoptfmt{#2}>#1=\pkgoptfmt{#1}|main}%
\fi
}

% \pkgoptval{value}{option}
\newcommand*{\pkgoptval}[2]{%
  \pkgoptfmt{#1}%
  \index{package options:>#2=\pkgoptfmt{#2}>#1=\pkgoptfmt{#1}|main}%
}

\newcommand*{\clsoptfmt}[1]{\textsf{#1}}

% \iclsopt[value]{option}
\newcommand*{\iclsopt}[2][]{%
  \def\@argi{#1}%
  \ifx\@argi\@empty
    \index{class options:>#2=\clsoptfmt{#2}|main}%
  \else
    \index{class options:>#2=\clsoptfmt{#2}>#1=\clsoptfmt{#1}|main}%
\fi
}

\newcommand*{\clsopt}[2][]{%
  \def\@argi{#1}%
  \ifx\@argi\@empty
    \clsoptfmt{#2}\index{class options:>#2=\clsoptfmt{#2}|main}%
  \else
    \clsoptfmt{#2=#1}%
    \index{class options:>#2=\clsoptfmt{#2}>#1=\clsoptfmt{#1}|main}%
\fi
}

% \clsoptval{value}{option}
\newcommand*{\clsoptval}[2]{%
  \clsoptfmt{#1}%
  \index{class options:>#2=\clsoptfmt{#2}>#1=\clsoptfmt{#1}|main}%
}

\newcommand*{\filetypefmt}[1]{\texttt{#1}}
\newcommand*{\ifiletype}[1]{\index{file
  types>#1=\filetypefmt{#1}|hyperpage}}

\newcommand*{\filetype}[1]{\filetypefmt{#1}\ifiletype{#1}}

\newcommand*{\styfmt}[1]{\textsf{#1}}

\newcommand*{\isty}[1]{\index{#1 package=\styfmt{#1}
  package|hyperpage}}
\newcommand*{\sty}[1]{\styfmt{#1}\isty{#1}}

\newcommand*{\clsfmt}[1]{\textsf{#1}}

\newcommand*{\icls}[1]{\index{#1 class=\clsfmt{#1} class|hyperpage}}
\newcommand*{\cls}[1]{\clsfmt{#1}\icls{#1}}

\newcommand*{\envfmt}[1]{\textsf{#1}}
\newcommand*{\ienv}[1]{\SpecialMainEnvIndex{#1}}
\newcommand*{\env}[1]{\envfmt{#1}\ienv{#1}}

\newcommand*{\ctrfmt}[1]{\textsf{#1}}
\newcommand*{\ictr}[1]{\index{#1={\protect\ttfamily#1} (counter)|hyperpage}}
\newcommand*{\ctr}[1]{\ctrfmt{#1}\ictr{#1}}

\newcommand*{\boolfmt}[1]{\textsf{#1}}
\newcommand*{\ibool}[1]{\index{#1={\ttfamily#1} (boolean variable)|hyperpage}}
\newcommand*{\bool}[1]{\boolfmt{#1}\ibool{#1}}

\newcommand*{\bstfmt}[1]{\textsf{#1}}
\newcommand*{\ibst}[1]{\index{#1 bibliography style=\bstfmt{#1} 
bibliography style|hyperpage}}
\newcommand*{\bst}[1]{\bstfmt{#1}\ibst{#1}}

\newcommand*{\menu}[1]{\textsf{#1}}

\providecommand*{\ctandoc}[1]{%
  \urlfootref{http://ctan.org/pkg/#1}{\sty{#1} documentation}%
}

\newcounter{example}
\newcommand*{\examplename}{example}

\newenvironment{example}[2]{%
  \refstepcounter{example}\label{#2}%
  \par\vskip10pt\noindent
  \textbf{\large Example \theexample\ (#1)}%
  \addcontentsline{loe}{section}{\protect\numberline{\theexample}#1}%
  \nopagebreak\par\vskip10pt\nopagebreak
}
{%
  \begin{center}\rule{2in}{1pt}\end{center}%
}

\@nlctdoc@if@usingtexht
{%
  \edef\aargh{\noexpand\HCode{\string&\string#x1F631;}}

  \newcommand*{\toTop}{\par\noindent\hyperlink{top}{Top}}

  \@ifundefined{chapter}
  {%
  \AtBeginDocument{%
      \Configure{section}{\toTop\HCode{<h2 class="sectionHead">}}{}{}{}%
      \Configure{subsection}{\toTop\HCode{<h3 class="subsectionHead">}}{}{}{}%
      \Css{div.important { border : solid red; }}%
      \Css{div.verbatim { font-family: monospace; white-space: nowrap; text-align:left; clear:both; padding-top: 2ex; padding-bottom: 2ex;} }%
    }
  }%
  {%
    \renewcommand{\thefootnote}{\thechapter.\arabic{footnote}}
    \AtBeginDocument{%
      \Configure{chapter}
      {\HCode{<div class="chapter">}}
      {\HCode{</div>}\toTop}
      {\HCode{<h2 class="chapterHead">}\thechapter. }{\HCode{</h2>}}%
      \Configure{section}{\toTop\HCode{<h3 class="sectionHead">}}{}{}{}%
      \Configure{subsection}{\toTop\HCode{<h4 class="subsectionHead">}}{}{}{}%
      \Css{div.important { border : solid red; }}%
      \Css{div.verbatim { font-family: monospace; white-space: nowrap; text-align:left; clear:both; padding-top: 2ex; padding-bottom: 2ex;} }%
    }%
  }%

  \providecommand*{\@maketitle}{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em%
  }

  \let\org@maketitle\maketitle
  \def\maketitle{\hypertarget{top}{}\org@maketitle}

  \let\oldlabel\label
  \renewcommand*{\label}[1]{%
    \HCode{<a name=\string"#1\string">}\oldlabel{#1}%
  }

  \renewcommand{\StopEventually}[1]{#1\toTop}
  \renewcommand*{\OnlyDescription}{}

  \newcommand*{\sectionref}[1]{\hyperref[#1]{\S\ref*{#1} }\nameref{#1}}
  \newcommand*{\xrsectionref}[3]{\href{#2.html\##1}{#3}}
  \newcommand*{\qtdocref}[2]{\href{#2.html}{\qt{#1}}}
  \newcommand*{\docref}[2]{\href{#2.html}{#1}}
  \newcommand*{\altdocref}[3]{\href{#3.html}{#1}}
  \newcommand*{\urlref}[2]{\href{#1}{#2}}
  \newcommand*{\urlfootref}[2]{\href{#1}{#2}}
  \newcommand*{\submenu}[1]{\menu{-\textgreater #1}}
  \newcommand*{\listofexamples}{}

  \edef\nlcthlangle{\noexpand\HCode{\string&\string#x27E8;}}
  \edef\nlcthrangle{\noexpand\HCode{\string&\string#x27E9;}}

  \renewcommand*{\meta}[1]{%
   \nlcthlangle\emph{#1}\nlcthrangle}
}%
{%
  \newcommand*{\toTop}{}
  \newcommand*{\sectionref}[1]{Section~\ref{#1}}
  \newcommand*{\qtdocref}[2]{\qt{#1} (\href{#2.pdf}{#2.pdf})}
  \newcommand*{\docref}[2]{#1 (\href{#2.pdf}{#2.pdf})}
  \newcommand*{\urlref}[2]{\url{#1}}
  \newcommand*{\urlfootref}[2]{#2\footnote{\url{#1}}}
  \newcommand*{\submenu}[1]{\,$\to$\,\menu{#1}}

  % \altdocref{text}{pdf}{html}
  \newcommand*{\altdocref}[3]{#1 (\href{#2.pdf}{#2.pdf})}

  % \xrsectionref{label}{html file}{html title}
  \newcommand*{\xrsectionref}[3]{Section~\ref{#1}}

  \newcommand*{\listofexamples}{%
    \@ifundefined{chapter}
    {%
      \section*{List of Examples}%
    }%
    {%
      \chapter*{List of Examples}%
    }
    \@starttoc{loe}%
  }

  \newcommand{\aargh}{\grimace}
}%


\AtBeginDocument{\MakeShortVerb{\|}}

\endinput
