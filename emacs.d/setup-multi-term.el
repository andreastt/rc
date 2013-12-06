;; Provides a wrapper around ansi-term running the zsh shell with
;; sensible defaults, such as allowing M-x to propagate through the
;; terminal.

(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(provide 'setup-multi-term)
