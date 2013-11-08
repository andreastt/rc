;;; setup-mu4e.el --- Mail configuration.  mu4e is the Emacs frontend
;;; to the mu mail indexer.

(require 'mu4e)

(setq mu4e-maildir       "~/Mail"     ;; top-level Maildir
      mu4e-sent-folder   "/Sent"      ;; folder for sent messages
      mu4e-drafts-folder "/Drafts"    ;; unfinished messages
      mu4e-trash-folder  "/Trash"     ;; trashed messages
      mu4e-refile-folder "/Archive")  ;; saved messages

;; Automatically fetch new mail with offlineimap.
(setq mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 300)

(setq mu4e-show-images t                                   ;; Show images
      mu4e-html2text-command "html2text -utf8 -width 72")  ;; Convert HTML to text

;; Fancy characters!
;; (setq mu4e-use-fancy-chars t)

;; Break message lines at width of window
(add-hook 'mu4e-view-mode-hook 'visual-line-mode)

;; Use imagemagick if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

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
      user-full-name "Andreas Tolfsen"
      mail-user-agent 'mu4e-user-agent)

;; Attaching files to messages.
(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(provide 'setup-mu)
