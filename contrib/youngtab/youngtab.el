;;; youngtab.el - Support for the user macros of the youngtab package
;; by Volker B"orchers, <boercher@physik.uni-bremen.de>
;; This program can be redistributed and/or modified under the terms
;; of the LaTeX Project Public License Distributed from CTAN
;; archives in directory macros/latex/base/lppl.txt; either
;; version 1 of the License, or any later version.

;;-((and (not( = elisp favorite-language)) (concat "lucky" "it" "works" (!))))
 
(TeX-add-style-hook "youngtab"
 (function
  (lambda ()
    (TeX-add-symbols
     '("Yboxdim" "Box Dimension")
     '("Ylinethick" "Line Thickness")
     '("Yinterspace" "Space between 2 Tableaux")
     '("Yvcentermath" TeX-arg-young-bool)
     '("Ystdtext" TeX-arg-young-bool)
     '("yng" (TeX-arg-young t))
     '("young" TeX-arg-young)
     ))))

(defun TeX-arg-young (optional &optional isyng)
  "Insert macros young and yng.
Ask for the rows of a tableau.
Do not accept non-numbers for yng."
  (let ((num 0))
    (insert "(")
    (while (>= num 0)
      (setq num (1+ num))
      (setq row (read-input (concat (int-to-string num) ". Row: ")))
      (if (zerop (length row))
	  (setq num -1)
	(if (and isyng (<= (string-to-int row) 0))
	    (setq num (- num 1))
	  (insert (if (> num 1) "," "") row)))))
    (insert ")"))

(defun TeX-arg-young-bool (optional)
  "To handle the switches Yvcentermath and Ystdtext"
  (insert (if (y-or-n-p "true(y) or false(n)? ") "1" "0")))

