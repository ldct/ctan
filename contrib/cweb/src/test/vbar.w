% $Id: vbar.w,v 1.2 1995/08/08 00:14:51 schrod Exp $
%----------------------------------------------------------------------

% tests ways to get ruled tables

\documentclass{cweb}

\usepackage{cwebarray}

\begin{document}

@ Test 1:

\begin{tabular}{^^7cl^^7cl^^7c}
\hline
1st column & 2nd column\\
\hline
\end{tabular}


@ Test 2:

\begin{tabular}{IlIlI}
\hline
1st column & 2nd column\\
\hline
\end{tabular}


\end{document}
