;; C-x r q to quit Emacs completely, C-x C-c to kill frame
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Mark additional regions matching current region
(global-set-key (kbd "M-æ") 'mark-all-like-this)
(global-set-key (kbd "C-å") 'mark-previous-like-this)
(global-set-key (kbd "C-æ") 'mark-next-like-this)
(global-set-key (kbd "C-Å") 'mark-more-like-this-extended)
(global-set-key (kbd "C-Æ") 'mark-more-like-this-extended)

;; Perform local cleanup
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c C-<return>") 'delete-blank-lines)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

;; Use M-w for copy-line if no active region
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "M-W") '(lambda () (interactive) (save-region-or-current-line 1)))

;; Make shell more convenient, and suspend frameless
(global-set-key (kbd "C-z") 'eshell)
(global-set-key (kbd "C-x C-z") 'suspend-frame)

;; Font size
(define-key global-map (kbd "C-+") 'zoom-frm-in)
(define-key global-map (kbd "C--") 'zoom-frm-out)

;; Create new frame
(define-key global-map (kbd "C-x C-n") 'make-frame-command)

;; Jump to a definition in the current file
(global-set-key (kbd "C-x C-i") 'ido-menu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-or-create-file-at-point)
(global-set-key (kbd "C-x M-p") 'find-or-create-file-at-point-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Window switching
(windmove-default-keybindings 'control) ;; Control+direction
(global-set-key (kbd "C-x -") 'rotate-windows)

;; Help should search more than just commands
(global-set-key (kbd "<f1> a") 'apropos)

;; Navigation bindings
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "M-<up>") 'beginning-of-buffer)
(global-set-key (kbd "M-<down>") 'end-of-buffer)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "C-e") 'move-end-of-line-or-next-line)
(global-set-key (kbd "C-a") 'move-start-of-line-or-prev-line)

;; Query replace regex key binding
(global-set-key (kbd "M-&") 'query-replace-regexp)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffeR)

;; Mark all
(global-set-key (kbd "C-c a") 'mark-whole-buffer)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)

;; Clever newlines
(global-set-key (kbd "<C-return>") 'new-line-below)
(global-set-key (kbd "<C-S-return>") 'new-line-above)
(global-set-key (kbd "<M-return>") 'end-of-line-and-indent-new-line)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Line movement
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Easy-mode fullscreen rgrep
(global-set-key (kbd "M-s s") 'rgrep-fullscreen)

(provide 'key-bindings)