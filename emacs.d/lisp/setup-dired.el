(autoload 'dired "dired" t)

;; Make dired less verbose
(autoload 'dired-details "dired-details" t)
(eval-after-load "dired-details"
  '(progn
     (setq-default dired-details-hidden-string "--- ")
     (dired-details-install)

     ;; Reload dired after creating a directory
     (defadvice dired-create-directory (after revert-buffer-after-create activate)
       (revert-buffer))

     ;; Reload dired after quitting wdired
     (defadvice wdired-abort-changes (after revert-buffer-after-abort activate)
       (revert-buffer))

     ;; C-a is nicer in dired if it moves back to start of files
     (defun dired-back-to-start-of-lines ()
       (interactive)
       (backward-char (- (current-column) 2)))

     (define-key dired-mode-map (kbd "C-a") 'dired-back-to-start-of-files)

     ;; M-up is nicer in dired if it moves to the third line – straight to the ".."
     (defun dired-back-to-top ()
       (interactive)
       (beginning-of-buffer)
       (next-line 2)
       (dired-back-to-start-of-files))

     (define-key dired-mode-map (kbd "M-<up>") 'dired-back-to-top)

     ;; M-down is nicer in dired if it moves to the last file
     (defun dired-jump-to-bottom ()
       (interactive)
       (end-of-buffer)
       (next-line -1)
       (dired-back-to-start-of-files))))

(defun my-dired-hook ()
  ;; Press r to enter wdired mode, C-c exit and save changes.
  (define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode))
(add-hook 'dired-mode-hook 'my-dired-hook)

(provide 'setup-dired)