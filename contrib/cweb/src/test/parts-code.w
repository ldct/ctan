% $Id: parts-code.w,v 1.1 1995/09/16 17:02:10 schrod Exp $
%------------------------------------------------------------

% test of `cwebparts' package:
% code parts to be included in a LaTeX document
% no sections

\documentclass{cweb}

\usepackage{rcs}

\begin{document}

\title{Believe it}
\author{Coogar}

\maketitle

@ Some explanation of the code below. It's very hairy, isn't it?

@( foo.h@>=
@< some |code| @>@;
@< more code @>

@ @< some ...@>=
for ( int i=1; i<10; i++ )
    @< more... @>

@ @< more... @>=

@
\end{document}
