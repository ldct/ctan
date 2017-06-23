(TeX-add-style-hook "rtsched-doc"
 (lambda ()
    (LaTeX-add-labels
     "fig:ex1"
     "fig:ex1a"
     "fig:ex1b"
     "fig:ex1c"
     "fig:resp-time"
     "fig:ex2"
     "fig:ex2a"
     "fig:ex2b"
     "fig:ex3a"
     "fig:ex4")
    (TeX-run-style-hooks
     "url"
     "rtsched"
     "latex2e"
     "art10"
     "article")))

