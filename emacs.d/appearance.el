(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))

;; Highlight matching parantheses when the point is on them
(show-paren-mode 1)

;; Cursor type
(setq-default cursor-type 'bar)

;; Show whitespace
(setq-default show-trailing-whitespace t)

;; Menu bar looks nice in Unity now
(menu-bar-mode 1)

;; Ditch them scroll bars
(scroll-bar-mode -1)

;; Window size
;; (setq default-frame-alist '(
;;                             (font . "7x13bold")
;;                             (width . 90)
;;                             (height . 45)
;;                             ))

;; Font
;;(set-face-attribute 'default nil :font "Ubuntu Mono-11")

;; Make zooming affect frame instead of buffers
(require 'zoom-frm)

;; Setup new frames correctly
(add-hook 'after-make-frame-functions 'setup-frame-hook)

;; Winner mode allows you to "redo" and "undo" window setups
(winner-mode)

(provide 'appearance)
