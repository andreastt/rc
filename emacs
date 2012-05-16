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

(defun setup-frame-hook (frame)
  "This function will be applied to all new emacs frames."
  (set-frame-parameter frame 'alpha '(95 95)) ; translucency
  (mouse-avoidance-mode 'cat-and-mouse) ; avoid mouse
  (fringe-mode 5)                       ; make fringes smaller
  (tool-bar-mode 0)                     ; no toolbar
  (menu-bar-mode 0)                     ; no menubar
  (scroll-bar-mode 0)                   ; no scrollbar
  (set-frame-parameter (selected-frame) 'alpha '(95 95)) ; translucency
  )
(add-hook 'after-make-frame-functions 'setup-frame-hook)

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

;; Popup messages to notify
(defun djcb-popup (title msg &optional icon)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the
  title of the message, MSG is the context.  Optionally you can
  provide an ICON and a sound to beplayed"
  (interactive)
  (if (eq window-system 'x)
      (shell-command (concat "notify-send "
			     if (icon (concat "-i " icon) "")
			     " '" title "' '" msg "'"))
    ;; text only version
    (message (concat title ": " msg))))


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


;; --------------------------------------------------------
;; Wanderlust
;; --------------------------------------------------------
(custom-set-variables
 '(wl-init-file "~/.wl"))
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)


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
 '(ecb-options-version "2.40")
 '(nil nil t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Grey15" :foreground "Grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "xos4" :family "Terminus"))))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "windowBackgroundColor")))))
