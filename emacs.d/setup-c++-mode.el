;;; setup-c++-mode.el --- Development setup for C++

(defun my-c++-mode-hook ()
  (define-key c++-mode-map (kbd "<S-f9>") 'gdb)
  (define-key c++-mode-map (kbd "<S-f10>") 'compile))
;  (define-key c++-mode-map (kbd "<f7>") 'gdb-step)
;  (define-key c++-mode-map (kbd "<f8>") 'gdb-next))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(provide 'setup-c++-mode)