(defun my-gtags-hook ()
  ;; Find a tag
  (local-set-key (kbd "M-.") 'gtags-find-tag)

  ;; Find reverse tag
  (local-set-key (kbd "M-,") 'gtags-find-rtag))
(add-hook 'gtags-mode-hook 'my-gtags-hook)

(defun my-js-hook ()
  (require 'gtags)
  (gtags-mode t)
  (gtags-create-or-update))
(add-hook 'js-mode-hook 'my-js-hook)

(require 'gtags)
(gtags-mode t)

(setq-default js2-allow-rhino-new-expr-initializer nil
              js2-auto-indent-p nil
              js2-enter-indents-newline nil
              js2-global-externs '("module"
                                   "require"
                                   "jQuery"
                                   "$"
                                   "_"
                                   "assert"
                                   "refute"
                                   "setTimeout"
                                   "clearTimeout"
                                   "setInterval"
                                   "clearInterval"
                                   "location"
                                   "__dirname")
              js2-idle-timer-delay 0.1
              js2-indent-on-enter-key nil
              js2-mirror-mode nil
              js2-strict-inconsistent-return-warning nil
              js2-auto-indent-p t
              js2-rebind-eol-bol-keys nil
              js2-include-rhino-externs nil
              js2-include-gears-externs nil
              js2-concat-multiline-strings 'eol
              js2-basic-offset 2)

(autoload 'js2-mode "js2-mode" t)
(autoload 'js2-imenu-extras "js2-imenu-extras" t)
(eval-after-load "js2-imenu-extras"
  '(progn
     (js2-imenu-extras-setup)))

(provide 'setup-js2)
