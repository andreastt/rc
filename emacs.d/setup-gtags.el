(add-hook 'gtags-mode-hook
          (lambda()
            (local-set-key (kbd "M-.") 'gtags-find-tag)     ; find a tag, also M-.
            (local-set-key (kbd "M-,") 'gtags-find-rtag)))  ; reverse tag

(provide 'setup-gtags)
