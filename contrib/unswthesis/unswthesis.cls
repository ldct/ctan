%%% ====================================================================
%%%  @LaTeX-class-file{
%%%	filename	= "unswthesis.cls",
%%%	version		= "1.6a",
%%%	date		= "23 October 1995",
%%%	writtenby	= "John Zaitseff",
%%%	email		= "J.Zaitseff@unsw.edu.au",
%%%	keywords	= "LaTeX, thesis, unsw, unswthesis",
%%%	docstring	= "This file provides a thesis class for the
%%%			   University of New South Wales, Australia."
%%% }
%%% ====================================================================

% This file provides a thesis class for the School of Computer Science
% and Engineering, University of New South Wales.  It is meant to be
% used with LaTeX-2e, and exists because of the archaic standards
% required by universities all over the world with regards to thesis
% styles.
%
% As with all class files, this class is meant to be used as the exclusive
% LaTeX-2e class for the entire document.  It may be introduced in the
% document via:
%
%       \documentclass{unswthesis}
%
% As always, options may be placed before the {unswthesis}.  In this case,
% the following options are supported:
%
%       singlespacing   - Single-space the document (ie, do not apply the
%                         thesis requirements).
%       doublespacing   - Double-space the document (actually, space it
%                         1.21 times the baseline).
%       draft           - Prints the word "DRAFT" across the front page,
%                         as well as on each page (in the footer).
%       final           - Opposite of draft: do not print "DRAFT".
%
% All of the options for the Book class are also supported, namely,
%       10pt, 11pt, 12pt             (11pt is used by default)
%       letterpaper, legalpaper,
%       executivepaper, a4paper,
%       a5paper, b5paper             (a4paper used by default)
%       landscape                    (not used by default)
%       oneside, twoside             (oneside used by default)
%       openright, openany           (openany used by default)
%       onecolumn, twocolumn         (onecolumn used by default)
%       openbib                      (not used by default)
%       leqn, fleqn                  (not used by default)
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unswthesis}%
    [1995/10/23 v1.6a University of NSW Thesis Class]
