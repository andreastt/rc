;; Provides a wrapper around ansi-term running the zsh shell with
;; sensible defaults, such as allowing M-x to propagate through the
;; terminal.

(defun ash-term-hooks ()
  ;; dapprev-expand in term
  (define-key term-raw-escape-map "/"
    (lambda ()
      (interactive)
      (let ((beg (point)))
        (dabbrev-expand nil)
        (kill-region beg (point)))
      (term-send-raw-string (substring-no-properties (current-kill 0)))))
  ;; yank in term (bound to C-c C-y)
  (define-key term-raw-escape-map "\C-y"
    (lambda ()
      (interactive)
      (term-send-raw-string (current-kill 0)))))
(add-hook 'term-mode-hook 'ash-term-hooks)

;; Kill the buffer when terminal is exited
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

;; UTF-8
(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

;; multi term
(require 'multi-term)

(defun last-term-buffer (l)
  "Return most recently used term buffer."
  (when l
    (if (eq 'term-mode (with-current-buffer (car l) major-mode))
        (car l) (last-term-buffer (cdr l)))))

(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
  none exists, of if the current bfufer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
    (if (or (not b) (eq 'term-mode major-mode))
        (multi-term)
      (switch-to-buffer b))))

(defun term-send-kill-whole-line ()
  "Kill whole line in term mode."
  (interactive)
  (term-send-raw-string "\C-a")
  (term-send-raw-string "\C-k"))

(defun term-send-kill-line ()
  "Kill line in term mode."
  (interactive)
  (term-send-raw-string "\C-k"))

(setq multi-term-program "/bin/zsh")

(setq term-unbind-key-list '("C-x" "<ESC>")
      term-bind-key-alist
      '(("C-c" . term-interrupt-subobj)
        ("C-p" . term-send-up)
        ("C-n" . term-send-down)
        ("C-s" . isearch-forward)
        ("C-r" . term-send-reverse-search-history)
        ("C-m" . term-send-raw)
        ("C-k" . term-send-kill-whole-line)
        ("C-y" . yank)
        ("C-_" . term-send-raw)
        ("M-f" . term-send-forward-word)
        ("M-b" . term-send-backward-word)
        ("M-p" . previous-line)
        ("M-n" . next-line)
        ("M-y" . yank-pop)
        ("M-." . term-send-raw-meta)))

;; Disable autopair in term-mode
(add-hook 'term-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate t) ;; for emacsen < 24
              (autopair-mode -1)))            ;; for emacsen >= 24

(provide 'setup-term)
