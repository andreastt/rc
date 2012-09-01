;;; init.el --- ato's emacs configuration

;; Turn off mouse interface early in statup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Remove built-in CEDET in Emacs >= 23.2 from load path
(setq load-path (remove (concat "/usr/share/emacs"
                                (substring emacs-version 0 -2) "/lisp/cedet")
                        load-path))

;; Set path to .emacs.d
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Set path to dependencies
(setq vendor-dir (expand-file-name "vendor" dotfiles-dir))

;; Replace CEDET with a custom version
(load-file (concat vendor-dir "/cedet/common/cedet.el"))

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
;; (setq custom-file (expand-file-name "custom.el" dotfiles-dir))
;; (load-custom-file)

;; Let's start with a smattering of sanity
(require 'sane-defaults)

;; Backup and temporary storage
(require 'backup)

;; Setup dependencies
(require 'setup-c++-mode)
(require 'setup-gdb)
(require 'setup-diary)
(require 'setup-tramp)
(require 'setup-xface)
(require 'setup-dired)
(require 'setup-magit)
(require 'setup-wl)
(require 'setup-ecb)
(require 'setup-jde)
(require 'setup-smex)
(require 'setup-js2-mode)
(require 'setup-autopair)
(require 'setup-markdown-mode)
(require 'setup-yaml-mode)
(require 'setup-jinja2-mode)

;; Map files to modes
(require 'mode-mappings)
(require 'mode-hooks)

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Key bindings
(require 'key-bindings)

;; Appearance
(require 'appearance)
(require 'misc)
(when is-mac (require 'mac))

;; Emacs server
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))

;; Run at full power, please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Conclude init by setting up specifics for the user
(when (file-exists-p user-settings-dir)
  (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
