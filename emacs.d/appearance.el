(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Theme
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-charcoal-black)))

;; Highlight matching parantheses when the point is on them
(show-paren-mode 1)

;; Cursor type
(setq-default cursor-type 'bar)

;; Show whitespace
;; TODO: Enable this only for relevant modes
;;(setq-default show-trailing-whitespace t)

;; Hide menu bar (enable with toggle-menu-bar-mode-from-frame)
(menu-bar-mode 0)

;; Show scroll bar on the left side
;; (scroll-bar-mode 1)
;; (set-scroll-bar-mode 'left)

;; Window size
(setq default-frame-alist '(
                            (font . "6x13")
                            (width . 102)
                            (height . 50)
                            ))

;; Disable 1 character border, or "fringe" on either side of every
;; buffer.
(set-fringe-mode 0)

;; Font
;;(set-face-attribute 'default nil :font "Ubuntu Mono-11")

;; Make zooming affect frame instead of buffers
(autoload 'zoom-frm "zoom-frm" t)

;; Setup new frames correctly
;(add-hook 'after-make-frame-functions 'setup-frame-hook)

;; Frame focus follows mouse
(setq mouse-autoselect-window t)

;; Winner mode allows you to "redo" and "undo" window setups
(winner-mode)

(provide 'appearance)
