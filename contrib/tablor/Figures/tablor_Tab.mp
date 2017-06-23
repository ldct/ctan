input tableauVariation;
verbatimtex
%&latex
\documentclass{article}
\usepackage[upright]{kpfonts}% ou mathpazo, lmodern, etc. ou rien !
%\usepackage{amsmath}
\renewcommand\mbox[1]{ #1 } % pour les mbox intempestifs de xcas
\renewcommand\cdot{ } % idem pour les cdot
\begin{document}
\catcode`\@=0 % pour utiliser le @
etex
beginTableau(0) newLigneVariables(btex $t$ etex);val(btex $-10$ etex);
val(btex $-1$ etex);
val(btex $0$ etex);
val(btex $1$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle g'(t)}$ etex); plus; nonDefBarre;plus;valBarre(btex 0 etex);moins;nonDefBarre;moins;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle g}$ etex);valPos(btex $\frac{100}{99}$ etex,0); limGauche(btex
                                    $+\infty $
                                    etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex          $0$
                                            etex,1);limGauche(btex
                                    $-\infty$
                                    etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex $1$ etex,0);
endTableau;

beginTableau(1) newLigneVariables(btex $t$ etex);val(btex $-10$ etex);
val(btex $-1$ etex);
val(btex $0$ etex);
val(btex $1$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle g'(t)}$ etex); plus; nonDefBarre;plus;valBarre(btex 0 etex);moins;nonDefBarre;moins;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle g}$ etex);valPos(btex $\frac{100}{99}$ etex,0); limGauche(btex
                                    $+\infty $
                                    etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex          $0$
                                            etex,1);limGauche(btex
                                    $-\infty$
                                    etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex $1$ etex,0);
endTableau;

beginTableau(2) newLigneVariables(btex $x$ etex);val(btex $0$ etex);
val(btex $2$ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);valBarre(btex 0 etex);plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $0$ etex,0);valPos(btex $4$ etex,1);
endTableau;


beginTableau(3)
newLigneVariables(btex $ {x}$ etex);
   val(btex $-\infty $ etex);val(btex $\frac{-3}{5}$ etex);
val(btex $2$ etex);
val(btex $+\infty $ etex); 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle -45 x-27}$ etex); plus; valBarre(btex 0 etex);moins;barre;moins;
     
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle 2-x}$ etex); plus;barre;plus;valBarre(btex 0 etex);moins;
     
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle @varphi(x)}$ etex); plus;valBarre(btex 0 etex); moins;nonDefBarre;plus; 
endTableau;

beginTableau(4) newLigneVariables(btex $x$ etex);val(btex $-5$ etex);
val(btex $0$ etex);
val(btex $7$ etex);

newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $25$ etex,1); valPos(btex          $0$
                                            etex,0);
valPos(btex $49$ etex,1);
endTableau;

beginTableau(5) newLigneVariables(btex $x$ etex);val(btex $-\infty $ etex);
val(btex $0$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);moins; valBarre(btex 0 etex);plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $+\infty $ etex,1); valPos(btex          $0$
                                            etex,0);
valPos(btex $+\infty $ etex,1);
endTableau;



beginTableau(6) newLigneVariables(btex $x$ etex);val(btex $-\infty $ etex);
val(btex $0$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);moins; valBarre(btex 0 etex);plus;
endTableau;

beginTableau(7) newLigneVariables(btex $t$ etex);val(btex $-10$ etex);
val(btex $-1$ etex);
val(btex $0$ etex);
val(btex $1$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle g'(t)}$ etex); plus; nonDefBarre;plus;valBarre(btex 0 etex);moins;nonDefBarre;moins;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle g}$ etex);valPos(btex $\frac{100}{99}$ etex,0); limGauche(btex
                                    $+\infty $
                                    etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex          $0$
                                            etex,1);limGauche(btex
                                    $-\infty$
                                    etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex $1$ etex,0);
endTableau;

beginTableau(8) newLigneVariables(btex $t$ etex);val(btex $-\pi $ etex);
val(btex $\frac{(-\pi )}{2}$ etex);
val(btex $\frac{\pi }{2}$ etex);
val(btex $\pi $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle g'(t)}$ etex); moins; valBarre(btex 0 etex);plus;valBarre(btex 0 etex);moins;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle g}$ etex);valPos(btex $\frac{1}{2}$ etex,1); valPos(btex          $\frac{-1}{2}$
                                            etex,0);
valPos(btex          $\frac{3}{2}$
                                            etex,1);valPos(btex $\frac{1}{2}$ etex,0);
endTableau;

beginTableau(9) newLigneVariables(btex $x$ etex);val(btex $1$ etex);val(btex $2$ etex);val(btex $3$ etex);val(btex $4$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $-1$ etex,0); valPos(btex $5$etex,1);valPos(btex $2$etex,0);valPos(btex $9$ etex,1);
endTableau;

beginTableau(10) newLigneVariables(btex $x$ etex);val(btex $1$ etex);val(btex $2$ etex);val(btex $3$ etex);val(btex $4$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $-1$ etex,1); limGauche(btex$-\infty $etex,0);nonDefBarre;limDroite(btex$+\infty $etex,1);valPos(btex $2$etex,0);valPos(btex $9$ etex,1);
endTableau;

beginTableau(11) newLigneVariables(btex $x$ etex);val(btex $1$ etex);val(btex $2$ etex);val(btex $3$ etex);val(btex $4$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);nonDefBarre;limDroite(btex $-1$ etex,1); limGauche(btex$-\infty $etex,0);nonDefBarre;limDroite(btex$+\infty $etex,1);valPos(btex $2$etex,0);limGauche(btex $+\infty $ etex,1);nonDefBarre;
endTableau;

beginTableau(12) newLigneVariables(btex $x$ etex);val(btex $-\infty $ etex);
val(btex $-1$ etex);
val(btex $1$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle @varphi'(x)}$ etex);moins; debutNonDefStrict;finNonDefStrict;plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle @varphi}$ etex);valPos(btex $+\infty $ etex,1); limGauche(btex $0$ etex,0);debutNonDef;finNonDef;limDroite(btex $0$ etex,0);valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(13) newLigneVariables(btex $x$ etex);val(btex $-\infty $ etex);
val(btex $-1$ etex);
val(btex $1$ etex);
val(btex $\frac{5}{2}$ etex);
val(btex $4$ etex);
val(btex $6$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);moins; debutNonDefStrict;finNonDefStrict;plus;valBarre(btex 0 etex);moins;debutNonDefStrict;finNonDefStrict;plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $+\infty $ etex,1); limGauche(btex $-\infty$ etex,0);debutNonDefStrict;finNonDefStrict;limDroite(btex $-\infty$ etex,0);valPos(btex$\ln\left(\frac{441}{16}\right)$etex,1);limGauche(btex $-\infty$ etex,0);debutNonDefStrict;finNonDefStrict;limDroite(btex $-\infty$ etex,0);valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(14) newLigneVariables(btex $x$ etex);val(btex $-10$ etex);val(btex $\alpha_1$ etex);val(btex $-1$ etex);val(btex $0$ etex);val(btex $1$ etex);val(btex $\alpha_2$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); plus;valBarre(btex$
                                                       $ etex);plus; nonDefBarre;plus;valBarre(btex 0 etex);moins;nonDefBarre;moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $\frac{100}{99}$ etex,0);valPos(btex $ 10 $ etex,0.5); limGauche(btex $+\infty $ etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex          $0$
                                            etex,1);limGauche(btex $-\infty$ etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex
                                            $ 10 $ etex,0.5);
                                                                 valPos(btex $1$ etex,0);
endTableau;

beginTableau(15) newLigneVariables(btex $x$ etex);val(btex $-10$ etex);val(btex $-1$ etex);val(btex $\alpha_1$ etex);val(btex $0$ etex);val(btex $\alpha_2$ etex);val(btex $1$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); plus;  nonDefBarre;plus;valBarre(btex $  $ etex);plus;valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins;nonDefBarre;moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $\frac{100}{99}$ etex,0);  limGauche(btex $+\infty $ etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex
                                            $ -1 $ etex,0.5);
                                                                 valPos(btex          $0$
                                            etex,1);valPos(btex
                                            $ -1 $ etex,0.5);
                                                                 limGauche(btex $-\infty$ etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex $1$ etex,0);
endTableau;

beginTableau(16) newLigneVariables(btex $x$ etex);val(btex $-10$ etex);val(btex $\frac{(-\left(\sqrt{10}\right))}{3}$ etex);val(btex $-1$ etex);val(btex $0$ etex);val(btex $1$ etex);val(btex $\frac{\sqrt{10}}{3}$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); plus;valBarre(btex$
                                                       $ etex);plus; nonDefBarre;plus;valBarre(btex 0 etex);moins;nonDefBarre;moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $\frac{100}{99}$ etex,0);valPos(btex $ 10 $ etex,0.5); limGauche(btex $+\infty $ etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex          $0$
                                            etex,1);limGauche(btex $-\infty$ etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex
                                            $ 10 $ etex,0.5);
                                                                 valPos(btex $1$ etex,0);
endTableau;

beginTableau(17) newLigneVariables(btex $x$ etex);val(btex $-10$ etex);val(btex $-1$ etex);val(btex $\frac{(-\left(\sqrt{2}\right))}{2}$ etex);val(btex $0$ etex);val(btex $\frac{\sqrt{2}}{2}$ etex);val(btex $1$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); plus;  nonDefBarre;plus;valBarre(btex $  $ etex);plus;valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins;nonDefBarre;moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $\frac{100}{99}$ etex,0);  limGauche(btex $+\infty $ etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex
                                            $ -1 $ etex,0.5);
                                                                 valPos(btex          $0$
                                            etex,1);valPos(btex
                                            $ -1 $ etex,0.5);
                                                                 limGauche(btex $-\infty$ etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex $1$ etex,0);
endTableau;

beginTableau(18) newLigneVariables(btex $x$ etex);val(btex $-\pi $ etex);val(btex $\frac{(-\pi )}{3}$ etex);val(btex $0$ etex);val(btex $\frac{\pi }{3}$ etex);val(btex $\pi $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle @cos'(x)}$ etex);valBarre(btex 0 etex);plus;valBarre(btex$
                                                       $ etex);plus; valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle @cos}$ etex);
valPos(btex $-1$ etex,0);valPos(btex $ 1/2 $ etex,0.5); valPos(btex          $1$
                                            etex,1);valPos(btex
                                            $ 1/2 $ etex,0.5);valPos(btex $-1$ etex,0);
endTableau;

beginTableau(19) newLigneVariables(btex $x$ etex);val(btex $0$ etex);
val(btex $     0.156422$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle g'(x)}$ etex);nonDefBarre;moins; valBarre(btex 0 etex);plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle g}$ etex);nonDefBarre;limDroite(btex $-1$ etex,1); valPos(btex          $    -1.145392$
                                            etex,0);
valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(20) newLigneVariables(btex $t$ etex);val(btex $-\infty $ etex);
val(btex $0$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle g'(t)}$ etex);moins; nonDefBarre;plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle g}$ etex);valPos(btex $1$ etex,1); valPos(btex
                                    $0$
                                    etex,0);valPos(btex $1$ etex,1);
endTableau;

beginTableau(21) newLigneVariables(btex $t$ etex);val(btex $0$ etex);
val(btex $\frac{\pi }{8}$ etex);
val(btex $\frac{\pi }{3}$ etex);
val(btex $\frac{3 \pi }{8}$ etex);
val(btex $\frac{\pi }{2}$ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x'(t)}$ etex);valBarre(btex $0$ etex);moins;valBarre(btex $-3 \sin\left(\frac{3 \pi }{8}\right)$ etex);moins;valBarre(btex $0$ etex);plus;valBarre(btex $3 \sin\left(\frac{\pi }{8}\right)$ etex);plus;valBarre(btex $3$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle x}$ etex);valPos(btex $1$ etex,1);valPos(btex          $\cos\left(\frac{3 \pi }{8}\right)$
                                            etex,0.5);valPos(btex          $-1$
                                            etex,0);
valPos(btex          $-\left(\cos\left(\frac{\pi }{8}\right)\right)$
                                            etex,0.5);valPos(btex $0$ etex,1);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle y'(t)}$ etex);valBarre(btex $4$ etex);plus;valBarre(btex $0$ etex);moins;valBarre(btex $-2$ etex);moins;valBarre(btex $0$ etex);plus;valBarre(btex $4$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle y}$ etex);valPos(btex $0$ etex,0);valPos(btex          $1$
                                            etex,1);valPos(btex          $\frac{(-\left(\sqrt{3}\right))}{2}$
                                            etex,0.5);valPos(btex          $-1$
                                            etex,0);
valPos(btex $0$ etex,1);
endTableau;

beginTableau(22) newLigneVariables(btex $t$ etex);val(btex $-\infty $ etex);
val(btex $-4$ etex);
val(btex $-1$ etex);
val(btex $0$ etex);
val(btex $2$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x'(t)}$ etex); moins;valBarre(btex $0$ etex);plus;nonDefBarre;plus;valBarre(btex $0$ etex);moins;nonDefBarre;moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle x}$ etex);valPos(btex $1$ etex,1);valPos(btex          $\frac{8}{9}$
                                            etex,0);
limGauche(btex
                                    $+\infty $
                                    etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex          $0$
                                            etex,1);limGauche(btex
                                    $-\infty$
                                    etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex $1$ etex,0);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle y'(t)}$ etex); moins;valBarre(btex $\frac{-64}{9}$ etex);moins;nonDefBarre;moins;valBarre(btex $0$ etex);plus;valBarre(btex $\frac{44}{9}$ etex);plus; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle y}$ etex);valPos(btex $+\infty $ etex,1);valPos(btex          $\frac{32}{3}$
                                            etex,0.5);limGauche(btex
                                    $-\infty$
                                    etex,0);nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex          $0$
                                            etex,0);
valPos(btex          $\frac{16}{3}$
                                            etex,0.5);valPos(btex $+\infty $ etex,1);
endTableau;


          beginTableau(23)
   newLigneVariables(btex $ {x}$ etex);
   val(btex $-\infty$ etex);val(btex $\frac{3}{2}$ etex);
val(btex $5$etex);
val(btex $+\infty$ etex);
  
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle -2x+3}$ etex);plus;valBarre(btex 0 etex);moins;barre;moins;
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle -x+5}$ etex);plus;barre;plus;valBarre(btex 0 etex);moins;
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle {(-2x+3)(-x+5)}}$ etex);plus;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);plus;
endTableau;
  beginTableau(24)
newLigneVariables(btex $ {x}$ etex);
   val(btex $-\infty $ etex);val(btex $-\left(\sqrt{2}\right)$ etex);
val(btex $-1$ etex);
val(btex $1$ etex);
val(btex $\sqrt{2}$ etex);
val(btex $\frac{3}{2}$ etex);
val(btex $+\infty $ etex); 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle -2 x+3}$ etex);
                              plus;barre;
                              plus;barre;
                              plus;barre;
                              plus;barre;
                              plus;valBarre(btex 0 etex);moins;
    
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x^{2}-1}$ etex);
                              plus;barre;
                              plus;
                                valBarre(btex 0 etex);moins;
                                valBarre(btex 0 etex);plus;barre;
                              plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x^{2}+1}$ etex);
                              plus;barre;
                              plus;barre;
                              plus;barre;
                              plus;barre;
                              plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x-1}$ etex);
                              moins;barre;
                              moins;barre;
                              moins;
                                valBarre(btex 0 etex);plus;barre;
                              plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x^{2}-2}$ etex);
                              plus;
                                valBarre(btex 0 etex);moins;barre;
                              moins;barre;
                              moins;
                                valBarre(btex 0 etex);plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle P(x)}$ etex);
                              moins;valBarre(btex 0 etex); plus;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);plus;valBarre(btex 0 etex);moins;
                              
endTableau;

   beginTableau(25)
newLigneVariables(btex $ {x}$ etex);
   val(btex $-15$ etex);val(btex $-10$ etex);
val(btex $10$ etex); 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x-10}$ etex);
                              moins;barre;moins;
    
                                valBarre(btex 0 etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x+10}$ etex);
                              moins;valBarre(btex 0 etex);plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f(x)}$ etex);
                              plus;valBarre(btex 0 etex); moins;
                                valBarre(btex 0 etex);
endTableau;

 
beginTableau(26)
newLigneVariables(btex $ {x}$ etex);
   val(btex $-\infty $ etex);val(btex $-4$ etex);
val(btex $\frac{5}{4}$ etex);
val(btex $\frac{3}{2}$ etex);
val(btex $2$ etex);
val(btex $4$ etex);
val(btex $+\infty $ etex); 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle -2 x+3}$ etex); plus;barre;plus;barre;plus; valBarre(btex 0 etex);moins;barre;moins;barre;moins;
     
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle -4 x+5}$ etex); plus;barre;plus; valBarre(btex 0 etex);moins;barre;moins;barre;moins;barre;moins;
     
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x^{2}-16}$ etex); plus; valBarre(btex 0 etex);moins;barre;moins;barre;moins;barre;moins;valBarre(btex 0 etex);plus; 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x-2}$ etex); moins;barre;moins;barre;moins;barre;moins; valBarre(btex 0 etex);plus;barre;plus; 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle Q(x)}$ etex); moins;nonDefBarre; plus;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);plus;nonDefBarre;moins;nonDefBarre;plus; 
endTableau;


beginTableau(27)
newLigneVariables(btex $ {x}$ etex);
   val(btex $-10$ etex);val(btex $-3$ etex);
val(btex $5$ etex);
val(btex $10$ etex); 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x-10}$ etex); moins;barre;moins;barre;moins;
    valBarre(btex 0 etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x-5}$ etex); moins;barre;moins;valBarre(btex 0 etex);plus; 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x+10}$ etex); valBarre(btex 0 etex);plus;barre;plus;barre;plus; 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x+3}$ etex); moins; valBarre(btex 0 etex);plus;barre;plus; 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle Q(x)}$ etex);nonDefBarre;moins;nonDefBarre; plus;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);
endTableau;



beginTableau(28)
newLigneVariables(btex $\displaystyle  {x}$ etex);
   val(btex $-10$ etex);val(btex $-5$ etex);
val(btex $10$ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle (x-10) (x+5)}$ etex);
                               plus;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);
endTableau;



beginTableau(29)
newLigneVariables(btex $\displaystyle  {x}$ etex);
   val(btex $-10$ etex);val(btex $2$ etex);
val(btex $5$ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle \frac{(x+10)}{(x-5) (x-2)}}$ etex);
                                valBarre(btex 0 etex); plus;nonDefBarre;moins;nonDefBarre;
endTableau;



beginTableau(30)
newLigneVariables(btex $\displaystyle  {x}$ etex);
   val(btex $0$ etex);val(btex $\frac{\pi }{2}$ etex);
val(btex $\pi $ etex);
val(btex $\frac{3 \pi }{2}$ etex);
val(btex $2 \pi $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle \tan\left(x\right)}$ etex);
                                valBarre(btex 0 etex); plus;nonDefBarre;moins;valBarre(btex 0 etex);plus;nonDefBarre;moins;valBarre(btex 0 etex);
endTableau;

  beginTableau(105)
newLigneVariables(btex $ {x}$ etex);
   val(btex $-50$ etex);val(btex $-\frac{2}{3}$ etex);
val(btex $-\frac{\sqrt{5}}{5}$ etex);
val(btex $\frac{\sqrt{5}}{5}$ etex);
val(btex $50$ etex); 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle 3 x+2}$ etex);
                              moins;
                                valBarre(btex 0 etex);plus;barre;
                              plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle 5 x^{2}-1}$ etex);
                              plus;barre;
                              plus;
                                valBarre(btex 0 etex);moins;valBarre(btex 0 etex);plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle F(x)}$ etex);
                              moins;valBarre(btex 0 etex); plus;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);plus;
                              
endTableau;

 beginTableau(31) newLigneVariables(btex $x$ etex);val(btex $-1$ etex);val(btex $\alpha_1$ etex);val(btex $0$ etex);val(btex $\alpha_2$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);nonDefBarre;moins;valBarre(btex$
                                                       $ etex);moins; valBarre(btex 0 etex);plus;valBarre(btex $  $ etex);plus; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
nonDefBarre;limDroite(btex $+\infty $ etex,1);valPos(btex $ 2 $ etex,0.5); valPos(btex          $-1$
                                            etex,0);valPos(btex
                                            $ 2 $ etex,0.5);valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(32) newLigneVariables(btex $x$ etex);val(btex $\frac{-1}{2}$ etex);val(btex $0$ etex);val(btex $\alpha_1$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); moins;  valBarre(btex 0 etex);plus;valBarre(btex $  $ etex);plus; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $\frac{1}{4}$ etex,1);  valPos(btex          $0$
                                            etex,0);valPos(btex
                                            $ 2 $ etex,0.5);valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(33) newLigneVariables(btex $x$ etex);val(btex $0$ etex);val(btex $\alpha_1$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle @ln'(x)}$ etex);nonDefBarre;plus;valBarre(btex$
                                                       $ etex);plus; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle @ln}$ etex);
nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex $ 2 $ etex,0.5);valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(35) newLigneVariables(btex $x$ etex);val(btex $1$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle -@ln'(x)}$ etex); moins;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle -@ln}$ etex);valPos(btex $0$ etex,1);valPos(btex $-\infty$ etex,0);
endTableau;

beginTableau(36) newLigneVariables(btex $x$ etex);val(btex $-\pi $ etex);val(btex $\alpha_1$ etex);val(btex $0$ etex);val(btex $\alpha_2$ etex);val(btex $\pi $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle @cos'(x)}$ etex);valBarre(btex 0 etex);plus;valBarre(btex$
                                                       $ etex);plus; valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle @cos}$ etex);
valPos(btex $-1$ etex,0);valPos(btex $ 1/2 $ etex,0.5); valPos(btex          $1$
                                            etex,1);valPos(btex
                                            $ 1/2 $ etex,0.5);valPos(btex $-1$ etex,0);
endTableau;

beginTableau(37) newLigneVariables(btex $x$ etex);val(btex $0$ etex);
val(btex $\pi $ etex);
val(btex $2 \pi $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle @cos'(x)}$ etex);valBarre(btex 0 etex);moins; valBarre(btex 0 etex);plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle @cos}$ etex);valPos(btex $1$ etex,1); valPos(btex          $-1$
                                            etex,0);
valPos(btex $1$ etex,1);
endTableau;

beginTableau(38) newLigneVariables(btex $t$ etex);val(btex $0$ etex);val(btex $\alpha_1$ etex);val(btex $\frac{\pi }{2}$ etex);val(btex $\pi $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle @tan'(t)}$ etex); plus;valBarre(btex$
                                                       $ etex);plus; nonDefBarre;plus; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle @tan}$ etex);
valPos(btex $0$ etex,0);valPos(btex $ 7 $ etex,0.5); limGauche(btex $+\infty $ etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex $0$ etex,1);
endTableau;

beginTableau(39) newLigneVariables(btex $t$ etex);val(btex $0$ etex);val(btex $\mathrm{atan}\left(7\right)$ etex);val(btex $\frac{\pi }{2}$ etex);val(btex $\pi $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle @tan'(t)}$ etex); plus;valBarre(btex$
                                                       $ etex);plus; nonDefBarre;plus; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle @tan}$ etex);
valPos(btex $0$ etex,0);valPos(btex $ 7 $ etex,0.5); limGauche(btex $+\infty $ etex,1);nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex $0$ etex,1);
endTableau;

beginTableau(40) newLigneVariables(btex $x$ etex);val(btex $-1$ etex);val(btex $\alpha_1$ etex);val(btex $\frac{-1}{2}$ etex);val(btex $\alpha_2$ etex);val(btex $1$ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); plus;valBarre(btex$
                                                       $ etex);plus; valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $0$ etex,0);valPos(btex $ 1 $ etex,0.5); valPos(btex          $\frac{3 \sqrt{3}}{4}$
                                            etex,1);valPos(btex
                                            $ 1 $ etex,0.5);valPos(btex $0$ etex,0);
endTableau;

beginTableau(41) newLigneVariables(btex $x$ etex);val(btex $-1$ etex);val(btex $    -0.839287$ etex);val(btex $\frac{-1}{2}$ etex);val(btex $0$ etex);val(btex $1$ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); plus;valBarre(btex$
                                                       $ etex);plus; valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $0$ etex,0);valPos(btex $ 1 $ etex,0.5); valPos(btex          $\frac{3 \sqrt{3}}{4}$
                                            etex,1);valPos(btex
                                            $ 1 $ etex,0.5);valPos(btex $0$ etex,0);
endTableau;

beginTableau(42) newLigneVariables(btex $x$ etex);val(btex $-1$ etex);
val(btex $0$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);nonDefBarre;plus; valBarre(btex 0 etex);moins;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);nonDefBarre;limDroite(btex $-\infty$ etex,0); valPos(btex          $0$
                                            etex,1);valPos(btex $-\infty$ etex,0);
endTableau;

  beginTableau(43)
newLigneVariables(btex $ {x}$ etex);
   val(btex $-10$ etex);val(btex $\frac{(-\left(\sqrt{5}\right)-3)}{2}$ etex);
val(btex $-1$ etex);
val(btex $\frac{(\sqrt{5}-3)}{2}$ etex);
val(btex $1$ etex);
val(btex $\frac{3}{2}$ etex);
val(btex $+\infty $ etex); 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle -2 x+3}$ etex);
                              plus;barre;
                              plus;barre;
                              plus;barre;
                              plus;barre;
                              plus;valBarre(btex 0 etex);moins;
    
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x-1}$ etex);
                              moins;barre;
                              moins;barre;
                              moins;barre;
                              moins;
                                valBarre(btex 0 etex);plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x+1}$ etex);
                              moins;barre;
                              moins;
                                valBarre(btex 0 etex);plus;barre;
                              plus;barre;
                              plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x^{2}+3 x+1}$ etex);
                              plus;
                                valBarre(btex 0 etex);moins;barre;
                              moins;
                                valBarre(btex 0 etex);plus;barre;
                              plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle G(x)}$ etex);
                              plus;valBarre(btex 0 etex); moins;valBarre(btex 0 etex);plus;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);plus;valBarre(btex 0 etex);moins;
                              
endTableau;

 beginTableau(44) newLigneVariables(btex $x$ etex);val(btex $-\infty $ etex);val(btex $-3$ etex);val(btex $\alpha_1$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);moins;  valBarre(btex 0 etex);plus;valBarre(btex $  $ etex);plus; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $-1$ etex,1);  valPos(btex          $-\left(e^{-4}\right)-1$
                                            etex,0);valPos(btex
                                            $ 0 $ etex,0.5);valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(45) newLigneVariables(btex $x$ etex);val(btex $-\infty $ etex);val(btex $0$ etex);val(btex $\alpha_1$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);plus;  valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $1$ etex,0);  valPos(btex          $2$
                                            etex,1);valPos(btex
                                            $ 0 $ etex,0.5);valPos(btex $-\infty$ etex,0);
endTableau;

beginTableau(47) newLigneVariables(btex $x$ etex);val(btex $0$ etex);
val(btex $1$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); plus; valBarre(btex 0 etex);moins;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $0$ etex,0); valPos(btex          $\ln\left(\frac{(e^{1}+1)}{e^{1}}\right)$
                                            etex,1);valPos(btex $0$ etex,0);
endTableau;

beginTableau(48) newLigneVariables(btex $x$ etex);val(btex $0$ etex);val(btex $\alpha_1$ etex);val(btex $\pi $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex); moins;valBarre(btex$
                                                       $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
valPos(btex $1$ etex,1);valPos(btex $ 0 $ etex,0.5);valPos(btex $-\pi -1$ etex,0);
endTableau;

beginTableau(49) newLigneVariables(btex $x$ etex);val(btex $0$ etex);val(btex $\alpha_1$ etex);val(btex $\frac{1}{e^{\frac{-1}{2}}}$ etex);val(btex $\alpha_2$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);nonDefBarre;plus;valBarre(btex$
                                                       $ etex);plus; valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex $ -1 $ etex,0.5); valPos(btex          $\frac{1}{4}$
                                            etex,1);valPos(btex
                                            $ -1 $ etex,0.5);valPos(btex $-\infty$ etex,0);
endTableau;

beginTableau(50) newLigneVariables(btex $x$ etex);val(btex $0$ etex);val(btex $e^{\frac{(-\left(\sqrt{5}\right)+1)}{2}}$ etex);val(btex $\frac{1}{e^{\frac{-1}{2}}}$ etex);val(btex $e^{\frac{(\sqrt{5}+1)}{2}}$ etex);val(btex $+\infty $ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);nonDefBarre;plus;valBarre(btex$
                                                       $ etex);plus; valBarre(btex 0 etex);moins;valBarre(btex $  $ etex);moins; 
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);
nonDefBarre;limDroite(btex $-\infty$ etex,0);valPos(btex $ -1 $ etex,0.5); valPos(btex          $\frac{1}{4}$
                                            etex,1);valPos(btex
                                            $ -1 $ etex,0.5);valPos(btex $-\infty$ etex,0);
endTableau;



beginTableau(51)
newLigneVariables(btex $\displaystyle  {x}$ etex);
   val(btex $-10$ etex);val(btex $10$ etex);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle (x-10) (x+10)}$ etex);
                                valBarre(btex 0 etex);moins; 
                                valBarre(btex 0 etex);
endTableau;

beginTableau(52) newLigneVariables(btex $x$ etex);val(btex $-\infty $ etex);
val(btex $-\left(\sqrt{2}\right)$ etex);
val(btex $-1$ etex);
val(btex $1$ etex);
val(btex $\sqrt{2}$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);moins; valBarre(btex 0 etex);plus;debutNonDefStrict;finNonDefStrict;moins;valBarre(btex 0 etex);plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $+\infty $ etex,1); valPos(btex$-2$etex,0);limGauche(btex $0$ etex,1);debutNonDef;finNonDef;limDroite(btex $0$ etex,1);valPos(btex$-2$etex,0);valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(53) newLigneVariables(btex $x$ etex);val(btex $-\infty $ etex);
val(btex $-1$ etex);
val(btex $1$ etex);
val(btex $+\infty $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(x)}$ etex);moins; debutNonDefStrict;finNonDefStrict;plus;
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $+\infty $ etex,1); limGauche(btex $-\infty$ etex,0);debutNonDefStrict;finNonDefStrict;limDroite(btex $-\infty$ etex,0);valPos(btex $+\infty $ etex,1);
endTableau;

beginTableau(54) newLigneVariables(btex $t$ etex);val(btex $0$ etex);
val(btex $\frac{\pi }{8}$ etex);
val(btex $\frac{\pi }{3}$ etex);
val(btex $\frac{3 \pi }{8}$ etex);
val(btex $\frac{\pi }{2}$ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x'(t)}$ etex);valBarre(btex $0$ etex);moins;valBarre(btex $-3 \sin\left(\frac{3 \pi }{8}\right)$ etex);moins;valBarre(btex $0$ etex);plus;valBarre(btex $3 \sin\left(\frac{\pi }{8}\right)$ etex);plus;valBarre(btex $3$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle x}$ etex);valPos(btex $1$ etex,1);valPos(btex          $\cos\left(\frac{3 \pi }{8}\right)$
                                            etex,0.5);valPos(btex          $-1$
                                            etex,0);
valPos(btex          $-\left(\cos\left(\frac{\pi }{8}\right)\right)$
                                            etex,0.5);valPos(btex $0$ etex,1);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle y'(t)}$ etex);valBarre(btex $4$ etex);plus;valBarre(btex $0$ etex);moins;valBarre(btex $-2$ etex);moins;valBarre(btex $0$ etex);plus;valBarre(btex $4$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle y}$ etex);valPos(btex $0$ etex,0);valPos(btex          $1$
                                            etex,1);valPos(btex          $\frac{(-\left(\sqrt{3}\right))}{2}$
                                            etex,0.5);valPos(btex          $-1$
                                            etex,0);
valPos(btex $0$ etex,1);
endTableau;

beginTableau(55) newLigneVariables(btex $t$ etex);val(btex $0$ etex);
val(btex $\frac{\pi }{3}$ etex);
val(btex $\pi $ etex);
val(btex $\frac{5 \pi }{3}$ etex);
val(btex $2 \pi $ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle x'(t)}$ etex);valBarre(btex $-1$ etex);moins;valBarre(btex $0$ etex);plus;valBarre(btex $3$ etex);plus;valBarre(btex $0$ etex);moins;valBarre(btex $-1$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle x}$ etex);valPos(btex $0$ etex,1);valPos(btex          $\frac{(\pi -3 \sqrt{3})}{3}$
                                            etex,0);
valPos(btex          $\pi $
                                            etex,0.5);valPos(btex          $\frac{(5 \pi +3 \sqrt{3})}{3}$
                                            etex,1);valPos(btex $2 \pi $ etex,0);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle y'(t)}$ etex);valBarre(btex $0$ etex);moins;valBarre(btex $-\left(\sqrt{3}\right)$ etex);moins;valBarre(btex $0$ etex);plus;valBarre(btex $\sqrt{3}$ etex);plus;valBarre(btex $0$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle y}$ etex);valPos(btex $1$ etex,1);valPos(btex          $0$
                                            etex,0.5);valPos(btex          $-3$
                                            etex,0);
valPos(btex          $0$
                                            etex,0.5);valPos(btex $1$ etex,1);
endTableau;

beginTableau(56) newLigneVariables(btex $t$ etex);val(btex $0$ etex);
val(btex $\frac{\pi }{8}$ etex);
val(btex $\frac{\pi }{6}$ etex);
val(btex $\frac{3 \pi }{8}$ etex);
val(btex $\frac{\pi }{2}$ etex);

newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle f'(t)}$ etex);valBarre(btex $3$ etex);plus;valBarre(btex $3 \cos\left(\frac{3 \pi }{8}\right)$ etex);plus;valBarre(btex $0$ etex);moins;valBarre(btex $-3 \cos\left(\frac{\pi }{8}\right)$ etex);moins;valBarre(btex $0$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle f}$ etex);valPos(btex $0$ etex,0);valPos(btex          $\sin\left(\frac{3 \pi }{8}\right)$
                                            etex,0.5);valPos(btex          $1$
                                            etex,1);valPos(btex          $-\left(\sin\left(\frac{\pi }{8}\right)\right)$
                                            etex,0.5);valPos(btex $-1$ etex,0);
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle g'(t)}$ etex);valBarre(btex $4$ etex);plus;valBarre(btex $0$ etex);moins;valBarre(btex $-2$ etex);moins;valBarre(btex $0$ etex);plus;valBarre(btex $4$ etex);
newLigneVariations(btex $\hbox{  Variations de }\atop{\displaystyle g}$ etex);valPos(btex $0$ etex,0);valPos(btex          $1$
                                            etex,1);valPos(btex          $\frac{\sqrt{3}}{2}$
                                            etex,0.5);valPos(btex          $-1$
                                            etex,0);
valPos(btex $0$ etex,1);
endTableau;

  beginTableau(57)
newLigneVariables(btex $ {x}$ etex);
   val(btex $0$ etex);val(btex $\frac{\pi }{3}$ etex);
val(btex $\frac{7 \pi }{6}$ etex);
val(btex $\frac{5 \pi }{3}$ etex);
val(btex $\frac{11 \pi }{6}$ etex);
val(btex $2 \pi $ etex); 
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle \cos\left(x\right)+\frac{1}{-2}}$ etex);
                              plus;
                                valBarre(btex 0 etex);moins;barre;
                              moins;
                                valBarre(btex 0 etex);plus;barre;plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle \sin\left(x\right)+\frac{1}{2}}$ etex);
                              plus;barre;
                              plus;
                                valBarre(btex 0 etex);moins;barre;
                              moins;valBarre(btex 0 etex);plus;
                              
newLigneSignes(btex $\hbox{ Signe de }\atop{\displaystyle  f (x)}$ etex);
                              plus;valBarre(btex 0 etex); moins;valBarre(btex 0 etex);plus;valBarre(btex 0 etex);moins;valBarre(btex 0 etex);plus;
                              
endTableau;

 