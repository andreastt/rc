;; C-x r q to quit Emacs completely, C-x C-c to kill frame
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; C-SPC to launch the magic function
(global-set-key (kbd "C-SPC") 'my-helm-multi-all)

;; Mark additional regions matching current region
(global-set-key (kbd "M-æ") 'mark-all-like-this)
(global-set-key (kbd "C-å") 'mark-previous-like-this)
(global-set-key (kbd "C-æ") 'mark-next-like-this)
(global-set-key (kbd "C-Å") 'mark-more-like-this-extended)
(global-set-key (kbd "C-Æ") 'mark-more-like-this-extended)

;; Comment or uncomment current line or marked region
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)

;; Kill whole line (not remainder of line) with C-M-k
(global-set-key (kbd "C-M-k") 'kill-whole-line)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'tool-bar-mode)
(global-set-key (kbd "C-S-<f10>") 'menu-bar-mode)

;; Use M-w for copy-line if no active region
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "M-W") '(lambda () (interactive) (save-region-or-current-line 1)))

;; Make shell more convenient, and suspend frameless
(global-set-key (kbd "C-z") '(lambda () (interactive) (ansi-term "/bin/zsh")))
(global-set-key (kbd "C-x C-z") 'suspend-frame)

;; Font size
(define-key global-map (kbd "C-+") 'zoom-frm-in)
(define-key global-map (kbd "C--") 'zoom-frm-out)

;; Create new frame
(define-key global-map (kbd "C-x C-n") 'make-frame-command)

;; Cycle through open frames
(define-key global-map (kbd "C-.") 'other-frame)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-or-create-file-at-point)
(global-set-key (kbd "C-x M-p") 'find-or-create-file-at-point-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-i") 'ibuffer)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Window switching
(windmove-default-keybindings 'control)  ;; C-[direction]
(global-set-key (kbd "C-x -") 'rotate-windows)

;; Help should search more than just commands
(global-set-key (kbd "<f1> a") 'apropos)

;; Navigation bindings
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "C-s-<down>") 'end-of-buffer)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "C-e") 'move-end-of-line-or-next-line)
(global-set-key (kbd "C-a") 'move-start-of-line-or-prev-line)

;; Query replace regex key binding
(global-set-key (kbd "M-&") 'query-replace-regexp)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)

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
(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "<M-up>") 'move-line-up)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Toggle fullscreen
(global-set-key (kbd "<f11>") 'toggle-fullscreen)

(provide 'key-bindings)
