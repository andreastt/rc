;; On Mac it sometimes mistakes / for the CWD directory.
(setq default-directory "~/")

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; To work around the dead-tilde problem with locale suffixes on
;; Ubuntu.
(require 'iso-transl)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; No splash screen or startup message
(setq inhibit-startup-message t
      inhibit-splash-screen t)

;; Disable visual bell; the beep sound should be disabled _outside_ of
;; Emacs
(setq visible-bell nil)

;; Empty scratch buffer
(setq initial-scratch-message "")

;; Sync Emacs' clipboard with the X system's
(setq x-select-enable-clipboard t)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files
(auto-compression-mode t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8, please
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; By default, lines should be 72 characters wide
(setq fill-column 72)

;; Save a list of recent files visited
(recentf-mode 1)

;; Omit hidden files in dired
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Don't break lines
(setq-default truncate-lines t)

;; Keep cursor away from edges when scrolling up and down
(require 'smooth-scrolling)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and
;; M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Focus new frame on splitting buffer
(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Diff's
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-funciton 'ediff-setup-windows-plain)

;; Follow symlinks automatically, but show a warning
(setq vc-follow-symlinks nil)

;; Use zsh as default shell
(setq explicit-shell-file-name "/bin/zsh")

;; Default web browser is governed by operating system.  On Debian one
;; can use x-www-browser to access the default browser, and the
;; corresponding program on Mac is called open.
(setq browse-url-browser-function 'browse-url-generic)
(if is-mac
    (setq browse-url-generic-program "open")
  (setq browse-url-generic-program "x-www-browser"))

;; Default ctags file should be .tags
(setq tags-file-name ".tags")

;; Crank up the rate at which Emacs autosaves files
(setq auto-save-interval 20  ;; n keystrokes
      auto-save-timeout 10)  ;; ten idle seconds

;; Seed the random number generator
(random t)

;; Whitespace
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Various superfluous white space
;(add-hook 'before-save-hook 'cleanup-buffer-safe)

;; Enable console mouse
(setq xterm-mouse-mode t)

(provide 'sane-defaults)
