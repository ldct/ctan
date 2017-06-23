%
% $Id: FUbeamer.cls 174 2015-08-14 18:55:52Z herbert $
%
%%
%% Praesentationen mit LaTeX
%%
%% Copyright (C) 2009-15 Herbert Voss <hvoss@tug.org>
%%
%% It may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%%
%% See http://www.latex-project.org/lppl.txt for details.
%%
%
\ProvidesClass{FUbeamer}[2015/08/14 v0.02a Vorlage Freie Universitaet Berlin (hv)]
%
\PassOptionsToPackage{ngerman}{babel}
\PassOptionsToPackage{table}{xcolor}
\PassOptionsToPackage{bookmarks,colorlinks}{hyperref}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[profesionalfonts,covered]{beamer}
\RequirePackage[T1]{fontenc}
\RequirePackage{babel}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage[scaled]{helvet}
%
\definecolor{FUblue}{RGB}{0,51,102}
\definecolor{FUgreen}{RGB}{153,204,0}
\definecolor{FUred}{RGB}{204,0,0}
\definecolor{FUorange}{RGB}{255,153,51}
\definecolor{FUgray}{gray}{0.6}
%
\setbeamersize{text margin left=15pt,text margin right=15pt}
%
\setbeamercolor*{frametitle}{fg=FUgray,bg=white}
\setbeamercolor*{normal text}{fg=black,bg=white}
\setbeamercolor*{alerted text}{fg=FUred,bg=white}
\setbeamercolor*{footline}{fg=FUblue,bg=white}
\setbeamercolor*{structure}{fg=FUred}
\setbeamercolor*{palette primary}{use=structure,fg=structure.fg,bg=}
\setbeamercolor*{palette secondary}{fg=FUblue,bg=}
\setbeamercolor*{separation line}{fg=FUblue}
\setbeamercolor*{example text}{fg=FUgreen,bg=}
\setbeamercolor*{block title}{use=structure,fg=structure.fg,bg=FUblue!20!bg}
\setbeamercolor*{block title alerted}{use=alerted text,fg=alerted text.fg,bg=alerted text.fg!20!bg}
\setbeamercolor*{block title example}{use=example text,fg=example text.fg,bg=example text.fg!20!bg}
\setbeamercolor*{block body}{parent=normal text,use=block title,bg=block title.bg!50!bg}
\setbeamercolor*{block body alerted}{parent=normal text,use=block title alerted,bg=block title alerted.bg!50!bg}
\setbeamercolor*{block body example}{parent=normal text,use=block title example,bg=block title example.bg!50!bg}

\setbeamerfont{tiny structure}{series=\mdseries,size=\tiny}
\setbeamerfont{title}{size=\Large,series=\bfseries}
\setbeamerfont*{author}{size=\normalsize,series=\bfseries}
\setbeamerfont{frametitle}{size=\large,series=\bfseries}
\setbeamerfont{framesubtitle}{size=\footnotesize}
\setbeamerfont*{footline}{series=\mdseries,size=\Tiny}
\setbeamerfont*{date}{size=\footnotesize}

\setbeamertemplate{itemize item}[default]
\setbeamertemplate{sections/subsections in toc}[ball]
\setbeamertemplate{headline}{}
\setbeamertemplate{navigation symbols}{}
%\setbeamertemplate{alerted text}[default]
\beamerdefaultoverlayspecification{<+-| alert@+>}
\def\beamer@andinst{\quad }

%\makeatletter
\setlength\textwidth{\paperwidth}
\addtolength\textwidth{-30pt}
\newlength\FU@image@width\setlength\FU@image@width{\textwidth}
\newlength\FU@image@height\setlength\FU@image@height{2.5cm}
\newlength\FU@rule\setlength\FU@rule{0.6pt}
%
\ifpdf
\pgfdeclareimage[height=1cm]{logo}{FULogo.png}
\else
\RequirePackage{graphicx-psmin}
\loadgraphics{FULogo.eps}
\pgfdeclareimage[height=1cm]{logo}{FULogo.eps}
\fi
\expandafter\pgfdeclareimage\expandafter[height=\the\FU@image@height]{bib}{FUbib.jpg}
\newlength\titlevsep\setlength\titlevsep{2mm}
\newsavebox\FU@box\savebox\FU@box{\pgfuseimage{bib}}
\mode
<all>
{
  \renewcommand\titlegraphic[2][]{%
    \edef\inserttitlegraphic{%
      \ifx\relax#2\relax\else
        \noexpand\includegraphics[height=\FU@image@height,width=\the\numexpr\textwidth-\wd\FU@box\relax sp,
          %viewpoint=0 0 \the\numexpr\FU@image@width-2\wd\FU@box\relax sp \FU@image@height,clip
          keepaspectratio=false,#1]{#2}%
      \fi}%
    }%
  \titlegraphic{}
}

\mode
<all>
{
  \newcommand\fachbereich[1]{\def\insertfachbereich{#1}}
  \fachbereich{}%
}

\defbeamertemplate*{title page}{FU}{%
  \vspace*{-0.5ex}
  ~\hfill\pgfuseimage{logo}\par
  \begingroup\fboxsep=0pt
  \colorbox{FUgray}{\makebox[\textwidth][l]{\rule{0pt}{\FU@image@height}\pgfuseimage{bib}%
    \inserttitlegraphic}}
  \endgroup
  \par\vfill
  {\usebeamerfont{title}\usebeamercolor[fg]{frametitle}\inserttitle}\\[\titlevsep]
  \ifx\insertsubtitle\@empty\else\vskip0.25em%
    {\usebeamerfont{subtitle}\insertsubtitle\par}%
  \fi%
  \par\vfill
  \begin{beamercolorbox}[sep=0pt]{author}
    {\usebeamerfont{author}\insertauthor}\\
    {\usebeamerfont{institute}\insertinstitute}
  \end{beamercolorbox}
  \par\vfill
  {\usebeamerfont{date}\usebeamercolor*[fg]{date}\insertdate%\rule[-.5ex]{0pt}{.5ex}
  }%
}

\defbeamertemplate{frametitle}{FU}{%
  \begin{beamercolorbox}[ht=4.25ex,dp=1ex]{headline}%
  \parbox{0.6\textwidth}{%
   \usebeamerfont*{frametitle}\usebeamercolor[fg]{frametitle}\insertframetitle}\hfill%
  \parbox{0.32\textwidth}{\pgfuseimage{logo}}\\
  {\usebeamercolor{separation line}\hspace*{-15pt}\rule{\paperwidth}{\FU@rule}}\par\vspace{-1.5ex}
  \end{beamercolorbox}}

\def\maketitle{\ifbeamer@inframe\titlepage\else\frame{\titlepage}\fi%
  \setbeamertemplate{frametitle}[FU]\setbeamertemplate{footline}[FU]}

\newcommand{\FU@footline}{%
  \mbox{}\insertfachbereich, \inserttitle, \insertdate 
  \hfill \insertframenumber/\inserttotalframenumber}

\defbeamertemplate{footline}{FU}{%
  \begin{beamercolorbox}[leftskip=15pt,rightskip=15pt,ht=2.5ex,dp=1ex]{footline}
  \hspace*{-15pt}{\usebeamercolor{separation line}\rule[1ex]{1.1\paperwidth}{\FU@rule}}\\
  \usebeamerfont{footline}\FU@footline\par
  \vspace{2ex}
  \end{beamercolorbox}%
}
%\makeatother


\endinput

