(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; Hide *nrepl-connection* and *nrepl-server* buffers
(setq nrepl-hide-special-buffers t)

(provide 'setup-clojure)
