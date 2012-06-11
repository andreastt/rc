;; mode:-*-emacs-lisp-*-

;;; .emacs --- ato's emacs configuration

;; Remove built-in CEDET in Emacs >= 23.2 from load path
(setq load-path
      (remove (concat "/usr/share/emacs/"
		      (substring emacs-version 0 -2) "/lisp/cedet")
	      load-path))

;; Load paths
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Disable splash screen and startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Disable system beep
(setq visible-bell t)

;; Backup directory
(setq
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Save minibuffer history
(setq savehist-file "~/.emacs.d/tmp/savehist")
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(savehist-mode 1)

;; Hide menu-, scroll- and toolbar
(tool-bar-mode -1)
(scroll-bar-mode -1)
;(menu-bar-mode -1)

(defun setup-frame-hook (frame)
  "This function will be applied to all new Emacs frames."
  (set-frame-parameter frame 'alpha '(95 95)) ;; translucency
  (mouse-avoidance-mode 'cat-and-mouse)       ;; avoid mouse
  (fringe-mode 5)                             ;; make fringes smaller
  (tool-bar-mode 0)                           ;; no toolbar
  (menu-bar-mode 0)                           ;; no menubar
  (scroll-bar-mode 0)                         ;; no scrollbar
  (set-frame-parameter (selected-frame) 'alpha '(95 95))  ;; translucency
  )
(add-hook 'after-make-frame-functions 'setup-frame-hook)

;; Go to line
(global-set-key "\C-l" 'goto-line)

;; yes → y
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

;; Cursor type
(setq-default cursor-type 'bar)

;; Whitespace
;(require 'whitespace)
;(setq whitespace-style '(empty trailing))

;; Default web browser
(setq browse-url-generic-program "opera")

;; Brace matching with vi-style % jumping
(show-paren-mode 1)
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;; Indent whole file and clean whitespace
(defun indent-all ()
  "Indents whole buffer and cleans whitespace."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; Alt+Enter will jump to end of line, insert a new line and indent it
(defun end-of-line-and-indent-new-line ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

(global-set-key (kbd "<M-return>") 'end-of-line-and-indent-new-line)

;; Interactively match anything
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Easier buffer switching (C-x b), C-<tab> will switch window,
;; C-<left>/<right> will jump forward and backwards between buffers
(iswitchb-mode 1)
(global-set-key [C-tab] 'other-window)
(global-set-key [C-left] 'next-buffer)
(global-set-key [C-right] 'previous-buffer)

;; Auto-refresh all buffers when files change on disk
(global-auto-revert-mode t)


;; ------------------
;; Diary and calendar
;; ------------------

;; Show diary entries automatically
(setq mark-diary-entries-in-calendar t)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; Week numbers in calendar
(copy-face font-lock-constant-face 'calendar-iso-week-face)
(set-face-attribute 'calendar-iso-week-face nil
                    :height 0.7)
(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'calendar-iso-week-face))


;; -----
;; Tramp
;; -----

(require 'password-cache)
(require 'tramp)
(setq password-cache-expiry nil)


;; ------
;; X-face
;; ------

(autoload 'x-face-decode-message-header "x-face-e21")

(autoload 'x-face-insert "x-face-e21" nil t)
(autoload 'x-face-save "x-face-e21" nil t)
(autoload 'x-face-show "x-face-e21" nil t)
(autoload 'x-face-ascii-view "x-face-e21" nil t)
(autoload 'x-face-turn-off "x-face-e21")

(add-hook 'mime-edit-translate-hook 'x-face-turn-off)
(add-hook 'mew-make-message-hook 'x-face-turn-off)


;; ----------
;; Wanderlust
;; ----------

(setq load-path (append
		 (list "~/.emacs.d/vendor/flim"
		       "~/.emacs.d/vendor/semi"
		       "~/.emacs.d/vendor/apel"
		       "~/.emacs.d/vendor/elmo"
		       "~/.emacs.d/vendor/wl")
		 load-path))

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)


;; -----
;; Theme
;; -----

(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))


;; ------
;; CEDET
;; ------

(load-file "~/.emacs.d/vendor/cedet/common/cedet.el")


;; ------------------
;; Autopairing braces
;; ------------------

(require 'autopair)
(autopair-global-mode)


;; --------------
;; Google C-style
;; --------------

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)


;; -----------
;; Java / JDEE
;; -----------

(add-to-list 'load-path "~/.emacs.d/vendor/jdee/lisp")

(setq
 jde-bug-debugger-host-address "127.0.0.1"
 jde-bug-jre-home "/usr/lib/jvm/java-6-openjdk-amd64"
 jde-compile-option-debug (quote ("all" (t nil nil)))
 jde-debugger (quote ("jdb"))
 jde-global-classpath (quote ("." "/usr/share/java/" "/usr/lib/jvm/java-6-openjdk-amd64/"))
 jde-jdk-doc-url "/usr/share/doc/openjdk-6-doc/html/api/index.html"
 jde-jdk-registry (quote (("1.6" . "/usr/lib/jvm/java-6-openjdk-amd64")))
 jde-jdk (quote ("1.6"))
 jde-regexp-jar-file "/usr/share/java/regexp.jar"
 jde-sourcepath (quote ("."))
 jde-junit-testrunner-type "org.junit.runner.JUnitCore"

 ;; Sometimes JDEE prints useful messages, but if everything works
 ;; well you will not be using this.
 jde-log-max 5000

 ;; Completes if conditions.
 jde-enable-abbrev-mode t

 ;; For syntax highlighting and basic syntax checking parse buffer
 ;; number of seconds from the time you changed the buffer
 jde-auto-parse-buffer-interval 600)
 
(setq defer-loading-jde nil)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde)
  (require 'jde-eclipse-compiler-server)
  (require 'flymake))

;; Understanding compiler output
(require 'compile)

(setq compilation-error-regexp-alist
      (append (list
	       ;; works for jikes
	       '("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):\\([0-9]+\\):[0-9]+:[0-9]+:" 1 2 3)
	       ;; works for javac
	       '("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):" 1 2)
	       ;; works for maven 2.x
	       '("^\\(.*\\):\\[\\([0-9]*\\),\\([0-9]*\\)\\]" 1 2 3)
	       ;; works for maven 3.x
	       '("^\\(\\[ERROR\\] \\)?\\(/[^:]+\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]" 2 3 4))
	      compilation-error-regexp-alist))

(setq jde-sourcepath '("./src"))
(setq jde-lib-directory-names '("^lib"))
(setq jde-global-classpath '("./lib/commons-exec-1.1.jar"
			     "./lib/commons-jxpath-1.3.jar"
			     "./lib/gson-2.2.jar"
			     "./lib/guava-12.0.jar"
			     "./lib/ini4j-0.5.2.jar"
			     "./lib/netty-3.2.7.Final.jar"
			     "./lib/operalaunchers-0.8.jar"
			     "./protobuf-java-2.4.1.jar"
			     "./lib/selenium-java-2.21.0.jar"
			     "./lib/servlet-api-2.5-6.1.9.jar"
			     "./lib/servlet-api.jar"
			     "./lib/sonar-ant-task-1.3.jar"
			     "./lib/webbit-0.4.8-SNAPSHOT.jar"))



(defun my-java-mode-hook ()
  ;; (setq c-basic-offset 2
  ;; 	c-label-offset 0
  ;; 	indent-tabs-mode nil
  ;; 	compile-command "cd ~/dev/webdriver-opera; ant compile"
  ;; 	require-final-newline nil)
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


(defun credmp/flymake-display-err-minibuf () 
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
	 (line-err-info-list  (nth 0 (flymake-find-err-info
				      flymake-err-info line-no)))
	 (count               (length line-err-info-list))
	 )
    (while (> count 0)
      (when line-err-info-list
	(let* ((file       (flymake-ler-file (nth (1- count)
						  line-err-info-list)))
	       (full-file  (flymake-ler-full-file (nth (1- count)
						       line-err-info-list)))
	       (text (flymake-ler-text (nth (1- count) line-err-info-list)))
	       (line       (flymake-ler-line (nth (1- count)
						  line-err-info-list))))
	  (message "[%s] %s" line text)
	  )
	)
      (setq count (1- count)))))

(defun show-previous-error ()
  (interactive)
  (flymake-goto-prev-error)
  (credmp/flymake-display-err-minibuf))

(defun show-next-error ()
  (interactive)
  (flymake-goto-next-error)
  (credmp/flymake-display-err-minibuf))


;; -----
;; C/C++
;; -----

(setq c-default-style "linux"
      c-basic-offset 4)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


;; ----
;; Perl
;; ----

(fset 'perl-mode 'cperl-mode)

(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t)


;; ---
;; CSS
;; ---

(setq css-indent-offset 2)


;; ---
;; ECB
;; ---

(add-to-list 'load-path "~/.emacs.d/vendor/ecb")
(require 'ecb-autoloads)


;; -------
;; Custom
;; -------

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Grey15" :foreground "Grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(flymake-errline ((((class color)) (:underline "OrangeRed"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "windowBackgroundColor")))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(flymake-allowed-file-name-masks (quote (("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init) ("\\.xml\\'" flymake-xml-init) ("\\.html?\\'" flymake-xml-init) ("\\.cs\\'" flymake-simple-make-init) ("\\.p[ml]\\'" flymake-perl-init) ("\\.php[345]?\\'" flymake-php-init) ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) ("\\.java\\'" jde-ecj-server-flymake-init jde-ecj-flymake-cleanup) ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) ("\\.tex\\'" flymake-simple-tex-init) ("\\.idl\\'" flymake-simple-make-init))))
 '(jde-compiler (quote (("eclipse java compiler server" "/home/ato/bin/ecj-4.2RC2.jar"))))
 '(jde-global-classpath (quote ("." "/usr/share/java/" "/usr/lib/jvm/java-6-openjdk-amd64/" "~/dev/webdriver-opera/lib/")))
 '(jde-junit-working-directory "~/dev/webdriver-opera")
 '(show-paren-mode t)
 '(tool-bar-mode nil))
