;; Provides a wrapper around ansi-term running the zsh shell with
;; sensible defaults, such as allowing M-x to propagate through the
;; terminal.

(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;; Disable autopair in term-mode
(add-hook 'term-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate t) ;; for emacsen < 24
              (autopair-mode -1)))            ;; for emacsen >= 24

(provide 'setup-multi-term)
