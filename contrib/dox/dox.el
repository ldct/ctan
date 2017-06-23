;;; dox.el --- AUC-TeX style file for DoX

;; Copyright (C) 2009, 2010, 2017 Didier Verna

;; Author: Didier Verna <didier@didierverna.net>
;; Keywords: tex abbrev data

;; This file is part of DoX.

;; DoX may be distributed and/or modified under the conditions of the LaTeX
;; Project Public License, either version 1.3 of this license or (at your
;; option) any later version. The latest version of this license is in
;; http://www.latex-project.org/lppl.txt and version 1.3 or later is part of
;; all distributions of LaTeX version 2005/12/01 or later.

;; DoX consists of all files listed in the file `README.md'.


;;; Commentary:


;;; Code:

(TeX-add-style-hook "dox"
  (function
   (lambda ()
     (TeX-add-symbols
      '("doxitem" [ "Options" ]
	"Function name" "Environment name" "Index category name")))))

(defun doxitem (envname)
  "Register a new environment ENVNAME with AUC-TeX.

The effect is to make docTeX mode treat this new environment just like
the macro and environment ones. Currently, this means avoiding inner
indentation.

ENVNAME is actually a regexp appearing in a logical group.
This means that you can register several environments simultaneously
by means or regexp combination."
  (make-local-variable 'docTeX-indent-inner-fixed)
  (push (list
	 (concat (regexp-quote TeX-esc)
		 "\\(begin\\|end\\)[ \t]*{\\("
		 envname
		 "\\)\\*?}")
	 0 nil)
	docTeX-indent-inner-fixed))

(defun doxitems (&rest envnames)
  "Register environments ENVNAMES with AUC-TeX.
See the function `doxitem' for more information."
  (mapc #'doxitem envnames))




;;; Local variables:
;;; eval: (put 'TeX-add-style-hook 'lisp-indent-function 1)
;;; End:

;;; dox.el ends here
