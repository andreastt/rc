;; Only start edit-server from emacsen run as daemons (--daemon)
(when (and (require 'edit-server nil t) (daemonp))
  (edit-server-start))

;; Since GMail started doing HTML email we need to dehtmlize before
;; editing.
(require 'edit-server-htmlize)
(add-hook 'edit-server-start-hook 'edit-server-maybe-dehtmlize-buffer)
(add-hook 'edit-server-done-hook 'edit-server-maybe-htmlize-buffer)

(provide 'setup-edit-server)
