\ProvidesFile{tables.inc}[2002/11/23 Common LaTeX code for character charts]

\documentclass{article}
\usepackage{geometry}
\usepackage{ucs}
\usepackage{colortbl}

\nofiles

\makeatletter

\ifx\TeXXeTstate\undefined\else\TeXXeTstate=1\fi

\def\format@table{table}
\def\@thirdoffour#1#2#3#4{#3}

\newcommand\combineglyph{o}
\def\ONE{1}

\newcommand\callcombineglyph[1]{\acombineglyph}

\newcommand\init@table{
  \count255=\gstart\divide\count255by16\multiply\count255by16\relax
  \ifnum\gstart=\count255\relax\else
    \PackageError{ucs::tables}{I need a multiple of 16 as beginning of
      the range, when format table is used (I got \gstart!=\number\count255)}\fi
  %
  \definecolor{notfound}{rgb}{.7,.7,.7}
  \definecolor{withoption}{rgb}{.9,.9,.9}
  \definecolor{combining}{rgb}{0.9,1,1}
  \definecolor{control}{rgb}{1,1,.9}
  \definecolor{outside}{rgb}{1,0,0}
  \definecolor{notassigned}{rgb}{.5,.5,.5}
  %
  \ifx\blackwhite\undefined
  \newcolumntype{A}{>{\columncolor{notfound}}D}
  \newcolumntype{B}{>{\columncolor{withoption}}D}
  \newcolumntype{C}{>{\columncolor{outside}}D}
  \newcolumntype{D}{>{\hfill}m{1.6em}<{\hfill\null}}
  \newcolumntype{E}{>{\mystrut}c}
  \newcolumntype{F}{>{\columncolor{combining}}D}
  \newcolumntype{G}{>{\columncolor{notassigned}}D}
  \newcolumntype{H}{>{\columncolor{control}}D}
  \else
  \newcolumntype{A}{>{\columncolor{notfound}}D}
  \newcolumntype{B}{D}
  \newcolumntype{C}{>{\columncolor{outside}}D}
  \newcolumntype{D}{>{\hfill}m{1.6em}<{\hfill\null}}
  \newcolumntype{E}{>{\mystrut}c}
  \newcolumntype{F}{D}
  \newcolumntype{G}{>{\columncolor{notassigned}}D}
  \newcolumntype{H}{D}
  \fi
  %
  \def\amper{&}
  \newcommand\mystrut{\rule{0pt}{12pt}}
  \newcommand\tend{%
    \\\hline%
    \end{tabular}%
    \end{document}}
  \newcommand\table@field[1]{%
%    \typeout{<\ahexcode>}%
    \count255=\acode\divide\count255by16\multiply\count255by16\relax
    \advance\count255by-\acode\relax
    \ifnum\count255=0\relax
      \expandafter\\\ahexcodebeforelast0\fi%
    &##1%
    }%
  \newcommand\noglyph{\table@field{\multicolumn{1}{A|}{}}}
  \newcommand\unassigned{\table@field{\multicolumn{1}{G|}{}}}
  \newcommand\withoption{\table@field{\multicolumn{1}{B|}{}}}
  \newcommand\glyph{%
    \edef\muco{\noexpand\multicolumn{1}{%
        \ifx\actrlglyph\undefined
          \ifx\acombining\ONE F\else D\fi
        \else
          H%
        \fi|}}%
    \expandafter\table@field\expandafter{\muco{\dirt%
      \ifx\arightleft\ONE\beginR\fi
      \ifx\afontenc\undefined\else
        \fontencoding{\afontenc}\selectfont\fi
      \ifx\afontfamily\undefined\else
        \fontfamily{\afontfamily}\selectfont\fi
      \ifx\aoption\undefined\else
        \SetUnicodeOption{no\goption}\SetUnicodeOption{\aoption}\fi
      \ifx\atableglyph\undefined
        \atableenvelope{%
        \ifx\acombining\ONE
          \SetUnicodeOption{combine}%
          \ifx\acombinechar\undefined
            \uc@output{\csname callcombineglyph\endcsname}{-1}%
          \else
            \SetUnicodeOption[1000]{\acombineoption}%
            \unichar{\acombinechar}%
          \fi
          \unichar{\acode}%
          \SetUnicodeOption{nocombine}%
        \else
          \unichar{\acode}\fi%
          }%
      \else
        \atableglyph\fi
      \ifx\arightleft\ONE\endR\fi
%      /\SetUnicodeOption{nodefault}\SetUnicodeOption{warnunknown}%
%      \SetUnicodeOption{fasterrors}\SetUnicodeOption{graphics}\unichar{\acode}
    \clearargs
    }}}
  \let\start\table@start
  \clearargs
}

