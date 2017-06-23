(TeX-add-style-hook "tablor-xetex"
 (lambda ()
    (LaTeX-add-environments
     "TSa"
     "TSq"
     "TS"
     "TSc"
     "TV"
     "TVP"
     "TVZ"
     "TVapp"
     "TVI"
     "TVIex"
     "TVIapp"
     "TVPC"
     "TVS")
    (TeX-add-symbols
     '("initablor" ["argument"] 0)
     '("nettoyer" ["argument"] 0)
     '("dressetoile" 2)
     '("dresse" 2)
     '("coultab" 1)
     '("ech" 1)
     '("executGiacmp" 1)
     "rem"
     "cat"
     "cp"
     "echod"
     "echof"
     "nomtravail"
     "tv"
     "tvbis"
     "echelle"
     "couleurtab")
    (TeX-run-style-hooks
     "pst-eps"
     "graphicx"
     "babel"
     "frenchb"
     "fontenc"
     "T1"
     "latex2e"
     "art10"
     "article"
     "ifxetex"
     "ifpdf"
     "fancyvrb"
     "ifthen"
     "filecontents"
     "tablor")))

