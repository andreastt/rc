;; C and C++
(require 'google-c-style)
(setq c-default-style "linux"
      c-basic-offset 4)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;(add-hook 'c-mode-common-hook 'google-set-c-style)

;; Perl
(fset 'perl-mode 'cperl-mode)
(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t)

;; Java/JDEE
(defun my-java-mode-hook ()
  ;; (setq c-basic-offset 2
  ;;    c-label-offset 0
  ;;    indent-tabs-mode nil
  ;;    compile-command "cd ~/dev/webdriver-opera; ant compile"
  ;;    require-final-newline nil)
  (lambda () (auto-fill-mode 1))
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (global-set-key "\M-N" 'jde-complete-minibuf)
  (global-set-key "\M-n" 'jde-complete-menu)
  (define-key c-mode-base-map "\C-c\C-p" 'show-previous-error)
  (define-key c-mode-base-map "\C-c\C-n" 'show-next-error)
  (c-set-offset 'substatement-open 0))
(add-hook 'jde-mode-hook 'my-java-mode-hook)
(add-hook 'jde-mode-hook 'google-set-c-style)
(add-hook 'jde-mode-hook 'google-make-newline-indent)

;; HTML
(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; CSS
(setq css-indent-offset 2)

;; JavaScript
(add-hook 'js2-mode-hook (lambda () (require 'setup-js2-mode)))

(provide 'mode-hooks)