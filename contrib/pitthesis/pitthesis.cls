%%  University of Pittsburgh, Thesis Document Class for LaTeX2e
%%
%%  Related files:  (*.clo are class option files)
%%	pitthesis.cls	-- document class file for pitt thesis
%%	pitteng.clo	-- Pitt Engineering thesis
%%	pittstd.clo	-- Pitt standard thesis
%%
%%  This document class load report class.
%%  Engineering thesis requires cite package which is available from CTAN.
%%	cite.sty	-- used in pitteng.clo, sorted & merged reference numbers
%%
%%  Wonkoo Kim (wkim+@pitt.edu, wkim@bellatlantic.net)
%%
%%  v1.2    September 23, 1999	- bug fixed: line spacing problem
%%  v1.1    August 22, 1999	- major update -- now loads report.cls
%%  v1.0.4  August 13, 1999	- try orphan/widow removal harder
%%  v1.0.3  August 12, 1999	- adjusted evensidemargin for twoside printing.
%%  v1.0.2  August 6, 1999	- added cover sheet for bibliography.
%%				- changed all big font sizes to \Large.
%%				- bug fixed: TOC was listed in TOC list.
%%  v1.0.1  July 29, 1999	- added \newlength\stringlen for text alignments
%%  v1.0    July 31, 1998	- First version
%%
%%--------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{pitthesis}
    [1999/08/23 v1.2 Univ. of Pittsburgh Thesis Class]

\newcommand\@pitthesis{eng}	% select Pitt Engineering Thesis style by default
\newif\if@pitteng
\newif\if@pittstd
\DeclareOption{pitteng}{\renewcommand\@pitthesis{eng}\@pittengtrue\@pittstdfalse}
\DeclareOption{pittstd}{\renewcommand\@pitthesis{std}\@pittstdtrue\@pittengfalse}
%%--------------------------------------------------------------------------
%% floats (figures and tables) numbering style:
%% floats numbering-by-chapter option by documentclass[floatchap]{pitthesis}
%% If [floatchap] is not given and if \floatsbyappendix is called in the
%% user's document, then only figures and tables in appendices are numbered by
%% appendix chapters.  I.e. Figure A-1, A-2, B-1, ... representing appendix
%% A's or appendix B's figures, otherwise all figures and tables are sequentially
%% numbered throughout the whole document before and after starting appendix.
%%
\newif\if@floatsbychapter
\@floatsbychapterfalse	    %% default: sequential numbering for the whole chapters
\newif\if@floatchapoption
\@floatchapoptionfalse	    % floatchap class option is not yet given.
\newcommand\@floatsbychap{\@floatsbychaptertrue
    \typeout{Floats (figures, tables) are numbered by chapters.}}
\let\floatsbyappendix\@floatsbychap

%% If \@floatsbychap is called, figures and tables are numbered by chapter.

\DeclareOption{floatchap}{\@floatsbychap\@floatchapoptiontrue}
\DeclareOption{nofloatchap}{\@floatsbychapterfalse\@floatchapoptiontrue}
%%--------------------------------------------------------------------------
\newif\if@phdthesis
\newif\if@msthesis
%% default: Ph.D. Thesis true
%% default: Master's Thesis false
\DeclareOption{phd}{\@phdthesistrue\@msthesisfalse}
\DeclareOption{ms}{\@msthesistrue\@phdthesisfalse}
%%--------------------------------------------------------------------------
\newif\if@proposal
\@proposalfalse 	%% default: Not proposal
\DeclareOption{proposal}{\@proposaltrue\typeout{Generating a Thesis Proposal ...}}
%%--------------------------------------------------------------------------
\newif\if@headings
\@headingsfalse 	%% default: No headings
\DeclareOption{headings}{\@headingstrue}
\DeclareOption{noheadings}{\@headingsfalse}
%%--------------------------------------------------------------------------
\def\@pitthesislinespacing{18pt}
\DeclareOption{single}{\def\@pitthesislinespacing{12pt}}
\DeclareOption{onehalf}{\def\@pitthesislinespacing{18pt}}
\DeclareOption{double}{\def\@pitthesislinespacing{24pt}}
%%--------------------------------------------------------------------------
%% all other options are passed to the base class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{pitteng,phd,onehalf}
\ProcessOptions
\LoadClass[letterpaper,11pt,oneside,onecolumn,final,openany]{report}

\if@floatchapoption\else
    \if@pitteng
    \@floatsbychap\fi\fi     % floats-by-chapter is the default for pitteng

%  ****************************************
%  *		PAGE LAYOUT		  *
%  ****************************************
%
% All margin dimensions measured from a point one inch from top and side
% of page.

% SIDE MARGINS:
\oddsidemargin 0.5in	% left margin is this number plus 1 inch  (1 inch = 72.27 pt)
\evensidemargin 0in	% 1 inch margin for even sides (for twoside printing)
\marginparwidth 1in	% the marginal paragraph is 1 inch wide
\marginparsep 12pt	% the distance between marginal paragraph
			% and the left margin

% VERTICAL SPACING:
\topmargin  0pt 	% the distance from top edge to page head
			% is this number plus 1 inch
\headheight 12pt	% the height of page head is 12 points
\headsep    24pt	% Space between running head and text.

% DIMENSION OF TEXT:

\textheight 8.5in	% the height of the text body is 8.5inches
\textwidth  6.0in	% the width of the text body is 6 inches

