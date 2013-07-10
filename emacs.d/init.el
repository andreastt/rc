;;; init.el --- ato's emacs configuration

;; To byte-compile everything in the ~/.emacs.d directory, run this
;; from time to time:
;;
;;     C-u 0 M-x byte-recompile-directory

;; Startup time metrics
(require 'cl)
(defvar *emacs-load-start* (current-time))

;; Run at full power, please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Turn off mouse interface early in statup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Set path to .emacs.d
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Set path to dependencies
(setq vendor-dir (expand-file-name "vendor" dotfiles-dir))

;; Load path
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path vendor-dir)

;; Are we on a Mac?
(setq is-mac (equal system-type 'darwin))

;; Functions (load all files in defuns-directory)
(setq defuns-dir (expand-file-name "defuns" dotfiles-dir))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Current user settings
(setq user-settings-dir (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external vendor extensions to load path
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in a separate file
(setq custom-file "~/.emacs.d/my-custom.el")
(load custom-file 'noerror)

;; Let's start with a smattering of sanity
(require 'sane-defaults)

;; Backup and temporary storage
(require 'backup)

;; Setup dependencies
(require 'setup-c++-mode)
(require 'setup-gdb)
(require 'setup-eclim)
(require 'setup-java)
(require 'setup-diary)
(require 'setup-tramp)
(require 'setup-dired)
(require 'setup-js2-mode)
(require 'setup-autopair)
(require 'setup-auto-complete)
(require 'setup-printing)
(require 'setup-magit)
(require 'setup-go)
(require 'setup-python)
(require 'setup-edit-server)
(require 'setup-org-mode)
(require 'setup-multi-web-mode)

;(autoload 'mark-more-like-this "mark-more-like-this" t)
(require 'mark-more-like-this)

;; Map files to modes
(require 'mode-mappings)
(require 'mode-hooks)

;; ;; Key bindings
(require 'key-bindings)

;; Appearance
(require 'appearance)
(when is-mac (require 'mac))

;; Emacs server
;(server-start)

;; (message "My .emacs loaded in %ds"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
