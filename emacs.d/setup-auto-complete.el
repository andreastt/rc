(autoload 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(setq ac-auto-start nil
      ac-quick-help-delay 0.5)
;;      ac-trigger-key "TAB"
;;      ac-use-menu-map t)

(custom-set-variables
 '(ac-trigger-key "TAB")
 '(ac-auto-start nil)
 '(ac-use-menu-map t))

;(define-key ac-mode-map [(control tab)] 'auto-complete)

;; (defun my-ac-config ()
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;   (global-auto-complete-mode t))

;; Go support
;;(add-to-list 'ac-modes 'go-mode)

;;(my-ac-config)

(ac-config-default)

;; For eclim (Eclipse) integration
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(provide 'setup-auto-complete)
