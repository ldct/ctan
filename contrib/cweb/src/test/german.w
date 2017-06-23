% $Id: german.w,v 1.3 1995/11/20 22:34:44 schrod Exp $
%----------------------------------------------------------------------

% tests german language support


% check if option after german works as well
\documentclass[german,suppress=index]{cweb}

\usepackage{german}

\begin{document}

\title{Test der \texttt{german} Option}
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
