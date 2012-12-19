;; C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Java
(add-to-list 'auto-mode-alist '("\\.java\\'" . jde-mode))

(defun my-java-mode-hook ()
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

;; Go
(add-to-list (quote auto-mode-alist) (cons "\\.go$" (function go-mode)))

;; Perl
(fset 'perl-mode 'cperl-mode)

(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t)

;; YAML
(autoload 'yaml-mode "yaml-mode")
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; HTML
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . html-mode))
(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; CSS
(setq css-indent-offset 2)

;; SVG
(add-to-list 'auto-mode-alist '("\\.svg$" . image-mode))

;; JavaScript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (require 'setup-js2-mode)))

;; Apache config
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; Soy templates
(autoload 'soy-mode "soy-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.soy\\'" . soy-mode))

(provide 'mode-mappings)
