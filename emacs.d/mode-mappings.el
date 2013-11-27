(require 'google-c-style)

;; C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Java
(add-to-list 'auto-mode-alist '("\\.java\\'" . java-mode))

;; Go
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; Rust
(add-to-list 'auto-mode-alist '("\\.rc\\'" . rust-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Perl
(fset 'perl-mode 'cperl-mode)

(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t)

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
(add-hook 'js2-mode-hook (lambda () (require 'setup-js2)))

(provide 'mode-mappings)
