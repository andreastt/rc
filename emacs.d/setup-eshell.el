(require 'eshell)
(require 'em-term)

(setenv "EDITOR" "emacsclient")

;; History size, saving history on exit
(setq eshell-history-size 20000
      eshell-save-history-on-exit t
      eshell-hist-ignoredups t
      eshell-cmpl-cycle-completions nil)

;; Scroll to bottom
(setq eshell-scroll-to-bottom-on-output t
      eshell-scroll-show-maximum-output t)

;; Visual commands
(setq eshell-visual-subcommands '(("git" "log" "show" "diff" "help")
                                  ("bzr" "log" "show" "diff" "help"))
      eshell-visual-options '(("git" "--help")))

;; Find file when using emacs
(defun eshell/emacs (file)
  "find-file alias"
  (find-file file))

;; Interpret and use ANSI colour codes in shell buffers
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-filter-apply)

(defun eshell/clear ()
  "Clears the shell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
;;  (autopair-newline))

(defun my-eshell-mode-hook ()
  (define-key eshell-mode-map (kbd "C-l") 'eshell/clear))
(add-hook 'eshell-mode-hook 'my-eshell-mode-hook)

(provide 'setup-eshell)
