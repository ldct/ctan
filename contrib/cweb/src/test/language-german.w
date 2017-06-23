% $Id: language-german.w,v 1.1 1995/11/20 22:34:45 schrod Exp $
%----------------------------------------------------------------------

% tests german language support

\documentclass[language=german]{cweb}

\usepackage{german}

\begin{document}

\title{Test der \texttt{language} Option}
\author{Puma}
\maketitle

@ Aktives Anf\"uhrungszeichen im String.
@c
#include "foo.h"

@ @( foo.h@>=
@< etwas |code| @>@;
@< mehr Code @>

@ @< etwas ...@>=
for ( int i=1; i<10; i++ )
    @< mehr... @>

@ @< mehr... @>=

@
\end{document}
