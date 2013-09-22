;; global is used for looking up tags and symbols.
(defun my-gtags-hook ()
  ;; Find a tag
  (local-set-key (kbd "M-.") 'gtags-find-tag)

  ;; Find reverse tag
  (local-set-key (kbd "M-,") 'gtags-find-rtag))
(add-hook 'gtags-mode-hook 'my-gtags-hook)

;; Change scroll behaviour of compilation
(setq compilation-scroll-output 'first-error)

(defun my-c-mode-hook ()
  ;; Compile
  (define-key c-mode-map (kbd "C-<f9>") 'compile)

  ;; Kill compilation
  (define-key c-mode-map (kbd "C-<f2>") 'kill-compilation)

  ;; Debug with gud-gdb
  (define-key c-mode-map (kbd "S-<f9>") 'gdb)

  ;; Switch between header and implementation
  (define-key c-mode-map (kbd "<f12>") 'ff-find-other-file)

  (require 'gtags)
  (gtags-mode t)
  (gtags-create-or-update))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

(provide 'setup-c-mode)
