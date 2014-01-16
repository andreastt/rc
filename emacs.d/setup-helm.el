(require 'helm-config)

;; (helm-mode 1)

;; (setq helm-completing-read-handlers-alist
;;       '((describe-function . ido)
;;         (describe-variable . ido)
;;         (debug-on-entry . helm-completing-read-symbols)
;;         (find-function . helm-completing-read-symbols)
;;         (find-tag . helm-completing-read-with-cands-in-buffer)
;;         (ffap-alternate-file . nil)
;;         (tmm-menubar . nil)
;;         (dired-do-copy . nil)
;;         (dired-to-rename . nil)
;;         (dired-create-directory . nil)
;;         (find-file . nil) ;; ido
;;         (copy-file-and-rename-buffer . nil)
;;         (rename-file-and-buffer . nil)
;;         (w3m-goto-url . nil)
;;         (ido-find-file . nil)
;;         (ido-edit-input . nil)
;;         (mml-attach-file . ido)
;;         (read-file-name . nil)))

;; helm gtags
(setq helm-c-gtags-path-style 'relative
      helm-c-gtags-ignore-case t
      helm-c-gtags-read-only t)
(add-hook 'c-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'c++-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'java-mode-hook (lambda () (helm-gtags-mode)))

(eval-after-load "helm-regexp"
  '(helm-attrset 'follow 1 helm-source-moccur))

(defun my-helm-multi-all ()
  "multi-occur in all buffers backed by files"
  (interactive)
  (helm-multi-occur
   (delq nil
         (mapcar (lambda (b)
                   (when (buffer-file-name b) (buffer-name b)))
                 (buffer-list)))))

(provide 'setup-helm)
