(TeX-add-style-hook "sciposter-example"
 (lambda ()
    (LaTeX-add-environments
     "Def")
    (LaTeX-add-bibitems
     "Flusser:Suk:93"
     "Hu:62"
     "maragos89:_patter"
     "Meijster:Wilkinson:PAMI"
     "Nacken:thesis")
    (LaTeX-add-labels
     "fig:blocks"
     "eq:antiext"
     "eq:increasing"
     "eq:idempot"
     "fig:opentransf"
     "alg:spect"
     "fig:tauspect"
     "fig:binspect")
    (TeX-add-symbols
     "imsize")
    (TeX-run-style-hooks
     "multicol"
     "amssymb"
     "amsmath"
     "epsfig"
     "latex2e"
     "sciposter10"
     "sciposter")))

