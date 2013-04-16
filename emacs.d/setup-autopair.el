;; Inserts matching braces
(autoload 'autopair "autopair" t)
(eval-after-load "autopair" '(progn (autopair-global-mode)))

(provide 'setup-autopair)