\newcommand\clearargs{%
  \global\let\afontenc\undefined
  \global\let\afontfamily\undefined
  \global\let\adirty\undefined
  \global\let\acombining\undefined
  \global\let\acode\undefined
  \global\let\aoption\undefined
  \global\let\ahexcode\undefined
  \global\let\acombineglyph\combineglyph
  \global\let\acombinechar\undefined
  \global\def\acombineoption{default}%
  \global\let\atableglyph\undefined
  \global\let\atableenvelope\@iden
}

\newcommand\dirt{\expandafter\ifx\adirty1%
  \typeout{Dirt!}%
  \SetUnicodeOption[0]{default}%
  \SetUnicodeOption[-20]{mathletters}%
  \SetUnicodeOption[-10]{cjkjis}%
  \fi}

\newcommand\old@glyph{%
  \expandafter\ifx\adirty1
    \typeout{Dirty \acode\space = 0x\ahexcode}%
    \noglyph%
  \else
    \@glyph
  \fi}

\newcommand\table@start{%
    \begin{tabular}{|E||D|D|D|D|D|D|D|D|D|D|D|D|D|D|D|D|}
      \hline
      \multicolumn{17}{|l|}{Range: U+\ghstart--U+\ghend, option: \goption}\\
      \hline\hline
      & 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & A & B & C & D & E & F\\
      \hline
      \let\\\relax
}

\newcommand\clearoptions{%
  \let\uc@tempa\\
  \def\\##1{\SetUnicodeOption{no##1}}
  \unicode@knownoptions
  \let\\\uc@tempa}

\newcommand\loadpackages{%
  \ifx\gfontencs\undefined\else
    \expandafter\usepackage\expandafter[\gfontencs]{fontenc}\fi
  \ifx\brailleunit\undefined\else
    \divide\brailleunit2\fi
}

\newcommand\tstart{
  \loadpackages
  \begin{document}
  \thispagestyle{empty}
  \clearoptions
  \SetUnicodeOption{\goption}
  \ifx\gformat\format@table
    \init@table
  \else
    \PackageError{ucs::tables}{Unknown format \gformat}
  \fi
  \typeout{Generating table, format: \gformat}
  \table@start
}

%%% These are for my local definitions...
\newcommand\coleq{%
  \mathrel{%
  \raise 3.0pt\hbox to0pt{.\hss}%
  \raise 0.85pt\hbox to 0pt{.\hss}%
  \hskip2.8pt\hbox{$=$}}}%
\newcommand{\qed}{\ensuremath{\rule{.6em}{.6em}}}
%
\iffalse
\newcommand\mathbfit[1]{\hbox{\bf\it #1}}
\newcommand\mathsfbf[1]{\hbox{\bf\sf #1}}
\newcommand\mathsfit[1]{\hbox{\it\sf #1}}
\newcommand\mathsfbfit[1]{\hbox{\bf\sf\it #1}}
\newcommand\mathbfxxx[3]{\rlap{\m@th$#1{#3}$}\hskip#2%
\rlap{\m@th$#1{#3}$}\hskip#2%
\rlap{\m@th$#1{#3}$}\hskip#2%
#1{#3}}
\newcommand\mathbfcal[1]{\mathbfxxx\mathcal{.2pt}{#1}}
\newcommand\mathbfcalsmall[1]{\mathbfxxx\mathcalsmall{.2pt}{#1}}
\newcommand\mathbffrak[1]{\mathbfxxx\mathfrak{.2pt}{#1}}
\newcommand\mathcalsmall[1]{{\scriptscriptstyle\expandafter\mathcal\expandafter
    {\uppercase{#1}}}}
\fi
% m4_emacs(
%%% Local Variables: 
%%% mode: latex
%%% time-stamp-start: "\\\\Provides\\(Package\\|File\\){[^}]*}\\["
%%% time-stamp-end: "\\( \\|\\]\\)"
%%% time-stamp-format: (time-stamp-yyyy/mm/dd)
%%% time-stamp-active: t
%%% time-stamp-line-limit: 200
%%% TeX-master: "~/prg/latexuni/tables/table-default-2000-20FF.tex"
%%% End: 
%%% Local IspellDict: british
% LocalWords:  british noexpand
% )
