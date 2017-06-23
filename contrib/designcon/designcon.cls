%%
%% This is file `designcon.cls',
%% 
%% 
%%   Author: Peter J. Pupalaikis  (pete_pope  at hotmail dot com)
%%   Copyright 2012 Peter J. Pupalaikis
%%   Version 1.0
%% 
%%   This work may be distributed and/or modified under the
%%   conditions of the LaTeX Project Public License, either
%%   version 1.3 of this license or (at your option) any
%%   later version.
%%   The latest version of the license is in
%%      http://www.latex-project.org/lppl.txt
%%   and version 1.3 or later is part of all distributions of
%%   LaTeX version 2003/06/01 or later.
%% 
%%   This work consists of the files listed in the README file.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{designcon}%
  [2012/08/29 v0.0 DesignCon Class]
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
%\ProcessOptions
\LoadClass[12pt,twoside,american,nolist]{article}
\usepackage{fontspec}
\setmainfont[Mapping=tex-text]{Times New Roman}
\setsansfont[Mapping=tex-text]{Arial Black}
\usepackage[letterpaper]{geometry}
\geometry{verbose,tmargin=1in,bmargin=1in,lmargin=0.75in,rmargin=0.75in}

\makeatletter
\@ifundefined{date}{}{\date{}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User specified LaTeX commands.
\usepackage{fontspec}
\usepackage{xunicode}
\usepackage{xltxtra}
\usepackage{hyphenat}
\usepackage{import}
\usepackage{tikz}
\usepackage[nolist]{acronym}
\usepackage{fix-cm}
\usepackage[sf]{titlesec}

%\usepackage{lettrine}

%\input{DesignConInc.tex}
\newcommand\HUGE{\@setfontsize\Huge{36}{47}}
\newfontinstance\bigkanafont[Color=000000,Scale=3]{Arial Black}

\makeatother

\usepackage{xunicode}
\usepackage{polyglossia}
\setdefaultlanguage[variant=american]{english}

\makeatletter
\newcount\@authorinfonumber
\@authorinfonumber=0
\makeatother

\makeatletter
\def\setAuthorInfo#1{
\global\advance\@authorinfonumber by 1
\expandafter\edef\csname authorinfo \the\@authorinfonumber\endcsname{#1}}
\makeatother

\def\AuthorInfoList#1{%
\noindent {\Large \csname authorinfo #1\endcsname}}

\newcommand{\setHeading}{\def\designconHeading}
\newcommand{\setSkip}{\def\designconSkip}

\makeatletter
\newcommand{\designconTitlePage}{
%\pagestyle{title}
\pagenumbering{gobble}
\begin{titlepage}
\noindent {\bigkanafont \designconHeading}
%\vspace{3in}
\noindent \begin{flushleft}
\begin{sloppypar}
{\fontsize{36}{43}\selectfont \@title \par}
\end{sloppypar}
%\par
\end{flushleft}
\designconSkip
\AuthorInfoList{1} \\
\AuthorInfoList{2} \\
\AuthorInfoList{3} \\
\AuthorInfoList{4} \\
\AuthorInfoList{5} \\
\AuthorInfoList{6} \\
\AuthorInfoList{7} \\
\AuthorInfoList{8} \\
\end{titlepage}
\cleardoublepage
}
\makeatother

\renewcommand{\maketitle}{
\designconTitlePage
}

\newcommand{\designConPaperStart}{
\cleardoublepage{}
\pagenumbering{arabic}
}

\endinput
%%
%% End of file `designcon.cls'.
