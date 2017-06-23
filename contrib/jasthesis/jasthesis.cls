% Version 0.5
% 23rd May 2002 (jAs)
%
\typeout{ }
\typeout{You can probably use this in much earlier versions of LaTeX2e}
\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{jasthesis}[2002/05/22 v0.5 (www.jamesAshepherd.com)]
\RequirePackage{ifthen}

\typeout{ }
\typeout{jasthesis.cls 2002/05/22 v0.5 (www.jaemsAshepherd.com)}
\typeout{ }
\typeout{This LaTeX class conforms to the requirements of}
\typeout{a thesis to be submitted to the University of Bristol}
\typeout{that is, roughtly BS4821:1990}
\typeout{ }

\typeout{ }
\typeout{Checking for option 'jasheads' to have section numbering in the margin}
\newboolean{jas@heads} \setboolean{jas@heads}{false}
\DeclareOption{jasheads}{\renewcommand{\@seccntformat}[1]{{\protect\makebox[0pt][r]{\@nameuse{the#1}.~}}}
                         \setboolean{jas@heads}{true}}
\ProcessOptions*

\typeout{ }
\typeout{12pt text, A4 paper, twosided}
\LoadClass[12pt,a4paper,twoside]{book}

\typeout{ }
\typeout{linespacing set at 1.5}
\renewcommand{\baselinestretch}{1.5}

\typeout{ }
\typeout{Centre page number at bottom, left heading section, right heading chapter}
\typeout{Margins: Binding 40mm, others 20mm}
\let\jas@headings=\ps@headings
\newcommand{\ps@jasthesis}{\jas@headings
 \ifthenelse{\boolean{jas@heads}}{
  \renewcommand{\@evenhead}{\ifthenelse{\value{chapter}=0}{}{
                            \begin{minipage}{\textwidth}
                             \normalfont\bfseries\sffamily\chaptername~\thechapter~~\jas@eventext\hfill
                             \\[-1em]\rule{\textwidth}{0.6pt}
                            \end{minipage}}}
  \renewcommand{\@oddhead}{\ifthenelse{\value{chapter}=0}{}{
                           \begin{minipage}{\textwidth}
                            \normalfont\bfseries\sffamily\hfill\thesection~~\jas@oddtext
                            \\[-1em]\rule{\textwidth}{0.6pt}
                           \end{minipage}}}
 }
 {
  \renewcommand{\@evenhead}{\leftmark\hfill}
  \renewcommand{\@oddhead}{\hfill\rightmark}
 }{}
 \renewcommand{\@evenfoot}{\hfill\thepage\hfill}
 \renewcommand{\@oddfoot}{\@evenfoot}

 \setlength{\voffset}{-1in}
 \setlength{\hoffset}{-1in}
 \setlength{\oddsidemargin}{45mm}
 \setlength{\evensidemargin}{20mm}
  \ifthenelse{\boolean{jas@heads}}{
   \addtolength{\evensidemargin}{5mm}
   \setlength{\headheight}{1em}
   \setlength{\headsep}{2em}
  }{}
 \setlength{\topmargin}{\evensidemargin}
 \setlength{\textwidth}{\paperwidth} \addtolength{\textwidth}{-\oddsidemargin}
                                     \addtolength{\textwidth}{-\evensidemargin}
 \setlength{\textheight}{\paperheight} \addtolength{\textheight}{-2\topmargin}
                                       \addtolength{\textheight}{-\headheight}
                                       \addtolength{\textheight}{-\headsep}
}

\newcommand{\ps@jastitlepage}{\jas@headings
 \renewcommand{\@evenhead}{}
 \renewcommand{\@oddhead}{}
 \renewcommand{\@evenfoot}{}
 \renewcommand{\@oddfoot}{}

 \setlength{\headheight}{0mm}
 \setlength{\headsep}{\footskip}
 \setlength{\voffset}{-1in}
 \setlength{\hoffset}{-1in}
 \setlength{\oddsidemargin}{45mm}
 \setlength{\evensidemargin}{20mm}
 \setlength{\topmargin}{\evensidemargin}
 \setlength{\textwidth}{\paperwidth} \addtolength{\textwidth}{-\oddsidemargin}
                                     \addtolength{\textwidth}{-\evensidemargin}
 \setlength{\textheight}{\paperheight} \addtolength{\textheight}{-2\topmargin}
                                       \addtolength{\textheight}{-\headheight}
                                       \addtolength{\textheight}{-\headsep}
 \renewcommand{\baselinestretch}{1}
}

\ifthenelse{\boolean{jas@heads}}{
 \newcommand{\ps@jaschapter}{\jas@headings
  \renewcommand{\@evenhead}{}
  \renewcommand{\@oddhead}{}
  \renewcommand{\@evenfoot}{\hfill\thepage\hfill}
  \renewcommand{\@oddfoot}{\@evenfoot} 
 
  \setlength{\voffset}{-1in}
  \setlength{\hoffset}{-1in}
  \setlength{\oddsidemargin}{45mm}
  \setlength{\evensidemargin}{20mm}

  \addtolength{\evensidemargin}{5mm}
  \setlength{\headheight}{2\baselineskip}
  \setlength{\headsep}{2em}

  \setlength{\topmargin}{\evensidemargin}
  \setlength{\textwidth}{\paperwidth} \addtolength{\textwidth}{-\oddsidemargin}
                                      \addtolength{\textwidth}{-\evensidemargin}
  \setlength{\textheight}{\paperheight} \addtolength{\textheight}{-2\topmargin}
                                        \addtolength{\textheight}{-\headheight}
                                        \addtolength{\textheight}{-\headsep}
  \renewcommand{\baselinestretch}{1.5}
}
}{}
\pagestyle{jasthesis}

\newcommand{\jas@title}{}
\newcommand{\thesistitle}[1]{\renewcommand{\jas@title}{#1}}

\newcommand{\jas@subtitle}{}
\newcommand{\thesissubtitle}[1]{\renewcommand{\jas@subtitle}{#1}}

\newcommand{\jas@volume}{}
\newcommand{\thesisvolume}[1]{\renewcommand{\jas@volume}{#1}}

\newcommand{\jas@author}{}
\newcommand{\thesisauthor}[1]{\renewcommand{\jas@author}{#1}}

\newcommand{\jas@degree}{}
\newcommand{\thesisdegree}[1]{\renewcommand{\jas@degree}{#1}}

\newcommand{\jas@wordcount}{}
\newcommand{\thesiswordcount}[1]{\renewcommand{\jas@wordcount}{#1}}

\newcommand{\thesismaketitle}{
  \thispagestyle{jastitlepage}\addtocounter{page}{-2}
  \mbox{}\begin{minipage}[t][0mm]{\textwidth}
          \begin{center}\Huge\sffamily\bfseries\jas@title\end{center}
          \mbox{}
          \begin{center}\sffamily\bfseries\jas@subtitle\end{center}
          \mbox{}
          \begin{center}\sffamily\jas@volume\end{center}
         \end{minipage}
  \vfill
  \mbox{}\begin{minipage}{\textwidth}
           \begin{center}\Large\sffamily\jas@author\end{center}
         \end{minipage}
  \vfill
  \mbox{}\begin{minipage}[b][0pt]{\textwidth}
          \begin{center}
           \jas@degree
          \end{center}
          \hfill\jas@wordcount
         \end{minipage}
 \newpage\thispagestyle{jastitlepage}\mbox{}\pagebreak
}

\ifthenelse{\boolean{jas@heads}}{
 \newcommand{\jas@eventext}{}
 \newcommand{\jas@oddtext}{}

  \renewcommand{\section}[2][]{
  \ifthenelse{\equal{#1}{}}%
   {\renewcommand{\jas@oddtext}{#2}
    \@startsection{section}{0}{0pt}{-3.5ex plus -1ex minus -.2ex}{2.3ex plus .2ex}%
     {\normalfont\bfseries\Large}{#2}
   }
   {\renewcommand{\jas@oddtext}{#1}
    \@startsection{section}{0}{0pt}{-3.5ex plus -1ex minus -.2ex}{2.3ex plus .2ex}%
     {\normalfont\bfseries\Large}[#1]{#2}
   }
 }
}{}

\newcommand{\thesisabstract}[1]{
 \cleardoublepage
 \renewcommand{\baselinestretch}{1}\normalfont
 \mbox{}\vspace{6em}\\
 {\Huge\bfseries Abstract}
 \begin{quotation}#1\end{quotation}
 \par\renewcommand{\baselinestretch}{1.5}\normalfont
}

\newcommand{\thesisdedication}[1]{
 \cleardoublepage
 \renewcommand{\baselinestretch}{1}\normalfont
 \mbox{}\vspace{6em}\\
 {\Huge\bfseries Dedication and\\ Acknowledgements}
 \begin{quotation}\slshape#1\end{quotation}
 \par\renewcommand{\baselinestretch}{1.5}\normalfont
}

\newcommand{\thesisdeclaration}[1]{
 \cleardoublepage
 \renewcommand{\baselinestretch}{1}\normalfont
 \mbox{}\vspace{6em}\\
 {\Huge\bfseries Author's Declaration}
 \begin{quotation}
 #1
 ~\\~\\
 \makebox[0pt][r]{Signed:}\makebox[8cm]{~\dotfill}
 ~\\~\\
 \makebox[0pt][r]{Date:}\makebox[4cm]{~\dotfill}
 \end{quotation}
 \par\renewcommand{\baselinestretch}{1.5}\normalfont
}


\typeout{ }
\typeout{Ensuring contents page/list of figures/list of tables/titles is singlespaced}
\typeout{I'm afraid I can't see anyway of making the contents pages singleside}
% put \addtocontents{toc}{\cleardoublepage} in the section where you want the page break

\let\jas@contents=\tableofcontents
\renewcommand{\tableofcontents}{
 \par\renewcommand{\baselinestretch}{1}\normalfont
 \jas@contents
 \par\renewcommand{\baselinestretch}{1.5}\normalfont
}

\let\jas@figures=\listoffigures
\renewcommand{\listoffigures}{
 \par\renewcommand{\baselinestretch}{1}\normalfont
 \jas@figures
 \par\renewcommand{\baselinestretch}{1.5}\normalfont
}

\let\jas@tables=\listoftables
\renewcommand{\listoftables}{
 \par\renewcommand{\baselinestretch}{1}\normalfont
 \jas@tables
 \par\renewcommand{\baselinestretch}{1.5}\normalfont
}

% Edited from book.cls
%----------------------------------------------------------------------------

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \renewcommand{\jas@eventext}{#1}
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{5\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \par\renewcommand{\baselinestretch}{1}\normalfont
        \centering\huge\bfseries \@chapapp\space \thechapter
        \par\nobreak\renewcommand{\baselinestretch}{1.5}\normalfont
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \par\renewcommand{\baselinestretch}{1}\normalfont
    \centering\Huge \bfseries #1\par\nobreak\renewcommand{\baselinestretch}{1}\normalfont
    \vskip 40\p@
  }}

\renewcommand\section[2][]{\par\renewcommand{\baselinestretch}{1}\normalfont
                                    \ifthenelse{\equal{#1}{}}{\renewcommand{\jas@oddtext}{#2}
                                     \@startsection {section}{1}{\z@}%
                                     {-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\normalfont\Large\bfseries}{#2}}
                                    {\renewcommand{\jas@oddtext}{#1}
                                     \@startsection {section}{1}{\z@}%
                                     {-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\normalfont\Large\bfseries}[#1]{#2}}
                            \par\nobreak\renewcommand{\baselinestretch}{1.5}\normalfont}

\renewcommand\subsection[2][]{\par\renewcommand{\baselinestretch}{1}\normalfont
                                    \ifthenelse{\equal{#1}{}}{%
                                     \@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}{#2}}
                                    {\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}[#1]{#2}}
                            \par\nobreak\renewcommand{\baselinestretch}{1.5}\normalfont}

\renewcommand\subsubsection[2][]{\par\renewcommand{\baselinestretch}{1}\normalfont
                                    \ifthenelse{\equal{#1}{}}{%
                                     \@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}{#2}}
                                    {\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}[#1]{#2}}
                            \par\nobreak\renewcommand{\baselinestretch}{1.5}\normalfont}
%----------------------------------------------------------------------------

\typeout{ }