% $Id: sup-lists.w,v 1.1 1995/08/27 19:29:07 schrod Exp $
%------------------------------------------------------------

% test suppression of index & ref list

\documentclass[suppress={index,reflist}]{cweb}

\begin{document}

@ We need something to add to the lists.

@< refinement @>=
foo(bar);

@
\end{document}
