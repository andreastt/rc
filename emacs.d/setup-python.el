;;; setup-python.el --- Development setup for Python

;;(setq py-install-directory "PATH/TO/PYTHON-MODE/")
;;(add-to-list 'load-path py-install-directory)

(add-to-list 'load-path "vendor/python-mode")
(setq py-install-directory "vendor/python-mode")
(require 'python-mode)

(setq py-shell-name "ipython")

;; (defun my-python-mode-hook ()
;;   (set-fill-column 79))

;; (add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'setup-python)
