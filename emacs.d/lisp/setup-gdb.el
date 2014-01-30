;;; setup-gdb.el --- GDB and GUD setup

;; General GDB and GUD settings
(add-hook 'gdb-mode-hook '(lambda ()
                            (gud-tooltip-mode 1)
                            (gdb-many-windows t)
                            (tool-bar-mode t)
                            (gdb-show-changed-values t)))

;; Key bindings for GUD
(defun my-gud-mode-hook ()
  (define-key gud-mode-map (kbd "S-<f9>") 'gud-go)
  (define-key gud-mode-map (kbd "C-c w") 'gud-self-watch)
  (define-key gud-mode-map (kbd "C-c e") 'gud-print)
  (define-key gud-mode-map (kbd "<f7>") 'gud-step)
  (define-key gud-mode-map (kbd "<f8>") 'gud-next))

(add-hook 'gud-mode 'my-gud-mode-hook)

(provide 'setup-gdb)
