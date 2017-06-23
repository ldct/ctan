%
%
% Reproducing the style of the Penguin Shakespeare
%
%

\usepackage[pagestyles,clearempty]{titlesec}[2005/01/22 v2.6]
\usepackage{titletoc}[2005/01/22 v1.5]

\TextHeight {6.5in}
\TextWidth  {4.51in}

\newcommand{\RunningTitle}{} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand {\FrontMatter} [1] {%

  \pagestyle {FrontMatterPage}

  \renewcommand{\RunningTitle}{#1} 

  \titleformat  {\chapter}[block]
                {\RelSize{1}\centering}
                {}
                {0pt}
                {\MakeUppercase}

  \titlespacing {\chapter}
                {0pt}
                {4\leading}
                {2\leading plus 1\leading}

  \titlecontents {chapter}[10pt]
                 {\vspace {1\leading plus .5\leading}}
                 {\scshape\MakeLowercase}
                 {\scshape\MakeLowercase}
                 {\hfill \thecontentspage}
                 [\addvspace{.33ex}]

  \titleformat {\section} [block]
               {\centering}
               {\arabic{section}.\ \ }
               {0pt}
               {\scshape}

  \titlespacing  {\section}
                 {0pt} 
                 {.5\leading  plus .5\leading minus .125\leading}
                 {.25\leading plus .25\leading minus .125\leading}

  \titlecontents {section}[0pt]
                 {}
                 {\makebox [20pt][r]{\number\thecontentslabelfinal.}%
                                     \hspace {5pt}}
                 {}
                 {\hfill \thecontentspage}

  \setcounter {secnumdepth}{1}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
  \addtocontents{toc}{\protect\thispagestyle{empty}}
  \tableofcontents
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpagestyle {FrontMatterPage} {

  \sethead   [\small \textsc{\MakeLowercase{\chaptertitle}}]
             []
             []
             {}
             {}
             {\small \textsc{\MakeLowercase{\chaptertitle}}}

  \setfoot   {}{\thepage}{}

  \setmarks  {chapter}{section}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand {\MainMatter} [1] {%

  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}

  \titlecontents {chapter}[10pt]
                 {\vspace {1\leading plus .5\leading}}
                 {\LETTERspace}
                 {\LETTERspace}
                 {\hfill \oldstylenums{\thecontentspage}}
                 []

  \titleformat  {\chapter}[block]
                {\RelSize{2}\centering}
                {}
                {0pt}
                {\MakeUppercase}
                []


  \titlespacing {\chapter}
                {0pt}
                {4\leading}
                {0pt}

  \setcounter {secnumdepth}{-2}

  \cleardoublepage
  \chapter {#1}
  \thispagestyle {empty}
  \cleardoublepage
  \pagestyle {MainMatterPage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpagestyle {MainMatterPage} {

  \sethead   [\hActScene]
             []
             []
             {}
             {}
             {\hActScene}

  \setfoot   {}{\thepage}{}

  \Capita    {section}{subsection}
}

\newcounter {first}
\newcounter {last}

\newcommand {\hActScene}{%
  \toptitlemarks \setcounter{first}{\sectiontitle}
  \bottitlemarks \setcounter{last} {\sectiontitle}
  \ifthenelse {\value{first} = \value{last}}
              {\hSameAct}
              {\hTwoActs}%
}

\newcommand {\hSameAct}{%
  \Roman {first}.%
  \toptitlemarks \setcounter{first}{\subsectiontitle}%
  \bottitlemarks \setcounter{last} {\subsectiontitle}%
  \ifthenelse {\value{first} = \value{last}}
              {\arabic{first}}
              {\arabic{first}\textendash\arabic{last}}%
}

\newcommand {\hTwoActs}{%
  \Roman {first}.%
  \toptitlemarks \setcounter{first}{\subsectiontitle}%
  \arabic {first}\textendash
  \Roman {last}.%
  \bottitlemarks \setcounter{last} {\subsectiontitle}%
  \arabic {last}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand {\BackMatter} [1] {%

  \renewcommand{\RunningTitle}{#1} 

  \pagestyle {BackMatterPage}
  \thispagestyle {empty}

  \addtocontents {toc} {\protect\setcounter{tocdepth}{1}}

  \setcounter {section} {0}
  \setcounter {secnumdepth}{1}

  \titleformat  {\chapter}[block]
                {\RelSize{1}\centering}
                {}
                {0pt}
                {\MakeUppercase}

  \titlespacing {\chapter}
                {0pt}
                {4\leading}
                {2\leading plus 1\leading}


  \titlecontents {chapter}[10pt]
                 {\vspace {1\leading plus .5\leading}}
                 {\scshape\MakeLowercase}
                 {\scshape\MakeLowercase}
                 {\hfill \thecontentspage}
                 [\addvspace{.33ex}]

  \titleformat {\section} [block]
               {\centering}
               {}
               {1em}
               {\scshape}

  \titlespacing  {\section}
                 {0pt} 
                 {1\leading plus .5\leading minus .25\leading}
                 {.5\leading plus .25\leading minus .125\leading}

  \titlecontents {section}[10pt]
                 {}
                 {\makebox [20pt][r]
                  {\RomanNumeral{\thecontentslabelfinal}\hspace {5pt}}
                 }
                 {}
                 {\hfill \oldstylenums{\thecontentspage}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpagestyle {BackMatterPage} {

  \sethead   [\small \textsc{\MakeLowercase{\chaptertitle}}]
             []
             []
             {}
             {}
             {\small \textsc{\MakeLowercase{\chaptertitle}}}

  \setfoot   {}{\thepage}{}

  \setmarks  {chapter}{section}
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
   \clearpage
   \pagestyle {empty}
   \Locus  \personae {} 
   \Forma            {}
   \Facies           {\textsc{##1}\space}
   \titulus {THE CHARACTERS IN THE PLAY}
   \spatium {4ex}
  }{\endVersus\endDrama}

\newenvironment {Characters} [2][1]%
  { \Facies \characters {\Delimiter[#1]\} ##1.}\characters {#2}%
    \Area}{\endArea}

\newenvironment {unnamed} {\Forma \personae {}}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\Locus \excessus {\textleftmargin + 4em}
\Modus           {\unhyphenated}

\Facies \personae {\textsc{\MakeLowercase{#1}}#2\relax
                   \hskip .5em plus .1em minus .1em\\ #1}
\Forma            {\hangafter 1  \hangindent 1.25em}
\Locus            {\left}
\SpatiumSupra     {0ex plus .25\leading}
\SpatiumInfra     {\penalty 10000}

\Facies \[     {\textit{#1}}
\Forma         {\hangafter 0 \hangindent 2.5em\relax} 
\SpatiumAnte   {.33em plus .22em minus .11em}
\SpatiumPost   {.33em plus .22em minus .11em}
\SpatiumSupra  {0ex plus .25ex}
\SpatiumInfra  {0ex plus .25ex}

\Facies \(     {\itshape}
\Forma         {\hangafter 0 \hangindent 3.5em \rangedleft} 
\SpatiumSupra  {0ex plus .5ex}
\SpatiumInfra  {0ex plus .5ex}

\Facies \numeri  {\RelSize{-2}#1}
\Locus           {\leftmargin - 1cm \\ \rightmargin + 1cm}
\Progressio      {{10}\\}

\Novus \numerus \Nact
\Facies         {\upshape \ROMANnumeral{#1}}
\Caput          {\section \headline}

%\newcommand     {\Act} {\thispagestyle{plain}\Nact{+1}\Nscene{0}}
\newcommand     {\Act} {\Nact{+1}\Nscene{0}}

\Novus \numerus \Nscene
\Facies         {\upshape.\number#1}
\Caput          {\subsection \headline}

\newcommand     {\Scene}[1] {%
                 \Nscene{+1}\numerus{1}%
                 \spatium {2\leading plus 1\leading \penalty 1000}%
                 \ActScene
                 \(#1\)}

\Novus \textus  \ActScene
\Facies         {\ifthenelse {\value{Nscene} = 1}
                             {{\RelSize {+2}\Nact*{+0}}}
                             {\Nact*{+0}}%
                 \Nscene*{+0}%
                }
\Locus          {\rightmargin + 1em \\ \leftmargin}
\Modus          {\aligned{left} \\ \aligned{right}}


\newenvironment {PROSE}{\Prosa \Locus \personae {}}{\endProsa}


