;; -----------
;; Load paths.
;; -----------

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme")

;; --------------------------------------------
;; Option key problems with Mac OS X and Emacs.
;; --------------------------------------------

(cond ((eq window-system 'ns) 
       (setq mac-command-modifier 'meta) 
       (setq mac-option-modifier 'none)) 
      ((and (eq window-system 'mac) (boundp 'aquamacs-version)) 
       (setq mac-command-modifier 'meta) 
       (setq mac-option-modifier nil)))


;; -----------------
;; Backup directory.
;; -----------------
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; -------------
;; Hide toolbar.
;; -------------
(tool-bar-mode -1)


;; -----------
;; Go to line.
;; -----------
(global-set-key "\C-l" 'goto-line)


;; ---------------------------
;; Setting font size to ~10pt.
;; ---------------------------
(set-face-attribute 'default nil :height 100)


;; ---------------------------
;; Set Emacs frame dimensions.
;; ---------------------------
(add-to-list 'default-frame-alist '(height . 85))
(add-to-list 'default-frame-alist '(width . 225))


;; ---------
;; yes -> y.
;; ---------
(fset 'yes-or-no-p 'y-or-n-p)


;; ---------------------
;; Menu and scroll bars.
;; ---------------------
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)


;; ----
;; ECB.
;; ----
;;(ecb-activate)
(require 'ecb-autoloads)


;; ------
;; Tramp.
;; ------
(require 'password-cache)
(require 'tramp)
(setq password-cache-expiry nil)


;; ------
;; Theme.
;; ------
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-clarity)))


;; -----------
;; Perl stuff.
;; -----------
(fset 'perl-mode 'cperl-mode)

(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t)


;; ----------
;; CSS stuff.
;; ----------
(setq css-indent-offset 2)


;; -----------
;; Ruby stuff.
;; -----------
;;(add-to-list 'auto-mode-list '("\\.rb\\'" . ruby-mode))
;;(add-to-list 'auto-mode-list '("/Rakefile$" . ruby-mode))
;;(add-to-list 'auto-mode-list '("\\.rake\\'$" . 

;; YAML-mode
(define-generic-mode 'yaml-mode
  (list ?\#)
  nil
  (list
   '("^[ \t]*\\(.+\\)[ \t]*:[ \r\n]" 0 font-lock-type-face)
   '("\\(%YAML\\|# \\(.*\\)\\|\\(---\\|\\.\\.\\.\\)\\(.*\\)\\)" 0 font-lock-comment-face)
   '("\\(\\*\\|\\&\\)\\(.*\\)" 0 (cons font-lock-variable-name-face '(underline)))
   '("\\!\\!\\sw+[ \r\n]" 0 font-lock-function-name-face)
   )
  (list "\\.yml$")
  nil
  "Generic mode for yaml files.")


;; ------------------------
;; PHP and web development.
;; ------------------------
(load "~/.emacs.d/nxhtml/autostart.el")


;; ----
;; Git.
;; ----
;;(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))

;;(require 'git)

;;(autoload 'egit "egit" "Emacs git history" t)
;;(autoload 'egit-file "egit" "Emacs git history file" t)
;;(autoload 'egit-dir "egit" "Emacs git history directory" t)

(require 'magit)


;; -----
;; Font.
;; -----
(set-face-font 'default "-unknown-DejaVu Sans Mono-normal-normal-normal-*-11-*-*-*-m-0-iso10646-1")
;;(set-face-font 'default "-jmk-neep alt-medium-r-*-*-20-*-*-*-c-*-iso10646-1")


;; ---------------------------------------------------------
;; Settings set with the internal Emacs customization panel.
;; ---------------------------------------------------------

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.32")
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "black"
;;         :foreground "white" :inverse-video nil :box nil :strike-through
;;         nil :overline nil :underline nil :slant normal :weight normal
;;         :height 9 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "windowBackgroundColor")))))
(put 'upcase-region 'disabled nil)