\pagenumbering{roman}	% this is the page number style
\pagestyle{plain}	% for the preliminary parts
\markboth{}{}		% no heading line

%    ****************************************
%    *		  PAGE STYLES		    *
%    ****************************************
%
% The page style 'foo' is defined by defining the command \ps@foo.  This
% command should make only local definitions.  There should be no stray
% spaces in the definition, since they could lead to mysterious extra
% spaces in the output.
%
% The \ps@... command defines the macros \@oddhead, \@oddfoot,
% \@evenhead, and \@evenfoot to define the running heads and
% feet---e.g., \@oddhead is the macro to produce the contents of the
% heading box for odd-numbered pages.  It is called inside an \hbox of
% width \textwidth.
%
% To make headings determined by the sectioning commands, the page style
% defines the commands \chaptermark, \sectionmark, ... , where
% \chaptermark{TEXT} is called by \chapter to set a mark, and so on.
% The \...mark commands and the \...head macros are defined with the
% help of the following macros.  (All the \...mark commands should be
% initialized to no-ops.)
%
%
% MARKING CONVENTIONS:
% LaTeX extends TeX's \mark facility by producing two kinds of marks
% a 'left' and a 'right' mark, using the following commands:
%     \markboth{LEFT}{RIGHT} : Adds both marks.
%     \markright{RIGHT}      : Adds a 'right' mark.
%     \leftmark  : Used in the \@oddhead, \@oddfoot, \@evenhead or \@evenfoot
%		   macro, gets the current 'left'  mark.  Works like TeX's
%		   \botmark command.
%     \rightmark : Used in the \@oddhead, \@oddfoot, \@evenhead or \@evenfoot
%		   macro, gets the current 'right'  mark.  Works like TeX's
%		   \firstmark command.
% The marking commands work reasonably well for right marks 'numbered
% within' left marks--e.g., the left mark is changed by a \chapter command and
% the right mark is changed by a \section command.  However, it does
% produce somewhat anomalous results if two \bothmark's occur on the same page.
%
%
% Commands like \tableofcontents that should set the marks in some page styles
% use a \@mkboth command, which is \let by the pagestyle command (\ps@...)
% to \markboth for setting the heading or \@gobbletwo to do nothing.

% \ps@empty and \ps@plain defined in latex.ltx

% Definition of 'headings' page style
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \if@headings
	\markboth {\MakeUppercase{%
	  \ifnum \c@secnumdepth >\m@ne
	    \@chapapp\ \thechapter\ \ %
	  \fi
	  ##1}}{}
      \else
	  \markboth {}{}
      \fi}%
    \def\sectionmark##1{%
      \if@headings
	\markright {\MakeUppercase{%
	  \ifnum \c@secnumdepth >\z@
	    \thesection\ \ %
	  \fi
	  ##1}}
      \else
	  \markright {}
      \fi}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \if@headings
	\markright {\MakeUppercase{%
	  \ifnum \c@secnumdepth >\m@ne
	    \@chapapp\ \thechapter\ \ %
	  \fi
	  ##1}}
      \else
	  \markright {}
      \fi}}
\fi

\newif\if@twocolthesis
\if@twocolumn\@twocolthesistrue
	\else\@twocolthesisfalse\fi

%    ****************************************
%    *	      CHAPTERS AND SECTIONS	    *
%    ****************************************
%
% The value of the counter secnumdepth gives the depth of the
% highest-level sectioning command that is to produce section numbers.
%
\setcounter{secnumdepth}{3}
%\setcounter{secnumdepth}{2}
%
\newcounter {main}			% \themain controls the starting
\setcounter {main}{0}
\renewcommand\themain {\@arabic\c@main}

\renewcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \if@twocolthesis\twocolumn\fi
  \ifnum \themain<1	    % Wonkoo Kim (wkim+@pitt.edu), July 31, 1998
       \setcounter{page}{1}
       \setcounter{main}{1}
       \pagenumbering{arabic}
       \pagestyle{headings}
       \markboth{}{}
  \fi%
  \thispagestyle{empty}     % Page style of part page is 'empty'
  % \thispagestyle{plain}%
  \if@twocolumn 	    % IF two-column style
    \onecolumn		    %  THEN \onecolumn
    \@tempswatrue	    %	    @tempswa := true
  \else 		    %  ELSE
    \@tempswafalse	    %	    @tempswa := false
  \fi			    % FI
  \null\vfil		    % Add fil glue to center title
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \Large\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Large \bfseries #2\par}%
    \@endpart}
%
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Large \bfseries #1\par}%
    \@endpart}
