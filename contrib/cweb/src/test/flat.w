% $Id: flat.w,v 1.1 1995/08/25 19:12:40 schrod Exp $
%----------------------------------------------------------------------

% tests section levels and references for flat structure documents.

\documentclass[structure=flat]{cweb}

\begin{document}

\tableofcontents

\newpage

@** s title.
\label{main-sec}

Some text.

@* e title.

Some text.
And some references: Part~\ref{main-sec} and section~\ref{normal-sec}.

@*0 0 title.

Some text.

@*1 1 title.

Some text.

@*2 2 title.

Some text.

@ \label{normal-sec}
Doc.

@d def foo
@f def int

@c
for ( int i=1; i<10; i++ )
    @< do something @>

@
\end{document}
