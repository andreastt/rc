;;; init.el --- ato's emacs configuration

;; To byte-compile everything in the ~/.emacs.d directory, run this
;; from time to time:
;;
;;     C-u 0 M-x byte-recompile-directory

;; Time stamp *messages*
(defun current-time-microseconds ()
  (let* ((nowtime (current-time))
         (now-ms (nth 2 nowtime)))
    (concat (format-time-string "[%Y-%m-%dT%T" nowtime) (format ".%d] " now-ms))))

(defadvice message (before test-symbol activate)
  (if (not (string-equal (ad-get-arg 0) "%s%s"))
      (let ((deactivate-mark nil)
            (inhibit-read-only t))
        (save-excursion
          (set-buffer "*Messages*")
          (goto-char (point-max))
          (if (not (bolp))
              (newline))
          (insert (current-time-microseconds))))))

;; Run at full power, please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Turn off mouse interface early in statup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Functions (load all files in defuns-directory)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Add external vendor extensions to load path
(setq vendor-dir (expand-file-name "vendor" user-emacs-directory))
(add-to-list 'load-path vendor-dir)
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Set up appearance early
(setq is-mac (equal system-type 'darwin))
(when window-system (require 'appearance))

;; Let's start with a smattering of sanity
(require 'sane-defaults)

;; Backup and temporary storage
(require 'backup)

;; Pull in desired packages if they don't exist on the local file
;; system.
(require 'packages)

;; Individual mode setups
(require 'setup-gdb)
(require 'setup-cc)
(require 'setup-c)
(require 'setup-c++)
(require 'setup-eclim)
(require 'setup-java)
(require 'setup-rust)
(require 'setup-js2)
(require 'setup-go)
(require 'setup-python)
(require 'setup-diary)
(require 'setup-tramp)
(require 'setup-dired)
(require 'setup-autopair)
(require 'setup-auto-complete)
(require 'setup-printing)
(require 'setup-css)
(require 'setup-multi-web)
(require 'setup-git)
(require 'setup-mu)
(require 'setup-helm)
(require 'setup-eshell)
(require 'setup-ido)

(require 'mark-more-like-this)

;; Map files to modes
(require 'mode-mappings)
(require 'mode-hooks)

;; Key bindings
(require 'key-bindings)

;; OS specific tweaks
(if is-mac
    (require 'mac)
  (require 'linux))
