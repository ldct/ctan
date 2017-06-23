%
%
% Reproducing the style of the Arden Shakespeare
%
%


\usepackage[pagestyles,outermarks,clearempty]{titlesec}[2005/01/22 v2.6]
\usepackage{titletoc}[2005/01/22 v1.5]

\TextHeight {6in}
\TextWidth  {3.85in}


\newcommand {\RunningTitle}{} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand {\TheChapterStyle} {%

  \titleformat  {\chapter}[block]
                {\RelSize{1}\centering}
                {}
                {0pt}
                {\LETTERspace}

  \titlespacing {\chapter}
                {0pt}
                {4\leading}
                {2\leading plus 1\leading minus .5\leading}

  \titlecontents {chapter}[0pt]
                 {\vspace {1\leading plus .5\leading}}
                 {\LETTERspace}
                 {\LETTERspace}
                 {\hfill \OldStyleNums{\thecontentspage}}
                 [\addvspace{.33ex}]
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand {\FrontMatter} [1] {%

  \renewcommand{\RunningTitle}{#1} 

  \frontmatter

  \pagestyle {FrontMatterPage}

  \TheChapterStyle


  \titleformat {\section} [block]
               {\centering}
               {\arabic{section}.\ \ }
               {0pt}
               {\scshape}

  \titlespacing  {\section}
                 {0pt} 
                 {.5\leading plus .5\leading minus .125\leading}
                 {.25\leading plus .25\leading minus .125\leading}

  \titlecontents {section}[0pt]
                 {}
                 {\makebox [20pt][r]{\number\thecontentslabelfinal.}%
                                     \hspace {5pt}}
                 {}
                 {\hfill \OldStyleNums{\thecontentspage}}

  \setcounter {secnumdepth}{1}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
  \addtocontents{toc}{\protect\thispagestyle{empty}}
  \addtocontents{toc}{\protect\parindent 1em}
  \tableofcontents
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpagestyle {FrontMatterPage} {

  \sethead   [\textup{\thepage}]%
             [\ifthenelse {\equal {\RunningTitle}{\empty}} 
						  {}
                          {\small \textsc{\MakeLowercase{\RunningTitle}}}
			 ]
             []%
             {}%
             {\small \textsc{\MakeLowercase{\chaptertitle}}}
             {\textup{\thepage}}%

  \setmarks  {chapter}{section}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand {\MainMatter} [1] {%

  \renewcommand{\RunningTitle}{#1} 

  \mainmatter

  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}

  \titleformat   {\chapter}[block]
                 {\RelSize{2}\centering}
                 {}
                 {0pt}
                 {\MakeUppercase}

  \titlecontents {chapter}[0pt]
                 {\vspace {1\leading plus .5\leading}}
                 {}
                 {\itshape\LETTERspace}
                 {\hfill \OldStyleNums{\thecontentspage}}
                 []

  \titlespacing {\chapter}{0pt}{8ex}{0pt plus 1fill}

  \setcounter {secnumdepth}{-2}

  \cleardoublepage
  \chapter {#1}
  \thispagestyle {empty}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter {first}
\newcounter {last}
\newpagestyle {MainMatterPage} {

  \sethead   [\oldstylenums{\thepage}]
             [\small \textsc{\MakeLowercase{\RunningTitle}}]
             [\toptitlemarks \setcounter{first}{\sectiontitle}
              \bottitlemarks \setcounter{last}{\sectiontitle}
              \small\textsc{[\,act \roman{first}
                \ifthenelse {\value{first} = \value{last}}
                            {}
                            {-\roman{last}}}
             ]
             {\toptitlemarks\small
              \textsc{sc.}\ \ROMANnumeral{\subsectiontitle}\,]}
             {\small \textsc{\MakeLowercase{\RunningTitle}}}
             {\oldstylenums{\thepage}}

  \Capita    {section}{subsection}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\Novus \textus \characters
\Facies        {\Delimiter\} #1.}
\Locus         {\area \textrightedge}
\Modus         {\aligned {middle} \rangedleft{+0pt}}

\newenvironment {DramatisPersonae}
  {\Drama \Versus
   \def \baselinestretch{.9}
   \itshape 
   \clearpage
   \pagestyle {empty}
   \Facies \titulus {\RelSize{+1}\LETTERspace{##1}}
   \Facies \personae {\textsc{##1}\space}
   \titulus {Dramatis person\ae}
   \spatium {1\leading}
  }{\endVersus\endDrama}

\newenvironment {Characters} [2][1]%
  { \Facies \characters {\Delimiter[#1]\} ##1.}\characters {#2}%
    \Area}{\endArea}

\newenvironment {unnamed} {\Forma \personae {}}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand {\BackMatter} [1] {%

  \renewcommand{\RunningTitle}{#1} 

  \pagestyle {BackMatterPage}
  \thispagestyle {empty}

  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}

  \setcounter {section} {0}
  \setcounter {secnumdepth}{1}

  \TheChapterStyle

  \titleformat {\section} [block]
               {\centering}
               {\LetterSpace{APPENDIX} \Roman{section}\\[.5\leading]}
               {1em}
               {\scshape}

  \titlespacing  {\section}
                 {0pt} 
                 {1\leading plus .25\leading minus .25\leading}
                 {.5\leading plus .125\leading minus .125\leading}

  \titlecontents {section}[0pt]
                 {}
                 {\makebox [20pt][r]
                  {\ROMANnumeral{\thecontentslabelfinal}%
                   \hspace {5pt}}
                 }
                 {}
                 {\hfill \oldstylenums{\thecontentspage}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpagestyle {BackMatterPage} {

  \sethead   [\oldstylenums{\thepage}]
             [\ifthenelse {\equal {\RunningTitle}{\empty}} 
						  {}
                          {\small \textsc{\MakeLowercase{\RunningTitle}}}
			 ]
             []
             {}
             {\small \textsc{\letterspace{\chaptertitle}}}
             {\oldstylenums{\thepage}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength {\textindent}
\setlength {\textindent} {2.5em}

\Locus  \excessus {\leftmargin + \textindent + 1em}
\Facies           {#1}
\Modus            {\aligned{left} \unhyphenated}

\Facies \personae {\textit{#1}.#2\hskip .5em plus .25em minus .125em% 
                   \\
                   \ifthenelse {\isopt [}
                     {\ifthenelse {\isopt b}
                       {#2.}
                       {#1}%
                     }
                     {\textsc{\MakeLowercase{#1}}}%
                     }
\Forma            {\rightskip \textindent  % for Prosa
                   \hangindent \textindent \hangafter 1}
\SpatiumSupra     {0ex plus 1pt\penalty -50}

\Novum \spatium  \mediumspace
\Facies          {.33em plus .22em minus .11em}


\Forma  \[     {\centeredfinal}
\Facies        {[\textit{#1}\ifthenelse {\isopt r} {} {]}}
\SpatiumAnte   {\mediumspace}
\SpatiumPost   {\mediumspace}
\SpatiumSupra  {.5\leading plus .25\leading \penalty -100}
\SpatiumInfra  {.5\leading plus .25\leading \penalty 50}

\Forma  \(     {\centred}
\Facies        {\itshape}
\SpatiumSupra  {.5\leading plus .25\leading \penalty -100}
\SpatiumInfra  {.5\leading plus .25\leading \penalty 50}

\Facies      \numeri {\fontfamily{cmr}\selectfont\small\oldstylenums{#1}#2}
\SpatiumAnte         {.5em}
\Progressio          {5}
\Locus               {\rightmargin \\ \rightmargin + 1em}

\Novus  \titulus \Act
\Facies          {\newpage\RelSize{+1}
				  \ifthenelse {\value{Nact} = 0}
                    		  {\vspace*{3\leading}
                              {\centerline{\RelSize{+1}%
                                           \LETTERspace{\RunningTitle}}}%
                               \vskip2\leading}
                              {\vspace*{6\leading}}
                  \thispagestyle{empty}
                  \LetterSpace{ACT}\kern .5em\relax
                  \Nact*{=+1}\Nscene{0}}%

\Novus  \numerus \Nact
\Facies          {\ROMANnumeral {#1}}
\Caput           {\section \headline}


\Novus  \titulus \Scene
\Facies          {SCENE\kern .5em\relax \Nscene*{=+1}%
                 \ifthenelse {\isempty #1}
                             {}
                             {.\,\textemdash\,[\textit{#1}\,]}%
                 \numerus{1}}
\SpatiumSupra    {3ex plus 1ex minus .5ex \penalty [.2]}
\SpatiumInfra    {1.5ex plus .25ex minus .25ex \penalty 10000}

\Novus  \numerus \Nscene
\Facies          {\ROMANnumeral {#1}}
\Caput           {\subsection \headline}

\newenvironment {PROSE}{\Prosa}{\endProsa}





