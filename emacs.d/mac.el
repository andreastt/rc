;; Change command to meta, and ignore option to use weird Norwegian keyboard
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; Mac friendly font
(set-face-attribute 'default nil :font "Monaco-10")

;; Make sure path is correct when launched as application
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

;; Keybinding to toggle full screen mode
(global-set-key (quote [M-f10]) (quote ns-toggle-fullscreen))

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Ignore .DS_Store files with ido mode
;(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; Use aspell for spell checking (`brew install aspell --lang=en`)
(setq ispell-program-name "/usr/local/bin/aspell")

(provide 'mac)
