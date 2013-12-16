;; Note that some appearance related options are set in linux.el and
;; mac.el.

;; Enable syntax highlighting
(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Highlight matching parantheses when the point is on them
(show-paren-mode 1)

;; Cursor type
(setq-default cursor-type 'bar)

;; Hide menu bar (enable with toggle-menu-bar-mode-from-frame)
(menu-bar-mode 0)

;; Disable 1 character border, or "fringe" on either side of every
;; buffer.
(set-fringe-mode 0)

;; Make zooming affect frame instead of buffers
(autoload 'zoom-frm "zoom-frm" t)

;; Setup new frames correctly
;(add-hook 'after-make-frame-functions 'setup-frame-hook)

;; Frame focus follows mouse
(setq mouse-autoselect-window t)

;; Winner mode allows you to "redo" and "undo" window setups
(winner-mode)

(provide 'appearance)
