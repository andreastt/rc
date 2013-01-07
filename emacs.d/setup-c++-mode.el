;;; setup-c++-mode.el --- Development setup for C++

;; Change scroll behaviour of compilation
(setq compilation-scroll-output 'first-error)

(defun my-c++-mode-hook ()
;  (define-key c++-mode-map (kbd "<S-f9>") 'gdb)
;  (define-key c++-mode-map (kbd "<S-f10>") 'compile))
;  (define-key c++-mode-map (kbd "<f7>") 'gdb-step)
;  (define-key c++-mode-map (kbd "<f8>") 'gdb-next))

  ;; Compile
  ;(define-key c++-mode-map (kbd "<f12>") 'compile)
  
  ;; Kill compilation
  (define-key c++-mode-map (kbd "C-<f2>") 'kill-compilation)

  ;; Open gud-gdb
  (define-key c++-mode-map (kbd "S-<f9>") 'gdb)

  ;; Switch between header and implementation
  (define-key c++-mode-map (kbd "<f12>") 'ff-find-other-file))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; (require 'auto-complete-clang)

;; (defun my-ac-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-mode-setup)

(add-hook 'c-mode-common-hook 'google-set-c-style)

(provide 'setup-c++-mode)
