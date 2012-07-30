;; -*- mode: Lisp -*-

;;; .wl -- andreastt's Opera mail configuration


;; Define Wanderlust as default MUA
(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

;; SSL program
(setq starttls-use-gnutls t)
(setq ssl-program-name "/usr/local/bin/gnutls-cli")

;; Icon directory
(setq wl-icon-directory "~/dev/wanderlust/etc/icons")

;; Disable inline display of HTML part.
(setq mime-setup-enable-inline-html nil)

;; Don't split large messages
(setq mime-edit-split-message nil)

;; Open links in web browser
(add-hook 'wl-message-redisplay-hook 'goto-address)

;; If lines are longer than this value, treat it as `large'.
;(setq mime-edit-message-default-max-lines 1000)

;; Auto-accept certificates
(setq ssl-certificate-verification-policy 0)

;; Header From:
(setq wl-from "Andreas Tolf Tolfsen <andreastt@opera.com>")

;; If (system-name) does not return FQDN, set following as a local
;; domain name without hostname.
(setq wl-local-domain "opera.com")

;; User's mail addresses.
(setq wl-user-mail-address-list
      (list (wl-address-header-extract-address wl-from)
            "andreastt@opera.com"
            "andreas.tolf.tolfsen@opera.com"
            ))

;; Subscribed mailing lists.
(setq wl-subscribed-mailing-list
      '("browser-automation@opera.com"
        "core@opera.com"
        "testers@opera.com"
        "core-systems@opera.com"
        "selenium-developers@googlegroups.com"
        ))

;; Default IMAP4 server
(setq elmo-imap4-default-server "imap.opera.com")
(setq elmo-imap4-default-user "andreastt")
;(setq elmo-imap4-default-authenticate-type 'cram-md5)
;(setq elmo-imap4-default-port '587)
;(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-default-authenticate-type 'login)
(setq elmo-imap4-default-stream-type 'starttls)


;; SMTP server
(setq wl-smtp-posting-server "smtp.opera.com")
(setq wl-smtp-posting-port '587)
(setq wl-smtp-authenticate-type "login") ;"cram-md5") ;"plain")
(setq wl-smtp-posting-user "andreastt")
(setq wl-smtp-connection-type "ssl")


;; Default folder for `wl-summary-goto-folder'.
(setq wl-default-folder "%Inbox"
      wl-draft-folder "%Drafts"
      wl-trash-folder "%Trash"
      wl-spam-folder "%Spam"
      wl-queue-folder ".queue")

;; Folder Carbon Copy
(setq wl-fcc "%Sent")
(setq wl-fcc-force-as-read t)  ;; mark sent messages as read

;; Confirm before exitting Wanderlust
(setq wl-interactive-exit t)

;; Confirm before sending message
(setq wl-interactive-send t)

;; Create opened thread
(setq wl-thread-insert-opened t)

;; Keep folder window beside summary (3 pane)
(setq wl-stay-folder-window t
      wl-folder-window-width 25)

;; Truncate long lines
(setq wl-message-truncate-lines t)
(setq wl-draft-truncate-lines t)

;; Open new frame for draft buffer
(setq wl-draft-use-frame t)

;; Don't limit indent for thread view
(setq wl-summary-indent-length-limit nil)
(setq wl-summary-width nil)

;; Divide thread by change of subject
(setq wl-summary-divide-thread-when-subject-changed t)

;; Change format of thread view
; maybe?

;; Display first message automatically
(setq wl-auto-select-first t)

;; Goto next folder when exit from summary
(setq wl-auto-select-next t)

;; Jump to unread message in 'N' or 'P'
(setq wl-summary-move-order 'unread)

;; Notify mail arrival
(setq wl-biff-check-folder-list '("%Inbox"))
(setq wl-biff-notify-hook '(ding))


;;; [[ Network ]]

;; Cache setting.
;; (Messages in localdir, localnews, maildir are not cached.)
;(setq elmo-archive-use-cache nil)
;(setq elmo-nntp-use-cache t)
;(setq elmo-imap4-use-cache t)
;(setq elmo-pop3-use-cache t)

;; Enable disconnected operation in IMAP folder
(setq elmo-enable-disconnected-operation t)

;; Store draft messages in queue folder if message is sent in unplugged status
(setq wl-draft-enable-queuing t)
;; When plug status is changed from unplugged to plugged, queued
;; messages are flushed automatically.
(setq wl-auto-flush-queue t)


;;; [[ Message Display Settings ]]

;; Hidden header field in  message buffer
;; (setq wl-message-ignored-field-list
;;       '(".*Received:"
;;      ".*Path:"
;;      ".*Id:"
;;      "^References:"
;;      "^Replied:"
;;      "^Errors-To:"
;;      "^Lines:"
;;      "^Sender:"
;;      ".*Host:"
;;      "^Xref:"
;;      "^Content-Type:"
;;      "^Precedence:"
;;      "^Status:"
;;      "^X-VM-.*:"))

(setq wl-message-ignored-field-list '("^.*:")
      wl-message-visible-field-list
      '("^\\(To\\|Cc\\):"
        "^Subject:"
        "^\\(From\\|Reply-To\\):"
        "^Organization:"
        "^Message-Id:"
        "^\\(Posted\\|Date\\):"
        "^[xX]-[Ff]ace:"
        )
      wl-message-sort-field-list
      '("^From"
        "^Organization:"
        "^X-Attribution:"
        "^Subject"
        "^Date"
        "^To"
        "^Cc"))

;; X-Face
;(when window-system
;(autoload 'x-face-decode-message-header "x-face-e21")
;(setq wl-highlight-x-face-function 'x-face-decode-message-header)

(setq wl-highlight-x-face-function 'x-face-decode-message-header)
(define-key wl-summary-mode-map "\C-x4s" 'x-face-save)
(define-key wl-summary-mode-map "\C-x4a" 'x-face-ascii-view)
(define-key wl-draft-mode-map "\C-x4i" 'x-face-insert)
;; "\M-t" key is reserved for wl command.
(define-key wl-draft-mode-map "\M-\C-t" 'x-face-show)


;;; [[ Spam Filter Settings ]]

;; TODO
