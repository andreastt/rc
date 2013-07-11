(add-hook 'gtags-mode-hook 
          (lambda()
            (local-set-key (kbd "M-.") 'gtags-find-tag)     ; find a tag, also M-.
            (local-set-key (kbd "M-,") 'gtags-find-rtag)))  ; reverse tag

(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'gtags)
            (gtags-mode t)
            (gtags-create-or-update)))

(provide 'setup-c-mode)
