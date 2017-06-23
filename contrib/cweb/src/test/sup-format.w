% $Id: sup-format.w,v 1.1 1995/08/29 15:22:17 schrod Exp $
%------------------------------------------------------------

% test suppression of format directives

\documentclass[suppress=format]{cweb}

\begin{document}

@ test
@f XmMainWindow int
@f foo int
@f bar i
XmMainWindow dir = XtCreateWidget("foobar");

@
\end{document}
