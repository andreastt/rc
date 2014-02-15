;; Mac specific preferences

;; Make sure path is correct when launched as application
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

;; Change command to meta, and ignore option to use weird Norwegian
;; keyboard
(setq mac-option-modifier nil  ;; 'super
      mac-command-modifier 'meta  ;; 'meta
      ;;ns-function-modifier 'hyper
      )

;; Allow emacs to use the X server clipboard
(setq x-select-enable-clipboard t)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

;; Mighty Mouse on Mac is very sensitive
(setq mouse-wheel-scroll-amount '(0.01))

;; Norwegian mac-keyboard alt-keys)
(define-key key-translation-map (kbd "s-8") (kbd "["))
(define-key key-translation-map (kbd "s-(") (kbd "{"))
(define-key key-translation-map (kbd "s-9") (kbd "]"))
(define-key key-translation-map (kbd "s-)") (kbd "}"))
(define-key key-translation-map (kbd "s-7") (kbd "|"))
(define-key key-translation-map (kbd "s-/") (kbd "\\"))
(define-key key-translation-map (kbd "M-s-7") (kbd "M-|"))

;; Mac friendly font
(when window-system
  (setq ato/default-font "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
  (setq ato/presentation-font "-apple-Monaco-medium-normal-normal-*-28-*-*-*-m-0-iso10646-1")
  (set-face-attribute 'default nil :font ato/default-font))

;; Enable menu bar on OS X since it's there by default anyways
(menu-bar-mode 1)

;; Enable scroll bars
(scroll-bar-mode 1)

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Open files from the workspace in a new frame
(setq ns-pop-up-frames t)

;; Use aspell for spell checking (`brew install aspell --lang=en`)
(setq ispell-program-name "/usr/local/bin/aspell")

;; Use Mac OS' default browser
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

(provide 'mac)
