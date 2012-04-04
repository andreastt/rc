;; mode:-*-emacs-lisp-*-

;;; .emacs --- ato's emacs configuration

;; Load paths
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Disable splash screen and startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Backup directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Hide menu-, scroll- and toolbar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Go to line
(global-set-key "\C-l" 'goto-line)

;; yes -> y
(fset 'yes-or-no-p 'y-or-n-p)

;; Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Follow symlinks automatically, but show a warning
(setq vc-follow-symlinks nil)

;; Window size
(setq default-frame-alist '(
			    (width . 140)
			    (height . 65)
			    ))

;; Smooth scrolling
(setq scroll-step 1)

;; Cusor type
(setq-default cursor-type 'bar)

;; Whitespace
(require 'whitespace)
(setq whitespace-style '(empty trailing))

;; History
(setq history-length 250)
(savehist-mode 1)
(setq savehist-file "~/.emacs.d/tmp/savehist")

;; Use Opera as default web browser
(setq browse-url-generic-program "opera"
      browse-url-browser-function 'browse-url-generic)

;; Enable meta key (OS X)
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; Forward delete in OS X (Fn+Delete)
(global-set-key [kp-delete] 'delete-char)


;; -----
;; Tramp
;; -----
(require 'password-cache)
(require 'tramp)
(setq password-cache-expiry nil)


;; ------------
;; Autocomplete
;; ------------

(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/dict")
(ac-config-default)


;; ---
;; ECB
;; ---

(add-to-list 'load-path "~/.emacs.d/vendor/ecb")
(require 'ecb)
(require 'ecb-autoloads)


;; -----
;; Theme
;; -----

(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))


;; --------------------------------------------------------
;; C++
;; --------------------------------------------------------

(setq-default c-default-style "linux"
	      c-basic-offset 4)


;; --------------------------------------------------------
;; Perl stuff
;; --------------------------------------------------------
(fset 'perl-mode 'cperl-mode)

(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t)


;; ---------
;; CSS stuff
;; ---------
(setq css-indent-offset 2)


;; ------
;; Python
;; ------

;; IPython shell instead of interactive python shell
(setq py-python-command-args '( "-colors" "Linux"))
(require 'python-mode)
(require 'ipython)

(defadvice py-execute-buffer (around python-keep-focus activate)
  "return focus to python code buffer"
  (save-excursion ad-to-it))

;; On the fly code syntax checking
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "pycheckers" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pyflakes-init)))
(load-library "flymake-cursor")
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)


;; --------------------------------------------------------
;; Settings set with the internal Emacs customization panel
;; --------------------------------------------------------

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Grey15" :foreground "Grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "xos4" :family "Terminus"))))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "windowBackgroundColor")))))
(put 'upcase-region 'disabled nil)
)