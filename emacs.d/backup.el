;; Write backup files to own directory
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Save minibuffer history
(setq savehist-file (expand-file-name "savehist" temporary-file-directory)
      savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(savehist-mode 1)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "places" temporary-file-directory))

(provide 'backup)