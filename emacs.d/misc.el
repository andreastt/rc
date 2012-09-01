;; Seed the random number generator
(random t)

;; Whitespace
(setq whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 100)

;; Various superfluous white space
;(add-hook 'before-save-hook 'cleanup-buffer-safe)

;; Enable console mouse
(setq xterm-mouse-mode t)

(provide 'misc)