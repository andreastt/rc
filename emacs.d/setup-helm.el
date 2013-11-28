(require 'helm-config)

(eval-after-load "helm-regexp"
  '(helm-attrset 'follow 1 helm-source-moccur))

(defun my-helm-multi-all ()
  "multi-occur in all buffers backed by files."
  (interactive)
  (helm-multi-occur
   (delq nil
         (mapcar (lambda (b)
                   (when (buffer-file-name b) (buffer-name b)))
                 (buffer-list)))))

(provide 'setup-helm)
