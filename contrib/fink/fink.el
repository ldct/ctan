;;; fink.el --- AUC-TeX style file for FiNK

;; Copyright (C) 2000, 2001, 2002, 2007 Didier Verna.

;; Author:        Didier Verna <didier@lrde.epita.fr>
;; Maintainer:    Didier Verna <didier@lrde.epita.fr>
;; Created:       Wed Mar 29 18:52:37 2000
;; Last Revision: Mon Jun 11 10:58:36 2007
;; Keywords:      tex abbrev data

;; This file is part of FiNK.

;; FiNK may be distributed and/or modified under the
;; conditions of the LaTeX Project Public License, either version 1.1
;; of this license or (at your option) any later version.
;; The latest version of this license is in
;; http://www.latex-project.org/lppl.txt
;; and version 1.1 or later is part of all distributions of LaTeX
;; version 1999/06/01 or later.

;; FiNK consists of all files listed in the file `README'.


;;; Commentary:

;; Contents management by FCM version 0.1-b2.


;;; Code:

(TeX-add-style-hook "fink"
  (function
   (lambda ()
     (TeX-add-symbols
      '("finkdir")
      '("finkbase")
      '("finkext")
      '("finkfile")
      '("finkpath")
      ;; Backward Compatibility:
      '("finkextension" "Extension")))))




;;; Local variables:
;;; eval: (put 'TeX-add-style-hook 'lisp-indent-function 1)
;;; End:

;;; fink.el ends here
