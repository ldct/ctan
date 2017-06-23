%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
% lion-msc.cls                                                                %
%                                                                             %
% A LaTeX document class for preparing a bachelor/master thesis according to  %
% the specifications of the Leiden Institute of Physics (LION),               %
% Leiden University, The Netherlands                                          %
%                                                                             %
%  Original version written by: Michiel de Dood                               %
%                               Leiden Institute of Physics                   %
%                               Leiden University                             %
%                               Niels Bohrweg 2                               %
%                               2333 CA, Leiden, The Netherlands              %
%                                                                             %
%      Please report errors to: Michiel de Dood                               %
%                       e-mail: dood@physics.leidenuniv.nl                    %
%                    telephone: +31-(0)71.527.5929                            %
%                                                                             %
% Permission to copy all or part of this work is granted, provided            %
% that the copies are not made or distributed for resale.                     %
%
% This file may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in:
%
%    http://www.latex-project.org/lppl.txt
%
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/06/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Considerations:
% 1. use the ifpdf package to make class a bit more robust?
% 2. add metadata to pdf?
% see http://www.howtotex.com/tips-tricks/adding-pdf-metadata-in-latex/
% \usepackage{ifpdf}
% \ifpdf
% \pdfinfo{
%    /Author (Author Name)
%    /Title (Adding PDF metadata in LaTeX)
%    /Keywords (PDF;LaTeX;howtoTeX.com) }
% \fi
% 4. potential problem with double line spacing option on title pages.

\typeout{}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lion-msc}[2017/03/17 v0.27]
\typeout{}
\typeout{Leiden Institute of Physics thesis class - version 0.27}
\typeout{}
\typeout{Copyright (c) 2014 Michiel de Dood}
\typeout{Please send questions, comments, additions, complaints to:}
\typeout{dood@physics.leidenuniv.nl}
\typeout{}

% The following are default options that are passed on to the documentclass

% == start : draft and final options
% Option [double] (default) - sets a double line spacing for easy commenting
% Option [single]           - single line spacing for final report

\def\mystretch{1.5}		% This is the default option, sets double line spacing
                        % if nothing is specified \mystretch is still defined
\DeclareOption{double}{}	% When [double] is specified do nothing
\DeclareOption{single}{	% This option creates the final version
    \typeout{single linespacing}
    \def\mystretch{1}}	

% Note that the linespacing is set after the \Loadclass command!
% == ** continued after \Loadclass

% A Master or Bachelor thesis is very similar to a report. The report class
% is a basic class that should be compatible with many options

\typeout{loading report class}

% Suspicious code. I cannot overule any of these values that are intended to
% be the default option. In particular the 12pt option...

\PassOptionsToClass{a4paper}{report}
\PassOptionsToClass{fleqn}{report}
\PassOptionsToClass{openright}{report}

% 14-03-2017 Michiel de Dood
% PassOptionsToClass or ExecuteOptions forces the 12 pt font size onto the
% user. This is unintended behavior, but the report class uses 10 pt font
% as a default, which is fairly small font
% http://tex.stackexchange.com/questions/40893/how-to-set-default-font-size-in-latex-cls-file

\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[\@@ptsize]{report}

% == continue : draft and final options
\def\baselinestretch{\mystretch}	% This sets the line spacing
% == end : double and single options

% A number of packages are provided with the class to minimize potential
% issues with the use of commands. This is equivalent to \usepackage in the
% tex file.

% Use the natbib package to take care of citations. Place citations between
% square brackets, comma separated, and sort and combine multiple references.
% This should resemble a citation used by the APS.

% 10-01-2014 adding the numbers option to natbib seems to avoid the following:
%            'natbib error bibliography not compatible with author-year citations'
%            thanks to http://tex.stackexchange.com/questions/54480
\RequirePackage[square,comma,sort&compress,numbers]{natbib}

% 10-04-2014 added input encoding. Thanks to Merlijn van Deen
%           This allows to use non-ascii input character, e.g. � instead of \"o
% 14-03-2017 added latin9 as option to ensure compatibility with LyX for unknown
%           reasons. Thanks to Vasco Tenner
\RequirePackage[utf8,latin9]{inputenc}

% Font selection
% \RequirePackage{mathptmx}
\RequirePackage{mathpazo}   % Just to make it look less like a Word document

% Special AMS symbols for displaying math
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% insertion of graphics
\RequirePackage[pdftex]{graphicx}

