;; Default options for c-mode-common, which implicitly affects all C
;; like languages and modes such as c-mode, c++-mode, java-mode, &c.

;; Change scroll behaviour of compilation
(setq compilation-scroll-output 'first-error)

;; ;; global is used for looking up tags and symbols.
;; (defun my-gtags-hook ()
;;   ;; Find a tag
;;   (local-set-key (kbd "M-.") 'gtags-find-tag)

;;   ;; Find reverse tag
;;   (local-set-key (kbd "M-,") 'gtags-find-rtag))
;; (add-hook 'gtags-mode-hook 'my-gtags-hook)

(defun my-c-common-hook ()
  ;; Compile and recompile
  ;; (local-key-set (kbd "C-<f9>") 'compile)
  ;; (local-key-set (kbd "C-S-<f9>") 'recompile)
  (define-key c-mode-base-map (kbd "C-<f9>") 'compile)
  (define-key c-mode-base-map (kbd "C-S-<f9>") 'compile)

  ;; Kill compilation
  ;; (local-key-set (kbd "C-<f2>") 'kill-compilation)
  (define-key c-mode-base-map (kbd "C-<f2>") 'kill-compilation)

  ;; Traverse compile errors
  (define-key c-mode-base-map (kbd "C-c C-p") 'show-previous-error)
  (define-key c-mode-base-map (kbd "C-c C-n") 'show-next-error)

  ;; Use GNU global
  (require 'gtags)
  (gtags-mode t)
  (gtags-create-or-update))
(add-hook 'c-mode-common-hook 'my-c-common-hook)
;; (add-hook 'c-initialization-hook 'my-c-initialization-hook)

(provide 'setup-cc)
