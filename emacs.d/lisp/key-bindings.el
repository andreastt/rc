;; C-x r q to quit Emacs completely, C-x C-c to kill frame
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Allow acme-styled search by right-clicking search term
(require 'acme-search)
(global-set-key [(mouse-3)] 'acme-search-forward)
(global-set-key [(shift mouse-3)] 'acme-search-forward)

;; C-SPC to launch the magic function
(global-set-key (kbd "C-SPC") 'my-helm-multi-all)

;; Mark additional regions matching current region
(global-set-key (kbd "M-æ") 'mark-all-like-this)
(global-set-key (kbd "C-å") 'mark-previous-like-this)
(global-set-key (kbd "C-æ") 'mark-next-like-this)
(global-set-key (kbd "C-Å") 'mark-more-like-this-extended)
(global-set-key (kbd "C-Æ") 'mark-more-like-this-extended)

;; Kill whole line (not remainder of line) with C-M-k
(global-set-key (kbd "C-M-k") 'kill-whole-line)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'tool-bar-mode)
(global-set-key (kbd "C-S-<f10>") 'menu-bar-mode)

;; Use M-w for copy-line if no active region
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "M-W") '(lambda () (interactive) (save-region-or-current-line 1)))

;; Make accessing shell more convenient
(global-set-key (kbd "C-z") 'eshell)

;; Suspend frameless emacs
(global-set-key (kbd "C-x C-z") 'suspend-frame)

;; Font size
(define-key global-map (kbd "C-+") 'zoom-frm-in)
(define-key global-map (kbd "C--") 'zoom-frm-out)

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

;; Replace show-buffers with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)  ;; 'helm-buffers-list

;; Remap C-x C-d to ido-dired, which is the same as C-x d
(global-set-key (kbd "C-x C-d") 'ido-dired)

;; Replace dabbrev-expand with hippie-expand, which by many are
;; considered a more powerful equivalent
(global-set-key (kbd "M-/") 'hippie-expand)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Window switching
(windmove-default-keybindings 'control)  ;; C-[direction]

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

;; Use regular expressions by default
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)

;; Mark all
(global-set-key (kbd "C-c C-a") 'mark-whole-buffer)

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

;; Compile and recompile, which are useful no matter what file type
;; you're in
(global-set-key (kbd "C-<f9>") 'compile)
(global-set-key (kbd "<f9>") 'recompile)

(provide 'key-bindings)
