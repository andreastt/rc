(autoload 'helm-config)

(defun my-helm-multi-all ()
  "multi-occur in all buffers backed by files."
  (interactive)
  (let ((helm-after-initialize-hook #'helm-follow-mode))
    (helm-multi-occur
     (delq nil
           (mapcar (lambda (b)
                      (when (buffer-file-name b) (buffer-name b)))
                    (buffer-list))))))

(provide 'setup-helm)