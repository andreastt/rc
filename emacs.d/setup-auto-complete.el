(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(setq ac-auto-start nil
      ac-quick-help-delay 0.5)

(define-key ac-mode-map [(control tab)] 'auto-complete)

(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (global-auto-complete-mode t))

(add-to-list 'ac-modes 'go-mode)

(my-ac-config)

(provide 'setup-auto-complete)