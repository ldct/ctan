% $Id: refname.w,v 1.3 1995/08/08 00:14:49 schrod Exp $
%----------------------------------------------------------------------

% tests refinement names, incl. pseudo-refinements w/ file names

\documentclass{cweb}

\begin{document}

@ @( foo.h@>=
@< some |code| @>@;
@< more code @>

@ @< some ...@>=
for ( int i=1; i<10; i++ )
    @< more... @>

@ @< more... @>=

@
\end{document}
