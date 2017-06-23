% University of Toronto Thesis LaTex2e Class definition.
% Written by Robert Bernecky 1997-07-10, based on
% the thesis.sty written at UofT by fpitt.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{utthesis}[1997/07/15 University of Toronto Thesis class definition]
\RequirePackage{setspace}

% The idea here is to modify the "report" class to meet the outdated,
% hard-to-read standards of the UofToronto School of Graduate Studies 
% requirements for theses. These standards require more expenditure
% of paper than a sensible format (being double-spaced) and  are 
% also harder to read, being a one-column format, but that's
% tradition for you...
 
% This is the first LaTeX class definition I have written, so if something
% looks wrong, it probably IS wrong. 

% The following options are what you get if you do not specify ANY options.
% E.g., \documentclass{utthesis}
% Basically, it is your camera copy.
\ExecuteOptions{letterpaper,twoside,12pt,onecolumn,final,openany}

% If you want a cheap-and-cheerful draft copy, try options such
%% \documentclass[draft,twoside,11pt]{utthesis} 

% Set up handling of "draft" option. 
\DeclareOption{draft}{%
 \PassOptionsToPackage{all}{draftcopy}% 
 \PassOptionsToClass{draft}{report}% 
 \AtEndOfClass{%
   \RequirePackage{draftcopy}%
   % I wanted to print timestamp of each file, but I don't see
   % how to do that...
   \draftcopyName{DRAFT: \today}{60 } % text for overprinting if in "draft" mode
   }%
}

% Pass ALL options to report.cls.
\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{report}
}

\ProcessOptions

\LoadClass{report} 
% Set up environments for thesis sections.

% clearemptydoublepage from page 92 of The LaTeX Companion 1993. 
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}


\renewenvironment{abstract}%
{\clearemptydoublepage \begin{center}
  \section*{Abstract}
 \end{center}
 \begin{center}
  {\@title}\\[2ex]
  {\@author}\\
  {\@degree}\\
   Graduate Department of {\@department}\\
   University of Toronto\\
   {\@gyear}
 \end{center}
 \begingroup
}{\newpage\endgroup}

\newenvironment{acknowledgements}%
{\clearemptydoublepage
 \begin{center}
  \section*{Acknowledgements}
 \end{center}
 \begingroup
}{\newpage\endgroup}

\newenvironment{dedication}%
{\clearemptydoublepage 
 \begin{center}
  \section*{Dedication}
 \end{center}
 \begingroup
}{\newpage\endgroup}

\newenvironment{preliminary}%
{\pagestyle{plain}\pagenumbering{roman}}%
{\pagenumbering{arabic}}

% Default values for title page.

%% To produce output with the desired line spacing, the argument of
%% \spacing should be multiplied by 5/6 = 0.8333, so that 1 1/2 spaced
%% corresponds to \spacing{1.5} and double spaced is \spacing{1.66}.
\def\normalspacing{1.25} % default line spacing

\newcommand{\department}[1]{\ifx\empty#1\else\gdef\@department{#1}\fi}
\newcommand{\degree}[1]{\ifx\empty#1\else\gdef\@degree{#1}\fi}
\renewcommand{\author}[1]{\ifx\empty#1\else\gdef\@author{#1}\fi}
\renewcommand{\title}[1]{\ifx\empty#1\else\gdef\@title{#1}\fi}
\newcommand{\gyear}[1]{\ifx\empty#1\else\gdef\@gyear{#1}\fi}

\global\def\@department{\mbox{}}
\global\def\@degree{\mbox{}}
\global\def\@author{\mbox{}}
\global\def\@title{\mbox{}}
\global\def\@gyear{\number\year} % Default year is current year


%% Change \maketitle to follow the SGS guidelines.
\renewcommand{\maketitle}
{\begin{titlepage}
   \setcounter{page}{1}
   %% Set the line spacing to 1 for the title page.
   \begin{spacing}{1} 
   \begin{large}
   \begin{center}
      \mbox{}
      \vfill
      \begin{sc}
      {\@title}\\
      \end{sc}
      \vfill
      by \\
      \vfill
      {\@author}\\
      \vfill
      \vfill
      A thesis submitted in conformity with the requirements\\
      for the degree of {\@degree}\\
      Graduate Department of {\@department}\\
      University of Toronto\\
      \vfill
      Copyright {\copyright} {\@gyear} by {\@author}\\
      \vspace*{.2in}
   \end{center}
   \end{large}
   \end{spacing}
   \end{titlepage}
   \setcounter{page}{2}
}%\maketitle


%% Footnotes are always single-spaced.
%%\let\@@footnotetext=\@footnotetext
%%\def\@footnotetext{\begin{spacing}{1}\@@footnotetext\end{spacing}}


%% Define the "thesis" page style.
\if@twoside % If two-sided printing.
\def\ps@thesis{\let\@mkboth\markboth
   \def\@oddfoot{}
   \let\@evenfoot\@oddfoot
   \def\@oddhead{
      {\sc\rightmark} \hfil \rm\thepage
      }
   \def\@evenhead{
      \rm\thepage \hfil {\sc\leftmark}
      }
   \def\chaptermark##1{\markboth{\ifnum \c@secnumdepth >\m@ne
      Chapter\ \thechapter. \ \fi ##1}{}}
   \def\sectionmark##1{\markright{\ifnum \c@secnumdepth >\z@
      \thesection. \ \fi ##1}}}
\else % If one-sided printing.
\def\ps@thesis{\let\@mkboth\markboth
   \def\@oddfoot{}
   \def\@oddhead{
      {\sc\rightmark} \hfil \rm\thepage
      }
   \def\chaptermark##1{\markright{\ifnum \c@secnumdepth >\m@ne
      Chapter\ \thechapter. \ \fi ##1}}}
\fi

\pagestyle{thesis}
% Set up page layout.
\setlength{\textheight}{9in} % Height of the main body of the text
\setlength{\topmargin}{-.5in} % .5" margin on top of page
\setlength{\headsep}{.5in}  % space between header and top of body
\addtolength{\headsep}{-\headheight} % See The LaTeX Companion, p 85
\setlength{\footskip}{.5in}  % space between footer and bottom of body
\setlength{\textwidth}{6.25in} % width of the body of the text
\setlength{\oddsidemargin}{.25in} % 1.25" margin on the left for odd pages
\setlength{\evensidemargin}{0in} % 1.25"  margin on the right for even pages

% Marginal notes
\setlength{\marginparwidth}{.75in} % width of marginal notes
\setlength{\marginparsep}{.125in} % space between marginal notes and text

% Make each page fill up the entire page. comment this out if you
% prefer. 
\flushbottom

\setcounter{tocdepth}{3} % Number the subsubsections 
