;
;;; york-thesis.el - Special code for york-thesis style.
;
;;; Code:

;; AUCTeX configuration
(TeX-add-style-hook "york-thesis"
 (function (lambda ()
   (setq LaTeX-largest-level (LaTeX-section-level "part"))
   (LaTeX-add-environments
	"epigraphs" "fquote"
	"fquotation" "fverse")
   (TeX-add-symbols
        '("epigraph" 2)
	'("degreename" 1)
	'("committeememberslist" 1)
	'("department" 1)
	'("masterof" 1)
	'("abstractfile" 1)
	'("acknowledgementsfile" 1)
	'("prefacefile" 1)
	'("abbreviationsfile" 1)
	'("threestars" 0))
)))

;;; york-thesis.el ends here