% \@endpart finishes the part page
\def\@endpart{\vfil\newpage
	      \if@twoside
		\null
		\thispagestyle{empty}%
		\newpage
	      \fi
	      \if@tempswa
		\twocolumn
	      \fi}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
		\if@pitteng
		    \if@headings
			\thispagestyle{plain}
		    \fi
		\else
		    \thispagestyle{plain}
		\fi
		\global\@topnum\z@	% Prevents figures from going at top of page.
		%\@afterindentfalse	% indent the 1st paragraph -- wkim
		\secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
		\if@twocolthesis\twocolumn\fi
		\ifnum \themain<1
		   \setcounter{page}{1}
		   \setcounter{main}{1}
		   \pagenumbering{arabic}
		   \pagestyle{headings}
		   \markboth{}{}	% Wonkoo Kim (wkim+@pitt.edu)
		\fi%
		\ifnum \c@secnumdepth >\m@ne
		    \refstepcounter{chapter}%
		    \def\@chapapp{} %
		    \if@pitteng
			\typeout{\@chapapp\space\thechapter.0}	%screen message
			\addcontentsline{toc}{chapter}{\protect
			    \numberline{\thechapter.0}\quad #1}
		    \else
			\typeout{\@chapapp\space\thechapter.}	%screen message
			\addcontentsline{toc}{chapter}{\protect
			    \numberline{\thechapter.}\quad #1}
		    \fi
		\else
		  \addcontentsline{toc}{chapter}{#1}%
		\fi
		\chaptermark{#1}%
		\addtocontents{lof}{\protect\addvspace{10\p@}}%
		\addtocontents{lot}{\protect\addvspace{10\p@}}%
		\if@twocolumn
		  \@topnewpage[\@makechapterhead{#2}]%
		\else
		  \@makechapterhead{#2}%
		  \@afterheading
		\fi}
% The \chapter heading
\def\@makechapterhead#1{%
  \if@pitteng
    %%\vspace*{12\p@}%
  \else
    \vspace*{0.7in}%
  \fi
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
	\large\bfseries\centering   % \@chapapp\space \thechapter
	\if@pitteng
	    \thechapter.0\quad	    % extra space
	\else
	    \thechapter.\quad	    % extra space
	\fi
    \fi
    \interlinepenalty\@M
    \large\bfseries #1\par\nobreak  % TeX penalty to prevent page break.
    \ifnum\@ptsize=2
	\vskip 24\p@		    % Space between heading and text.
    \else
	\vskip 20\p@
    \fi
  }}
\def\@schapter#1{%
	\typeout{#1}		    % screen message
	\addcontentsline{toc}{chapter}{#1}		% added -- wkim
	\if@headings
	    \@mkboth{\MakeUppercase#1}{\MakeUppercase#1}% added -- wkim
	\fi
	\if@twocolumn
	    \@topnewpage[\@makeschapterhead{#1}]%
	\else
	    \@makeschapterhead{#1}%
	    \@afterheading
	\fi}
% The unnumbered heading
\def\@makeschapterhead#1{%
  \if@pitteng
    %%\vspace*{12\p@}%
  \else
    \vspace*{0.7in}%
  \fi
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \large\bfseries\centering #1\par\nobreak   % TeX penalty to prevent page break.
    \ifnum\@ptsize=2
	\vskip 24\p@		% Space between heading and text.
    \else
	\vskip 20\p@
    \fi
  }}

%%--------------------------------------------------------------------------
% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%	     optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.
%    NAME	: e.g., 'subsection'
%    LEVEL	: a number, denoting depth of section -- e.g., chapter=1,
%		  section = 2, etc.  A section number will be printed if
%		  and only if LEVEL < or = the value of the secnumdepth
%		  counter.
%    INDENT	: Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.
%		  If negative, then paragraph indent of text following
%		  heading is suppressed.
%    AFTERSKIP	: if positive, then skip to leave below heading,
%			else - skip to leave to right of run-in heading.
%    STYLE	: commands to set style
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.  A sectioning command
%  is normally defined to \@startsection + its first six arguments.
%
\renewcommand\section{\@startsection {section}{1}{\z@}%
				   {5ex \@plus 1ex \@minus .2ex}%
				   {2.3ex \@plus.2ex}%
				   {\normalfont\large\bfseries\centering}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
				     {3ex\@plus 1ex \@minus .2ex}%
				     {1.5ex \@plus .2ex}%
				     {\normalfont\normalsize\bfseries}}

% since \subsubsection heading is rather unique, it is redefined here
%
\renewcommand\subsubsection{\secdef\@subsubsection\@ssubsubsection}   %

\def\@subsubsection[#1]#2{ \refstepcounter{subsubsection}%
	\addcontentsline{toc}{subsubsection}{\protect	% put an entry to
	\numberline{\thesubsubsection}\space #1}	% jobname.toc file
	  \@makesubsubsectionhead{#2}\nolinebreak}

\def\@ssubsubsection#1{\@makessubsubsectionhead{#1}\nolinebreak}

\def\@makesubsubsectionhead#1{		% Heading for \subsubsection command
  \par \vspace*{12pt}			% Space before
  \noindent
  {\normalsize\bfseries\underbar{\hbox{%
   \thesubsubsection\space\space#1}}.~~}}

\def\@makessubsubsectionhead#1{ 	% Heading for \subsubsection* command
  \par \vspace*{12pt}			% Space before
  \noindent
  { \normalsize\bfseries\underbar{\hbox{#1}}\nolinebreak.~~}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
				    {2.5ex \@plus1ex \@minus.2ex}%
				    {-1em}%
				    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
				       {2.2ex \@plus1ex \@minus .2ex}%
				       {-1em}%
				      {\normalfont\normalsize\bfseries}}

% Default initializations of \...mark commands.  (See below for their
% us in defining page styles.
%
% \def\chaptermark#1{}
% \def\sectionmark#1{}		 % Preloaded definitions
% \def\subsectionmark#1{}
% \def\subsubsectionmark#1{}
% \def\paragraphmark#1{}
% \def\subparagraphmark#1{}

\newcommand\@coversheet[1]{%
	% make a cover sheet with a heading centered on a page
	\if@twocolthesis
	    \onecolumn
	\else
	    \clearpage
	\fi
	\thispagestyle{empty}		% cover sheets are not numbered
	{\vbox{}\vfill%
	 \center{\Large\bfseries #1}	% cover sheet heading in \Large font
	 \vfill\vbox{\vspace{2.4in}}}
	\if@twocolthesis
	    \twocolumn
	\else
	    \clearpage
	\fi
	}

%%--------------------------------------------------------------------------
%%	APPENDIX
%%--------------------------------------------------------------------------
%
% The \appendix command must do the following:
%    -- reset the chapter counter to zero
%    -- set \@chapapp to Appendix (for messages)
%    -- redefine the chapter counter to produce appendix numbers
%    -- reset the section counter to zero
%    -- redefine the \chapter command if appendix titles and headings are
%	to look different from chapter titles and headings.

\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  \setcounter{subparagraph}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}

%%--------------------------------------------------------------------------
%%%%%%% The appendix environments: %%%%%%%%%%%%%%%
%%--------------------------------------------------------------------------
%%  There would be no *-form chapters (\chapter*{}) in appendix environments.
\newenvironment{appendices}{
    \begingroup
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \setcounter{subparagraph}{0}
    \gdef\@chapapp{\appendixname}
    \gdef\thechapter{\@Alph\c@chapter}
    \addtocontents{toc}{\protect\addvspace{0.5em}}%
    \if@floatsbychapter 	    % if figures, tables are numbered by chapters
	\renewcommand\thefigure
		{\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@figure}
	\renewcommand\thetable
		{\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@table}
       % \renewcommand\thefigure{\thechapter-\@arabic\c@figure}
       % \renewcommand\thetable{\thechapter-\@arabic\c@table}
    \else			    % if figures and tables are numbered sequentially
	\renewcommand\thefigure{\@arabic\c@figure}
	\renewcommand\thetable{\@arabic\c@table}
    \fi
    \renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
	\if@floatsbychapter
	    \setcounter{figure}{0}
	    \setcounter{table}{0}
	\fi
	\global\@topnum\z@	% Prevents figures from going at top of page.
	%\@afterindentfalse	 % indent the 1st paragraph -- wkim
	\secdef\@chapter\@schapter
	}
    \def\@chapter[##1]##2{\ifnum \c@secnumdepth >\m@ne
	    \refstepcounter{chapter}%
	\fi
	\if@pitteng			    % Pitt Engineering thesis
	    \typeout{\@chapapp\space\thechapter}    %screen message
	    \addcontentsline{toc}{chapter}{APPENDIX \thechapter\quad ##1}
	\else				    % Pitt standard thesis
	    \typeout{\@chapapp\space\thechapter.}   %screen message
	    \addcontentsline{toc}{chapter}{APPENDIX \thechapter.\quad ##1}
	\fi
	\gdef\@chapapp{} %
	\chaptermark{##1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}% extra vspace in list of figures
	\addtocontents{lot}{\protect\addvspace{10\p@}}% extra vspace in list of tables
	%
	\@coversheet{APPENDIX \thechapter}% a cover sheet for each appendix chapter
	\if@twocolumn
	  \@topnewpage[\@makechapterhead{##2}]%
	\else
	  \@makechapterhead{##2}%
	  \@afterheading
	\fi}
    \def\@makechapterhead##1{		    % Heading for \chapter command
	\if@pitteng
	    \if@headings
		\thispagestyle{plain}
	    \fi
	\else
	    \thispagestyle{plain}
	\fi
	\global\@topnum\z@	% Prevents figures from going at top of page.
	\if@pitteng\else
	    \vspace*{0.7in}		    % space at top of text page.
	\fi
	{
	    \ifnum \c@secnumdepth >\m@ne    % IF secnumdepth > -1 THEN
		\large\bfseries\centering%
		\if@pitteng			% Pitt Engineering thesis
		    APPENDIX \thechapter\quad
		\else				% Pitt Standard
		    APPENDIX \thechapter.\quad
		\fi
		\fi
	    \large \bfseries ##1\par	    % may need a : in here
	    \nobreak			    % TeX penalty to prevent page break.
	    \ifnum\@ptsize=2
		\vskip 24\p@		    % Space between heading and text.
	    \else
		\vskip 20\p@
	    \fi
	}
	%\@afterindentfalse	% indent the 1st paragraph -- wkim
    }
}{ \endgroup }

%%--------------------------------------------------------------------------
%%  Single appendix environment:
%%--------------------------------------------------------------------------
%
\newenvironment{singleappendix}{
    \begingroup
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \setcounter{subparagraph}{0}
    \gdef\@chapapp{Appendix}
    \gdef\thechapter{\@Alph\c@chapter}
    \addtocontents{toc}{\protect\addvspace{0.5em}}%
    \if@floatsbychapter
	\setcounter{figure}{0}
	\setcounter{table}{0}
	\if@pitteng			    % Pitt Engineering thesis
	    \def\thefigure{A.\@arabic\c@figure}
	    \def\thetable{A.\@arabic\c@table}
	\else				    % Pitt Standard
	    \def\thefigure{A-\@arabic\c@figure}
	    \def\thetable{A-\@arabic\c@table}
	\fi
    \else
	\def\thefigure{\@arabic\c@figure}
	\def\thetable{\@arabic\c@table}
    \fi
    \def\@chapter[##1]##2{\ifnum \c@secnumdepth >\m@ne
	    \refstepcounter{chapter}%
	\fi
	\typeout{\@chapapp}    %screen message
	\addcontentsline{toc}{chapter}{APPENDIX\quad ##1}
	\gdef\@chapapp{} %
	\chaptermark{##1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}% extra vspace in list of figures
	\addtocontents{lot}{\protect\addvspace{10\p@}}% extra vspace in list of tables
	\if@twocolumn
	  \@topnewpage[\@makechapterhead{##2}]%
	\else
	  \@makechapterhead{##2}%
	  \@afterheading
	\fi}
    \def\@makechapterhead##1{		% Heading for \chapter command
	\@coversheet{APPENDIX}		% the cover page for appendix
	\if@pitteng
	    \if@headings
		\thispagestyle{plain}
	    \fi
	\else
	    \thispagestyle{plain}
	\fi
	\global\@topnum\z@	% Prevents figures from going at top of page.
	\if@pitteng\else
	    \vspace*{12pt}		    % space at top of text page.
	\fi
	{
	  \ifnum \c@secnumdepth >\m@ne	    % IF secnumdepth > -1 THEN
	    \large\bfseries\centering
		APPENDIX \space \fi \large \bfseries ##1\par
	    \nobreak			    % TeX penalty to prevent page break.
	    \ifnum\@ptsize=2
		\vskip 24\p@		    % Space between heading and text.
	    \else
		\vskip 20\p@
	    \fi
	}
	%\@afterindentfalse		% indent the 1st paragraph -- wkim
	}
}{ \endgroup }

%%--------------------------------------------------------------------------
%%  Numbering Figures and Tables
%%--------------------------------------------------------------------------
%%
%%removefr.tex
%%Date: Sat, 30 Jul 1994 17:58:55 PST
%%From: Donald Arseneau <asnd@erich.triumf.ca>
%%
%%  \@removefromreset{FOO}{BAR} : Removes counter FOO from the list of
%%			 counters \cl@BAR to be reset when counter BAR
%%			 is stepped.  The opposite of \@addtoreset.
\def\@removefromreset#1#2{\let\@tempb\@elt
   \expandafter\let\expandafter\@tempa\csname c@#1\endcsname
   \def\@elt##1{\expandafter\ifx\csname c@##1\endcsname\@tempa\else
	 \noexpand\@elt{##1}\fi}%
   \expandafter\edef\csname cl@#2\endcsname{\csname cl@#2\endcsname}%
   \let\@elt\@tempb}

%% to number figures and tables by chapters.
\if@floatsbychapter		% If figures & tables are numbered by chapter
    \if@pitteng 		    % Pitt Engineering thesis
	\renewcommand\thefigure
	    {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
	\renewcommand\thetable
	    {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
    \else			    % Pitt standard thesis
	\renewcommand\thefigure
	    {\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@figure}
	\renewcommand\thetable
	    {\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@table}
    \fi
\else				% figures & tables are numbered sequentially
    \@removefromreset{figure}{chapter}
    \@removefromreset{table}{chapter}
    \renewcommand\thefigure{\@arabic\c@figure}
    \renewcommand\thetable{\@arabic\c@table}
\fi

%\setlength\abovecaptionskip{10\p@}
%\setlength\belowcaptionskip{0\p@}
\setlength\abovecaptionskip{5\p@}	    % Wonkoo Kim (wkim+@pitt.edu)
\setlength\belowcaptionskip{5\p@}	    % Wonkoo Kim (wkim+@pitt.edu)
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  % \sbox\@tempboxa{#1: #2}%
  \sbox\@tempboxa{{\bfseries #1}\quad#2}%   % Wonkoo Kim (wkim+@pitt.edu)
  \ifdim \wd\@tempboxa >\hsize
    % #1: #2\par
    {\bfseries #1}\quad#2\par		    % Wonkoo Kim (wkim+@pitt.edu)
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%

%%--------------------------------------------------------------------------
%% EQUATION and EQNARRAY -- put here because it must follow \chapter definition
%%--------------------------------------------------------------------------
\@tempswafalse
\if@pittstd\if@floatsbychapter\else
    \@tempswatrue\fi\fi
\if@tempswa
    \@removefromreset{equation}{chapter}
    \renewcommand\theequation{\@arabic\c@equation}
\else
    %\@addtoreset {equation}{chapter}	% Makes \chapter reset 'equation' counter.
					% \@addtoreset is already done by report.cls.
    %\renewcommand\theequation{\thechapter-\arabic{equation}}
    \renewcommand\theequation{%
	\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@equation}
\fi

\jot = 3pt	  % Extra space added between lines of an eqnarray environment

% The macro \@eqnnum defines how equation numbers are to appear in equations.
%
% \def\@eqnnum{(\theequation)}
\def\@eqnnum{\hbox{\rm (\theequation)}}     %% WK added
%% WK -- Without this \@eqnnum, fonts(size) are different between equation,
%% eqnarray, and display math environments.

%    ****************************************
%    *	       TABLE OF CONTENTS, ETC.	    *
%    ****************************************
%
%\setcounter{tocdepth}{2}
\setcounter{tocdepth}{3}

% TABLEOFCONTENTS
%  In report style, \tableofcontents, \listoffigures, etc. are always
%  set in single-column style.	@restonecol
\renewcommand\tableofcontents{%
    \clearpage			% Wonkoo Kim (wkim+@pitt.edu)
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \if@pittstd
	\vspace*{0.45in}
    \fi
    \section*{\contentsname}	% Wonkoo Kim (wkim+@pitt.edu)
    %\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%??
    \vskip -1em 		    %%
    \hfill \underline{Page}\par     %% Wonkoo Kim (wkim+@pitt.edu)
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
    }

\def\thedots{\cleaders\hbox{$\m@th \mkern4.5mu . \mkern4.5mu$}\hfill}

\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}
    %\@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}%
    \vskip -1em
    \underline{Figure No.}\hfill \underline{Page}\par	%% Wonkoo Kim (wkim+@pitt.edu)
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }

\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}
    %\@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}%
    \vskip -1em
    \underline{Table No.}\hfill \underline{Page}\par	%% Wonkoo Kim (wkim+@pitt.edu)
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
%\let\l@table\l@figure

%    ****************************************
%    *		   BIBLIOGRAPHY 	    *
%    ****************************************
%
% The thebibliography environment executes the following commands:
%
%  \def\newblock{\hskip .11em plus .33em minus -.07em} --
%      Defines the `closed' format, where the blocks (major units of
%      information) of an entry run together.
%
%  \sloppy  -- Used because it's rather hard to do line breaks in
%      bibliographies,
%
%  \sfcode`\.=1000\relax --
%      Causes a `.' (period) not to produce an end-of-sentence space.

\renewenvironment{thebibliography}[1]
     {\@coversheet{\bibname}	    % cover sheet
      \addtocontents{toc}{\protect\addvspace{0.5em}}%
      \chapter*{\bibname}
      %\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
	   {\settowidth\labelwidth{\@biblabel{#1}}%
	    \leftmargin\labelwidth
	    \advance\leftmargin\labelsep
	    \@openbib@code
	    \usecounter{enumiv}%
	    \let\p@enumiv\@empty
	    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      %\sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\renewenvironment{theindex}
       {\@coversheet{\indexname}	% cover sheet
	\addtocontents{toc}{\protect\addvspace{0.5em}}%
	\if@twocolumn
	   \@restonecolfalse
	 \else
	   \@restonecoltrue
	 \fi
	 \columnseprule \z@
	 \columnsep 35\p@
	 \twocolumn[\@makeschapterhead{\indexname}]%
	 \if@headings			% Wonkoo Kim (wkim+@pitt.edu)
	     \@mkboth{\MakeUppercase\indexname}%
		     {\MakeUppercase\indexname}%
	     \thispagestyle{plain}
	 \fi
	 \parindent\z@
	 \parskip\z@ \@plus .3\p@\relax
	 \let\item\@idxitem}
	{\if@restonecol\onecolumn\else\clearpage\fi}

\renewcommand\contentsname {TABLE OF CONTENTS}
\renewcommand\listfigurename {LIST OF FIGURES}
\renewcommand\listtablename {LIST OF TABLES}
\renewcommand\bibname {BIBLIOGRAPHY}
\renewcommand\indexname {INDEX}
\renewcommand\figurename {Figure}
\renewcommand\tablename {Table}
\renewcommand\partname {PART}
\renewcommand\chaptername {Chapter}
\renewcommand\appendixname {APPENDIX}
\renewcommand\abstractname {ABSTRACT}

%%--------------------------------------------------------------------------
%%  Parameters for Thesis
%%--------------------------------------------------------------------------
%%
\def\@degrees{}
\def\@degree{}
\def\@school{}
\def\@university{}
\def\@proposal{}

\def\@year{}			%% \year for titlepage
\def\year#1{\def\@year{#1}}

\def\degrees#1{\def\@degrees{#1}}
\def\degree#1{\def\@degree{#1}}
\def\school#1{\def\@school{#1}}
\def\university#1{\def\@university{#1}}
\def\proposal#1{\def\@proposal{#1}}

%%\def\signedrule{\nobreak\leaders\hrule\hskip 2.0truein\ }
%\def\@signedrule#1{\null\nobreak\leaders\hrule\hskip#1\null}
\def\@signedrule#1{\rule[-0.6ex]{#1}{0.2pt}}
\def\signedrule{\null\nobreak\leaders\hrule\hfill\null}
%\def\signedrule{\null\nobreak\leaders\hrule\hfill\null}
%% WK -- Use \@signedrule for fixed length. (\signedrule is variable.)

%%--------------------------------------------------------------------------
%%  Title Page
%%--------------------------------------------------------------------------

\def\maketitle{{
    \baselineskip 18pt		    % line spacing
    \begin{titlepage}
    \let\footnotesize\small	    % Local definitions to make \thanks produce
    \let\footnoterule\relax	    % \normalsize footnotes with no separating rule.
    \setcounter{page}{1}
    \null
    \if@pittstd
	\vskip 0.7truein
    \fi
    \begin{center}
       {\large\bfseries\baselineskip 18pt
	 \@title \par}		    % Set title in \large size.
       \vskip 36pt		    % Vertical space after title. %% WK
       {\normalsize\bfseries\baselineskip 18pt	    % Set author in \normalsizes.
	 by\par
	 \begin{tabular}[t]{c}\@author
	 \end{tabular}\par}
	{
	\normalsize\bfseries\baselineskip 18pt
	\if@proposal
	    \vskip 72pt
	    \@proposal\par	    % Ph.D. Dissertation Proposal\par
	\else
	    \vskip 12pt 	    % Vertical space after author.
	    \@degrees\par
	\fi
	    \vskip 60pt
	    Submitted to the Graduate Faculty\\
	    of the \@school\\
	    in partial fulfillment of\\
	    the requirement for the degree of\\
	    \@degree\par
	    \vskip 36pt
	    \@university\\
	\if@proposal
	    \@date
	\else
	    \@year		    % set year in
	\fi
	}
    \end{center}\par
    \vskip 18pt
    \baselineskip 10pt
    \if@proposal\else
	\noindent\hspace{3.0in} {The Author grants permission}\par
	\noindent\hspace{3.0in} {to reproduce single copies.}\par
	\vskip 36pt
	\noindent\hspace{3.0in} {\bfseries \signedrule}\par
	\vskip -1ex
	\noindent\hspace{3.0in} {\bfseries\small Signed}\par
    \fi
    \vfil
    \null
    \end{titlepage}
    \setcounter{footnote}{0}	   % Footnotes start at zero again.
    \setcounter{page}{2}	   % page starts  start at 2 for theses.
    \global\let\maketitle\relax
    \global\let\degrees\relax
    \global\let\@degrees\@empty
    \global\let\degree\relax
    \global\let\@degree\@empty
    \global\let\school\relax
    \global\let\@school\@empty
    \global\let\thanks\relax
    \global\let\@thanks\@empty
    % keep \@author, \@date, \@title, \@year etc.
    % for committee signature & abstract pages.
}}

%%--------------------------------------------------------------------------
%%	COMMITTEE SIGNATURE PAGE
%%--------------------------------------------------------------------------
%% Macros for Ph.D./M.S. COMMITTEE SIGNATURE PAGE
%
% Usage:
%	\begin{committeesignature}[5]	% begins the committee signature page
%					  for 5 committee members.
%	\advisor{name, title}		% prints advisor's signature line \@advisor
%	\chairperson{name, title}	% synonym to \advisor (\@chairperson = \@advisor)
%
%	[\coadvisor{name, title}]	% prints coadvisor's signature line [optional]
%	[\cochairperson{name, title}]	% synonym to \coadvisor [optional]
%
%	\committeemember{name, title}
%
%	... (as many as you want) ...
%
%	\committeemember{name, title}
%
%	\end{committeesignature}	% ends the committee signature page
%
%   For M.S. Thesis,
%	\begin{committeesignature}
%	\advisor{Prof. Foo Bar, Ph.D.}
%	\end{committeesignature}
%
%   For Ph.D. Thesis,
%	\begin{committeesignature}[4]	    % 4 committee members.
%	\advisor{Prof. Foo Bar, Ph.D.}
%	\committeemember{Prof. Abc Def, Ph.D.}
%	\committeemember{Prof. Xyz Uvw, Ph.D.}
%	\committeemember{Prof. Bar Foo, Ph.D.}
%	\end{committeesignature}
%
\newenvironment{committeesignature}[1][5]
   {\baselineskip 18pt
    \if@twocolumn
	\@restonecoltrue
	\onecolumn
    \else
	\clearpage
	\@restonecolfalse
    \fi
    \if@proposal\else
	\typeout{ COMMITTEE SIGNATURE PAGE }
	\@makeschapterhead{COMMITTEE SIGNATURE PAGE}
	\vspace{12pt}
	\if@msthesis\vspace{24pt}\fi
	\if@phdthesis
	    \vspace{-30pt}
	    \begin{center}
		This dissertation was presented\\[4pt]
		by\\[4pt]
		\underline{\quad\@author\quad}\\[12pt]
		It was defended on\\[4pt]
		\underline{\quad\@date\quad}\\[10pt]
		and approved by
		\ifnum#1>5\\[36pt]	    % 6 members
		\else\ifnum#1>4\\[36pt]     % 5
		\else\ifnum#1>3\\[54pt]     % 4
		\else\\[72pt]\fi\fi\fi	    % 3 or less
	    \end{center}
	\fi
    \fi
    \if@pittstd
	\ifnum#1>5\def\tempskip{-16pt}	    % 6 members
	\else\ifnum#1>4\def\tempskip{0pt}   % 5
	\else\ifnum#1>3\def\tempskip{4pt}   % 4
	\else\def\tempskip{8pt}\fi\fi\fi    % 3 or less
    \else
	\ifnum#1>5\def\tempskip{-12pt}	    % 6 members
	\else\ifnum#1>4\def\tempskip{5pt}   % 5
	\else\ifnum#1>3\def\tempskip{10pt}  % 4
	\else\def\tempskip{15pt}\fi\fi\fi   % 3 or less
    \fi
   } {}

\if@phdthesis	    % if Ph.D. thesis
%%--------------------------------------------------------------------------
% Ph.D. Committee Signatures
%%--------------------------------------------------------------------------
  \def\@authortitle{Ph.D.}  % Author's title
  \def\@chairperson{}	    % Chairperson's name (advisor)
  \def\@cochairperson{}     % co-chairperson's name
  \def\@committee{}	    % committee member name

  \def\chairpersonname#1{\def\@chairperson{#1}} % define name only
  \let\advisorname\chairpersonname

  \def\chairperson#1{\def\@chairperson{#1}\def\@committee{#1}
    \if@proposal\else
      \@phdcommittee{Chairperson}
    \fi}

  \def\cochairperson#1{\def\@cochairperson{#1}\def\@committee{#1}
    \if@proposal\else
      \@phdcommittee{Co-chairperson}
    \fi}

  \let\advisor\chairperson
  \let\@advisor\@chairperson
  \let\coadvisor\cochairperson
  \let\@coadvisor\@cochairperson

  \def\committeemember#1{\def\@committee{#1}
    \if@proposal\else
      \@phdcommittee{Member}
    \fi}

  \if@proposal\else
    \def\@phdcommittee#1{
	\begin{tabbing}
	  (Signature) \= \@signedrule{5in} \\[-0.5ex]	% set tab by \=
		      \> Committee {#1} \\[-0.7ex]	% move to tabs.
		      \> \@committee \\[\tempskip]
	\end{tabbing}
      }
  \fi
\else	    % if not Ph.D. thesis
%%--------------------------------------------------------------------------
% M.S. Committee Signatures
%%--------------------------------------------------------------------------
  \if@pitteng
    \def\@authortitle{M.S.}
  \else
    \def\@authortitle{M.A.}
  \fi
  \def\@advisor{}
  \def\advisorname#1{\def\@advisor{#1}} 	% define name only

  \def\advisor#1{\def\@advisor{#1}\def\@committee{#1}
    \if@proposal\else
      \@mscommittee{Advisor}
    \fi}
  \def\@coadvisor{}
  \def\coadvisor#1{\def\@coadvisor{#1}\def\@committee{#1}
    \if@proposal\else
      \@mscommittee{Co-advisor}
    \fi}
  \def\@committee{}
  \def\committeemember#1{\def\@committee{#1}
    \if@proposal\else
      \@mscommittee{Committee Member}
    \fi}

  \let\chairperson\advisor
  \let\@chairperson\@advisor
  \let\cochairperson\coadvisor
  \let\@cochairperson\@coadvisor
  \let\chairpersonname\advisorname

  \if@proposal\else
    \def\@mscommittee#1{
      \begin{tabbing}
	  \hspace{2.5in} \= \hspace{0.9in} \= \kill	% set tabs by \=
	  {\@committee} \\[-2.5ex]
	  \@signedrule{2.5in} \> \> \@signedrule{2.5in} \\[-.5ex]  % move to tabs.
	  {#1}		      \> \> Signature \\
      \end{tabbing}
    }
  \fi
\fi

\def\authortitle#1{\def\@authortitle{#1}}

%%--------------------------------------------------------------------------
%%  ABSTRACT PAGE
%%--------------------------------------------------------------------------
\renewcommand\abstract{{
    \baselineskip 18pt
    \typeout{ ABSTRACT }
    \if@twocolumn
	\@restonecoltrue
	\onecolumn
    \else
	\clearpage
	\@restonecolfalse
    \fi
    \null		% \null itself has a line space + extra
    \if@pitteng
	\vspace{1in}
    \fi
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \@makeschapterhead{ABSTRACT}
    \vskip 1em
    \if@proposal\else		% if not proposal (i.e. thesis)
	\noindent\hspace{3in}\raisebox{0.75ex}{Signature} \signedrule\par
	\settowidth{\stringlen}{Signature}%
	\if@phdthesis
	    \if{\@chairperson}{}\else
		\vspace*{-2ex}\noindent\hspace{3in} \hspace{\stringlen} \@chairperson\par
	    \fi
	\else
	    \if{\@advisor}{}\else
		\vspace*{-2ex}\noindent\hspace{3in} \hspace{\stringlen} \@advisor\par
	    \fi
	\fi
	\nobreak %
	\vspace*{2.5ex} %
	\begin{center}
	    \textbf{{\@title}} \par \vspace{5ex}
	    {\@author} \if{\@authortitle}{}
	    \else{,\ \@authortitle} \fi \par
	    \if@pitteng 		    % Pitt Engineering
		{\@university} \par
	    \else			    % Pitt Standard
		{\@university, \@year} \par
	    \fi
	\end{center}
	\vspace*{2ex}
    \fi
}}

% The macros for the  ACKNOWLEDGEMENTS and FOREWORDS

\def\acknowledgments{\chapter*{ACKNOWLEDGMENTS}}
\def\forewords{\chapter*{FOREWORDS}}
\def\preface{\chapter*{PREFACE}}
\let\acknowledgements\acknowledgments

%    ****************************************
%    *		 INITIALIZATION 	    *
%    ****************************************
%
% Default initializations

\newlength\stringlen	    % To measure string length: \settowidth{\stringlen}{text string}
			    % Used in pitteng.clo to align texts by \hspace{\stringlen}

\input{pitt\@pitthesis.clo}

\AtBeginDocument{%
  \baselineskip \@pitthesislinespacing	% default line spacing is 1.5 lines.
  \parskip 4pt plus 10pt	% the distance between paragraphes
  \clubpenalty4000		% To remove orphan (single line at bottom of page) and
  \@clubpenalty \clubpenalty	% widow (single line at top of page).
  \widowpenalty4000%		% -- Wonkoo Kim (wkim+@pitt.edu)
  \onecolumn			% start thesis in one column even if twocolumn was chosen.
}

\gdef\@university{University of Pittsburgh}

\proposal{Ph.D. Dissertation Proposal}

\endinput
%%
%% End of file `pitthesis.cls'.
