% $Id: newif.w,v 1.1 1995/11/07 18:28:52 schrod Exp $
%------------------------------------------------------------

% test that proper definition of \newif is established.


% First, restore problematic definition and pretend we're an old LaTeX.

\makeatletter

\outer\def\newif#1{\count@@\escapechar \escapechar\m@@ne
  \expandafter\expandafter\expandafter
   \edef\@@if#1{true}{\let\noexpand#1=\noexpand\iftrue}%
  \expandafter\expandafter\expandafter
   \edef\@@if#1{false}{\let\noexpand#1=\noexpand\iffalse}%
  \@@if#1{false}\escapechar\count@@} % the condition starts out false

\let\OldNewif=\newif

\edef\fmtversion{1994/12/01}

\makeatother


% Now, start the document and check if \newif got redefined.

\documentclass{cweb}

\begin{document}

\ifx \OldNewif\newif
    \errmessage{\string\newif\space was not redefined.}
\else
    \message{\string\newif\space got redefined.}
\fi

@ Test.

\end{document}
