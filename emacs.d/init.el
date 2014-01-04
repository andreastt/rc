;;; init.el --- ato's emacs configuration

;; To byte-compile everything in the ~/.emacs.d directory, run this
;; from time to time:
;;
;;     C-u 0 M-x byte-recompile-directory

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
(require 'setup-gdb)
(require 'setup-cc)
(require 'setup-c)
(require 'setup-c++)
(require 'setup-eclim)
(require 'setup-java)
(require 'setup-rust)
(require 'setup-js2)
(require 'setup-go)
;; (require 'setup-python)
(require 'setup-diary)
(require 'setup-tramp)
(require 'setup-dired)
(require 'setup-autopair)
(require 'setup-auto-complete)
(require 'setup-printing)
(require 'setup-css)
(require 'setup-multi-web)
(require 'setup-tramp)
(require 'setup-git)
;; (require 'setup-mu)
(require 'setup-helm)
(require 'setup-eshell)
(require 'setup-ido)

(require 'mark-more-like-this)

;; Map files to modes
(require 'mode-mappings)
(require 'mode-hooks)

;; Key bindings
(require 'key-bindings)

;; Appearance
(when window-system (require 'appearance))
(if is-mac
    (require 'mac)
  (require 'linux))

;; Emacs server
;(server-start)
(put 'erase-buffer 'disabled nil)