% styling of captions using the captions package
% 28/03/2014 removed the small (0.5cm) margin for the figure captions
% 22/05/2014 added hypcap option as suggested by Casper Remeijer
% 08/07/2013 corrected sl,small override - Tobias de Jong and David Kok
\RequirePackage[margin=0cm,font={small,sl},labelfont={bf,sl},tableposition=top,singlelinecheck=false,hypcap]{caption}

% Use US english (default) hyphenation rules and provide dutch as an option
\RequirePackage[dutch,USenglish]{babel}

% For standard formatting of dates I use the datetime package
% It is important to load this package AFTER the babel package
\RequirePackage[us,nodayofweek]{datetime}

% The calc package allows to specify lengths etc. as an arithmetic expression
\RequirePackage{calc}

% Colored text
\RequirePackage{xcolor}
			% used to be color package, but this gives conflicts with user packages
			% reported by Casper Remeijer June 9, 2016

\definecolor{mygrey}{gray}{0.5}
\definecolor{lionblue}{RGB}{0,43,127} % The official color, thanks to Ferry Besamusca

% Consistent section styling
% \RequirePackage{sectsty}
% \allsectionsfont{\sffamily} % changed 26/03/2014 avoid mixing of fonts

% Chapter styling
\RequirePackage[Lenny]{fncychap} % consider titlesec as alternative
\ChRuleWidth{1pt}

% Enable fancy headers
\RequirePackage{fancyhdr}

% Formatting tools for the title
\RequirePackage{titling}

% 09/07/2014 Redefine the \cleardoublepage command to get completely empty pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi}


% == start : define several variables to be placed on the titlepage
\gdef\@studentid{\color{red}use $\backslash$\texttt{studentid\{\ldots\}} to define}
\gdef\@abstract{\color{red}Please use $\backslash$\texttt{abstract\{\ldots\}} to define an abstract in the document preamble.}
\gdef\@supervisor{\color{red}use $\backslash$\texttt{supervisor\{\ldots\}} to define}
\gdef\@corrector{\color{red}use $\backslash$\texttt{corrector\{\ldots\}} to define}
\gdef\@affiliation{\color{black}Huygens-Kamerlingh Onnes Laboratory, Leiden University}
\gdef\@address{\color{black}P.O. Box 9500, 2300 RA Leiden, The Netherlands}
\gdef\@degree{\color{black}Bachelor of Science}
\gdef\@major{\color{black}Physics}

\def\studentid#1{\gdef\@studentid{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\corrector#1{\gdef\@corrector{#1}}
\gdef\affiliation#1{\gdef\@affiliation{#1}}
\gdef\address#1{\gdef\@address{#1}}
\gdef\degree#1{\gdef\@degree{#1}}   % 22/05/2014 corrected mix-up of degree and major: Error spotted by Leandros Talman
\gdef\major#1{\gdef\@major{#1}}

\gdef\theauthor{\@author}

% Optional cover picture
\def\coverpicture#1{\gdef\@coverpicture{#1}\cover@picturetrue}
% New if construct:             Default condition:
\newif\ifcover@picture          \cover@picturefalse


% == start : title page using titling package

% shift the title up a little compared to the standard definition
\setlength{\droptitle}{-4cm}

\pretitle{ % this is inserted before the title.
    \pagestyle{empty}
    \begin{center}
        \color{lionblue}
        \vskip 1em
        \includegraphics[width=2.5cm]{lion-msc-logo.pdf}
        \color{lionblue}
        \noindent\rule{\textwidth}{0.4mm}
        \vskip 0.5em
        \huge
}

\posttitle{
        \noindent\rule{\textwidth}{0.4mm}
        \vfill
        \ifcover@picture
         \@coverpicture
        \fi
        \vfill
        \vskip 1em
    \end{center}

    \begin{center}
        \begin{minipage}[b]{.75\textwidth}
            \color{black}
            \begin{center}
                \normalsize
                \textsc{Thesis} \\ \vskip 0.5em
                submitted in partial fulfillment of the \\
                requirements for the degree of \\ \vskip 0.5em
                \textsc{\@degree} \\
                in \\
                \textsc{\@major} \\ \vskip 0.5em
            \normalsize
            Author :             \hfill {\@author} \\
            Student ID :         \hfill {\@studentid} \\
            Supervisor :         \hfill {\@supervisor} \\
            2$^{nd}$ corrector : \hfill {\@corrector}
            \par
            \vskip 1em
            Leiden, The Netherlands, \@date
            \end{center}
        \end{minipage}
    \end{center}
    \cleardoublepage
}

