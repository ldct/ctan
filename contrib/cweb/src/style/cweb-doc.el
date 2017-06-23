;; $Id: cweb-doc.el,v 1.1 1995/08/29 15:15:30 schrod Exp $
;;----------------------------------------------------------------------

;;;
;;; AUC-TeX configuration for cweb-doc.sty
;;;

(TeX-add-style-hook "cweb-doc"
  (function
    (lambda ()
      (TeX-add-symbols "cweb" "ctangle" "cweave"
		       '("arg" 1)
		       '("<" TeX-arg-free ">")
		       '("cls" 1)
		       '("pkg" 1)
		       )
      (LaTeX-add-environments "fixme" "cseqtab"
			      '("options" LaTeX-env-item)
			      )
      (setq LaTeX-item-list (cons '("options" . LaTeX-item-argument)
				  LaTeX-item-list))
      )))
