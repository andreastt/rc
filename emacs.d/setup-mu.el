;;; setup-mu4e.el --- Mail configuration.  mu4e is the Emacs frontend
;;; to the mu mail indexer.

(require 'mu4e)

(setq mu4e-maildir       "~/Mail"     ;; top-level Maildir
      mu4e-sent-folder   "/sent"      ;; folder for sent messages
      mu4e-drafts-folder "/drafts"    ;; unfinished messages
      mu4e-trash-folder  "/trash"     ;; trashed messages
      mu4e-refile-folder "/archive")  ;; saved messages

;; Automatically fetch new mail with offlineimap.  (Consider replacing
;; with local exim smarthost or getmail).
(setq mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 300)

(require 'smtpmail)

;; Tell message-mode how to send email.
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.mozilla.org"
      smtpmail-smtp-server "smtp.mozilla.org"
      smtpmail-local-domain "mozilla.com"
      smtpmail-smtp-service 587)

;; Queue messages in separate IMAP folder for later sending.
(setq smtpmail-queue-mail nil
      smtpmail-queue-dir "~/Mail/queue/cur")

;; Don't keep message buffers around.
(setq message-kill-buffer-on-exit t)

;; Some more generic mail settings.
(setq user-mail-address "ato@mozilla.com"
      user-full-name "Andreas Tolfsen")

(provide 'setup-mu)
