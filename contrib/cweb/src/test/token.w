% $Id: token.w,v 1.3 1995/08/29 15:21:08 schrod Exp $
%----------------------------------------------------------------------

% tests: rendering of tokens

\documentclass{cweb}

\begin{document}

@
@c
a = 100L;
a = 100UL;

@ shift operators:
@c
cout << "hello, world" << endl;
cin >> var;

@ formatting that depend on font sizes in Plain \texttt{CWEB}:
@f foo_bar int
@c
foo++; bar--;
foo_bar obj;
obj->method();


@
\end{document}