\preauthor{
    \thispagestyle{empty}
    \begin{center}
        \Huge \@title \\
        \vskip 1 em
        \color{black}
        \large \bf
}

\postauthor{
    \end{center}
    \begin{center}
        \normalsize \@affiliation \\ \@address
        \lineskip 0.5em
        \par
    \end{center}
}

\predate{
    \begin{center}
        \normalsize
}

\postdate{
    \end{center}
    \begin{center}
            \vskip 1 em
            \color{black} \large \textbf{Abstract}
    \end{center}
    \vskip 1em
    \normalsize \@abstract
    \vfill
}

% Changed the alignment of the abstract. The centering is plain ugly
% Following comments of Casper Remeijer
\postdate{
    \end{center}
    \begin{center}
    \vskip 1 em
    \color{black} \large \textbf{Abstract} \\
                \vskip 1em
                \normalsize \@abstract
    \end{center}
    \vfill
}
% == end   : title page using titling package

% == start : pagesize commands
% note: a4 = 297x210 mm, letter = 280x216 mm

% \setlength{\textwidth}{160mm}   % used to be 160
% \setlength{\textheight}{240mm}  % used to be 240

% Now we need to set margins and headers to center the page on the paper.
% This can be done with a little help of the calc package.

% \setlength{\oddsidemargin}{(\paperwidth-\textwidth)/2-1in}
% \setlength{\evensidemargin}{(\paperwidth-\textwidth)/2-1in}

% \setlength{\topmargin}{(\paperheight-\textheight-\headheight-\headsep-\footskip)/2-1in}
% == end   : pagesize commands

% == start : Bibliography name changed to References

%% Small caps References as labels for page headers
%% added \itemsep command to adjust vertical space between references
%% IMPORTANT NOTE: The references consist of one big list with many \bibitems...
%% VERY IMPORTANT: \def\bibname should be within the thebibliography environment.
%%                 It seems to be defined elsewhere as well (BibTeX?)
%\newdimen\bibindent
%\setlength\bibindent{1.5em}
%\renewenvironment{thebibliography}[1]
%    {\def\bibname{References}
%     \chapter*{\bibname
%        \@mkboth{\textsc\bibname}{\textsc\bibname}}%
%      \list{\@biblabel{\@arabic\c@enumiv}}%
%           {\itemsep 0em
%            \settowidth\labelwidth{\@biblabel{#1}}%
%            \leftmargin\labelwidth
%            \advance\leftmargin\labelsep
%            \@openbib@code
%            \usecounter{enumiv}%
%            \let\p@enumiv\@empty
%            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
%      \sloppy
%      \clubpenalty4000
%      \@clubpenalty \clubpenalty
%      \widowpenalty4000%
%      \sfcode`\.\@m}
%     {\def\@noitemerr
%       {\@latex@warning{Empty `thebibliography' environment}}%
%      \endlist}
%% == end   : Bibliography name changed to References

% == start : appearance of footnotes
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
% == end   : appearance of footnotes

% == start : remove dots in TOC.
\renewcommand{\@dotsep}{10000} %% Default value is 4.5
% == end   : remove dots in TOC

% == start : definition of headers
% 28/03/2014 - removed font change in the headers and footers.


\pagestyle{fancy} % 10/04/2014 I moved this up into the creation of the title.
                  % 09/07/2014 and I placed it back because it doesn't work!

\renewcommand{\chaptermark}[1]{\markboth{\small \textit{#1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\small \textit{\thesection{} #1}}}

%\renewcommand{\sectionmark}[1]{}

\fancyhf{}
\fancyfoot[CE,CO]{\vskip 5mm \scriptsize{\color{mygrey}Version of \@date -- Created \today~-~\currenttime}}
\fancyfoot[RO,LE]{\thepage}
\fancyhead[RO,LE]{\thepage}
\fancyhead[LO]{\rightmark}
\fancyhead[RE]{\leftmark}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
\addtolength{\headheight}{2.5pt}
\fancypagestyle{plain}{%
    \fancyhead{}
    \renewcommand{\footrulewidth}{0pt}
    \renewcommand{\headrulewidth}{0pt}
}
% == end   : definition of headers

% Make references etc. available as hyperlinks.
% 10-01-2014 [hidelinks] option with thanks to Vasco Tenner
% 11-10-2014 Move this all the way to the end so that appendices work. Thanks to Thomas Ruytenberg
% 13-03-2016 Suggestion by Max Snijders to add pdfusetitle to the options of hyperref
%            This adds metadata to the PDF File
\RequirePackage[pdfusetitle,hidelinks]{hyperref}
