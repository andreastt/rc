(autoload 'compile "compile" t)

;; Make sure ant's output is in a format emacs likes
(setenv "ANT_ARGS" "-emacs")

(provide 'setup-java)
