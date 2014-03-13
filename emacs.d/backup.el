;; Auto save into the same file, which turns off creating backup files
;; completely
;(setq auto-save-visited-file-name t)

;; Delete old versions automatically
;(setq delete-old-versions t)

(require 'recentf)

;; Don't clobber symlinks
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2

      ;; Use versioned backups
      version-control t

      ;; Put recentf in temporary folder
      recentf-save-file (expand-file-name "recentf" temporary-file-directory))

;; Write backup files to own directory
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/"))
      auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))

;; Create autosave directory if necessary, since emacs won't
(make-directory "~/.emacs.d/autosaves/" t)

;; Save minibuffer history
(setq savehist-file (expand-file-name "savehist" temporary-file-directory)
      savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(savehist-mode 1)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "places" temporary-file-directory))

(provide 'backup)
