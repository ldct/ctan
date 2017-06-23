;;; qcm.el --- AUC-TeX style file for QCM

;; Copyright (C) 2004 Didier Verna.

;; Author:        Didier Verna <didier@lrde.epita.fr>
;; Maintainer:    Didier Verna <didier@lrde.epita.fr>
;; Created:       Tue Apr 18 14:49:29 2000
;; Last Revision: Tue Nov  9 17:46:37 2004
;; Keywords:      tex abbrev data

;; This file is part of QCM.

;; QCM may be distributed and/or modified under the
;; conditions of the LaTeX Project Public License, either version 1.1
;; of this license or (at your option) any later version.
;; The latest version of this license is in
;; http://www.latex-project.org/lppl.txt
;; and version 1.1 or later is part of all distributions of LaTeX
;; version 1999/06/01 or later.

;; QCM consists of all files listed in the file `README'.


;;; Commentary:

;; Contents management by FCM version 0.1-b2.

;; #### NOTE: maybe this file should be split in two: one for the style and
;; #### one for the class.

;;; Code:

(defun qcm-LaTeX-item-question ()
  (if current-prefix-arg
      (TeX-insert-macro "true")
    (TeX-insert-macro "false")))

(push '("question" . qcm-LaTeX-item-question) LaTeX-item-list)

(defun qcm-LaTeX-env-question (environment)
  "Create a \`question' environment in a QCM document."
  ;; Questions can be quite long, so instead of prompting for them, which
  ;; would be annoying, let's just put the point inside the braces.
  (LaTeX-insert-environment environment "{}")
  (beginning-of-line)
  (kill-line)
  (LaTeX-find-matching-begin)
  (end-of-line)
  (forward-char -1)
  )

(TeX-add-style-hook "qcm"
  (function
   (lambda ()
     ;; QCM style:
     (LaTeX-add-environments
      '("question" qcm-LaTeX-env-question)
      '("correction")
      )
     (TeX-add-symbols
      '("true" (TeX-arg-literal " "))
      '("false" (TeX-arg-literal " "))
      '("truesymbol" t)
      '("falsesymbol" t)
      '("correctionstyle" t)
      '("questionspace")
      '("thequestion")
      '("answerstitle" t)
      '("answerstitlefont" t)
      '("answernumberfont" t)
      '("makeform")
      '("makemask")
      '("headerfont" t)
      '("X" t)
      ;; QCM Class:
      '("title" t)
      '("titlefont" t)
      '("titlespace")
      '("maketitle")
      '("questiontitle" t)
      '("questiontitlefont" t)
      '("questiontitlespace")
      '("questionsepspace")
      )
     )))




;;; Local variables:
;;; eval: (put 'TeX-add-style-hook 'lisp-indent-function 1)
;;; End:

;;; qcm.el ends here
