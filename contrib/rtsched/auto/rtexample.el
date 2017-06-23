(TeX-add-style-hook "rtexample"
 (lambda ()
    (LaTeX-add-labels
     "fig:ex1"
     "fig:ex1a"
     "fig:ex1b"
     "fig:ex1c"
     "fig:ex2"
     "fig:ex2a"
     "fig:ex2b"
     "fig:ex2c"
     "fig:ex3a")
    (TeX-run-style-hooks
     "url"
     "rtsched"
     "latex2e"
     "art10"
     "article")))

