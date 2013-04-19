(autoload 'compile "compile" t)

(defun my-c-mode-hook ()
  (setq c-basic-offset 2
        c-label-offset 0
        indent-tabs-mode nil
        compile-command "cd ~/dev/goth/client && ant compile"
        require-final-newline nil)
  (lambda () (auto-fill-mode 1))
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
;;(global-set-key "\M-n" 'jde-complete-minibuf)
;;(global-set-key "\M-N" 'jde-complete-menu)
  (define-key c-mode-base-map "\C-c\C-p" 'show-previous-error)
  (define-key c-mode-base-map "\C-c\C-n" 'show-next-error)
  (c-set-offset 'substatement-open 0))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

(provide 'setup-java)
