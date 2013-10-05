;; Mac specific appearance
(set-face-attribute 'default nil :font "Monaco-12")
(scroll-bar-mode 0)

;; Theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; Change command to meta, and ignore option to use weird Norwegian
;; keyboard
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t

      ;; Use Emacs terminfo, not system terminfo
      system-uses-terminfo nil)

;; Enable menu bar on OS X since it's there by default anyways
(menu-bar-mode 1)

;; Mac friendly font without antialiasing
;;(set-face-attribute 'default nil :font "Menlo-10")
(set-face-attribute 'default nil :font "Monaco-10")
;;(setq mac-allow-anti-aliasing nil)

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
