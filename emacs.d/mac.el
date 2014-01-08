;; Mac specific preferences

;; Change command to meta, and ignore option to use weird Norwegian
;; keyboard
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t

      ;; Use Emacs terminfo, not system terminfo
      system-uses-terminfo nil

      ;; Mighty Mouse on Mac is very sensitive
      mouse-wheel-scroll-amount '(0.01))

(setq default-frame-alist '(
                            (font . "Menlo 12")
                            (width . 95)
                            (height . 60)
                            (fringe-mode . "no-fringes")
                            ))

;; Enable menu bar on OS X since it's there by default anyways
(menu-bar-mode 1)

;; Enable scroll bars
(scroll-bar-mode 1)

;; Mac friendly font without antialiasing
;; (set-face-attribute 'default nil :font "Menlo-12")

;; Make sure path is correct when launched as application
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; Use aspell for spell checking (`brew install aspell --lang=en`)
(setq ispell-program-name "/usr/local/bin/aspell")

(provide 'mac)