\RequirePackage{fancyheadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Changeable Parameters   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Change these for customisation.  To change them in a LaTeX document,
% simply use \thesisuni{xxx} and \thesisschool{xxx}.

\gdef\@thesisuni{The University of New South Wales}
\gdef\@thesisschool{School of Electrical Engineering and\\%
                    Computer Science and Engineering}

% Customise for foreign languages.

\def\supervisorname{Supervisor:}
\def\assessorname{Assessor:}
\def\abstractname{Abstract}

%%%%%%%%%%%%%%%%%%%%%
%   Class options   %
%%%%%%%%%%%%%%%%%%%%%

\newif\if@dspacing{}
\newif\if@thdraft{}
\newcommand\droptnm{final}

\DeclareOption{singlespacing}{\@dspacingfalse}
\DeclareOption{doublespacing}{\@dspacingtrue}
\DeclareOption{draft}{\@thdrafttrue\renewcommand\droptnm{draft}}
\DeclareOption{final}{\@thdraftfalse\renewcommand\droptnm{final}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{doublespacing,final}
\ProcessOptions
\LoadClass[a4paper,11pt,oneside,openany,\droptnm]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Draft / final options   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@thdraft%
    \RequirePackage[first,light]{draftcopy}%
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Double and single spacing   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ssp}{%
    \def\baselinestretch{1}%
    \large\normalsize\selectfont}
\newcommand{\dsp}{%
    \def\baselinestretch{1.21}%
    \large\normalsize\selectfont}

% Define conditional:

\if@dspacing%
    \newcommand\s@dsp{\dsp}%
\else%
    \newcommand\s@dsp{\ssp}%
\fi

% Conditional Double-spacing environment

\def\spacing{%
    \begingroup%
    \s@dsp}%
\def\endspacing{%
    \par \vskip \parskip \vskip \baselineskip%
    \endgroup%
    \vskip -\parskip%
    \vskip -\baselineskip}

% Always single-space

\def\sspacing{%
    \begingroup%
    \ssp}%
\def\endsspacing{%
    \par \vskip \parskip \vskip \baselineskip%
    \endgroup%
    \vskip -\parskip%
    \vskip -\baselineskip}

% Execute the following ONLY if double-spacing was selected.

\if@dspacing
    % The following are from "book.cls":
    \renewcommand{\mainmatter}{%
	\cleardoublepage\@mainmattertrue\pagenumbering{arabic}\s@dsp}
    \renewcommand{\backmatter}{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\@mainmatterfalse\ssp}
    \renewenvironment{figure}[1][tbp]{\@float{figure}[#1]\ssp}{\end@float\s@dsp}
    \renewenvironment{figure*}[1][tbp]{\@dblfloat{figure}[#1]\ssp}{\end@dblfloat\s@dsp}
    \renewenvironment{table}[1][tbp]{\@float{table}[#1]\ssp}{\end@float\s@dsp}
    \renewenvironment{table*}[1][tbp]{\@dblfloat{table}[#1]\ssp}{\end@dblfloat\s@dsp}

    % The following are from "latex.ltx". BUG: This is NOT single-spaced.

    \long\def\@footnotetext#1{\insert\footins{%
	\ssp%                  % Should be single-spaced, but...
	\reset@font\footnotesize
	\interlinepenalty\interfootnotelinepenalty
	\splittopskip\footnotesep
	\splitmaxdepth \dp\strutbox \floatingpenalty \@MM
	\hsize\columnwidth \@parboxrestore
	\protected@edef\@currentlabel{%
	    \csname p@footnote\endcsname\@thefnmark
	}%
	\color@begingroup
	    \@makefntext{%
		\rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
	\color@endgroup}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Miscellaneous Commands   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareFontShape{OT1}{cmr}{bx}{sl}{<-> cmbxsl10}{}
\newcommand{\HUGE}{%
    \fontencoding{OT1}\fontfamily{cmr}%
    \fontseries{bx}\fontshape{sl}%
    \fontsize{36}{45}\selectfont}

\newcommand{\thesisuni}[1]{\gdef\@thesisuni{#1}}
\newcommand{\thesisschool}[1]{\gdef\@thesisschool{#1}}
\newcommand{\thesistitle}[1]{\gdef\@thesistitle{#1}}
\newcommand{\thesisauthor}[1]{\gdef\@thesisauthor{#1}}
\newcommand{\thesisdegree}[1]{\gdef\@thesisdegree{#1}}
\newcommand{\thesisdate}[1]{\gdef\@thesisdate{#1}}
\newcommand{\thesissupervisor}[1]{\gdef\@thesissupervisor{#1}}
\newcommand{\thesisassessor}[1]{\gdef\@thesisassessor{#1}}

\newcommand{\@thesistitle}{\@latex@error{No \noexpand\thesistitle given}\@ehc}
\newcommand{\@thesisauthor}{\@latex@error{No \noexpand\thesisauthor given}\@ehc}
\newcommand{\@thesisdegree}{\@latex@error{No \noexpand\thesisdegree given}\@ehc}
\newcommand{\@thesisdate}{\@latex@error{No \noexpand\thesisdate given}\@ehc}
\newcommand{\@thesissupervisor}{\@latex@error{No \noexpand\thesissupervisor given}\@ehc}
\newcommand{\@thesisassessor}{\@latex@error{No \noexpand\thesisassessor given}\@ehc}

\renewcommand{\title}[1]{\@latex@warning{\noexpand\title is not used with this class}}
\renewcommand{\author}[1]{\@latex@warning{\noexpand\author is not used with this class}}
\renewcommand{\date}[1]{\@latex@warning{\noexpand\date is not used with this class}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Thesis front matter   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Title page

\renewcommand{\maketitle}%
    {\begin{titlepage}%
	\null\vfil
	\begin{center}%
	    {\huge \scshape \@thesisuni \par}%
	    \vskip 2em%
	    {\Large \scshape \@thesisschool \par}%
	    \vskip 7em%
	    {\HUGE \@thesistitle \par}%
	    \vskip 6em%
	    {\Large \bfseries \@thesisauthor \par}%
	    \vskip .7em%
	    {\large \@thesisdegree \par}%
	    \vskip .7em%
	    {\large \@thesisdate \par}%
	    \vskip 8em%
	    {\large \textsl{\supervisorname}\ \@thesissupervisor \par}%
	    {\large \textsl{\assessorname}\ \@thesisassessor \par}%
	\end{center}\par
	\vskip 30\p@
	\vfil\null
    \end{titlepage}%
    \setcounter{footnote}{0}%
    \let\maketitle\relax}

% Abstract environment (not defined by "book.cls")

\newenvironment{abstract}{%
    \titlepage
    \null\vfil
    \begin{center}%
	{\Large \bfseries \abstractname}
	\@endparpenalty\@M
    \end{center}\spacing}%
    {\endspacing\par\vfil\null\endtitlepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   General Page Parameters   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The university requirements specify a 25mm border all around, except for
% the bottom (20mm). We actually increase this to make it more
% typographically correct. The page dimensions used were taken from "The
% LaTeX Companion", p. 85, with appropriate modifications.

%\setlength\oddsidemargin{15\p@}
%\setlength\evensidemargin{15\p@}
\setlength\oddsidemargin{30\p@}
\setlength\evensidemargin{30\p@}
\setlength\topmargin{15\p@}
\setlength\headsep{20\p@}
\setlength\headheight{20\p@}
%\setlength\footskip{40\p@}
\setlength\marginparwidth{15\p@}
\setlength\marginparsep{\z@}
\setlength\textwidth{\paperwidth %
    \advance\textwidth -144\p@ %
    \advance\textwidth -\oddsidemargin %
    \advance\textwidth -\marginparwidth %
    \advance\textwidth -\marginparsep}
\setlength\textheight{\paperheight %
    \advance\textheight -140\p@ %
    \advance\textheight -\topmargin %
    \advance\textheight -\headheight %
    \advance\textheight -\headsep %
    \advance\textheight -\footskip}

% Page headings and footers.

\pagestyle{fancyplain}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{\thechapter. #1}}
\renewcommand{\sectionmark}[1]{}
\lhead[\fancyplain{}{\bfseries\thepage}]{\fancyplain{}{\bfseries\rightmark}}
\rhead[\fancyplain{}{\bfseries\leftmark}]{\fancyplain{}{\bfseries\thepage}}
\cfoot{\fancyplain{\textrm{\thepage}}{}}

\if@thdraft
    \rfoot[\textbf{Draft:}~\today]{}
    \lfoot[]{\textbf{Draft:}~\today}
\fi
