;;; setup-c++-mode.el --- Development setup for C++

;; Change scroll behaviour of compilation
(setq compilation-scroll-output 'first-error)

(defun my-c++-mode-hook ()
  ;; Compile
  (define-key c++-mode-map (kbd "C-<f9>") 'compile)

  ;; Kill compilation
  (define-key c++-mode-map (kbd "C-<f2>") 'kill-compilation)

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
