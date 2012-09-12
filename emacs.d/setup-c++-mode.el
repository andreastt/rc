;;; setup-c++-mode.el --- Development setup for C++

(defun my-c++-mode-hook ()
  (define-key c++-mode-map (kbd "<S-f9>") 'gdb)
  (define-key c++-mode-map (kbd "<S-f10>") 'compile))
;  (define-key c++-mode-map (kbd "<f7>") 'gdb-step)
;  (define-key c++-mode-map (kbd "<f8>") 'gdb-next))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(require 'auto-complete-clang)

(defun my-ac-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-mode-setup)

(provide 'setup-c++-mode)