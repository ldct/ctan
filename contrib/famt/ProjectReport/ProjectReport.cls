 \NeedsTeXFormat{LaTeX2e}
 \ProvidesClass{ProjectReport}[2012/02/24 FAMT Project Report]

% Allow the inclusion of graphics
\ifx\pdfoutput\undefined
% we are running LaTeX, not pdflatex
\usepackage{graphicx}
\else
% we are running pdflatex, so convert .eps files to .pdf
\usepackage[pdftex]{graphicx}
\usepackage{epstopdf}
\fi
   
% Declare some variables to hold the text fields 

    \newcommand{\Title}[1]{\gdef\FAMTField@Title{#1}}
    \newcommand{\Protitle}[1]{\gdef\FAMTField@Protitle{#1}}
    \newcommand{\deptname}[1]{\gdef\FAMTField@deptname{#1}}
    \newcommand{\dept}[1]{\gdef\FAMTField@dept{#1}}
    \newcommand{\degree}[1]{\gdef\FAMTField@degree{#1}}
    \newcommand{\university}[1]{\gdef\FAMTField@university{#1}}
    \newcommand{\MemberA}[1]{\gdef\FAMTField@MemberA{#1}}
    \newcommand{\MemberB}[1]{\gdef\FAMTField@MemberB{#1}}
    \newcommand{\MemberC}[1]{\gdef\FAMTField@MemberC{#1}}
    \newcommand{\MemberD}[1]{\gdef\FAMTField@MemberD{#1}}
    \newcommand{\RegA}[1]{\gdef\FAMTField@RegA{#1}}
    \newcommand{\RegB}[1]{\gdef\FAMTField@RegB{#1}}
    \newcommand{\RegC}[1]{\gdef\FAMTField@RegC{#1}}
    \newcommand{\RegD}[1]{\gdef\FAMTField@RegD{#1}}
    \newcommand{\Year}[1]{\gdef\FAMTField@Year{#1}}
    \newcommand{\Month}[1]{\gdef\FAMTField@Month{#1}}
    \newcommand{\Guidename}[1]{\gdef\FAMTField@Guidename{#1}}   
    \newcommand{\Collegename}[1]{\gdef\FAMTField@Collegename{#1}}
    \newcommand{\Certificate}[1]{\gdef\FAMTField@Certificate{#1}}

% Code for printing month
     \usepackage{ifthen}
     \newcommand{\monthnum}[1]%
{%
\ifthenelse{\equal{#1}{1}}{\Month{January}}{}%
\ifthenelse{\equal{#1}{2}}{\Month{February}}{}%
\ifthenelse{\equal{#1}{3}}{\Month{March}}{}%
\ifthenelse{\equal{#1}{4}}{\Month{April}}{}%
\ifthenelse{\equal{#1}{5}}{\Month{May}}{}%
\ifthenelse{\equal{#1}{6}}{\Month{June}}{}%
\ifthenelse{\equal{#1}{7}}{\Month{July}}{}%
\ifthenelse{\equal{#1}{8}}{\Month{August}}{}%
\ifthenelse{\equal{#1}{9}}{\Month{September}}{}%
\ifthenelse{\equal{#1}{10}}{\Month{October}}{}%
\ifthenelse{\equal{#1}{11}}{\Month{November}}{}%
\ifthenelse{\equal{#1}{12}}{\Month{December}}{}%
}

% Initialize the variables to their default values

    \Title{A project report on}
    \Protitle{}
    \deptname{Information Technology}
    \dept{Department of Information Technology}
    \degree{Bachelor of Engineering}
    \MemberA{} \MemberB{} \MemberC{} \MemberD{}
    \RegA{} \RegB{} \RegC{} \RegD{}
    \Year{\number \year}
    \Guidename{}
    \Collegename{Finolex Academy of Management and Technology, Ratnagiri}
    \Certificate{CERTIFICATE}
    \university{Mumbai}
   \monthnum{4}

% Define the preliminary page layouts using the variables

% Defining title page
    \newcommand{\FAMTtitlepage}{
        \thispagestyle{empty}
        {  
        \centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}
      \parbox[t]{6in}{\centering \Large\FAMTField@Title} \\[\baselineskip]       
      \LARGE{\textbf{\FAMTField@Protitle}} \\[\baselineskip] \normalsize
      \Large
      \vspace{0.2cm}
      \textit{submitted in partial fulfillment of the \\ requirements for the degree of}\\[\baselineskip]
      \vspace{0.2cm}
      \textbf{\FAMTField@degree} \linebreak
      \textit{in} \linebreak
      \textbf{ \FAMTField@deptname} \\[\baselineskip]
      \textit{by} \\[\baselineskip]
\begin{table}[h]
\centering
\begin{tabular}{lr}
\textbf{\Large{\FAMTField@MemberA}} & \textbf{\Large{\FAMTField@RegA}} \tabularnewline
\textbf{\Large{\FAMTField@MemberB}} & \textbf{\Large{\FAMTField@RegB}} \tabularnewline
\textbf{\Large{\FAMTField@MemberC}} & \textbf{\Large{\FAMTField@RegC}} \tabularnewline
\textbf{\Large{\FAMTField@MemberD}} & \textbf{\Large{\FAMTField@RegD}} \tabularnewline 
\end{tabular}
\end{table}
       \textit{under the guidance of} \linebreak
        \textbf{\textup{\FAMTField@Guidename}} \\[\baselineskip]
        \vspace{0.2cm}
        \includegraphics[width=0.25 \textwidth]{logo}\\[\baselineskip]
        \vspace{0.2cm}
        \FAMTField@dept \linebreak
        \FAMTField@Collegename \linebreak
        \mbox{\FAMTField@Month \hspace{0.1cm} \FAMTField@Year} \\[\baselineskip]
        }
        \clearemptydoublepage
      }

% Defining certificate page

      \newcommand{\FAMTcertificatepage}{
        \thispagestyle{empty}
        {\centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{CertificatePage}{bm:Certificate}
        \parbox[t]{6in}{\centering \Large{\underline{\FAMTField@Certificate}}\par}\\[\baselineskip] 
      \normalsize \large
      The report titled \linebreak
      \LARGE{\textbf{\FAMTField@Protitle}} \\[\baselineskip] \normalsize \large
      \textit{duly completed by}\\[\baselineskip]      
\begin{table}[h]
 \centering
 \begin{tabular}{lr}
\textbf{\Large{\FAMTField@MemberA}} & \textbf{\Large{\FAMTField@RegA}} \\
\textbf{\Large{\FAMTField@MemberB}} & \textbf{\Large{\FAMTField@RegB}} \\
\textbf{\Large{\FAMTField@MemberC}} & \textbf{\Large{\FAMTField@RegC}} \\
\textbf{\Large{\FAMTField@MemberD}} & \textbf{\Large{\FAMTField@RegD}} \\
 \end{tabular}
 \end{table}
       \textit{as a partial fulfillment of the \\ requirements for the degree of}\\[\baselineskip]
       \textbf{\FAMTField@degree} \linebreak
       \textit{in} \linebreak
       \textbf{\FAMTField@deptname} \\[\baselineskip]
       \textit{from} \linebreak  
       \textbf{The University of \FAMTField@university}
\vfill
\begin{table}[h]
\centering
\begin{tabular}{ccc}
\tabularnewline \tabularnewline \tabularnewline
\large{\FAMTField@Guidename} \\ \large{(Project Guide)} & \hspace*{1cm}  \large{(Internal Examiner)} \hspace*{1cm} & \large{(External Examiner)} 
\tabularnewline \tabularnewline \tabularnewline \tabularnewline \tabularnewline
\large{(H.O.D.)} &  & \large{(Principal)} 
\tabularnewline
 \end{tabular}
 \end{table}
\begin{flushleft}
Date: \linebreak
Place: \FAMTField@dept, \\
\hspace{1.2cm} \FAMTField@Collegename
\end{flushleft} 
       }
       \clearemptydoublepage
      }
        
% Define the macro for making preliminary pages

     \newcommand{\makepreliminarypages}{
        \singlespace
        \changepage{0.8in}{}{}{}{}{}{-0.2in}{-0.3in}{}
        \FAMTtitlepage
        \FAMTcertificatepage
        \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}   
        \changepage{-0.5in}{}{}{}{}{}{0.2in}{0.3in}{}
        \doublespace
    }

    \usepackage{xifthen} % Default Argument is Empty
    % \newcommand{\optarg}[1]{\ifthenelse{\isempty{#1}}{}{#1}}
    
    % College name is other than Finolex Academy of Management and Technology
    \newcommand{\College}[1]{\ifthenelse{\isempty{#1}}{}{\Collegename{#1}}}
    
    % Department name is other than Information Technology
    \newcommand{\Department}[1]{\ifthenelse{\isempty{#1}}{}{\deptname{#1} \dept{#1}}}

    % Degree name is other than Bachelor of Engineering
    \newcommand{\Degree}[1]{\ifthenelse{\isempty{#1}}{}{\degree{#1}}}

    % University name is other than University of Mumbai
    \newcommand{\University}[1]{\ifthenelse{\isempty{#1}}{}{\university{#1}}}


% A command to handle single sided preliminary pages in a double sided environment

% Define the '\clearemptydoublepage' command to clear pages but not number any blank pages inserted.
    \let\cle@rdoublep@ge\cleardoublepage
    \newcommand{\cle@remptydoublep@ge}{
      \clearpage
      \if@twoside
      \ifodd\c@page\else
      \fi\fi
      {\pagestyle{empty}\cle@rdoublep@ge}}
    \newcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}

% Load the class and needed packages
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
    \ProcessOptions
    \relax
    \LoadClass[a4paper,12pt,oneside]{book}
    \RequirePackage{changepage}

% A couple of useful macros for line spacing

% The \singlespace macro switches to single spaced lines
\newcommand{\singlespace}{\par\renewcommand{\baselinestretch}{1}\small\normalsize\par}

% The \doublespace macro switches to double spaced lines
\newcommand{\doublespace}{\par\renewcommand{\baselinestretch}{1.66}\small\normalsize\par}

% This package allows you to specify the 4 margins without needing to remember the particular page dimensions commands
\usepackage[top=1.4in, bottom=1.1in, left=1.3in, right=1.1in]{geometry}

% Redefine the Table of Contents to deal with some blank page
% and bookmarking issues relating to ETD submission
    \let\TEMPtableofcontents\tableofcontents
    \renewcommand{\tableofcontents}{
      \clearemptydoublepage
      \singlespace
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Table of Contents}
      \TEMPtableofcontents
      \clearemptydoublepage
      \doublespace
    }

% Redefine the List of Figures to deal with some blank page
% and bookmarking issues
    \let\TEMPlistoffigures\listoffigures
    \renewcommand{\listoffigures}{
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{List of Figures}
      \TEMPlistoffigures
    }

% Redefine the Bibliography to deal with a bookmarking issues
    \let\TEMPbibliography\bibliography
    \renewcommand{\bibliography}{\clearemptydoublepage
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Bibliography}
      \TEMPbibliography
    }

% These packages typeset the thesis with Times Roman font
\usepackage[T1]{fontenc}
\usepackage{mathptmx}

% The fancyhdr package allows to easily customize page header.
% The settings below produce a nice, well separated header.
\usepackage{fancyhdr}
  \fancyhead{}
  \fancyhead[RO,RE]{\slshape \rightmark}
  \fancyfoot{}
  \fancyfoot[CO,CE]{\thepage}
  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{\chaptername \ \thechapter \ \ #1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection \ \ #1}}

% The caption package allows you to change the formatting of figure captions.
% The commands here change to the suggested caption format:
% single spaced and a bold tag
\usepackage[margin=0.3in,labelfont=bf,labelsep=none]{caption}
 \DeclareCaptionFormat{suggested}{\singlespace#1#2 #3\par\doublespace}
 \captionsetup{format=suggested}

% The hyperref package provides automatic linking and
% bookmarking for the table of contents, index, equation
% references, and figure references.  It must be included for
% the FAMT class to make a properly functioning
% electronic thesis.  It should be the last package loaded if
% possible.
%
% To add a bookmark in the pdf you can use \pdfbookmark.  
% You can look up its usage in hyperref package documentation
\usepackage[bookmarksnumbered,pdfpagelabels=true,plainpages=false,colorlinks=true,linkcolor=black,citecolor=black,urlcolor=blue]{hyperref}
\urlstyle{rm}
\doublespace