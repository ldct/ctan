(TeX-add-style-hook "labbook"
  (lambda ()
		(TeX-add-symbols
		 '("newexperiment" "abbreviation" t)
		 '("newsubexperiment" "abbreviation" t)
		 )
    (setq LaTeX-largest-level (LaTeX-section-level "chapter"))
    ;; load basic definitons
    (TeX-run-style-hooks "scrbase")
    (TeX-run-style-hooks "scrbook")
    (make-local-variable 'LaTeX-section-list)
    (setq LaTeX-section-list 
					'(("part" 0)
						("labday" 1)
						("chapter" 1)
						("experiment" 2)
						("section" 2)
						("subexperiment" 3)
						("subsection" 3)
						("subsubsection" 4)
						("paragraph" 5)
						("subparagraph" 6)
						("addpart" 0)
						("addsec" 2)
						("minisec" 7)))
		(setq LaTeX-section-label
			'(("chapter" . "day:")
				("labday" . "day:")
				("section" . "sec:")
				("experiment" . "sec:")
				("subexperiment" . "sec:")
				("subsection" . "sec:")))
		(if (fboundp 'reftex-add-section-levels)
				(reftex-add-section-levels '(("labday" . 1)
																		 ("experiment" . 2)
																		 ("subexperiment" . 3))))
))


