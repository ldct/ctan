% $Id: badend.w,v 1.3 1995/08/08 00:14:46 schrod Exp $
%----------------------------------------------------------------------

% tests unknown \end macro
% assumes "h" and "x" user reaction
% note: produces no output!

\makeatletter
\def\end#1{\csname end#1\endcsname\@@checkend{#1}%
  \expandafter\endgroup \if@@endpe \@@doendpe \fi
\relax							% <-- added
  \if@@ignore \global\@@ignorefalse \ignorespaces\fi}
\makeatother

\documentclass{cweb}

\begin{document}

@ Test

\end{document}
