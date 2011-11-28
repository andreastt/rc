;; mode:-*-emacs-lisp-*-
;; ato's emacs configuration

;; ----------
;; Load paths
;; ----------

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme")


;; ----------------
;; Backup directory
;; ----------------
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; -------------------------------
;; Hide menu-, scroll- and toolbar
;; -------------------------------
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)


;; ----------
;; Go to line
;; ----------
(global-set-key "\C-l" 'goto-line)


;; --------
;; yes -> y
;; --------
(fset 'yes-or-no-p 'y-or-n-p)


;; -----
;; Tramp
;; -----
(require 'password-cache)
(require 'tramp)
(setq password-cache-expiry nil)


;; -----
;; Theme
;; -----
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))


;; ----------
;; Wanderlust
;; ----------
(setq user-mail-address "ato@sny.no")
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)


;; ----------
;; Perl stuff
;; ----------
(fset 'perl-mode 'cperl-mode)

(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t)


;; ---------
;; CSS stuff
;; ---------
(setq css-indent-offset 2)


;; --------------------------------------------------------
;; Settings set with the internal Emacs customization panel
;; --------------------------------------------------------

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Grey15" :foreground "Grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "xos4" :family "Terminus"))))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "windowBackgroundColor")))))
(put 'upcase-region 'disabled nil)
