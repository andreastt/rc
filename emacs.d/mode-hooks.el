;; C and C++
(autoload 'google-c-style "google-c-style" t)
(setq c-default-style "linux"
      c-basic-offset 4)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;(add-hook 'c-mode-common-hook 'google-set-c-style)

;; Java
(add-hook 'java-mode-hook 'my-java-mode-hook)

;; Perl
(fset 'perl-mode 'cperl-mode)
(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t)

;; JavaScript
(add-hook 'js2-mode-hook (lambda () (require 'setup-js2)))

(provide 'mode-hooks)
