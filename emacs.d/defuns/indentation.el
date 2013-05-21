;; Indent whole file and clean whitespace
(defun indent-all ()
  "Indents whole buffer and cleans whitespace."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; M-enter will jump to end of line, insert a new line, and indent it
(defun end-of-line-and-indent-new-line  ()
  "Jump to end of line, insert new line and indent it."
  (interactive)
  (end-of-line)
  (newline-and-indent))