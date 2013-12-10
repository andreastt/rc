;;; setup-c++-mode.el --- Development setup for C++

;; TODO(ato): Share many of these with c-mode.

(defun my-c++-mode-hook ()
  ;; Debug with gud-gdb
  ;;
  ;; Debugging step key bindings are defined in setup-gdb.el.
  (define-key c++-mode-map (kbd "S-<f9>") 'gdb)

  ;; Switch between header and implementation
  (define-key c++-mode-map (kbd "<f12>") 'ff-find-other-file))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; Use Google C style
(add-hook 'c-mode-common-hook 'google-set-c-style)

(provide 'setup-c++-mode)
