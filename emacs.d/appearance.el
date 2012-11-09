(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))

;; Pretty font in Emacs 24/Ubuntu
(if is-mac nil
  (set-face-attribute 'default nil :font "DejaVu Sans Mono")
  (set-face-attribute 'default nil :height 90))

;; Highlight matching parantheses when the point is on them
(show-paren-mode 1)

;; No menu bars
(menu-bar-mode -1)

;; Cursor type
(setq-default cursor-type 'bar)

;; (when window-system
;;   (setq frame-title-format '(buffer-file-name "%f" ("%b")))
;;   (turn-off-tool-bar)
;;   (tooltip-mode -1))

;; (add-hook 'before-make-frame-hook 'turn-off-tool-bar)

;; Ditch them scroll bars
(scroll-bar-mode -1)

;; Window size
(setq default-frame-alist '(
                            (width . 140)
                            (height . 35)
                            ))

;; Make zooming affect frame instead of buffers
(require 'zoom-frm)

;; Setup new frames correctly
(add-hook 'after-make-frame-functions 'setup-frame-hook)

(provide 'appearance)
