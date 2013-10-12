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
;; (seteq mu4e-get-mail-command "offlineimap"
;;        mu4e-update-interval 300)

;; Tell message-mode how to send email.
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.domeneshop.no"
      smtpmail-local-domain "sny.no"

      ;; Offline imap for replying to emails and putting them in a
      ;; queue.
      smtpmail-queue-mail nil
      smtpmail-queue-dir "~/Mail/queue/cur"

      ;; Don't keep message buffers around.
      message-kill-buffer-on-exit t)

;; Some more generic mail settings.
(setq user-mail-address "ato@sny.no"
      user-full-name "Andreas Tolfsen")

(provide 'setup-mu)
