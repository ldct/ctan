% $Id: titlepage.w,v 1.1 1995/08/27 13:29:41 schrod Exp $
%------------------------------------------------------------

% test titlepage option
% test also forwarding of option to baseclass

\documentclass[titlepage]{cweb}

\begin{document}

\title{Test title}
\author{Coogar}

\maketitle

Test text.

@
\end{document}
