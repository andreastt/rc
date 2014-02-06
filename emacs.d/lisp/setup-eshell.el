(setenv "EDITOR" "emacsclient")
(setenv "PATH" (concat "~/bin" ":"
                       "~/dev/go/bin" ":"
                       (getenv "PATH")))

(require 'eshell)
(require 'em-term)

;; Path
(setq eshell-path-env (concat "~/dev/go/bin" ":"
                              eshell-path-env))

;; History size, saving history on exit
(setq eshell-history-size 20000
      eshell-save-history-on-exit t
      eshell-hist-ignoredups t
      eshell-cmpl-cycle-completions nil)

;; Visual commands
(setq eshell-visual-subcommands '(("git" "log" "show" "diff" "help")
                                  ("bzr" "log" "show" "diff" "help"))
      eshell-visual-options '(("git" "--help")))
(add-to-list 'eshell-visual-commands "pydoc")
(add-to-list 'eshell-visual-commands "godoc")

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

;; open opens file, openo opens file in the other window
(defalias 'open 'find-file)
(defalias 'openo 'find-file-other-window)

(provide 'setup-eshell)