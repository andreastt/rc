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

;; HTML
(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; CSS
(setq css-indent-offset 2)

;; JavaScript
(add-hook 'js2-mode-hook (lambda () (require 'setup-js2)))

;; Markdown
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; Disable autopair in term-mode
(add-hook 'term-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate t) ;; for emacsen < 24
              (autopair-mode -1))             ;; for emacsen >= 24
)

(provide 'mode-hooks)
